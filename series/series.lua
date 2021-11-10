return function(s, length)
  return coroutine.wrap(function()
    if length > #s then return end

    local substr = s:sub(1, length)
    local idx = length + 1

    coroutine.yield(substr)

    while idx <= #s do
      substr = substr:sub(2, length) .. s:sub(idx, idx)
      coroutine.yield(substr)
      idx = idx + 1
    end
  end)
end
