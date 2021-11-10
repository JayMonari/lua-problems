local house = {}

local characters = {
  "the house that Jack built.",
  "the malt",
  "the rat",
  "the cat",
  "the dog",
  "the cow with the crumpled horn",
  "the maiden all forlorn",
  "the man all tattered and torn",
  "the priest all shaven and shorn",
  "the rooster that crowed in the morn",
  "the farmer sowing his corn",
  "the horse and the hound and the horn"
}

local actions = {
  "lay in ",
  "ate ",
  "killed ",
  "worried ",
  "tossed ",
  "milked ",
  "kissed ",
  "married ",
  "woke ",
  "kept ",
  "belonged to "
}

house.verse = function(which)
  local verses = "This is " .. characters[which]
  for n = which - 1, 1, -1 do
    verses = verses .. '\n' .. "that " .. actions[n] .. characters[n]
  end
  return verses
end

house.recite = function()
  local song = {}
  for v = 1, 12 do
    song[v] = house.verse(v)
  end
  return table.concat(song, '\n')
end

return house
