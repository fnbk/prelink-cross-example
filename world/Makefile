
all: x86 arm

x86:
	gcc -Wall -fPIC -shared -Iinclude -o lib_x86/libworld.so src/world.cpp 

arm:
	../arm-2012.03/bin/arm-none-linux-gnueabi-gcc -Wall -fPIC -shared -Iinclude -o lib_arm/libworld.so src/world.cpp 
