push!(LOAD_PATH, pwd() * "/../src")

using LAS
using SurfaceFitting

# fetch the Autzen Stadium laz file, if not found
autzen_laz = "autzen.laz"
autzen_ply = "autzen.ply"
autzen_url = "http://www.liblas.org/samples/autzen/autzen.laz"
if !isfile(autzen_laz)
  using Requests
  save(get(autzen_url), autzen_laz)
end

# read the points
print("Reading points...")
pts = read_points(autzen_laz)
println("done.")

# generate the faces
fcs = triangulate_pointcloud(pts)

# write PLY
open(autzen_ply, "w") do fid
  write(fid, "ply\n")
  write(fid, "format binary_little_endian 1.0\n")
  @printf(fid, "element vertex %u\n", npts)
  write(fid, "property float x\nproperty float y\nproperty float z\n")
  @printf(fid, "element face %u\n", length(fcs))
  write(fid, "property list uchar int vertex_index\nend_header\n")
  write(fid, pts)
  for face in fcs
    write(fid, UInt8(3))
    write(fid, map(Cint, collect(face)))
  end
end
