# Automatically generated using Clang.jl wrap_c, version 0.0.0

using Compat

const LIBLAS_C_API = 1
const LIBLAS_VERSION_MAJOR = 1
const LIBLAS_VERSION_MINOR = 8
const LIBLAS_VERSION_REV = 0
const LIBLAS_VERSION_BUILD = 0
const LIBLAS_VERSION_NUM = LIBLAS_VERSION_MAJOR * 1000 + LIBLAS_VERSION_MINOR * 100 + LIBLAS_VERSION_REV * 10 + LIBLAS_VERSION_BUILD
const LIBLAS_RELEASE_DATE = 20140801
const LIBLAS_RELEASE_NAME = "1.8.0"
const NULL = 0
const TRUE = 1
const FALSE = 0

# Skipping MacroDefinition: MIN ( a , b ) ( ( a < b ) ? a : b )
# Skipping MacroDefinition: MAX ( a , b ) ( ( a > b ) ? a : b )

#const LASCopyString = strdup
const LAS_MODE_READ = 0
const LAS_MODE_WRITE = 1
const LAS_MODE_APPEND = 2

type LASWriterHS
end

typealias LASWriterH Ptr{LASWriterHS}

type LASReaderHS
end

typealias LASReaderH Ptr{LASReaderHS}

type LASPointHS
end

typealias LASPointH Ptr{LASPointHS}

type LASHeaderHS
end

typealias LASHeaderH Ptr{LASHeaderHS}

type LASGuidHS
end

typealias LASGuidH Ptr{LASGuidHS}

type LASVLRHS
end

typealias LASVLRH Ptr{LASVLRHS}

type LASColorHS
end

typealias LASColorH Ptr{LASColorHS}

type LASSRSHS
end

typealias LASSRSH Ptr{LASSRSHS}

type LASSchemaHS
end

typealias LASSchemaH Ptr{LASSchemaHS}

# begin enum ANONYMOUS_1
typealias ANONYMOUS_1 UInt32
const LE_None = (UInt32)(0)
const LE_Debug = (UInt32)(1)
const LE_Warning = (UInt32)(2)
const LE_Failure = (UInt32)(3)
const LE_Fatal = (UInt32)(4)
# end enum ANONYMOUS_1

# begin enum LASError
typealias LASError UInt32
const LE_None = (UInt32)(0)
const LE_Debug = (UInt32)(1)
const LE_Warning = (UInt32)(2)
const LE_Failure = (UInt32)(3)
const LE_Fatal = (UInt32)(4)
# end enum LASError
