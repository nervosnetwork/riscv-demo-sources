# Dependencies

```
$ brew tab riscv/riscv
$ brew install riscv-tools bison
```

## minimal

```
$ cd minimal
$ make
$ spike pk minimal
```

## sha3

```
$ cd sha3
$ make
$ spike pk sha3
```

## vmvmvm

```
$ cd vmvmvm
$ make build
$ spike pk mruby/build/riscv-gcc/bin/mruby bitcoin.rb
$ spike pk mruby/build/riscv-gcc/bin/mruby forth.rb
```
