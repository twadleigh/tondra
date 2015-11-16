module BinaryLabeling

export binary_labeling

const binary_labeling_lib = Base.source_dir() * "/binary_labeling.so"

function binary_labeling(es, ρ, σ)
  ne = length(ρ)
  nv = length(σ)
  ϕ = zeros(σ)

  ccall((:binary_labeling, binary_labeling_lib),
    Float32, (Int32, Int32, Ptr{Int32}, Ptr{Float32}, Ptr{Float32}, Ptr{Float32}),
    nv, ne, es-1, ρ, σ, ϕ)

  ϕ
end

end # module BinaryLabeling
