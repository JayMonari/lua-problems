local Robot = {}

local function getRandomCharValues(from, to, length)
  local str = ''

  for _ = 1, length do
    str = str .. string.char(math.random(from, to))
  end

  return str
end

local function getRandomLowercaseLetters(length)
  return getRandomCharValues(('a'):byte(), ('z'):byte(), length)
end

local function getRandomDigits(length)
  return getRandomCharValues(('0'):byte(), ('9'):byte(), length)
end

local function makeRobotName()
  return getRandomLowercaseLetters(2) .. getRandomDigits(3)
end

function Robot:new()
  return setmetatable({ name = makeRobotName() }, { __index = self })
end

function Robot:reset()
  self.name = makeRobotName()
end

return Robot
