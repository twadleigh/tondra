module LAS

export read_points

const liblas_c = "liblas_c"

include("liblas_common.jl")
include("liblas_h.jl")

function read_points(fn)
  rdr = LASReader_Create(pointer(fn))
  hdr = LASReader_GetHeader(rdr)
  npts = LASHeader_GetPointRecordsCount(hdr)
  pts = zeros(3, npts)
  for k in 1:npts
    p = LASReader_GetNextPoint(rdr)
    pts[1, k] = LASPoint_GetX(p)
    pts[2, k] = LASPoint_GetY(p)
    pts[3, k] = LASPoint_GetZ(p)
  end
  LASReader_Destroy(rdr)

  pts
end

end # module LAS
