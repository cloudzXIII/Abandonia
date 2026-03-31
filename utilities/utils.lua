---Returns true with probability `chance` (0.0 to 1.0)
---@param chance number
---@return boolean
function ABANDONIA.random_chance(chance)
  return math.random() < chance
end

ABN.vanilla_food = {
  j_gros_michel = true,
  j_ice_cream = true,
  j_cavendish = true,
  j_turtle_bean = true,
  j_diet_cola = true,
  j_popcorn = true,
  j_ramen = true,
  j_selzer = true,
  j_egg = true,
}

-- Initialize pool of food jokers if it doesn't exist already, which may be created by other mods.
-- Any joker can add itself to this pool by adding pools = { Food = true } to its code
-- Credits to Paperback for this code
if not SMODS.ObjectTypes.Food then
  SMODS.ObjectType {
    key = 'Food',
    default = 'j_joker',
    cards = {},
    inject = function(self)
      SMODS.ObjectType.inject(self)
      -- Insert base game food jokers
      for k, _ in pairs(ABN.vanilla_food) do
        self:inject_card(G.P_CENTERS[k])
      end
    end
  }
end
