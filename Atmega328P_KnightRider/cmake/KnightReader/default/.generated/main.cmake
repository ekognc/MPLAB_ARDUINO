include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(KnightReader_default_library_list )

# Handle files with suffix (s|as|asm|AS|ASM|As|aS|Asm), for group default-XC8
if(KnightReader_default_default_XC8_FILE_TYPE_assemble)
add_library(KnightReader_default_default_XC8_assemble OBJECT ${KnightReader_default_default_XC8_FILE_TYPE_assemble})
    KnightReader_default_default_XC8_assemble_rule(KnightReader_default_default_XC8_assemble)
    list(APPEND KnightReader_default_library_list "$<TARGET_OBJECTS:KnightReader_default_default_XC8_assemble>")

endif()

# Handle files with suffix S, for group default-XC8
if(KnightReader_default_default_XC8_FILE_TYPE_assemblePreprocess)
add_library(KnightReader_default_default_XC8_assemblePreprocess OBJECT ${KnightReader_default_default_XC8_FILE_TYPE_assemblePreprocess})
    KnightReader_default_default_XC8_assemblePreprocess_rule(KnightReader_default_default_XC8_assemblePreprocess)
    list(APPEND KnightReader_default_library_list "$<TARGET_OBJECTS:KnightReader_default_default_XC8_assemblePreprocess>")

endif()

# Handle files with suffix [cC], for group default-XC8
if(KnightReader_default_default_XC8_FILE_TYPE_compile)
add_library(KnightReader_default_default_XC8_compile OBJECT ${KnightReader_default_default_XC8_FILE_TYPE_compile})
    KnightReader_default_default_XC8_compile_rule(KnightReader_default_default_XC8_compile)
    list(APPEND KnightReader_default_library_list "$<TARGET_OBJECTS:KnightReader_default_default_XC8_compile>")

endif()

# Handle files with suffix elf, for group default-XC8
if(KnightReader_default_default_XC8_FILE_TYPE_objcopy_avr)
add_library(KnightReader_default_default_XC8_objcopy_avr OBJECT ${KnightReader_default_default_XC8_FILE_TYPE_objcopy_avr})
    KnightReader_default_default_XC8_objcopy_avr_rule(KnightReader_default_default_XC8_objcopy_avr)
    list(APPEND KnightReader_default_library_list "$<TARGET_OBJECTS:KnightReader_default_default_XC8_objcopy_avr>")

endif()

# Handle files with suffix elf, for group default-XC8
if(KnightReader_default_default_XC8_FILE_TYPE_objcopy_lss)
add_library(KnightReader_default_default_XC8_objcopy_lss OBJECT ${KnightReader_default_default_XC8_FILE_TYPE_objcopy_lss})
    KnightReader_default_default_XC8_objcopy_lss_rule(KnightReader_default_default_XC8_objcopy_lss)
    list(APPEND KnightReader_default_library_list "$<TARGET_OBJECTS:KnightReader_default_default_XC8_objcopy_lss>")

endif()


# Main target for this project
add_executable(KnightReader_default_image_iO16QJ5_ ${KnightReader_default_library_list})

set_target_properties(KnightReader_default_image_iO16QJ5_ PROPERTIES
    OUTPUT_NAME "default"
    SUFFIX ".elf"
    ADDITIONAL_CLEAN_FILES "${output_extensions}"
    RUNTIME_OUTPUT_DIRECTORY "${KnightReader_default_output_dir}")
target_link_libraries(KnightReader_default_image_iO16QJ5_ PRIVATE ${KnightReader_default_default_XC8_FILE_TYPE_link})
# Add the link options from the rule file.
KnightReader_default_link_rule( KnightReader_default_image_iO16QJ5_)


#Add objcopy steps
KnightReader_default_objcopy_avr_rule(KnightReader_default_image_iO16QJ5_)
KnightReader_default_objcopy_lss_rule(KnightReader_default_image_iO16QJ5_)

