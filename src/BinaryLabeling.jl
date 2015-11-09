module BinaryLabeling

export binary_labeling

clip(v, lo, hi) = v < lo ? lo : (v > hi ? hi : v)
shrink(v, c) = v - clip(v, -c, c)

# basic step of the iteration
function update_labeling(ne, nv, es, ρ, σ, ϕₒ, ϕ, λ, b, d)

  # update d (in place)
  for k in 1:ne
    d[k] = shrink(ϕ[es[2,k]] - ϕ[es[1,k]] + b[k], ρ[k]/λ)
  end

  # update ϕ
  for k in 1:nv
    ϕ[k] = -σ[k]/λ
  end
  for k in 1:ne
    ϕ[es[1,k]] += ϕₒ[es[2,k]] + d[k] - b[k]
    ϕ[es[2,k]] += ϕₒ[es[1,k]] + d[k] - b[k]
  end
  for k in 1:nv
    ϕ[k] = clip(ϕ[k], -1.0, 1.0)
  end

  # update b (in place)
  for k in 1:ne
    b[k] += ϕ[es[2,k]] - ϕ[es[1,k]] - d[k]
  end
end

"""
Calcuates the binary labeling ϕᵢ∈[-1,1] of graph vertices which minimizes:

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

  ϕₒ = zeros(nv)
  ϕ = zeros(nv)

  # do at least this many iterations
  for k in 1:3
    update_labeling(ne, nv, es, ρ, σ, ϕ, ϕₒ, λ, b, d)
    update_labeling(ne, nv, es, ρ, σ, ϕₒ, ϕ, λ, b, d)
  end

  # then do iterations until there is no change
  while norm(ϕ-ϕₒ) > 1.0e-8*sqrt(nv)
    @printf("Change: %f.\n", norm(ϕ-ϕₒ)/sqrt(nv))
    update_labeling(ne, nv, es, ρ, σ, ϕ, ϕₒ, λ, b, d)
    update_labeling(ne, nv, es, ρ, σ, ϕₒ, ϕ, λ, b, d)
  end
  @printf("Change: %f.\n", norm(ϕ-ϕₒ)/sqrt(nv))

  ϕ
end

end # module BinaryLabeling
