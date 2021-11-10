local SpaceAge = {}


function SpaceAge:new(seconds)
  self.seconds = seconds

  local precise_age = seconds / 31557600

  local function round(float)
    return math.floor(float * 100 + 0.5) / 100.0
  end

  local function calculate_years_relative_to_earth(orbital_period)
    return function() return round(precise_age / orbital_period) end
  end

  self.on_earth =   calculate_years_relative_to_earth(1)
  self.on_mercury = calculate_years_relative_to_earth(0.2408467)
  self.on_venus =   calculate_years_relative_to_earth(0.61519726)
  self.on_mars =    calculate_years_relative_to_earth(1.8808158)
  self.on_jupiter = calculate_years_relative_to_earth(11.862615)
  self.on_saturn =  calculate_years_relative_to_earth(29.447498)
  self.on_uranus =  calculate_years_relative_to_earth(84.016846)
  self.on_neptune = calculate_years_relative_to_earth(164.79132)

  return self
end

return SpaceAge
