# Super Mario LibSDL makefile
# Link: https://docs.microsoft.com/en-us/cpp/build/nmake-reference
#	   https://github.com/jakowskidev/uMario_Jakowski
# Note: Apparently one of the SDL libraries is compiled with to export DLL definitions, so
#       the linker will automatically create a .lib and .exp file
#
all: debug

build_dir:
	rmdir /S/Q build
	@IF Not EXIST build (mkdir build)

debug: 
	cd build
	cmake G -A x64 ..
	devenv SuperMario.sln /build "Debug|x64" /project INSTALL

clean:
	del /Q bin\SuperMario.exe

run: 
	cd bin
	SuperMario.exe
