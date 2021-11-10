local Set = {}

function Set:new(...)
  local instance = { _elements = {} }
  self.__index = self
  for _, ele in ipairs({...}) do
    instance._elements[ele] = true
  end
  return setmetatable(instance, self)
end

function Set:is_empty()
  return next(self._elements) == nil
end

function Set:contains(e)
  return self._elements[e] ~= nil
end

function Set:is_subset(set)
  for ele in self:iter() do
    if not set:contains(ele) then return false end
  end
  return true
end

function Set:is_disjoint(set)
  for ele in self:iter() do
    if set:contains(ele) then return false end
  end
  return true
end

function Set:size()
  local count = 0
  for _ in self:iter() do count = count + 1 end
  return count
end

function Set:equals(other)
  return self:size() == other:size() and self:is_subset(other)
end

function Set:add(e)
  self._elements[e] = true
end

function Set:intersection(other)
  local inter = Set:new()
  for ele in self:iter() do
    if other:contains(ele) then inter:add(ele) end
  end
  return inter
end

function Set:difference(other)
  local diff = Set:new()
  for ele in self:iter() do
    if not other:contains(ele) then diff:add(ele) end
  end
  return diff
end

function Set:union(other)
  local un = Set:new()
  for ele in self:iter() do un:add(ele) end
  for ele in other:iter() do un:add(ele) end
  return un
end

function Set:iter()
  local next, table, element = pairs(self._elements)
  return function()
    element = next(table, element)
    return element
  end
end

return function(...) return Set:new(...) end
