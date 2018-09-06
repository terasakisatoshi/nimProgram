
main: libquery.a
	gcc -ldl -o main main.c libquery.a 

libquery.a:query.nim
	nim c --app:staticlib --noMain query.nim 

clean:
	rm -rf nimcache
	rm -f main
	rm -f *.a