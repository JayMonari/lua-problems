local animals = {
  "fly",
  "spider",
  "bird",
  "cat",
  "dog",
  "goat",
  "cow",
}

local sayings = {
  "",
  "It wriggled and jiggled and tickled inside her.",
  "How absurd to swallow a bird!",
  "Imagine that, to swallow a cat!",
  "What a hog, to swallow a dog!",
  "Just opened her throat and swallowed a goat!",
  "I don't know how she swallowed a cow!",
}

local endl = "\n"
local start = "I know an old lady who swallowed a "
local finish = "I don't know why she swallowed the fly. Perhaps she'll die.\n"
local swallowed = "She swallowed the "
local catch = " to catch the "
local spiderVerse = " that wriggled and jiggled and tickled inside her"
local punchline =
  "I know an old lady who swallowed a horse.\nShe's dead, of course!\n"

local function makeVerse(which)
  if which == 1 then
    return start .. animals[which] .. '.' .. endl .. finish
  elseif which == 8 then
    return punchline
  end

  local verse = start .. animals[which] .. '.' .. endl ..
  sayings[which] .. endl
  while which > 1 do
    verse = verse .. swallowed .. animals[which] .. catch .. animals[which - 1]
    if which == 3 then
      verse = verse .. spiderVerse
    end
    verse = verse .. '.' .. endl
    which = which - 1
  end

  return verse .. finish
end

local function makeVerses(from, to)
  local verses = {}
  for n = from, to do
    table.insert(verses, makeVerse(n))
  end

  return table.concat(verses, endl) .. endl
end

local function sing()
  return makeVerses(1, 8)
end

return {
  verse = makeVerse,
  verses = makeVerses,
  sing = sing
}
