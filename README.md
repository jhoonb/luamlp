luamlp
======

Luamlp is a module written in Lua, implements the algorithm
of multilayer perceptron with back-propagation algorithm in a
generic way.
One can define the number of hidden layers to 1 or 2 (not require
the use of more than two hidden layers). One can also define the
number of neurons used in any layer. The data input and output
(for training) must be formatted in a two-dimensional array format:
	
Data_input = {{x1},... {xn}} or {{x1,x2} ..., {xn-1, xn}}

Data_output y1 = {{y1},... {yn}} or {{y1,y2} ..., {yn-1, yn}}

DEPENDENCIES
==
	Lua installed in system.
	Tested in Lua 5.2 (5.1 dont work unpack in function Test)
	Linux/Ubuntu: sudo apt-get install lua5.2

FUNCTIONS | RETURN 
==
Narray(nl, nc, value) -> table
Luamlp:New(ni, nh1, nh2, nout) -> number
Luamlp:Config(lr, it, bias, ert, mm, mt, fx, dfx) -> table
Luamlp:LoadConfig(name(optional)) -> None
Luamlp:Training(print_error) -> None
Luamlp:Propagation(x) -> table
Luamlp:Backpropagation(y) -> number
Luamlp:Test(dinput) -> None


Files:
==

> luamlp.lua: source code
> test_luamlp.lua: file test of luamlp.lua
> config.luamlp: optional, file for configuration parameters luamlp.lua


Example of use:
==

The XOR Problem: http://home.agh.edu.pl/~vlsi/AI/xor_t/en/main.htm

Run test_luamlp.lua:

in terminal enter the directo luary where Luamlp, digit:
$ lua5.2 test_luamlp.lua

Detais of example XOR:
==
| input | output |
 0,0 = 0 
 0,1 = 1
 1,0 = 1
 1,1 = 0

Solution using Luamlp
==

> -- load module in variable
> luamlp = require 'luamlp'
> -- create neural network with 2 neuron in layer input
> -- 2 neuron in layer hidden 1, 0 neuron in layer hidden 2
> -- and 1 neuron in layer ouput 
> mlp = luamlp:New(2,2,0,1)
> -- insert to input and output in neural network
> mlp.input = {{0,0}, {0,1}, {1,0}, {1,1}}
> mlp.output = {{0}, {1}, {1}, {1}}
> -- configure os parameters mlp
> -- 0.3 = learning rate, 10000 = iteration max.
> -- 1 = value for bias, 0.01: error in training
> -- 0.003: rate of mommentum term
> mlp:Config(0.3, 10000, 1, 0.01, 0.003)
> -- execute training, parameter true: exib error in cada
> -- iteration
mlp:Training(true)
> -- test of learning
mlp:Test(mlp.input)


