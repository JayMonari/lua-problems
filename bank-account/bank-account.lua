local BankAccount = {}

function BankAccount:new()
  local new = { _balance = 0, _closed = false }
  self.__index = self
  return setmetatable(new, self)
end

function BankAccount:balance()
return self._balance
end

function BankAccount:deposit(amount)
  assert(amount > 0)
  assert(not self._closed)

  self._balance = self._balance + amount
end

function BankAccount:withdraw(amount)
  assert(amount > 0)
  assert(self._balance > amount)
  assert(not self._closed)

  self._balance = self._balance - amount
end

function BankAccount:close()
  self._closed = true
end

return BankAccount
