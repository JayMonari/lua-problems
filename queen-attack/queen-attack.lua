return function(pos)
  assert(0 <= pos.row and pos.row <= 7)
  assert(0 <= pos.column and pos.column <= 7)

  local can_attack = function(other)
    return pos.column == other.column or pos.row == other.row or
      pos.row - pos.column == other.row - other.column or
      pos.row + pos.column == other.row + other.column
  end

  return {
    row = pos.row,
    column = pos.column,
    can_attack = can_attack
  }
end
