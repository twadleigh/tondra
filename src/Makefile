update_labeling.so : update_labeling.o
	gcc -shared -fopenmp -o $@ $^

update_labeling.o : update_labeling.c
	gcc -c -O3 -fPIC -std=c99 -fopenmp -o $@ $^

.PHONY : clean
clean :
	-rm update_labeling.so update_labeling.o
