ifeq ($(dbg),1)
	GCCFLAGS += -g
else
	GCCFLAGS += -O3 -g3
endif


all: build

build: no_comparison

no_comparison.o: no_comparison.cpp
	g++ $(GCCFLAGS) -o $@ -c $< -fopenmp
	g++ $(GCCFLAGS) -o $@.asm -S -c $< -fopenmp

no_comparison: no_comparison.o
	g++ $(GCCFLAGS) -o $@ $+ -lgomp

clean:
	rm -f no_comparison.o no_comparison

clobber:
	clean
