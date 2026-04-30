---Returns true with probability `chance` (0.0 to 1.0)
---@param chance number
---@return boolean
function ABANDONIA.random_chance(chance)
  return math.random() < chance
end
