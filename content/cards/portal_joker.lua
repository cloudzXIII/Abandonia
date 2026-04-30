local wrap_around_straight_ref = SMODS.wrap_around_straight
function SMODS.wrap_around_straight()
  if next(SMODS.find_card("j_abn_portal_joker")) then
    return true
  end

  return wrap_around_straight_ref()
end

SMODS.Joker {
  key = 'portal_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet3',
  pos = { x = 6, y = 2 },
  cost = 4,
  discovered = false,
  blueprint_compat = false,

  config = { extra = {} },

  calculate = function(self, card, context)
  end,
  abn_artist_credits = {
    artist = "b.b.b.b."
  },
}
