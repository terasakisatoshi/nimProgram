fib.h:fib.nim maths.cpp
	nim c --noMain --noLinking --header:fib.h fib.nim 
	g++ -Inimcache -I$(HOME)/.choosenim/toolchains/nim-0.18.0/lib nimcache/*.c maths.cpp 

clean:
	rm -f a.out
	rm -rf nimcache