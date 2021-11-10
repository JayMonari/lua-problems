local VOWEL_START = "^[aeiou]"
local CONSONANT_START = "^([BCDFGHJKLMNPQRSTUVWXYZbcdfghjklmnpqrstuvwxyz]+)([aeiou].*)$"

local function hasprefix(str, target)
  local prefix = str:sub(1, #target)
  return prefix == target
end

return function(phrase)
  local pig_latin = {}
  for word in phrase:gmatch '[^ ]+' do
    if word:find(VOWEL_START) ~= nil or
      hasprefix(word, "xr") or hasprefix(word, "yt") then
      table.insert(pig_latin, word .. "ay")
    else
      local gr1, gr2 = word:match(CONSONANT_START)
      if gr1 then
        table.insert(pig_latin, gr2 .. gr1 .. "ay")
      end
    end
  end
  return table.concat(pig_latin, ' ')
end
