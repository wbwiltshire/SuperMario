cmake_minimum_required(VERSION 3.10)
project(SuperMario)

# Set compiler warning levels
if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    if (CMAKE_CXX_FLAGS MATCHES "/W[0-4]")
		string(REGEX REPLACE "/W[0-4]" "/W0" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
    else()
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
    endif()
endif()

# Set SDL library location
set(BIN_DIR ${PROJECT_SOURCE_DIR}/bin)
set(SDL2_DIR ../Dependencies/libSDL)
set(SDL2_IMAGE_DIR ../Dependencies/SDL2_image)
set(SDL2_MIXER_DIR ../Dependencies/SDL2_mixer-2.0.2)
include_directories(${SDL2_DIR}/include ${SDL2_IMAGE_DIR}/include ${SDL2_MIXER_DIR}/include)
link_directories(${SDL2_DIR}/lib/x64 ${SDL2_IMAGE_DIR}/lib/x64 ${SDL2_MIXER_DIR}/lib/x64)

# Compile and Link
include_directories(source)
file(GLOB_RECURSE SuperMario_SOURCES "source/*.cpp")
add_executable (SuperMario ${SuperMario_SOURCES})
target_link_libraries(SuperMario SDL2_mixer.lib SDL2.lib SDL2main.lib SDL2_image.lib)

# Install files to bin directory
install(TARGETS SuperMario DESTINATION ${BIN_DIR})


