local function transform(dataset)
  local transformed = {}

  for pointValue, v in pairs(dataset) do
    for _, val in ipairs(v) do
      transformed[val:lower()] = pointValue
    end
  end

  return transformed
end

return {
  transform = transform
}
