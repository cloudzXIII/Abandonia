local is_faceRef = Card.is_face
function Card:is_face(from_boss)
  if next(SMODS.find_card('j_abn_misplaced_texture')) then
    local id = self:get_id()
    if id == 11 or id == 12 or id == 13 then
      return false
    end
  end
  return is_faceRef(self, from_boss)
end

SMODS.Joker {
  key = 'misplaced_texture',

  rarity = 2,
  atlas = 'ABNJokerSheet4',
  pos = { x = 3, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  calculate = function(self, card, context)
  end,

  abn_artist_credits = {
    artist = "Monachrome",
  },
}
