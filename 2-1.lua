#!/usr/bin/env lua5.4

local x = 0
local d = 0

local env = {
	forward = function(n) x = x + n end,
	up = function(n) d = d - n end,
	down = function(n) d = d + n end,
}

for l in io.lines("2.txt") do
	load(l:gsub(' ', '('):gsub('$', ')'), "2.txt", "t", env)()
end

print(x*d)
