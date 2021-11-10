local function translate(dx, dy)
  return function(self) self.x, self.y = self.x + dx, self.y + dy end
end

local function turn_to(new_heading)
  return function(self) self.heading = new_heading end
end

local commands = {
  R = {
    north = turn_to("east"),
    east = turn_to("south"),
    south = turn_to("west"),
    west = turn_to("north")
  },
  L = {
    north = turn_to("west"),
    west = turn_to("south"),
    south = turn_to("east"),
    east = turn_to("north")
  },
  A = {
    north = translate(0, 1),
    east = translate(1, 0),
    south = translate(0, -1),
    west = translate(-1, 0)
  }
}

local function move(self, command_chain)
  for cmd in command_chain:gmatch '.' do
    commands[cmd][self.heading](self)
  end
end

return function(config)
  return { x = config.x, y = config.y, heading = config.heading, move = move }
end
