module PLY

export write_ply

function write_ply(fn, pts, fcs)
  (fcsz, nfcs) = size(fcs)
    
  open(fn, "w") do fid
    write(fid, "ply\n")
    write(fid, "format binary_little_endian 1.0\n")
    @printf(fid, "element vertex %u\n", size(pts)[2])
    write(fid, "property float x\nproperty float y\nproperty float z\n")
    @printf(fid, "element face %u\n", nfcs)
    write(fid, "property list uchar int vertex_index\nend_header\n")
    write(fid, map(Float32, pts))
    for k in 1:nfcs
      write(fid, UInt8(fcsz))
      write(fid, map(Cint, fcs[:,k] - 1))
    end
  end

end

end # module PLY
