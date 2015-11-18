module LAS

export read_points_and_bounding_box

const liblas_c = "liblas_c"

include("liblas_common.jl")
include("liblas_h.jl")

function read_points_and_bounding_box(fn)
  rdr = LASReader_Create(pointer(fn))
  hdr = LASReader_GetHeader(rdr)
  npts = LASHeader_GetPointRecordsCount(hdr)
  xlo = LASHeader_GetMinX(hdr)
  ylo = LASHeader_GetMinY(hdr)
  zlo = LASHeader_GetMinZ(hdr)
  xhi = LASHeader_GetMaxX(hdr)
  yhi = LASHeader_GetMaxY(hdr)
  zhi = LASHeader_GetMaxZ(hdr)
  pts = zeros(3, npts)
  for k in 1:npts
    p = LASReader_GetNextPoint(rdr)
    pts[1, k] = LASPoint_GetX(p)
    pts[2, k] = LASPoint_GetY(p)
    pts[3, k] = LASPoint_GetZ(p)
  end
  LASReader_Destroy(rdr)

  (pts, ((xlo, ylo, zlo), (xhi, yhi, zhi)))
end

end # module LAS
