SMODS.Joker {
  key = 'mod_joker',
  rarity = 2, 
  atlas = 'ABNJokerSheet17',
  pos = { x = 7, y = 4 },
  cost = 6, 
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chips = 0,
      chip_gain = 5,
    }
  },
  
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.chip_gain } }
  end,

  update = function(self, card)
    if G.STAGE ~= G.STAGES.RUN then return end

    local total_suits_registered = 0

    for suit_key, _ in pairs(SMODS.Suits) do
      total_suits_registered = total_suits_registered + 1
    end

    local valid_suits = math.max(0, total_suits_registered - 1)

    card.ability.extra.chips = valid_suits * card.ability.extra.chip_gain
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
        return {
          chips = card.ability.extra.chips,
          colour = G.C.CHIPS
        }
    end
  end,

  abn_artist_credits = {
    artist = "0kronix",
  },
}