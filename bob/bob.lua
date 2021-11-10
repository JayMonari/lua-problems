local bob = {}

function bob.hey(say)
  if say == '' then return "Fine, be that way." end

  local isYelling = say:upper() == say
  local isQuestion = say:sub(-1) == '?'

  if isYelling and isQuestion then
    return "Calm down, I know what I'm doing!"
  elseif isYelling then
    return "Whoa, chill out!"
  elseif isQuestion then
    return "Sure"
  else
    return "Whatever"
  end
end

return bob
