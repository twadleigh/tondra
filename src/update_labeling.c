#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

float clip(float v, float c) {
  return v > c ? c : (v < -c ? -c : v);
}

float shrink(float v, float c) {
  return v > c ? v - c : (v < -c ? v + c : 0.0f);
}

// Φ = ρᵢⱼ(ϕᵢ - ϕⱼ)
void update_labeling_v1(int ne, int nv,
  const int *es, const float *w, const float *rho, const float *sigma,
  const float lambda, const float *phi0, float *phi, float *b, float *d) {

#pragma omp parallel
  {

  // update d (in place)
#pragma omp for
    for (int k = 0; k < ne; ++k) {
      d[k] = shrink(rho[k] * (phi0[es[2*k+1]] - phi0[es[2*k]]) + b[k], lambda);
    }

  // update phi
#pragma omp for
    for (int k = 0; k < nv; ++k) {
      phi[k] = 0.0f;
    }
#pragma omp for
    for (int k = 0; k < ne; ++k) {
      phi[es[2*k]]   += rho[k] * phi0[es[2*k+1]] - d[k] + b[k];
      phi[es[2*k+1]] += rho[k] * phi0[es[2*k]]   + d[k] - b[k];
    }
#pragma omp for
    for (int k = 0; k < nv; ++k) {
      phi[k] = clip(w[k] * phi[k] - lambda * sigma[k], 1.0f);
    }

  // update b (in place)
#pragma omp for
    for (int k = 0; k < ne; ++k) {
      b[k] += rho[k] * (phi[es[2*k+1]] - phi[es[2*k]]) - d[k];
    }

  } // #pragma omp parallel
}

// Φ = ϕᵢ - ϕⱼ
void update_labeling_v2(int ne, int nv,
  const int *es, const float *w, const float *rho, const float *sigma,
  const float lambda, const float *phi0, float *phi, float *b, float *d) {

#pragma omp parallel
  {

  // update d (in place)
#pragma omp for
    for (int k = 0; k < ne; ++k) {
      d[k] = shrink(phi0[es[2*k+1]] - phi0[es[2*k]] + b[k], lambda * rho[k]);
    }

  // update phi
#pragma omp for
    for (int k = 0; k < nv; ++k) {
      phi[k] = 0.0f;
    }
#pragma omp for
    for (int k = 0; k < ne; ++k) {
      phi[es[2*k]]   += phi0[es[2*k+1]] - d[k] + b[k];
      phi[es[2*k+1]] += phi0[es[2*k]]   + d[k] - b[k];
    }
#pragma omp for
    for (int k = 0; k < nv; ++k) {
      phi[k] = clip(w[k] * phi[k] - lambda * sigma[k], 1.0f);
    }

  // update b (in place)
#pragma omp for
    for (int k = 0; k < ne; ++k) {
      b[k] += phi[es[2*k+1]] - phi[es[2*k]] - d[k];
    }

  } // #pragma omp parallel
}
