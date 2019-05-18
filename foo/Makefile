.PHONY: al
all: libfoo.a

libfoo.a : src/foo.cpp include/foo.h
	g++ -c src/foo.cpp -Iinclude
	ar rvs libfoo.a foo.o

clean:
	rm -f libfoo.a foo.o