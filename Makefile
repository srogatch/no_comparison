ifeq ($(dbg),1)
	GCCFLAGS += -g
else
	GCCFLAGS += -O3 -g3
endif

COMPILER = clang++


all: build

build: no_comparison

no_comparison.o: no_comparison.cpp
	$(COMPILER) $(GCCFLAGS) -o $@ -c $< -fopenmp
	$(COMPILER) $(GCCFLAGS) -o $@.asm -S -c $< -fopenmp

no_comparison: no_comparison.o
	$(COMPILER) $(GCCFLAGS) -o $@ $+ -lgomp

clean:
	rm -f no_comparison.o no_comparison

clobber:
	clean
