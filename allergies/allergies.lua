local allergens = {
  "eggs",
  "peanuts",
  "shellfish",
  "strawberries",
  "tomatoes",
  "chocolate",
  "pollen",
  "cats",
}

local function list(score)
  local allergies = {}

  for i = 1, #allergens do
    if score & (2 ^ (i - 1)) ~= 0 then
      table.insert(allergies, allergens[i])
    end
  end

  return allergies
end


local scores = {}
for i = 1, #allergens do
  scores[allergens[i]] = 2 ^ (i - 1)
end

local function allergic_to(score, which)
  return score & scores[which] ~= 0
end

return {
  list = list,
  allergic_to = allergic_to
}
