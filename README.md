# brainfuck-perl-interpreter
A very ordinary cross-platform "interpreter" for brainfuck written in perl.

## Usage:
``` shell
# grant executable permissions to script
chmod +x bf.sh

# execute brainfuck code
./bf.sh examples/hello_world.bf

# DEBUG Mode
./bf.sh examples/add.bf --debug
```

## Examples
``` shell
./bf.sh examples/hello_world.bf
H
e
l
l
o

W
o
r
l
d
!
```
```shell
# adding two numbers - 2 and 3
./bf.sh examples/add.bf --debug
OP: + pointer: 0 off: 0 memory: 1
OP: + pointer: 0 off: 1 memory: 2
OP: > pointer: 1 off: 2 memory: 2
OP: + pointer: 1 off: 3 memory: 2, 1
OP: + pointer: 1 off: 4 memory: 2, 2
OP: + pointer: 1 off: 5 memory: 2, 3
OP: < pointer: 0 off: 6 memory: 2, 3
OP: [ pointer: 0 off: 7 memory: 2, 3
OP: - pointer: 0 off: 8 memory: 1, 3
OP: > pointer: 1 off: 9 memory: 1, 3
OP: + pointer: 1 off: 10 memory: 1, 4
OP: < pointer: 0 off: 11 memory: 1, 4
OP: ] pointer: 0 off: 7 memory: 1, 4
OP: - pointer: 0 off: 8 memory: 0, 4
OP: > pointer: 1 off: 9 memory: 0, 4
OP: + pointer: 1 off: 10 memory: 0, 5
OP: < pointer: 0 off: 11 memory: 0, 5
OP: ] pointer: 0 off: 12 memory: 0, 5
```
