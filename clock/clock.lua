local Clock = {}

Clock.__index = Clock

function Clock:__tostring()
  local hours = (self.time // 60) % 24
  local minutes = self.time % 60
  return string.format("%02d:%02d", hours, minutes)
end

function Clock:plus(time)
  self.time = self.time + time
  return self
end

function Clock:minus(time)
  self.time = self.time - time
  return self
end

function Clock:equals(other)
  return self.time == other.time
end

function Clock.at(hours, minutes)
  local time = hours * 60 + (minutes or 0)
  return setmetatable({ time = time % (24 * 60) }, Clock)
end

return Clock
