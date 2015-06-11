
all: x86 arm

#
# builds
#

x86:
	gcc -Wall -Iworld/include -Lworld/lib_x86/ -lworld -o bin_x86/hello src/main.cpp

arm:
	$(MAKE) -C world
	arm-2012.03/bin/arm-none-linux-gnueabi-gcc -Wall -Iworld/include -Lworld/lib_arm/ -lworld -o bin_arm/hello src/main.cpp
	cp world/include/world.h arm-2012.03/arm-none-linux-gnueabi/libc/usr/local/include/
	cp world/lib_arm/libworld.so arm-2012.03/arm-none-linux-gnueabi/libc/usr/local/lib/
	cp bin_arm/hello arm-2012.03/arm-none-linux-gnueabi/libc/usr/local/bin/


#
# prelink
#
	
prelink_x86:
	PATH=/usr/local/sbin prelink --verbose --cache-file=cache/prelink_x86.cache --config-file=prelink_x86.conf --ld-library-path=world/lib_x86 bin_x86/hello world/lib_x86/libworld.so
	
prelink_arm:
	cp prelink_arm.conf arm-2012.03/arm-none-linux-gnueabi/libc/etc/prelink.conf
	PATH=/usr/local/sbin prelink --verbose --root=/home/developer/workspace/eclipse/prelink-cross-example/arm-2012.03/arm-none-linux-gnueabi/libc --cache-file=/etc/cache/prelink.cache --config-file=/etc/prelink.conf --ld-library-path="/usr/local/lib;/lib;" -h /usr/local/bin/hello /lib/libc.so.6 /lib/libgcc_s.so.1 /lib/ld-2.15.so


#
# undo
#

prelink_x86_undo:
	PATH=/usr/local/sbin prelink --verbose --undo --cache-file=cache/prelink_x86.cache --config-file=prelink_x86.conf --ld-library-path="world/lib_arm;" bin_x86/hello
	PATH=/usr/local/sbin prelink --verbose --undo --all
	
prelink_arm_undo:
	PATH=/usr/local/sbin prelink --verbose --undo --root=arm-2012.03/arm-none-linux-gnueabi/libc --cache-file=/etc/cache/prelink.cache --config-file=/etc/prelink.conf --ld-library-path="/usr/local/lib;/lib;" -h /usr/local/bin/hello /lib/libc.so.6 /lib/libgcc_s.so.1 /lib/ld-2.15.so

