-- Functions
-- Part 1
local function check(os, us)
    local d = os - us
    if math.abs(d) >= 2 then
        d = d < 0 and 1 or -1
    end

    return -d + 1
end

local function get_score(other, us)
    local oscore = other - 64
    local uscore = us - 87

    local c = check(oscore, uscore)
    return 3 * c + uscore
end

-- Part 2
local function expected_score(other, strategy)
    local oscore = other - 64
    local sscore = strategy - 87
    -- truth table to see why
    local uscore = (oscore + sscore) % 3 + 1

    return uscore + 3 * (sscore - 1)
end

-- Program Start
local input = io.open("input.txt")
if not input then
    return os.exit(false)
end

local line
local other, strat
local score = 0
while true do
    line = input:read("l")
    if not line then
        break
    end
    other, strat = line:byte(1), line:byte(3)
    local s = expected_score(other, strat)
    score = score + s
end
input:close()

print(score)
