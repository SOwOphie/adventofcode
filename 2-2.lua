#!/usr/bin/env lua5.4

local a = 0
local x = 0
local d = 0

function forward(n) x = x + n; d = d + a*n end
function up(n) a = a - n end
function down(n) a = a + n end

for l in io.lines("2.txt") do
	load(l:gsub(' ', '('):gsub('$', ')'))()
end

print(x*d)
