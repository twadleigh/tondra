push!(LOAD_PATH, pwd() * "/../src")

using LAS
using SurfaceFitting
using PLY

# fetch the laz file, if not found
laz = "point_vernon.laz"
ply = "point_vernon.ply"
url = "<redacted>"
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

# output results
write_ply(ply, pts, fcs)
