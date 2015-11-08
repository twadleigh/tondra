module SurfaceFitting

export triangulate_pointcloud

using QHull
using BinaryLabeling

"""
Given a set of points in 3-space, calculates a triangulation of (a subset of)
those points. The triangles are a subset of the faces of the Delaunay
tetrahedralization of (a superset of) the point set.

The algorithm assumes that the volume should generally be regarded as "empty"
in the positive z direction, and "filled" in the negative z direction.

pts - 3 × M matrix of points in 3-space.
"""
function triangulate_pointcloud(pts)

  # 0. augment the point set with "boundary" points
  x0 = mean(pts[1,:])
  y0 = mean(pts[2,:])
  zlo = minimum(pts[3,:])
  zhi = maximum(pts[3,:])
  dz = zhi - zlo
  pts = [pts [x0; y0; (zlo - 10*dz)] [x0; y0; (zhi + 10*dz)]]

  # 1. construct Delaunay simplices
  simps = delaunay_simplices(pts)

  # 2. construct edge list
  es = delaunay_edges(simps)

  # 3. construct edge, vertex costs
  ρ = face_weights(pts, simps, es)
  σ = boundary_bias(simps, size(pts)[2])

  print("Calculating binary labeling...")
  # 5. calculate vertex labeling
  λ = 0.1
  ϕ = binary_labeling(es, ρ, σ, λ)
  println("done.")

  println(ϕ)

  # 6. extract isosurface
  isosurface(es, simps, ϕ)
end

function delaunay_edges(simps)
  nsimps = length(simps)

  half_edges = Dict{IntSet, Int}()
  edges = Vector{Int}()
  for k in 1:nsimps
    simp = simps[k]
    for v in simp
      face = delete!(copy(simp), v)
      if haskey(half_edges, face)
        l = pop!(half_edges, face)
        push!(edges, l, k)
      else
        half_edges[face] = k
      end
    end
  end

  ne = round(Int, length(edges)/2)
  reshape(edges, (2,ne))
end


# The face weight is taken to be the maximum distance of any point in the
# triangle to its nearest vertex. For acute & right triangles, this is the
# radius of the circumscribed circle. For obtuse triangles, this the length
# of the side of an isocelese triangle whose base is the second longest side (b)
# and which has one side coincident with the longest side (c).
function face_weights(pts, simps, es)
  ne = size(es)[2]
  ρ = Vector{Float64}(ne)

  for k in 1:ne
    face = collect(simps[es[1,k]] ∩ simps[es[2,k]])
    v1 = pts[:, face[1]]
    v2 = pts[:, face[2]]
    v3 = pts[:, face[3]]

    # side lengths
    ls = sort([norm(v1 - v2), norm(v2 - v3), norm(v3 - v1)])
    a = ls[1]
    b = ls[2]
    c = ls[3]

    if a^2 + b^2 >= c^2
      # acute/right
      wt = (a*b*c)/sqrt((a+b+c)*(b+c-a)*(c+a-b)*(a+b-c))
    else
      # obtuse
      wt = (b^2*c)/sqrt(b^2+c^2-a^2)
    end

    ρ[k] = wt
  end

  ρ
end

# Any vertex that touches the extra -z point gets a label bias of -Inf, driving
# it to be labeled with +1: filled. Similarly, if it touches the +z point,
# the label bias is Inf, forcing it to be labeled with -1: empty.
function boundary_bias(simps, npts)
  nv = length(simps)
  σ = zeros(nv)
  lo = npts - 1
  hi = npts

  for k in 1:nv
    v = simps[k]
    σ[k] = lo ∈ v ? -Inf : (hi ∈ v ? Inf : 0)
  end

  σ
end

function isosurface(es, simps, ϕ)
  ne = size(es)[2]

  surf = Vector{IntSet}()
  for k in 1:ne
    v1 = es[1,k]
    v2 = es[2,k]
    if ϕ[v1] * ϕ[v2] < 0
      push!(surf, simps[v1] ∩ simps[v2])
    end
  end

  surf
end

end # module SurfaceFitting
