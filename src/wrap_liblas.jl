using Clang.cindex
using Clang.wrap_c
using Compat

LIBLAS_INCLUDE = "/usr/local/include/liblas/capi"


liblas_header = [joinpath(LIBLAS_INCLUDE, "liblas.h")]

# Set up include paths
clang_includes = ASCIIString[]
push!(clang_includes, LIBLAS_INCLUDE)

# Clang arguments
clang_extraargs = ["-v"]
# clang_extraargs = ["-D", "__STDC_LIMIT_MACROS", "-D", "__STDC_CONSTANT_MACROS"]

# Callback to test if a header should actually be wrapped (for exclusion)
function wrap_header(top_hdr::ASCIIString, cursor_header::ASCIIString)
    return startswith(dirname(cursor_header), LIBLAS_INCLUDE)
end

lib_file(hdr::ASCIIString) = "liblas_c"
output_file(hdr::ASCIIString) = "liblas_h.jl"

const wc = wrap_c.init(;
                        headers = liblas_header,
                        output_file = "liblas_h.jl",
                        common_file = "liblas_common.jl",
                        clang_includes      = clang_includes,
                        header_wrapped      = wrap_header,
                        header_library      = lib_file,
                        header_outputfile   = output_file,
                        clang_diagnostics = true)

run(wc)
