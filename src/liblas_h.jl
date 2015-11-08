# Julia wrapper for header: /usr/local/include/liblas/capi/liblas.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function LAS_GetVersion()
    ccall((:LAS_GetVersion,liblas_c),Ptr{UInt8},())
end

function LAS_GetFullVersion()
    ccall((:LAS_GetFullVersion,liblas_c),Ptr{UInt8},())
end

function LAS_IsLibGeoTIFFEnabled()
    ccall((:LAS_IsLibGeoTIFFEnabled,liblas_c),Cint,())
end

function LAS_IsGDALEnabled()
    ccall((:LAS_IsGDALEnabled,liblas_c),Cint,())
end

function LAS_IsLibSpatialIndexEnabled()
    ccall((:LAS_IsLibSpatialIndexEnabled,liblas_c),Cint,())
end

function LASError_Reset()
    ccall((:LASError_Reset,liblas_c),Void,())
end

function LASError_Pop()
    ccall((:LASError_Pop,liblas_c),Void,())
end

function LASError_GetLastErrorNum()
    ccall((:LASError_GetLastErrorNum,liblas_c),LASError,())
end

function LASError_GetLastErrorMsg()
    ccall((:LASError_GetLastErrorMsg,liblas_c),Ptr{UInt8},())
end

function LASError_GetLastErrorMethod()
    ccall((:LASError_GetLastErrorMethod,liblas_c),Ptr{UInt8},())
end

function LASError_GetErrorCount()
    ccall((:LASError_GetErrorCount,liblas_c),Cint,())
end

function LASError_Print(message::Ptr{UInt8})
    ccall((:LASError_Print,liblas_c),Void,(Ptr{UInt8},),message)
end

function LASReader_Create(filename::Ptr{UInt8})
    ccall((:LASReader_Create,liblas_c),LASReaderH,(Ptr{UInt8},),filename)
end

function LASReader_CreateWithHeader(filename::Ptr{UInt8},hHeader::LASHeaderH)
    ccall((:LASReader_CreateWithHeader,liblas_c),LASReaderH,(Ptr{UInt8},LASHeaderH),filename,hHeader)
end

function LASReader_GetNextPoint(hReader::LASReaderH)
    ccall((:LASReader_GetNextPoint,liblas_c),LASPointH,(LASReaderH,),hReader)
end

function LASReader_GetPointAt(hReader::LASReaderH,position::UInt32)
    ccall((:LASReader_GetPointAt,liblas_c),LASPointH,(LASReaderH,UInt32),hReader,position)
end

function LASReader_Destroy(hReader::LASReaderH)
    ccall((:LASReader_Destroy,liblas_c),Void,(LASReaderH,),hReader)
end

function LASReader_GetHeader(hReader::LASReaderH)
    ccall((:LASReader_GetHeader,liblas_c),LASHeaderH,(LASReaderH,),hReader)
end

function LASReader_SetHeader(hReader::LASReaderH,hHeader::LASHeaderH)
    ccall((:LASReader_SetHeader,liblas_c),Void,(LASReaderH,LASHeaderH),hReader,hHeader)
end

function LASReader_SetSRS(hReader::LASReaderH,hSRS::LASSRSH)
    ccall((:LASReader_SetSRS,liblas_c),LASError,(LASReaderH,LASSRSH),hReader,hSRS)
end

function LASReader_SetInputSRS(hReader::LASReaderH,hSRS::LASSRSH)
    ccall((:LASReader_SetInputSRS,liblas_c),LASError,(LASReaderH,LASSRSH),hReader,hSRS)
end

function LASReader_SetOutputSRS(hReader::LASReaderH,hSRS::LASSRSH)
    ccall((:LASReader_SetOutputSRS,liblas_c),LASError,(LASReaderH,LASSRSH),hReader,hSRS)
end

function LASReader_Seek(hReader::LASReaderH,position::UInt32)
    ccall((:LASReader_Seek,liblas_c),LASError,(LASReaderH,UInt32),hReader,position)
end

function LASReader_GetSummaryXML(hReader::LASReaderH)
    ccall((:LASReader_GetSummaryXML,liblas_c),Ptr{UInt8},(LASReaderH,),hReader)
end

function LASPoint_GetX(hPoint::LASPointH)
    ccall((:LASPoint_GetX,liblas_c),Cdouble,(LASPointH,),hPoint)
end

function LASPoint_SetX(hPoint::LASPointH,value::Cdouble)
    ccall((:LASPoint_SetX,liblas_c),LASError,(LASPointH,Cdouble),hPoint,value)
end

function LASPoint_GetRawX(hPoint::LASPointH)
    ccall((:LASPoint_GetRawX,liblas_c),Clong,(LASPointH,),hPoint)
end

function LASPoint_SetRawX(hPoint::LASPointH,value::Clong)
    ccall((:LASPoint_SetRawX,liblas_c),LASError,(LASPointH,Clong),hPoint,value)
end

function LASPoint_GetY(hPoint::LASPointH)
    ccall((:LASPoint_GetY,liblas_c),Cdouble,(LASPointH,),hPoint)
end

function LASPoint_SetY(hPoint::LASPointH,value::Cdouble)
    ccall((:LASPoint_SetY,liblas_c),LASError,(LASPointH,Cdouble),hPoint,value)
end

function LASPoint_GetRawY(hPoint::LASPointH)
    ccall((:LASPoint_GetRawY,liblas_c),Clong,(LASPointH,),hPoint)
end

function LASPoint_SetRawY(hPoint::LASPointH,value::Clong)
    ccall((:LASPoint_SetRawY,liblas_c),LASError,(LASPointH,Clong),hPoint,value)
end

function LASPoint_GetZ(hPoint::LASPointH)
    ccall((:LASPoint_GetZ,liblas_c),Cdouble,(LASPointH,),hPoint)
end

function LASPoint_SetZ(hPoint::LASPointH,value::Cdouble)
    ccall((:LASPoint_SetZ,liblas_c),LASError,(LASPointH,Cdouble),hPoint,value)
end

function LASPoint_GetRawZ(hPoint::LASPointH)
    ccall((:LASPoint_GetRawZ,liblas_c),Clong,(LASPointH,),hPoint)
end

function LASPoint_SetRawZ(hPoint::LASPointH,value::Clong)
    ccall((:LASPoint_SetRawZ,liblas_c),LASError,(LASPointH,Clong),hPoint,value)
end

function LASPoint_GetIntensity(hPoint::LASPointH)
    ccall((:LASPoint_GetIntensity,liblas_c),UInt16,(LASPointH,),hPoint)
end

function LASPoint_SetIntensity(hPoint::LASPointH,value::UInt16)
    ccall((:LASPoint_SetIntensity,liblas_c),LASError,(LASPointH,UInt16),hPoint,value)
end

function LASPoint_GetReturnNumber(hPoint::LASPointH)
    ccall((:LASPoint_GetReturnNumber,liblas_c),UInt16,(LASPointH,),hPoint)
end

function LASPoint_SetReturnNumber(hPoint::LASPointH,value::UInt16)
    ccall((:LASPoint_SetReturnNumber,liblas_c),LASError,(LASPointH,UInt16),hPoint,value)
end

function LASPoint_GetNumberOfReturns(hPoint::LASPointH)
    ccall((:LASPoint_GetNumberOfReturns,liblas_c),UInt16,(LASPointH,),hPoint)
end

function LASPoint_SetNumberOfReturns(hPoint::LASPointH,value::UInt16)
    ccall((:LASPoint_SetNumberOfReturns,liblas_c),LASError,(LASPointH,UInt16),hPoint,value)
end

function LASPoint_GetScanDirection(hPoint::LASPointH)
    ccall((:LASPoint_GetScanDirection,liblas_c),UInt16,(LASPointH,),hPoint)
end

function LASPoint_SetScanDirection(hPoint::LASPointH,value::UInt16)
    ccall((:LASPoint_SetScanDirection,liblas_c),LASError,(LASPointH,UInt16),hPoint,value)
end

function LASPoint_GetFlightLineEdge(hPoint::LASPointH)
    ccall((:LASPoint_GetFlightLineEdge,liblas_c),UInt16,(LASPointH,),hPoint)
end

function LASPoint_SetFlightLineEdge(hPoint::LASPointH,value::UInt16)
    ccall((:LASPoint_SetFlightLineEdge,liblas_c),LASError,(LASPointH,UInt16),hPoint,value)
end

function LASPoint_GetScanFlags(hPoint::LASPointH)
    ccall((:LASPoint_GetScanFlags,liblas_c),Cuchar,(LASPointH,),hPoint)
end

function LASPoint_SetScanFlags(hPoint::LASPointH,value::Cuchar)
    ccall((:LASPoint_SetScanFlags,liblas_c),LASError,(LASPointH,Cuchar),hPoint,value)
end

function LASPoint_GetClassification(hPoint::LASPointH)
    ccall((:LASPoint_GetClassification,liblas_c),Cuchar,(LASPointH,),hPoint)
end

function LASPoint_SetClassification(hPoint::LASPointH,value::Cuchar)
    ccall((:LASPoint_SetClassification,liblas_c),LASError,(LASPointH,Cuchar),hPoint,value)
end

function LASPoint_GetTime(hPoint::LASPointH)
    ccall((:LASPoint_GetTime,liblas_c),Cdouble,(LASPointH,),hPoint)
end

function LASPoint_SetTime(hPoint::LASPointH,value::Cdouble)
    ccall((:LASPoint_SetTime,liblas_c),LASError,(LASPointH,Cdouble),hPoint,value)
end

function LASPoint_GetScanAngleRank(hPoint::LASPointH)
    ccall((:LASPoint_GetScanAngleRank,liblas_c),UInt8,(LASPointH,),hPoint)
end

function LASPoint_SetScanAngleRank(hPoint::LASPointH,value::UInt8)
    ccall((:LASPoint_SetScanAngleRank,liblas_c),LASError,(LASPointH,UInt8),hPoint,value)
end

function LASPoint_SetPointSourceId(hPoint::LASPointH,value::UInt16)
    ccall((:LASPoint_SetPointSourceId,liblas_c),LASError,(LASPointH,UInt16),hPoint,value)
end

function LASPoint_GetPointSourceId(hPoint::LASPointH)
    ccall((:LASPoint_GetPointSourceId,liblas_c),UInt16,(LASPointH,),hPoint)
end

function LASPoint_GetUserData(hPoint::LASPointH)
    ccall((:LASPoint_GetUserData,liblas_c),Cuchar,(LASPointH,),hPoint)
end

function LASPoint_SetUserData(hPoint::LASPointH,value::Cuchar)
    ccall((:LASPoint_SetUserData,liblas_c),LASError,(LASPointH,Cuchar),hPoint,value)
end

function LASPoint_Validate(hPoint::LASPointH)
    ccall((:LASPoint_Validate,liblas_c),Cint,(LASPointH,),hPoint)
end

function LASPoint_IsValid(hPoint::LASPointH)
    ccall((:LASPoint_IsValid,liblas_c),Cint,(LASPointH,),hPoint)
end

function LASPoint_Create()
    ccall((:LASPoint_Create,liblas_c),LASPointH,())
end

function LASPoint_Copy(hPoint::LASPointH)
    ccall((:LASPoint_Copy,liblas_c),LASPointH,(LASPointH,),hPoint)
end

function LASPoint_Destroy(hPoint::LASPointH)
    ccall((:LASPoint_Destroy,liblas_c),Void,(LASPointH,),hPoint)
end

function LASPoint_GetHeader(hPoint::LASPointH)
    ccall((:LASPoint_GetHeader,liblas_c),LASHeaderH,(LASPointH,),hPoint)
end

function LASPoint_SetHeader(hPoint::LASPointH,hHeader::LASHeaderH)
    ccall((:LASPoint_SetHeader,liblas_c),Void,(LASPointH,LASHeaderH),hPoint,hHeader)
end

function LASPoint_GetData(hPoint::LASPointH,data::Ptr{Cuchar})
    ccall((:LASPoint_GetData,liblas_c),LASError,(LASPointH,Ptr{Cuchar}),hPoint,data)
end

function LASPoint_SetData(hPoint::LASPointH,data::Ptr{Cuchar})
    ccall((:LASPoint_SetData,liblas_c),LASError,(LASPointH,Ptr{Cuchar}),hPoint,data)
end

function LASPoint_GetXML(hPoint::LASPointH)
    ccall((:LASPoint_GetXML,liblas_c),Ptr{UInt8},(LASPointH,),hPoint)
end

function LASHeader_Copy(hHeader::LASHeaderH)
    ccall((:LASHeader_Copy,liblas_c),LASHeaderH,(LASHeaderH,),hHeader)
end

function LASHeader_Create()
    ccall((:LASHeader_Create,liblas_c),LASHeaderH,())
end

function LASHeader_Destroy(hHeader::LASHeaderH)
    ccall((:LASHeader_Destroy,liblas_c),Void,(LASHeaderH,),hHeader)
end

function LASHeader_GetFileSignature(hHeader::LASHeaderH)
    ccall((:LASHeader_GetFileSignature,liblas_c),Ptr{UInt8},(LASHeaderH,),hHeader)
end

function LASHeader_GetFileSourceId(hHeader::LASHeaderH)
    ccall((:LASHeader_GetFileSourceId,liblas_c),UInt16,(LASHeaderH,),hHeader)
end

function LASHeader_SetFileSourceId(hHeader::LASHeaderH,value::UInt16)
    ccall((:LASHeader_SetFileSourceId,liblas_c),LASError,(LASHeaderH,UInt16),hHeader,value)
end

function LASHeader_GetProjectId(hHeader::LASHeaderH)
    ccall((:LASHeader_GetProjectId,liblas_c),Ptr{UInt8},(LASHeaderH,),hHeader)
end

function LASHeader_SetProjectId(hHeader::LASHeaderH,value::Ptr{UInt8})
    ccall((:LASHeader_SetProjectId,liblas_c),LASError,(LASHeaderH,Ptr{UInt8}),hHeader,value)
end

function LASHeader_SetGUID(hHeader::LASHeaderH,hId::LASGuidH)
    ccall((:LASHeader_SetGUID,liblas_c),LASError,(LASHeaderH,LASGuidH),hHeader,hId)
end

function LASHeader_GetVersionMajor(hHeader::LASHeaderH)
    ccall((:LASHeader_GetVersionMajor,liblas_c),Cuchar,(LASHeaderH,),hHeader)
end

function LASHeader_SetVersionMajor(hHeader::LASHeaderH,value::Cuchar)
    ccall((:LASHeader_SetVersionMajor,liblas_c),LASError,(LASHeaderH,Cuchar),hHeader,value)
end

function LASHeader_GetVersionMinor(hHeader::LASHeaderH)
    ccall((:LASHeader_GetVersionMinor,liblas_c),Cuchar,(LASHeaderH,),hHeader)
end

function LASHeader_SetVersionMinor(hHeader::LASHeaderH,value::Cuchar)
    ccall((:LASHeader_SetVersionMinor,liblas_c),LASError,(LASHeaderH,Cuchar),hHeader,value)
end

function LASHeader_GetSystemId(hHeader::LASHeaderH)
    ccall((:LASHeader_GetSystemId,liblas_c),Ptr{UInt8},(LASHeaderH,),hHeader)
end

function LASHeader_SetSystemId(hHeader::LASHeaderH,value::Ptr{UInt8})
    ccall((:LASHeader_SetSystemId,liblas_c),LASError,(LASHeaderH,Ptr{UInt8}),hHeader,value)
end

function LASHeader_GetSoftwareId(hHeader::LASHeaderH)
    ccall((:LASHeader_GetSoftwareId,liblas_c),Ptr{UInt8},(LASHeaderH,),hHeader)
end

function LASHeader_SetSoftwareId(hHeader::LASHeaderH,value::Ptr{UInt8})
    ccall((:LASHeader_SetSoftwareId,liblas_c),LASError,(LASHeaderH,Ptr{UInt8}),hHeader,value)
end

function LASHeader_GetReserved(hHeader::LASHeaderH)
    ccall((:LASHeader_GetReserved,liblas_c),UInt16,(LASHeaderH,),hHeader)
end

function LASHeader_SetReserved(hHeader::LASHeaderH,value::UInt16)
    ccall((:LASHeader_SetReserved,liblas_c),LASError,(LASHeaderH,UInt16),hHeader,value)
end

function LASHeader_GetCreationDOY(hHeader::LASHeaderH)
    ccall((:LASHeader_GetCreationDOY,liblas_c),UInt16,(LASHeaderH,),hHeader)
end

function LASHeader_SetCreationDOY(hHeader::LASHeaderH,value::UInt16)
    ccall((:LASHeader_SetCreationDOY,liblas_c),LASError,(LASHeaderH,UInt16),hHeader,value)
end

function LASHeader_GetCreationYear(hHeader::LASHeaderH)
    ccall((:LASHeader_GetCreationYear,liblas_c),UInt16,(LASHeaderH,),hHeader)
end

function LASHeader_SetCreationYear(hHeader::LASHeaderH,value::UInt16)
    ccall((:LASHeader_SetCreationYear,liblas_c),LASError,(LASHeaderH,UInt16),hHeader,value)
end

function LASHeader_GetHeaderSize(hHeader::LASHeaderH)
    ccall((:LASHeader_GetHeaderSize,liblas_c),UInt16,(LASHeaderH,),hHeader)
end

function LASHeader_GetDataOffset(hHeader::LASHeaderH)
    ccall((:LASHeader_GetDataOffset,liblas_c),UInt32,(LASHeaderH,),hHeader)
end

function LASHeader_SetDataOffset(hHeader::LASHeaderH,value::UInt32)
    ccall((:LASHeader_SetDataOffset,liblas_c),LASError,(LASHeaderH,UInt32),hHeader,value)
end

function LASHeader_GetHeaderPadding(hHeader::LASHeaderH)
    ccall((:LASHeader_GetHeaderPadding,liblas_c),UInt32,(LASHeaderH,),hHeader)
end

function LASHeader_SetHeaderPadding(hHeader::LASHeaderH,value::UInt32)
    ccall((:LASHeader_SetHeaderPadding,liblas_c),LASError,(LASHeaderH,UInt32),hHeader,value)
end

function LASHeader_GetRecordsCount(hHeader::LASHeaderH)
    ccall((:LASHeader_GetRecordsCount,liblas_c),UInt32,(LASHeaderH,),hHeader)
end

function LASHeader_GetDataRecordLength(hHeader::LASHeaderH)
    ccall((:LASHeader_GetDataRecordLength,liblas_c),UInt16,(LASHeaderH,),hHeader)
end

function LASHeader_SetDataRecordLength(hHeader::LASHeaderH,value::UInt16)
    ccall((:LASHeader_SetDataRecordLength,liblas_c),LASError,(LASHeaderH,UInt16),hHeader,value)
end

function LASHeader_GetDataFormatId(hHeader::LASHeaderH)
    ccall((:LASHeader_GetDataFormatId,liblas_c),Cuchar,(LASHeaderH,),hHeader)
end

function LASHeader_SetDataFormatId(hHeader::LASHeaderH,value::Cuchar)
    ccall((:LASHeader_SetDataFormatId,liblas_c),LASError,(LASHeaderH,Cuchar),hHeader,value)
end

function LASHeader_GetPointRecordsCount(hHeader::LASHeaderH)
    ccall((:LASHeader_GetPointRecordsCount,liblas_c),UInt32,(LASHeaderH,),hHeader)
end

function LASHeader_SetPointRecordsCount(hHeader::LASHeaderH,value::UInt32)
    ccall((:LASHeader_SetPointRecordsCount,liblas_c),LASError,(LASHeaderH,UInt32),hHeader,value)
end

function LASHeader_GetPointRecordsByReturnCount(hHeader::LASHeaderH,index::Cint)
    ccall((:LASHeader_GetPointRecordsByReturnCount,liblas_c),UInt32,(LASHeaderH,Cint),hHeader,index)
end

function LASHeader_SetPointRecordsByReturnCount(hHeader::LASHeaderH,index::Cint,value::UInt32)
    ccall((:LASHeader_SetPointRecordsByReturnCount,liblas_c),LASError,(LASHeaderH,Cint,UInt32),hHeader,index,value)
end

function LASHeader_GetScaleX(hHeader::LASHeaderH)
    ccall((:LASHeader_GetScaleX,liblas_c),Cdouble,(LASHeaderH,),hHeader)
end

function LASHeader_GetScaleY(hHeader::LASHeaderH)
    ccall((:LASHeader_GetScaleY,liblas_c),Cdouble,(LASHeaderH,),hHeader)
end

function LASHeader_GetScaleZ(hHeader::LASHeaderH)
    ccall((:LASHeader_GetScaleZ,liblas_c),Cdouble,(LASHeaderH,),hHeader)
end

function LASHeader_SetScale(hHeader::LASHeaderH,x::Cdouble,y::Cdouble,z::Cdouble)
    ccall((:LASHeader_SetScale,liblas_c),LASError,(LASHeaderH,Cdouble,Cdouble,Cdouble),hHeader,x,y,z)
end

function LASHeader_GetOffsetX(hHeader::LASHeaderH)
    ccall((:LASHeader_GetOffsetX,liblas_c),Cdouble,(LASHeaderH,),hHeader)
end

function LASHeader_GetOffsetY(hHeader::LASHeaderH)
    ccall((:LASHeader_GetOffsetY,liblas_c),Cdouble,(LASHeaderH,),hHeader)
end

function LASHeader_GetOffsetZ(hHeader::LASHeaderH)
    ccall((:LASHeader_GetOffsetZ,liblas_c),Cdouble,(LASHeaderH,),hHeader)
end

function LASHeader_SetOffset(hHeader::LASHeaderH,x::Cdouble,y::Cdouble,z::Cdouble)
    ccall((:LASHeader_SetOffset,liblas_c),LASError,(LASHeaderH,Cdouble,Cdouble,Cdouble),hHeader,x,y,z)
end

function LASHeader_GetMinX(hHeader::LASHeaderH)
    ccall((:LASHeader_GetMinX,liblas_c),Cdouble,(LASHeaderH,),hHeader)
end

function LASHeader_GetMinY(hHeader::LASHeaderH)
    ccall((:LASHeader_GetMinY,liblas_c),Cdouble,(LASHeaderH,),hHeader)
end

function LASHeader_GetMinZ(hHeader::LASHeaderH)
    ccall((:LASHeader_GetMinZ,liblas_c),Cdouble,(LASHeaderH,),hHeader)
end

function LASHeader_SetMin(hHeader::LASHeaderH,x::Cdouble,y::Cdouble,z::Cdouble)
    ccall((:LASHeader_SetMin,liblas_c),LASError,(LASHeaderH,Cdouble,Cdouble,Cdouble),hHeader,x,y,z)
end

function LASHeader_GetMaxX(hHeader::LASHeaderH)
    ccall((:LASHeader_GetMaxX,liblas_c),Cdouble,(LASHeaderH,),hHeader)
end

function LASHeader_GetMaxY(hHeader::LASHeaderH)
    ccall((:LASHeader_GetMaxY,liblas_c),Cdouble,(LASHeaderH,),hHeader)
end

function LASHeader_GetMaxZ(hHeader::LASHeaderH)
    ccall((:LASHeader_GetMaxZ,liblas_c),Cdouble,(LASHeaderH,),hHeader)
end

function LASHeader_SetMax(hHeader::LASHeaderH,x::Cdouble,y::Cdouble,z::Cdouble)
    ccall((:LASHeader_SetMax,liblas_c),LASError,(LASHeaderH,Cdouble,Cdouble,Cdouble),hHeader,x,y,z)
end

function LASHeader_GetVLR(hHeader::LASHeaderH,i::UInt32)
    ccall((:LASHeader_GetVLR,liblas_c),LASVLRH,(LASHeaderH,UInt32),hHeader,i)
end

function LASHeader_DeleteVLR(hHeader::LASHeaderH,index::UInt32)
    ccall((:LASHeader_DeleteVLR,liblas_c),LASError,(LASHeaderH,UInt32),hHeader,index)
end

function LASHeader_AddVLR(hHeader::LASHeaderH,hVLR::LASVLRH)
    ccall((:LASHeader_AddVLR,liblas_c),LASError,(LASHeaderH,LASVLRH),hHeader,hVLR)
end

function LASHeader_GetXML(hHeader::LASHeaderH)
    ccall((:LASHeader_GetXML,liblas_c),Ptr{UInt8},(LASHeaderH,),hHeader)
end

function LASWriter_Create(filename::Ptr{UInt8},hHeader::LASHeaderH,mode::Cint)
    ccall((:LASWriter_Create,liblas_c),LASWriterH,(Ptr{UInt8},LASHeaderH,Cint),filename,hHeader,mode)
end

function LASWriter_WritePoint(hWriter::LASWriterH,hPoint::LASPointH)
    ccall((:LASWriter_WritePoint,liblas_c),LASError,(LASWriterH,LASPointH),hWriter,hPoint)
end

function LASWriter_WriteHeader(hWriter::LASWriterH,hHeader::LASHeaderH)
    ccall((:LASWriter_WriteHeader,liblas_c),LASError,(LASWriterH,LASHeaderH),hWriter,hHeader)
end

function LASWriter_WriteOwnedHeader(hWriter::LASWriterH)
    ccall((:LASWriter_WriteOwnedHeader,liblas_c),LASError,(LASWriterH,),hWriter)
end

function LASWriter_Destroy(hWriter::LASWriterH)
    ccall((:LASWriter_Destroy,liblas_c),Void,(LASWriterH,),hWriter)
end

function LASWriter_GetHeader(hWriter::LASWriterH)
    ccall((:LASWriter_GetHeader,liblas_c),LASHeaderH,(LASWriterH,),hWriter)
end

function LASWriter_SetHeader(hWriter::LASWriterH,hHeader::LASHeaderH)
    ccall((:LASWriter_SetHeader,liblas_c),Void,(LASWriterH,LASHeaderH),hWriter,hHeader)
end

function LASWriter_SetSRS(hWriter::LASWriterH,hSRS::LASSRSH)
    ccall((:LASWriter_SetSRS,liblas_c),LASError,(LASWriterH,LASSRSH),hWriter,hSRS)
end

function LASWriter_SetInputSRS(hWriter::LASWriterH,hSRS::LASSRSH)
    ccall((:LASWriter_SetInputSRS,liblas_c),LASError,(LASWriterH,LASSRSH),hWriter,hSRS)
end

function LASWriter_SetOutputSRS(hWriter::LASWriterH,hSRS::LASSRSH)
    ccall((:LASWriter_SetOutputSRS,liblas_c),LASError,(LASWriterH,LASSRSH),hWriter,hSRS)
end

function LASHeader_GetGUID(hHeader::LASHeaderH)
    ccall((:LASHeader_GetGUID,liblas_c),LASGuidH,(LASHeaderH,),hHeader)
end

function LASGuid_Create()
    ccall((:LASGuid_Create,liblas_c),LASGuidH,())
end

function LASGuid_CreateFromString(string::Ptr{UInt8})
    ccall((:LASGuid_CreateFromString,liblas_c),LASGuidH,(Ptr{UInt8},),string)
end

function LASGuid_Destroy(hId::LASGuidH)
    ccall((:LASGuid_Destroy,liblas_c),Void,(LASGuidH,),hId)
end

function LASGuid_Equals(hId1::LASGuidH,hId2::LASGuidH)
    ccall((:LASGuid_Equals,liblas_c),Cint,(LASGuidH,LASGuidH),hId1,hId2)
end

function LASGuid_AsString(hId::LASGuidH)
    ccall((:LASGuid_AsString,liblas_c),Ptr{UInt8},(LASGuidH,),hId)
end

function LASVLR_Create()
    ccall((:LASVLR_Create,liblas_c),LASVLRH,())
end

function LASVLR_Destroy(hVLR::LASVLRH)
    ccall((:LASVLR_Destroy,liblas_c),Void,(LASVLRH,),hVLR)
end

function LASVLR_GetUserId(hVLR::LASVLRH)
    ccall((:LASVLR_GetUserId,liblas_c),Ptr{UInt8},(LASVLRH,),hVLR)
end

function LASVLR_SetUserId(hVLR::LASVLRH,value::Ptr{UInt8})
    ccall((:LASVLR_SetUserId,liblas_c),LASError,(LASVLRH,Ptr{UInt8}),hVLR,value)
end

function LASVLR_GetDescription(hVLR::LASVLRH)
    ccall((:LASVLR_GetDescription,liblas_c),Ptr{UInt8},(LASVLRH,),hVLR)
end

function LASVLR_SetDescription(hVLR::LASVLRH,value::Ptr{UInt8})
    ccall((:LASVLR_SetDescription,liblas_c),LASError,(LASVLRH,Ptr{UInt8}),hVLR,value)
end

function LASVLR_GetRecordLength(hVLR::LASVLRH)
    ccall((:LASVLR_GetRecordLength,liblas_c),UInt16,(LASVLRH,),hVLR)
end

function LASVLR_SetRecordLength(hVLR::LASVLRH,value::UInt16)
    ccall((:LASVLR_SetRecordLength,liblas_c),LASError,(LASVLRH,UInt16),hVLR,value)
end

function LASVLR_GetRecordId(hVLR::LASVLRH)
    ccall((:LASVLR_GetRecordId,liblas_c),UInt16,(LASVLRH,),hVLR)
end

function LASVLR_SetRecordId(hVLR::LASVLRH,value::UInt16)
    ccall((:LASVLR_SetRecordId,liblas_c),LASError,(LASVLRH,UInt16),hVLR,value)
end

function LASVLR_GetReserved(hVLR::LASVLRH)
    ccall((:LASVLR_GetReserved,liblas_c),UInt16,(LASVLRH,),hVLR)
end

function LASVLR_SetReserved(hVLR::LASVLRH,value::UInt16)
    ccall((:LASVLR_SetReserved,liblas_c),LASError,(LASVLRH,UInt16),hVLR,value)
end

function LASVLR_GetData(hVLR::LASVLRH,data::Ptr{Cuchar})
    ccall((:LASVLR_GetData,liblas_c),LASError,(LASVLRH,Ptr{Cuchar}),hVLR,data)
end

function LASVLR_SetData(hVLR::LASVLRH,data::Ptr{Cuchar},length::UInt16)
    ccall((:LASVLR_SetData,liblas_c),LASError,(LASVLRH,Ptr{Cuchar},UInt16),hVLR,data,length)
end

function LASColor_Create()
    ccall((:LASColor_Create,liblas_c),LASColorH,())
end

function LASColor_Destroy(hColor::LASColorH)
    ccall((:LASColor_Destroy,liblas_c),Void,(LASColorH,),hColor)
end

function LASColor_GetRed(hColor::LASColorH)
    ccall((:LASColor_GetRed,liblas_c),UInt16,(LASColorH,),hColor)
end

function LASColor_SetRed(hColor::LASColorH,value::UInt16)
    ccall((:LASColor_SetRed,liblas_c),LASError,(LASColorH,UInt16),hColor,value)
end

function LASColor_GetGreen(hColor::LASColorH)
    ccall((:LASColor_GetGreen,liblas_c),UInt16,(LASColorH,),hColor)
end

function LASColor_SetGreen(hColor::LASColorH,value::UInt16)
    ccall((:LASColor_SetGreen,liblas_c),LASError,(LASColorH,UInt16),hColor,value)
end

function LASColor_GetBlue(hColor::LASColorH)
    ccall((:LASColor_GetBlue,liblas_c),UInt16,(LASColorH,),hColor)
end

function LASColor_SetBlue(hColor::LASColorH,value::UInt16)
    ccall((:LASColor_SetBlue,liblas_c),LASError,(LASColorH,UInt16),hColor,value)
end

function LASPoint_GetColor(hPoint::LASPointH)
    ccall((:LASPoint_GetColor,liblas_c),LASColorH,(LASPointH,),hPoint)
end

function LASPoint_SetColor(hPoint::LASPointH,hColor::LASColorH)
    ccall((:LASPoint_SetColor,liblas_c),LASError,(LASPointH,LASColorH),hPoint,hColor)
end

function LASSRS_Create()
    ccall((:LASSRS_Create,liblas_c),LASSRSH,())
end

function LASSRS_GetGTIF(hSRS::LASSRSH)
    ccall((:LASSRS_GetGTIF,liblas_c),Ptr{Void},(LASSRSH,),hSRS)
end

function LASSRS_SetGTIF(hSRS::LASSRSH,pgtiff::Ptr{Void},ptiff::Ptr{Void})
    ccall((:LASSRS_SetGTIF,liblas_c),LASError,(LASSRSH,Ptr{Void},Ptr{Void}),hSRS,pgtiff,ptiff)
end

function LASSRS_GetWKT(hSRS::LASSRSH)
    ccall((:LASSRS_GetWKT,liblas_c),Ptr{UInt8},(LASSRSH,),hSRS)
end

function LASSRS_GetWKT_CompoundOK(hSRS::LASSRSH)
    ccall((:LASSRS_GetWKT_CompoundOK,liblas_c),Ptr{UInt8},(LASSRSH,),hSRS)
end

function LASSRS_SetWKT(hSRS::LASSRSH,value::Ptr{UInt8})
    ccall((:LASSRS_SetWKT,liblas_c),LASError,(LASSRSH,Ptr{UInt8}),hSRS,value)
end

function LASSRS_SetFromUserInput(hSRS::LASSRSH,value::Ptr{UInt8})
    ccall((:LASSRS_SetFromUserInput,liblas_c),LASError,(LASSRSH,Ptr{UInt8}),hSRS,value)
end

function LASSRS_GetProj4(hSRS::LASSRSH)
    ccall((:LASSRS_GetProj4,liblas_c),Ptr{UInt8},(LASSRSH,),hSRS)
end

function LASSRS_SetProj4(hSRS::LASSRSH,value::Ptr{UInt8})
    ccall((:LASSRS_SetProj4,liblas_c),LASError,(LASSRSH,Ptr{UInt8}),hSRS,value)
end

function LASSRS_SetVerticalCS(hSRS::LASSRSH,verticalCSType::Cint,citation::Ptr{UInt8},verticalDatum::Cint,verticalUnits::Cint)
    ccall((:LASSRS_SetVerticalCS,liblas_c),LASError,(LASSRSH,Cint,Ptr{UInt8},Cint,Cint),hSRS,verticalCSType,citation,verticalDatum,verticalUnits)
end

function LASHeader_GetSRS(hHeader::LASHeaderH)
    ccall((:LASHeader_GetSRS,liblas_c),LASSRSH,(LASHeaderH,),hHeader)
end

function LASHeader_SetSRS(hHeader::LASHeaderH,hSRS::LASSRSH)
    ccall((:LASHeader_SetSRS,liblas_c),LASError,(LASHeaderH,LASSRSH),hHeader,hSRS)
end

function LASSRS_Destroy(hSRS::LASSRSH)
    ccall((:LASSRS_Destroy,liblas_c),Void,(LASSRSH,),hSRS)
end

function LASSRS_GetVLR(hSRS::LASSRSH,i::UInt32)
    ccall((:LASSRS_GetVLR,liblas_c),LASVLRH,(LASSRSH,UInt32),hSRS,i)
end

function LASSRS_GetVLRCount(hSRS::LASSRSH)
    ccall((:LASSRS_GetVLRCount,liblas_c),UInt32,(LASSRSH,),hSRS)
end

function LASString_Free(string::Ptr{UInt8})
    ccall((:LASString_Free,liblas_c),Void,(Ptr{UInt8},),string)
end

function LASSchema_GetByteSize(hFormat::LASSchemaH)
    ccall((:LASSchema_GetByteSize,liblas_c),UInt32,(LASSchemaH,),hFormat)
end

function LASSchema_GetBaseByteSize(hFormat::LASSchemaH)
    ccall((:LASSchema_GetBaseByteSize,liblas_c),UInt32,(LASSchemaH,),hFormat)
end

function LASHeader_GetSchema(hHeader::LASHeaderH)
    ccall((:LASHeader_GetSchema,liblas_c),LASSchemaH,(LASHeaderH,),hHeader)
end

function LASHeader_SetSchema(hHeader::LASHeaderH,hFormat::LASSchemaH)
    ccall((:LASHeader_SetSchema,liblas_c),LASError,(LASHeaderH,LASSchemaH),hHeader,hFormat)
end

function LASSchema_Destroy(hFormat::LASSchemaH)
    ccall((:LASSchema_Destroy,liblas_c),Void,(LASSchemaH,),hFormat)
end

function LASHeader_Compressed(hHeader::LASHeaderH)
    ccall((:LASHeader_Compressed,liblas_c),Cint,(LASHeaderH,),hHeader)
end

function LASHeader_SetCompressed(hHeader::LASHeaderH,b::Cint)
    ccall((:LASHeader_SetCompressed,liblas_c),LASError,(LASHeaderH,Cint),hHeader,b)
end
