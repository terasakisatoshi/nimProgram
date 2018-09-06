all: main libshared.so
libshared.so: shared.c
	gcc -shared -o libshared.so shared.c
main: main.nim shared.c
	nim c main.nim

clean: 
	rm -f main
	rm -f libshared.so
	rm -rf nimcache