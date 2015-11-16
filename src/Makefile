binary_labeling.so : binary_labeling.o graph.o maxflow.o
	g++ -shared -fPIC -o $@ $^

%.o : %.cpp
	g++ -c -O3 -fPIC -o $@ $^

.PHONY : clean
clean :
	-rm binary_labeling.so binary_labeling.o
