# Install script for directory: /develop/cloud_application_library/avcodec/3rd/source/libyuv

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/develop/cloud_application_library/avcodec/3rd/source/build")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "0")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/develop/cloud_application_library/avcodec/3rd/source/libyuv/build/libyuv.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/libyuv" TYPE FILE FILES
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/basic_types.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/compare.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/convert.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/convert_argb.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/convert_from.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/convert_from_argb.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/cpu_id.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/planar_functions.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/rotate.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/rotate_argb.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/rotate_row.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/row.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/scale.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/scale_argb.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/scale_row.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/version.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/video_common.h"
    "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv/mjpeg_decoder.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/develop/cloud_application_library/avcodec/3rd/source/libyuv/include/libyuv.h")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/develop/cloud_application_library/avcodec/3rd/source/libyuv/build/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/develop/cloud_application_library/avcodec/3rd/source/libyuv/build/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
