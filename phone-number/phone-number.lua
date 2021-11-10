local PhoneNumber = {}

PhoneNumber = setmetatable(PhoneNumber, {
    __tostring = function(phone)
      local ac = phone:areaCode()
      local first = phone.number:sub(4, 6)
      local last = phone.number:sub(7, 10)

      return string.format("(%s) %s-%s", ac, first, last)
    end
})

function PhoneNumber:new(number)
  self.number = number:gsub("[^%d]", '')
  self._wrongNumber = "0000000000"

  if #self.number < 10 or #self.number > 11 then
    self.number = self._wrongNumber
  elseif #self.number == 11 then
    if self.number:sub(1, 1) ~= '1' then
      self.number = self._wrongNumber
    else
      self.number = self.number:sub(2, #self.number)
    end
  end

  self.ac = self.number:sub(1, 3)

  return self
end

function PhoneNumber:areaCode()
  return self.ac
end

return PhoneNumber
