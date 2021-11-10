local School = {}

function School:new()
  self.__index = self
  return setmetatable({ _roster = {} }, self)
end

function School:add(name, grade)
  local roster = self._roster[grade] or {}
  table.insert(roster, name)
  table.sort(roster)
  self._roster[grade] = roster
end

function School:roster()
  return self._roster
end

function School:grade(grade)
  return self._roster[grade] or {}
end

return School
