return function(s, length)
  return coroutine.wrap(function()
    if length > #s then return end

    local substr = s:sub(1, length)
    local i = length + 1

    coroutine.yield(substr)

    while i <= #s do
      substr = substr:sub(2, length) .. s:sub(i, i)
      coroutine.yield(substr)
      i = i + 1
    end
  end)
end
