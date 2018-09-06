
main: libtest.a
	gcc -ldl -o main main.c libtest.a 

libtest.a:test.nim
	nim c --app:staticlib --noMain test.nim 

clean:
	rm -rf nimcache
	rm -f main
	rm -f *.a