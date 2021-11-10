return function(s)
  local acronym = ''

  for word in s:gmatch "%w+" do
    acronym = acronym .. word:sub(1, 1):upper()

    local internalCapitalLetter = word:gmatch "%l%u" ()
    if internalCapitalLetter then
      acronym = acronym .. internalCapitalLetter:sub(2, 2)
    end
  end

  return acronym
end
