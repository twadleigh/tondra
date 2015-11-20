module SurfaceFitting

export triangulate_pointcloud, triangulate_pointcloud_in_box

using QHull
using BinaryLabeling

function triangulate_pointcloud_in_box(pts, xlo, xhi, ylo, yhi)

  # calculate point subset for this chunk
  npts = size(pts)[2]
  nsubpts = 0
  for n in 1:npts
    x = pts[1,n]
    y = pts[2,n]
    if x >= xlo && x <= xhi && y >= ylo && y <= yhi
      nsubpts += 1
    end
  end

  # bail if there aren't really any points in this chunk
  if nsubpts < 3
    return Matrix{Int}()
  end

  subpts_ix = zeros(Int, nsubpts)
  subpts = zeros(3, nsubpts)
  ix = 1
  for n in 1:npts
    x = pts[1,n]
    y = pts[2,n]
    if x >= xlo && x <= xhi && y >= ylo && y <= yhi
      subpts_ix[ix] = n
      subpts[:,ix] = pts[:,n]
      ix += 1
    end
  end

  # calculate faces for this chunk
  fcs = triangulate_pointcloud(subpts)

  # translate faces to original point set indices
  (fcsz, nfcs) = size(fcs)
  for k in 1:fcsz, l in 1:nfcs
    fcs[k,l] = subpts_ix[fcs[k,l]]
  end

  fcs
end

"""
Given a set of points in 3-space, calculates a triangulation of (a subset of)
those points. The triangles are a subset of the faces of the Delaunay
tetrahedralization of (a superset of) the point set.

The algorithm assumes that the volume should generally be regarded as "empty"
in the positive z direction, and "filled" in the negative z direction.

pts - 3 × M matrix of points in 3-space.
"""
function triangulate_pointcloud(pts)
  npts = size(pts)[2]

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

  # 5. calculate vertex labeling
  ϕ = binary_labeling(es, ρ, σ)

  # 6. extract isosurface
  isosurface(es, pts, simps, ϕ)
end

function delaunay_edges(simps)
  (ndims,nsimps) = size(simps)
  @assert ndims == 4

  half_edges = Dict{IntSet, Int32}()
  edges = Vector{Int32}()
  for k in 1:nsimps
    simp = IntSet(simps[:,k])
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
# radius of the circumscribed circle. For obtuse triangles, we simplify
# and take the cost to be half the length of the longest side. This is an
# upper bound on the maximum distance to a vertex, which serves to
# discourage obtuse triangles.
function face_weights(pts, simps, es)
  ne = size(es)[2]
  ρ = Vector{Float32}(ne)

  for k in 1:ne
    face = collect(IntSet(simps[:,es[1,k]]) ∩ IntSet(simps[:,es[2,k]]))
    v1 = pts[:, face[1]]
    v2 = pts[:, face[2]]
    v3 = pts[:, face[3]]

    # side lengths
    ls = sort([norm(v1 - v2), norm(v2 - v3), norm(v3 - v1)])
    a = ls[1]
    b = ls[2]
    c = ls[3]

    if a^2 + b^2 >= c^2
      wt = (a*b*c)/sqrt((a+b+c)*(b+c-a)*(c+a-b)*(a+b-c))
    else
      wt = c/2
    end

    ρ[k] = min(wt^10.0, 1.0e30)
  end

  ρ
end

# Any vertex that touches the extra -z point gets a label bias of -Inf, driving
# it to be labeled with +1: filled. Similarly, if it touches the +z point,
# the label bias is Inf, forcing it to be labeled with -1: empty.
function boundary_bias(simps, npts)
  nv = size(simps)[2]
  σ = zeros(Float32, nv)
  lo = npts - 1
  hi = npts

  for k in 1:nv
    v = IntSet(simps[:,k])
    σ[k] = lo ∈ v ? -Inf : (hi ∈ v ? Inf : 0)
  end

  σ
end

function isosurface(es, pts, simps, ϕ)
  ne = size(es)[2]
  max_pt_ix = size(pts)[2] - 2

  nf = 0
  surf = Vector{Int}()
  for k in 1:ne
    v1 = es[1,k]
    v2 = es[2,k]
    if ϕ[v1] * ϕ[v2] < 0
      s1 = IntSet(simps[:,v1])
      s2 = IntSet(simps[:,v2])
      face_set = s1 ∩ s2
      outside_simplex = ϕ[v1] < 0 ? s1 : s2
      outside_vertex = collect(setdiff(outside_simplex, face_set))[1]
      face = collect(face_set)

      # bail if, for some reason, the face touches a boundary point
      # this shouldn't happen, but, very occassionally does!
      if maximum(face) > max_pt_ix
        continue
      end

      # check the face orientation
      origin = pts[:, face[1]]
      vec1 = pts[:, face[2]] - origin
      vec2 = pts[:, face[3]] - origin
      vec3 = pts[:, outside_vertex] - origin
      if (vec3' * (vec1 × vec2))[1] < 0
        reverse!(face)
      end

      append!(surf, face)
      nf += 1
    end
  end

  reshape(surf, (3, nf))
end

end # module SurfaceFitting
