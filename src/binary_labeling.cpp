#include "graph.h"
#include <stdio.h>

void print_msg(const char *msg) {
  fprintf(stdout, msg);
}

extern "C"
float binary_labeling(int nv, int ne, const int *es, const float *rho, const float *sigma, float *phi) {
  typedef Graph<float, float, float> Graph_t;
  Graph_t g(nv, ne);

  g.add_node(nv);

  for (int k = 0; k < nv; ++k) {
    g.add_tweights(k, sigma[k], 0.0f);
  }

  for (int k = 0; k < ne; ++k) {
    g.add_edge(es[2*k], es[2*k+1], rho[k], rho[k]);
  }

  float flow = g.maxflow();

  for (int k = 0; k < nv; ++k) {
    phi[k] = g.what_segment(k) == Graph_t::SOURCE ? -1.0f : 1.0f;
  }

  return flow;
}
