# Super Mario LibSDL makefile
# Link: https://docs.microsoft.com/en-us/cpp/build/nmake-reference
#	   https://github.com/jakowskidev/uMario_Jakowski
# Note: Apparently one of the SDL libraries is compiled with to export DLL definitions, so
#       the linker will automatically create a .lib and .exp file
#
CC=cl
#CFLAGS=/c 
#Compile with debug info
CFLAGS=/c /EHsc /Zi /I..\Dependencies\libSDL\include /I..\Dependencies\SDL_ttf\include /I..\Dependencies\SDL2_image\include /I..\Dependencies\SDL2_mixer-2.0.2\include
LINK=link
#LFLAGS=
# Link: https://docs.microsoft.com/en-us/cpp/build/reference/linker-options
#Link with debug info
LFLAGS= /DEBUG /SUBSYSTEM:CONSOLE /LIBPATH:..\Dependencies\libSDL\lib\x64 /LIBPATH:..\Dependencies\SDL_ttf\lib\x64 /LIBPATH:..\Dependencies\SDL2_image\lib\x64 /LIBPATH:..\Dependencies\SDL2_mixer-2.0.2\lib\x64
LIBS=SDL2_mixer.lib SDL2.lib SDL2main.lib SDL2_ttf.lib SDL2_image.lib user32.lib gdi32.lib 
ODIR=bin
SDIR=source
EXE=SuperMario.exe

all: $(ODIR)\$(EXE)

{$(SDIR)}.cpp{$(ODIR)}.obj: 
	$(CC) $(CFLAGS) $** /Fo$@

$(ODIR)\$(EXE): $(ODIR)\main.obj $(ODIR)\AboutMenu.obj $(ODIR)\Beetle.obj $(ODIR)\Block.obj $(ODIR)\BlockDebris.obj $(ODIR)\Bowser.obj $(ODIR)\Bubble.obj $(ODIR)\BulletBill.obj $(ODIR)\BulletBillSpawner.obj \
 $(ODIR)\CFG.obj $(ODIR)\Cheep.obj $(ODIR)\CheepSpawner.obj $(ODIR)\Coin.obj $(ODIR)\Console.obj $(ODIR)\Core.obj $(ODIR)\Event.obj $(ODIR)\Fire.obj $(ODIR)\FireBall.obj $(ODIR)\Flag.obj $(ODIR)\Flower.obj \
 $(ODIR)\Goombas.obj $(ODIR)\Hammer.obj $(ODIR)\HammerBro.obj $(ODIR)\IMG.obj $(ODIR)\Koppa.obj $(ODIR)\Lakito.obj $(ODIR)\LevelEditor.obj $(ODIR)\LevelText.obj $(ODIR)\LoadingMenu.obj $(ODIR)\MainMenu.obj \
 $(ODIR)\Map.obj $(ODIR)\MapLevel.obj $(ODIR)\Menu.obj $(ODIR)\MenuManager.obj $(ODIR)\MenuOption.obj $(ODIR)\Minion.obj $(ODIR)\Mushroom.obj $(ODIR)\Music.obj $(ODIR)\MusicManager.obj $(ODIR)\OptionsMenu.obj \
 $(ODIR)\PauseMenu.obj $(ODIR)\Pipe.obj $(ODIR)\Plant.obj $(ODIR)\Platform.obj $(ODIR)\Player.obj $(ODIR)\PlayerFireBall.obj $(ODIR)\Points.obj $(ODIR)\Spikey.obj $(ODIR)\Spring.obj $(ODIR)\Sprite.obj \
 $(ODIR)\Squid.obj $(ODIR)\Star.obj $(ODIR)\Text.obj $(ODIR)\Texture.obj $(ODIR)\Toad.obj $(ODIR)\UpFire.obj $(ODIR)\Vector2.obj $(ODIR)\Vine.obj
	$(LINK) $**  /out:$@ $(LFLAGS) $(LIBS)

clean:
	@IF EXIST *.pdb (del *.pdb)
	@IF EXIST bin\*.obj (del bin\*.obj)
	@IF EXIST bin\*.pdb (del bin\*.pdb)
	@IF EXIST bin\$(EXE) (del bin\$(EXE))
	@IF EXIST bin\*.ilk (del bin\*.ilk)
	@IF EXIST bin\*.lib (del bin\*.lib)
	@IF EXIST bin\*.exp (del bin\*.exp)