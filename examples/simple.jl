push!(LOAD_PATH, pwd() * "/../src")

using SurfaceFitting
using PLY

pts = randn(3,1000)
pts[3,:] *= 0.2
fcs = triangulate_pointcloud(pts)

write_ply("simple.ply", pts, fcs)
