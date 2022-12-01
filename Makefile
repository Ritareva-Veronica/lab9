INST_DIR = $$HOME/test_for_make/


export ARCH=x86_64
export CROSS_COMPILE=x86_64-linux-

all: main.c list.c matrix.c
	$(CROSS_COMPILE)gcc -c list.c matrix.c
	$(CROSS_COMPILE)ar -r static.a list.o matrix.o
	$(CROSS_COMPILE)gcc -fpic -c list.c matrix.c
	$(CROSS_COMPILE)gcc -shared list.o matrix.o -o dynamic.so
	$(CROSS_COMPILE)gcc main.c list.c matrix.c -lm -o app.out
	echo $(ARCH)
	echo $(CROSS_COMPILE)
	
install: all
	@if [-d $(INST_DIR) ]; \
	then \
	cp app.out $(INST_DIR); \
	echo "Installed in $(INST_DIR)";\
	else \
	echo "Sorry $(INST_DIR) doesn't exist";\
fi
#Generate static lib
static: list.c matrix.c
	$(CROSS_COMPILE)gcc -c list.c matrix.c 
	ar -r static.a list.o matrix.o

#Generate dynamic lib
dynamic: list.c matrix.c 
	$(CROSS_COMPILE)gcc -fpic -c list.c matrix.c 
	$(CROSS_COMPILE)gcc -shared list.o matrix.o -o dynamic.so
	
.PHONY: clean
clean:
	rm -rf *.o
