# The following functions contains all the flags passed to the different build stages.

set(PACK_REPO_PATH "C:/Users/emreo/.mchp_packs" CACHE PATH "Path to the root of a pack repository.")

function(KnightReader_default_default_XC8_assemble_rule target)
    set(options
        "-c"
        "${MP_EXTRA_AS_PRE}"
        "-mcpu=ATmega328P"
        "-g"
        "-x"
        "assembler-with-cpp"
        "-mdfp=${PACK_REPO_PATH}/Microchip/ATmega_DFP/3.6.299/xc8"
        "-Wl,--gc-sections"
        "-O1"
        "-ffunction-sections"
        "-fdata-sections"
        "-fshort-enums"
        "-fno-common"
        "-funsigned-char"
        "-funsigned-bitfields"
        "-Wall"
        "-L${CMAKE_CURRENT_SOURCE_DIR}/../../.."
        "-gdwarf-3"
        "-mno-const-data-in-progmem"
        "-Wa,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__ATmega328P__"
        PRIVATE "__DEBUG=1"
        PRIVATE "DEBUG"
        PRIVATE "XPRJ_default=default")
    target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
endfunction()
function(KnightReader_default_default_XC8_assemblePreprocess_rule target)
    set(options
        "-c"
        "${MP_EXTRA_AS_PRE}"
        "-mcpu=ATmega328P"
        "-g"
        "-x"
        "assembler-with-cpp"
        "-mdfp=${PACK_REPO_PATH}/Microchip/ATmega_DFP/3.6.299/xc8"
        "-Wl,--gc-sections"
        "-O1"
        "-ffunction-sections"
        "-fdata-sections"
        "-fshort-enums"
        "-fno-common"
        "-funsigned-char"
        "-funsigned-bitfields"
        "-Wall"
        "-L${CMAKE_CURRENT_SOURCE_DIR}/../../.."
        "-gdwarf-3"
        "-mno-const-data-in-progmem"
        "-Wa,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__ATmega328P__"
        PRIVATE "__DEBUG=1"
        PRIVATE "DEBUG"
        PRIVATE "XPRJ_default=default")
    target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
endfunction()
function(KnightReader_default_default_XC8_compile_rule target)
    set(options
        "-c"
        "${MP_EXTRA_CC_PRE}"
        "-mcpu=ATmega328P"
        "-x"
        "c"
        "-mdfp=${PACK_REPO_PATH}/Microchip/ATmega_DFP/3.6.299/xc8"
        "-Wl,--gc-sections"
        "-O1"
        "-ffunction-sections"
        "-fdata-sections"
        "-fshort-enums"
        "-fno-common"
        "-funsigned-char"
        "-funsigned-bitfields"
        "-Wall"
        "-L${CMAKE_CURRENT_SOURCE_DIR}/../../.."
        "-gdwarf-3"
        "-mno-const-data-in-progmem")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__ATmega328P__"
        PRIVATE "__DEBUG=1"
        PRIVATE "DEBUG"
        PRIVATE "XPRJ_default=default")
    target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
endfunction()
function(KnightReader_default_link_rule target)
    set(options
        "-Wl,-Map=mem.map"
        "${MP_EXTRA_LD_PRE}"
        "-mcpu=ATmega328P"
        "-Wl,--defsym=__MPLAB_BUILD=1"
        "-mdfp=${PACK_REPO_PATH}/Microchip/ATmega_DFP/3.6.299/xc8"
        "-Wl,--gc-sections"
        "-O1"
        "-ffunction-sections"
        "-fdata-sections"
        "-fshort-enums"
        "-fno-common"
        "-funsigned-char"
        "-funsigned-bitfields"
        "-Wall"
        "-L${CMAKE_CURRENT_SOURCE_DIR}/../../.."
        "-gdwarf-3"
        "-mno-const-data-in-progmem"
        "-Wl,--memorysummary,memoryfile.xml"
        "-Wl,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1")
    list(REMOVE_ITEM options "")
    target_link_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__DEBUG=1"
        PRIVATE "XPRJ_default=default")
    target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
endfunction()
function(KnightReader_default_objcopy_avr_rule target)
    add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${OBJCOPY}
        ARGS -O ihex ${KnightReader_default_image_name} ${KnightReader_default_image_base_name}.hex
        WORKING_DIRECTORY ${KnightReader_default_output_dir})
endfunction()
function(KnightReader_default_objcopy_lss_rule target)
    add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${OBJDUMP}
        ARGS --disassemble --wide --demangle --line-numbers --section-headers --source ${KnightReader_default_image_name} > ${KnightReader_default_image_base_name}.lss
        WORKING_DIRECTORY ${KnightReader_default_output_dir})
endfunction()
