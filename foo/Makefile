.PHONY: all
all: libfoo.a libbar.a

libfoo.a: src/foo.cpp include/foo.h
	g++ -c src/foo.cpp -Iinclude
	ar rvs libfoo.a foo.o

libbar.a: src/bar.cpp include/bar.h
	g++ -c src/bar.cpp -Iinclude
	ar rvs libbar.a bar.o

clean:
	rm -f libfoo.a foo.o libbar.a bar.o