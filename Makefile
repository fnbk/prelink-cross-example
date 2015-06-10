
all: x86 arm

#
# builds
#

x86:
	gcc -Wall -o bin_x86/hello src/main.cpp

arm:
	arm-2012.03/bin/arm-none-linux-gnueabi-gcc -Wall -o bin_arm/hello src/main.cpp

#
# prelink
#
	
prelink_x86:
	PATH=/usr/local/sbin prelink --verbose --cache-file=cache/prelink_x86.cache --config-file=prelink_x86.conf bin_x86/hello

prelink_arm:
	PATH=/usr/local/sbin prelink --verbose --cache-file=cache/prelink_arm.cache --config-file=prelink_arm.conf --ld-library-path="arm-2012.03/arm-none-linux-gnueabi/libc/lib;arm-2012.03/arm-none-linux-gnueabi/libc/usr/lib;" -h bin_arm/hello

prelink_arm_my_libs:
	PATH=/usr/local/sbin prelink --verbose --cache-file=cache/prelink_arm_my_libs.cache --config-file=prelink_arm_my_libs.conf --ld-library-path="arm-2012.03/my_libs;" -h bin_arm/hello

#
# undo
#

prelink_x86_undo:
	PATH=/usr/local/sbin prelink --verbose --undo --cache-file=cache/prelink_x86.cache --config-file=prelink_x86.conf bin_x86/hello
	PATH=/usr/local/sbin prelink --verbose --undo --all
	
prelink_arm_undo:
	PATH=/usr/local/sbin prelink --verbose --undo --cache-file=cache/prelink_arm.cache --config-file=prelink_arm.conf --ld-library-path="arm-2012.03" -h bin_arm/hello
	PATH=/usr/local/sbin prelink --verbose --undo --all

prelink_arm_my_libs_undo:
	PATH=/usr/local/sbin prelink --verbose --undo --cache-file=cache/prelink_arm_my_libs.cache --config-file=prelink_arm_my_libs.conf --ld-library-path="arm-2012.03/my_libs;" -h bin_arm/hello
	PATH=/usr/local/sbin prelink --verbose --undo --all

