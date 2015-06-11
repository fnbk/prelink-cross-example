# x86

## compile

```
make x86
```


## run

```
LD_DEBUG=statistics LD_LIBRARY_PATH=world/lib_x86 ./bin_x86/hello
```

```
      9838:
      9838:     runtime linker statistics:
      9838:       total startup time in dynamic loader: 1055533 clock cycles
      9838:                 time needed for relocation: 316775 clock cycles (30.0%)
      9838:                      number of relocations: 97
      9838:           number of relocations from cache: 5
      9838:             number of relative relocations: 1
      9838:                time needed to load objects: 409043 clock cycles (38.7%)
hello
world
      9838:
      9838:     runtime linker statistics:
      9838:                final number of relocations: 102
      9838:     final number of relocations from cache: 5
```

## prelink

```
make prelink_x86
```

```
Laying out 1 libraries in virtual address space 41000000-50000000
Assigned virtual address space slots for libraries:
/lib/ld-linux.so.2                                           41000000-410228fc
/lib/libc.so.6                                               41025000-411d6adc
world/lib_x86/libworld.so                                    411d9000-411db024
Prelinking /home/developer/workspace/eclipse/prelink-cross-example/world/lib_x86/libworld.so
Prelinking /home/developer/workspace/eclipse/prelink-cross-example/bin_x86/hello
```

## run prelinked

```
LD_DEBUG=statistics LD_LIBRARY_PATH=world/lib_x86 ./bin_x86/hello
```

```
      9848:
      9848:     runtime linker statistics:
      9848:       total startup time in dynamic loader: 951296 clock cycles
      9848:                 time needed for relocation: 92595 clock cycles (9.7%)
      9848:                      number of relocations: 0
      9848:           number of relocations from cache: 26
      9848:             number of relative relocations: 0
      9848:                time needed to load objects: 342481 clock cycles (36.0%)
hello
world
      9848:
      9848:     runtime linker statistics:
      9848:                final number of relocations: 0
      9848:     final number of relocations from cache: 26
```


# ARM

# compile

```
make arm
```

# prelink

```
make prelink_arm
```

```
Laying out 4 libraries in virtual address space 41000000-50000000
Assigned virtual address space slots for libraries:
/lib/ld-linux.so.3                                           41000000-4102a968
/lib/libc.so.6                                               41030000-41181968
/lib/libgcc_s.so.1                                           41188000-411af748
/usr/local/lib/libworld.so                                   411b8000-411c06d0
Prelinking /lib/ld-2.15.so
Prelinking /lib/libc-2.15.so
Prelinking /lib/libgcc_s.so.1
Prelinking /usr/local/lib/libworld.so
Prelinking /usr/local/bin/hello

```




