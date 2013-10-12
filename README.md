luamlp
==

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
--
Lua installed in system. <br>
Tested in Lua 5.2 (5.1 dont work unpack in function Test) <br>
Linux/Ubuntu: > sudo apt-get install lua5.2 <br>

FUNCTIONS | RETURN 
--
Narray(nl, nc, value) -> table <br>
Luamlp:New(ni, nh1, nh2, nout) -> number<br>
Luamlp:Config(lr, it, bias, ert, mm, mt, fx, dfx) -> table<br>
Luamlp:LoadConfig(name(optional)) -> None <br>
Luamlp:Training(print_error) -> None <br>
Luamlp:Propagation(x) -> table <br>
Luamlp:Backpropagation(y) -> number <br>
Luamlp:Test(dinput) -> None <br> <br>


Files:
--
luamlp.lua: source code <br> 
test_luamlp.lua: file test of luamlp.lua <br>
config.luamlp: optional, file for configuration parameters luamlp.lua <br>


Example of use:
--

The XOR Problem: http://home.agh.edu.pl/~vlsi/AI/xor_t/en/main.htm

Run test_luamlp.lua:
--

In terminal enter the directo luary where Luamlp, digit:
> $ lua5.2 test_luamlp.lua <br>


Solution using Luamlp
--

Detais of example XOR: <br>
--

| input | output |<br>
 0,0 = 0 <br>
 0,1 = 1<br>
 1,0 = 1<br>
 1,1 = 0<br>


load module in variable <br>
> luamlp = require 'luamlp' <br>
create neural network with 2 neuron in layer input<br>
2 neuron in layer hidden 1, 0 neuron in layer hidden 2<br>
and 1 neuron in layer ouput <br>
> mlp = luamlp:New(2,2,0,1)<br>
insert to input and output in neural network<br>
> mlp.input = {{0,0}, {0,1}, {1,0}, {1,1}}<br>
> mlp.output = {{0}, {1}, {1}, {1}}<br>
configure os parameters mlp<br>
0.3 = learning rate, 10000 = iteration max.<br>
1 = value for bias, 0.01: error in training<br>
0.003: rate of mommentum term<br>
> mlp:Config(0.3, 10000, 1, 0.01, 0.003)<br>
execute training, parameter true: displays error in each iteration<br>
>mlp:Training(true)<br>
test of learning<br>
>mlp:Test(mlp.input)<br>


