#!/usr/bin/env lua5.4

local a = 0
local x = 0
local d = 0

local env = {
	forward = function(n) x = x + n; d = d + a*n end,
	up = function(n) a = a - n end,
	down = function(n) a = a + n end,
}

for l in io.lines("2.txt") do
	load(l:gsub(' ', '('):gsub('$', ')'), "2.txt", "t", env)()
end

print(x*d)
