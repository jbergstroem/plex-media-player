set(INSTALL_BIN_DIR .)
set(INSTALL_RESOURCE_DIR resources)
set(HAVE_UPDATER 1)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /Oy-")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /Oy-")

find_library(WINMM winmm)
find_library(IMMLIB imm32)
find_library(VERLIB version)
set(OS_LIBS ${WINMM} ${IMMLIB} ${VERLIB})

# Add install rules for required system runtimes such as MSVCRxx.dll
SET (CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS_SKIP ON)
INCLUDE(InstallRequiredSystemLibraries)
IF (CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS)
  INSTALL(FILES ${CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS}
    DESTINATION ${INSTALL_BIN_DIR}
    PERMISSIONS OWNER_WRITE OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ
    COMPONENT Runtime)
ENDIF (CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS)
