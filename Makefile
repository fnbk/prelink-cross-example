
all: x86 arm

#
# builds
#

x86:
	gcc -Wall -o bin_x86/hello src/main.cpp

arm:
	arm-2012.03/bin/arm-none-linux-gnueabi-gcc -Wall -o bin_arm/hello src/main.cpp
	cp bin_arm/hello arm-2012.03/arm-none-linux-gnueabi/libc/usr/local/bin/

#
# prelink
#
	
prelink_x86:
	PATH=/usr/local/sbin prelink --verbose --cache-file=cache/prelink_x86.cache --config-file=prelink_x86.conf bin_x86/hello

prelink_arm:
	cp prelink_arm.conf arm-2012.03/arm-none-linux-gnueabi/libc/etc/prelink.conf
	PATH=/usr/local/sbin prelink --verbose --root=arm-2012.03/arm-none-linux-gnueabi/libc/ --cache-file=/etc/cache/prelink.cache --config-file=/etc/prelink.conf --ld-library-path="/lib;" -h /usr/local/bin/hello /lib/libc-2.15.so /lib/libgcc_s.so.1 /lib/ld-2.15.so


#
# undo
#

prelink_x86_undo:
	PATH=/usr/local/sbin prelink --verbose --undo --cache-file=cache/prelink_x86.cache --config-file=prelink_x86.conf bin_x86/hello
	PATH=/usr/local/sbin prelink --verbose --undo --all
	
prelink_arm_undo:
	PATH=/usr/local/sbin prelink --verbose --undo --root=arm-2012.03/arm-none-linux-gnueabi/libc/ --cache-file=/etc/cache/prelink.cache --config-file=/etc/prelink.conf --ld-library-path="/lib;" -h /usr/local/bin/hello /lib/libc-2.15.so /lib/libgcc_s.so.1 /lib/ld-2.15.so


