#!/usr/bin/env lua5.4

local input = {}
for l in io.lines("5.txt") do
	local x1, y1, x2, y2 = l:match("^(%d+),(%d+) %-> (%d+),(%d+)$")
	table.insert(input, {
		x1 = tonumber(x1),
		y1 = tonumber(y1),
		x2 = tonumber(x2),
		y2 = tonumber(y2)
	})
end

local map = setmetatable({}, {__index = function() return 0 end})

local function spot(x, y)
	local addr = ("%d:%d"):format(x, y)
	map[addr] = map[addr] + 1
end

local function linex(x1, x2, y)
	if x1 > x2 then return linex(x2, x1, y) end
	for x = x1, x2 do spot(x, y) end
end

local function liney(x, y1, y2)
	if y1 > y2 then return liney(x, y2, y1) end
	for y = y1, y2 do spot(x, y) end
end

local function lined(x1, x2, y1, y2)
	if x1 > x2 then return lined(x2, x1, y2, y1) end
	local m = y1 < y2 and 1 or -1
	for i = 0, x2 - x1 do
		spot(x1 + i, y1 + m*i)
	end
end

for _, v in ipairs(input) do
	if v.x1 == v.x2 then
		liney(v.x1, v.y1, v.y2)
	elseif v.y1 == v.y2 then
		linex(v.x1, v.x2, v.y1)
	else
		lined(v.x1, v.x2, v.y1, v.y2)
	end
end

local ret = 0
for _, v in pairs(map) do
	if v >= 2 then ret = ret + 1 end
end
print(ret)
