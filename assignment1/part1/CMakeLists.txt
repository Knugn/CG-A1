cmake_minimum_required(VERSION 2.6.0)

# Specify project name
project(Part1)

# Set extra compiler flags
if(UNIX)
  set(CMAKE_CXX_FLAGS "-W -Wall -std=c++0x")
endif(UNIX)

# Add source directories
aux_source_directory("${CMAKE_CURRENT_SOURCE_DIR}/src" Part1_SRCS)

# Add include directories
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/src")

# Create variable for required libraries
set(requiredLibs)

# Tell CMake where to look for extra modules
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/modules/")

# GLFW
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/../external/glfw" ${CMAKE_CURRENT_BINARY_DIR}/glfw)
include_directories(SYSTEM "${CMAKE_CURRENT_SOURCE_DIR}/../external/glfw/include")

# OpenGL
find_package(OpenGL REQUIRED)
if(OPENGL_FOUND)
  include_directories( SYSTEM ${OPENGL_INCLUDE_DIR})
  set(requiredLibs ${requiredLibs} ${OPENGL_LIBRARIES})
endif(OPENGL_FOUND)

# GLEW
aux_source_directory("${CMAKE_CURRENT_SOURCE_DIR}/../external/glew/src" Part1_SRCS)
include_directories(SYSTEM "${CMAKE_CURRENT_SOURCE_DIR}/../external/glew/include")
add_definitions(-DGLEW_STATIC)

# GLM
include_directories(SYSTEM "${CMAKE_CURRENT_SOURCE_DIR}/../external/glm")

# Create build files for executable
add_executable(part1 ${Part1_SRCS})

# Link against libraries
target_link_libraries(part1 glfw ${requiredLibs} ${GLFW_LIBRARIES})

# Install executable
install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/part1 DESTINATION bin)

# Specify build type
set(CMAKE_BUILD_TYPE Release)
