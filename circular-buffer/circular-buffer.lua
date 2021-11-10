local CircularBuffer = {}

function CircularBuffer:new(capacity)
  self.capacity = capacity
  self.size = 0
  self.currIdx = 1
  self.startIdx = 1
  self.buf = {}
  return self
end

function CircularBuffer:read()
  assert(self.size > 0, "buffer is empty")

  self.size = self.size - 1
  local val = self.buf[self.startIdx]
  self.startIdx = (self.startIdx % self.capacity) + 1

  return val
end

function CircularBuffer:write(val)
  if val == nil then return end
  assert(self.size ~= self.capacity, "buffer is full")

  table.insert(self.buf, self.currIdx, val)
  self.currIdx = (self.currIdx % self.capacity) + 1
  self.size = self.size + 1
end

function CircularBuffer:forceWrite(val)
  if self.size == self.capacity then
    self.buf[self.startIdx] = val
    self.startIdx = (self.startIdx % self.capacity) + 1
  else
    self:write(val)
  end
end

function CircularBuffer:clear()
  self = self:new(self.capacity)
  return self
end

return CircularBuffer
