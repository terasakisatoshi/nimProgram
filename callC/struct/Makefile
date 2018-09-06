main: mystruct.so main.nim
	nim c main.nim

mystruct.so: mystruct.c
	gcc -shared -fPIC -o $@ $^

clean:
	rm -rf nimcache
	rm -rf main
	rm -rf mystruct.so