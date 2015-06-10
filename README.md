## clone

```
git clone https://github.com/fnbk/prelink-cross-example.git
```

## master

```
prelink-cross-example: git checkout master
```

## compile

```
prelink-cross-example: make
```

## run

```
LD_DEBUG=statistics LD_LIBRARY_PATH=world/lib_x86 ./bin_x86/hello
```

```
      9676:
      9676:     runtime linker statistics:
      9676:       total startup time in dynamic loader: 862137 clock cycles
      9676:                 time needed for relocation: 295417 clock cycles (34.2%)
      9676:                      number of relocations: 93
      9676:           number of relocations from cache: 5
      9676:             number of relative relocations: 0
      9676:                time needed to load objects: 249062 clock cycles (28.8%)
hello world
      9676:
      9676:     runtime linker statistics:
      9676:                final number of relocations: 95
      9676:     final number of relocations from cache: 5
```

## prelink x86 (host system)

```
prelink-cross-example: make prelink_x86
```

```
Assigned virtual address space slots for libraries:
/lib/ld-linux.so.2                                           41000000-410228fc
/lib/libc.so.6                                               41025000-411d6adc
Prelinking /home/developer/workspace/eclipse/prelink-cross-example/bin_x86/hello
```

## run prelinked

```
LD_DEBUG=statistics LD_LIBRARY_PATH=world/lib_x86 ./bin_x86/hello
```

```
      9686:
      9686:     runtime linker statistics:
      9686:       total startup time in dynamic loader: 668304 clock cycles
      9686:                 time needed for relocation: 77629 clock cycles (11.6%)
      9686:                      number of relocations: 0
      9686:           number of relocations from cache: 25
      9686:             number of relative relocations: 0
      9686:                time needed to load objects: 240344 clock cycles (35.9%)
hello world
      9686:
      9686:     runtime linker statistics:
      9686:                final number of relocations: 0
      9686:     final number of relocations from cache: 25
```


## prelink arm

```
prelink-cross-example: make prelink_arm
```

```
...
prelink: bin_arm/hello: Could not parse `/usr/local/sbin//prelink-rtld: error while loading shared libraries: ld-linux.so.3'
```

