#! /usr/bin/env julia

push!(LOAD_PATH, pwd() * "/../src")
DL_LOAD_PATH = [pwd() * "/../src"]

using LAS
using SurfaceFitting
using PLY

basename = ARGS[1]
laz = basename*".laz"
ply = basename*".ply"

# read the points
print("Reading points...")
(the_pts, ((xlo, ylo, zlo), (xhi, yhi, zhi))) = read_points_and_bounding_box(laz)
println("done.")

# translate and rescale the points (to make qhull happy)
print("Translating and scaling the points...")
npts = size(the_pts)[2]
pts = zeros(3, npts)
ctr = 0.5 * [xlo+xhi, ylo+yhi, zlo+zhi]
scale = 2 / norm([xhi-xlo, yhi-ylo, zhi-zlo])
for k in 1:npts
  pts[:,k] = scale * (the_pts[:,k] - ctr)
end
println("done.")

# section the pointcloud into chunks
dr = 100.0
nx = ceil(Int, (xhi-xlo)/dr)
ny = ceil(Int, (yhi-ylo)/dr)
dx = scale*(xhi-xlo)/nx
dy = scale*(yhi-ylo)/ny
x0 = scale*(xlo - ctr[1])
y0 = scale*(ylo - ctr[2])

fcs = Matrix{Int}()
for k in 1:nx, l in 1:ny
  print(@sprintf("Working on chunk (%u,%u) of (%u,%u)...", k, l, nx, ny))

  # calculate 2D bounding box for this chunk (with some overlap)
  xb = x0 + k*dx + 0.1*scale
  yb = y0 + l*dy + 0.1*scale
  xa = xb - dx - 0.2*scale
  ya = yb - dy - 0.2*scale

  subfcs = triangulate_pointcloud_in_box(pts, xa, xb, ya, yb)
  if length(fcs) == 0
    fcs = subfcs
  else
    fcs = hcat(fcs, subfcs)
  end

  println("done.")
end

print("Writing PLY...")
write_ply(ply, the_pts, fcs)
println("done.")
