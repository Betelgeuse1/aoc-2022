-- Functions
local function check(os, us)
    local d = os - us
    if math.abs(d) >= 2 then
        d = d < 0 and 1 or -1
    end

    return -d + 1
end

local function get_score(o, u)
    local oscore = o - 64
    local uscore = u - 87

    local c = check(oscore, uscore)
    return 3 * c + uscore
end

-- Program Start
local input = io.open("input.txt")
if not input then
    return os.exit(false)
end

local line
local other, us
local score = 0
while true do
    line = input:read("l")
    if not line then
        break
    end
    other, us = line:byte(1), line:byte(3)
    local s = get_score(other, us)
    score = score + s
end
input:close()

print(score)
