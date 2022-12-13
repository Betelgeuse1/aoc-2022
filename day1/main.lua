local function switch_max(max, range, new)
	for j = range, 1, -1 do
		local temp = max[j]
		max[j] = new
		new = temp
	end
	return max
end

local function check_max(max, new)
	for i = 0, #max - 1 do
		local v = max[#max - i]
		if v < new then
			max = switch_max(max, #max - i, new)
			break
		end
	end
	return max
end

local function sum(lst)
	local s = 0
	for _, el in ipairs(lst) do
		s = s + el
	end
	return s
end

-- Start of program

local input = io.open("input.txt", "r")
-- nil check
if not input then
	return
end

local max = { 0, 0, 0 }
local count = 0
for line in input:lines("l") do
	if line == "" then
		max = check_max(max, count)
		count = 0
	else
		count = count + tonumber(line)
	end
end

max = check_max(max, count)
input:close()

print(sum(max))
