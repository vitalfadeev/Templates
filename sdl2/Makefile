all:
	dub run

clean:
ifeq ($(OS),Windows_NT)
	rmdir /Q /S .dub
	del /Q *.exe
	del /Q *.pdb
	del /Q mixins.d
	del /Q dub.selections.json
else
	rm -rf .dub
	rm -f *.exe
	rm -f *.pdb
	rm -f mixins.d
	rm -f dub.selections.json
	rm -f ./sdl2
endif
