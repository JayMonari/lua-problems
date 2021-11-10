local beer = {}

function beer.verse(number)
  if number == 2 then
    return "2 bottles of beer on the wall, 2 bottles of beer.\n" ..
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  elseif number == 1 then
    return "1 bottle of beer on the wall, 1 bottle of beer.\n" ..
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  elseif number == 0 then
    return "No more bottles of beer on the wall, no more bottles of beer.\n" ..
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  else
    return string.format(
      "%d bottles of beer on the wall, %d bottles of beer.\n" ..
      "Take one down and pass it around, %d bottles of beer on the wall.\n",
      number, number, number - 1)
  end
end

function beer.sing(start, finish)
  local verses = {}

  if finish == nil then finish = 0 end
  for i = start, finish, -1 do
    table.insert(verses, beer.verse(i))
  end

  return table.concat(verses, '\n')
end

return beer
