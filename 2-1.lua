#!/usr/bin/env lua5.4

local x = 0
local d = 0

function forward(n) x = x + n end
function up(n) d = d - n end
function down(n) d = d + n end

for l in io.lines("2.txt") do
	load(l:gsub(' ', '('):gsub('$', ')'))()
end

print(x*d)
