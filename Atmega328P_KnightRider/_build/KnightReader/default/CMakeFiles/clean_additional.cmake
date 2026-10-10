# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "C:\\Projects\\GitHub\\MPLAB_ARDUINO\\Atmega328P_KnightRider\\out\\KnightReader\\default.cmf"
  "C:\\Projects\\GitHub\\MPLAB_ARDUINO\\Atmega328P_KnightRider\\out\\KnightReader\\default.hex"
  "C:\\Projects\\GitHub\\MPLAB_ARDUINO\\Atmega328P_KnightRider\\out\\KnightReader\\default.hxl"
  "C:\\Projects\\GitHub\\MPLAB_ARDUINO\\Atmega328P_KnightRider\\out\\KnightReader\\default.mum"
  "C:\\Projects\\GitHub\\MPLAB_ARDUINO\\Atmega328P_KnightRider\\out\\KnightReader\\default.o"
  "C:\\Projects\\GitHub\\MPLAB_ARDUINO\\Atmega328P_KnightRider\\out\\KnightReader\\default.sdb"
  "C:\\Projects\\GitHub\\MPLAB_ARDUINO\\Atmega328P_KnightRider\\out\\KnightReader\\default.sym"
  )
endif()
