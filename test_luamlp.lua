--[[
-- test module luamlp.lua
-- Author: Jhonathan Paulo Banczek
-- Copyright: jpbanczek@gmail.com
-- 09-10-2013
-- example: PROBLEM XOR
--]]

-- load module
luamlp = require 'luamlp'

mlp = luamlp:New(2,2,0,1)
mlp.input = {{0,0},{0,1},{1,0},{1,1}}
mlp.output = {{0},{1},{1},{0}}
mlp:Config(0.3, 100000, 1, 0.01, 0.003)
mlp:Training(true)
mlp:Test(mlp.input)
