# Tondra

Fit a triangulated surface to a point cloud by extracting a subset of faces of its Delaunay tetrahedralization.

## Prerequisites

1. You must have the `qhull` executable installed and on the path.
2. To read `.laz` files, you need the `liblas_c` shared library built with `LASzip` support and available on the search path.

## Setup

Run the `Makefile` in the `src` directory to build the shared library.

# Running

To create a `.ply` from a `.laz` file:

1. `cd` to the `examples` directory;
2. run the `laz_to_ply.jl` script with the base name of the `.laz` file. _E.g._, if you have `autzen.laz` in the `examples` directory:
```
> ./laz_to_ply.jl autzen
```
