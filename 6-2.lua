#!/usr/bin/env lua5.4

local cache = {}
local function f(off, t)
	local key = ("%d:%d"):format(off, t)
	if cache[key] then return cache[key] end
	local ret = t <= off and 1 or f(off, t - 7) + f(off + 2, t - 7)
	cache[key] = ret
	return ret
end

local sum = 0
for n in io.open("6.txt"):read("a"):gmatch("%d+") do
	sum = sum + f(tonumber(n), 256)
end

print(sum)
