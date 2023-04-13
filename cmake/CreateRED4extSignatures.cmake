# Generate header of all RED4ext files

set(ZOLTAN_ALL_SIGNATURES "${PROJECT_BINARY_DIR}/zoltan/Signatures.hpp")

file(GLOB_RECURSE RED4EXT_ZOLTAN_HEADERS ${PROJECT_SOURCE_DIR}/deps/red4ext.sdk/include/RED4ext/*.hpp)
list(FILTER RED4EXT_ZOLTAN_HEADERS EXCLUDE REGEX ".*-inl.hpp")
list(FILTER RED4EXT_ZOLTAN_HEADERS EXCLUDE REGEX "VFTEnum.hpp")

file(WRITE ${ZOLTAN_ALL_SIGNATURES} "")
foreach(RED4EXT_ZOLTAN_HEADER ${RED4EXT_ZOLTAN_HEADERS})
 file(RELATIVE_PATH IN_FILE_RELATIVE ${PROJECT_SOURCE_DIR}/deps/red4ext.sdk/include/ ${RED4EXT_ZOLTAN_HEADER})
 file(APPEND ${ZOLTAN_ALL_SIGNATURES} "#include <${IN_FILE_RELATIVE}>\n")
endforeach()