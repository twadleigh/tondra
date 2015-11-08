push!(LOAD_PATH, pwd() * "/../src")

using LAS
using SurfaceFitting

# fetch the Autzen Stadium laz file, if not found
laz = "point_vernon.laz"
ply = "point_vernon.ply"
url = "https://roames-hpc-home.s3.amazonaws.com/users/chrisfoster/pub/point_vernon.laz"
ctr = [482520.0; 7207550.0; 9.0]
rad = 5.0
if !isfile(laz)
  using Requests
  save(get(url), laz)
end

# read the points
print("Reading points...")
pts = read_points(laz)
println("done.")

# trim, translate and rescale
print("Trimming, translating and scaling...")
npts = size(pts)[2]
msk = [norm(pts[:,k] - ctr) < rad for k in 1:npts]
npts2 = sum(msk)
pts2 = zeros(3,npts2)
ix = 1
for k in 1:npts
  if !msk[k]
    continue
  end
  pts2[:,ix] = pts[:,k]
  pts2[:,ix] -= ctr
  pts2[:,ix] /= rad
  ix += 1
end
pts = pts2
pts2 = nothing
println("done.")

# generate the faces
fcs = triangulate_pointcloud(pts)

# write PLY
open(ply, "w") do fid
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
