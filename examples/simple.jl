push!(LOAD_PATH, pwd() * "/../src")
DL_LOAD_PATH = [pwd() * "/../src"]

using SurfaceFitting
using PLY

pts = randn(3,1000)
pts[3,:] *= 0.5
fcs = triangulate_pointcloud(pts)

write_ply("simple.ply", pts, fcs)
