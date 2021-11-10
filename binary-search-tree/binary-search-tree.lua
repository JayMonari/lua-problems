local BinarySearchTree = {}

function BinarySearchTree:new(root)
  self.__index = self
  return setmetatable({ value = root, left = nil, right = nil }, self)
end

function BinarySearchTree:from_list(values)
  assert(values and #values > 0, "Cannot create a BST from an empty list!")
  local root = BinarySearchTree:new(table.remove(values, 1))
  for _, value in ipairs(values) do
    root:insert(value)
  end
  return root
end

function BinarySearchTree:insert(value)
  local side = value > self.value and "right" or "left"
  if self[side] then
    self[side]:insert(value)
  else
    self[side] = BinarySearchTree:new(value)
  end
  return self
end

function BinarySearchTree:yield_from_side(side)
  return coroutine.wrap(function()
    if side then
      for v in side:values() do
        coroutine.yield(v)
      end
    end
  end)
end

function BinarySearchTree:values()
  return coroutine.wrap(function()
    if self.left then
      for v in self.left:values() do coroutine.yield(v) end
    end
    coroutine.yield(self.value)
    if self.right then
      for v in self.right:values() do coroutine.yield(v) end
    end
  end)
end

return BinarySearchTree
