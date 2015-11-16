module BinaryLabeling

export binary_labeling

const update_labeling_lib = Base.source_dir() * "/update_labeling.so"
const update_labeling_fn = :update_labeling_v2

function update_labeling(ne, nv, es, w, ρ, σ, λ, ϕₒ, ϕ, b, d)
  ccall((update_labeling_fn, update_labeling_lib),
    Void, (Int32, Int32, Ptr{Int32}, Ptr{Float32}, Ptr{Float32}, Ptr{Float32},
    Float32, Ptr{Float32}, Ptr{Float32}, Ptr{Float32}, Ptr{Float32}),
      ne, nv, es, w, ρ, σ, λ, ϕₒ, ϕ, b, d)
end

"""
Calcuates the binary labeling ϕᵢ ∈ {-1,1} of graph vertices which minimizes:

  Σᵢ σᵢϕᵢ + Σᵢⱼ ρᵢⱼ |ϕᵢ-ϕⱼ|

where i ranges over vertices and ij ranges over edges.

The algorithm is a version of the split Bregman method, which has been shown
to be both relatively simple to implement and parallelize, and exhibits fast
convergence on L1-minimization problems (which generally converge very slowly
using standard minimization techniques).

See, e.g., http://epubs.siam.org/doi/abs/10.1137/080725891

Inputs:
  es - edges
  ρ  - edge weight (ρ ≧ 0)
  σ  - vertex label bias (σ < 0 → filled, σ > 0 → empty)
  λ  - a regularlization parameter (λ > 0)
"""
function binary_labeling(es, ρ, σ, λ)

  nv = length(σ)
  ne = length(ρ)
  @assert size(es) == (2, ne)

  # initialize workspace storage
  d = zeros(ρ)
  b = zeros(ρ)

  ϕₒ = zeros(σ)
  ϕ = zeros(σ)

  # calculate reweighting (inverse valence)
  if update_labeling_fn == :update_labeling_v1
    w = zeros(σ)
    for k in 1:ne
      w[es[1,k]] += ρ[k]
      w[es[2,k]] += ρ[k]
    end
    for k in 1:nv
      w[k] = 1.0 / w[k]
    end
  else
    w = zeros(σ)
    for k in 1:ne
      w[es[1,k]] += 1.0
      w[es[2,k]] += 1.0
    end
    for k in 1:nv
      w[k] = 1.0 / w[k]
    end
  end

  # calculate edge indices appropriate for C
  es2 = es - 1

  # do at least this many iterations
  for k in 1:3
    update_labeling(ne, nv, es2, w, ρ, σ, λ, ϕ, ϕₒ, b, d)
    update_labeling(ne, nv, es2, w, ρ, σ, λ, ϕₒ, ϕ, b, d)
  end

  # then do iterations until there is no change
  while norm(ϕ-ϕₒ) > 1.0e-4*sqrt(nv)
    update_labeling(ne, nv, es2, w, ρ, σ, λ, ϕ, ϕₒ, b, d)
    update_labeling(ne, nv, es2, w, ρ, σ, λ, ϕₒ, ϕ, b, d)
  end

  ϕ
end

end # module BinaryLabeling
