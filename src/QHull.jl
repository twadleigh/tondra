module QHull

export delaunay_simplices

"""
Inputs:
pts - MxN array of N M-dimensional points

Produces vector of sets of indices.
"""
function delaunay_simplices(pts)
  (ndims, npts) = size(pts)

  # spawn qhull process
  (outs, ins, p) = readandwrite(`qhull d Qt i`)

  # write out the vertices
  @printf(ins, "%u\n%u\n", ndims, npts)
  for k in 1:npts
    for l in 1:ndims
      @printf(ins, "%f ", pts[l,k])
    end
    @printf(ins, "\n")
  end
  flush(ins)
  close(ins)

  # read in the simplices
  nsimps = parse(Int, readline(outs))
  simps = Matrix{Int}(ndims+1, nsimps)
  for i in 1:nsimps
    simps[:,i] = sort(map(s -> 1 + parse(Int, s), split(readline(outs))))
  end

  simps
end

end # module QHull
