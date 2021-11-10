local alphabet = 'abcdefghijklmnopqrstuvwxyz'
local cipher = 'zyxwvutsrqponmlkjihgfedcba'

local function encode(plaintext)
  local encoded = {}

  local group = ''
  local cleantext = plaintext:lower():gsub("[^a-zA-Z0-9]", '')
  for i = 1, #cleantext do
    local alnum = cleantext:sub(i, i)
    local enc_idx = alphabet:find(alnum)

    if enc_idx == nil then
      group = group .. alnum
    else
      group = group .. cipher:sub(enc_idx, enc_idx)
    end

    if i % 5 == 0 or i == #cleantext then
      table.insert(encoded, group)
      group = ''
    end
  end

  return table.concat(encoded, ' ')
end

return { encode = encode }
