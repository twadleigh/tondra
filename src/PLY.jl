module PLY

export write_ply

function write_ply(fn, pts, fcs)
  open(fn, "w") do fid
    write(fid, "ply\n")
    write(fid, "format binary_little_endian 1.0\n")
    @printf(fid, "element vertex %u\n", size(pts)[2])
    write(fid, "property float x\nproperty float y\nproperty float z\n")
    @printf(fid, "element face %u\n", length(fcs))
    write(fid, "property list uchar int vertex_index\nend_header\n")
    write(fid, map(Float32, pts))
    for face in fcs
      write(fid, UInt8(length(face)))
      write(fid, map(Cint, collect(face) - 1))
    end
  end

end

end # module PLY
