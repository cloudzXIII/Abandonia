-- Artistic Interpretation (coded by cloudzXIII)
SMODS.Joker {
  key = 'artistic_interpretation',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips, card.ability.extra.chips_gain
      }
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet8',
  pos = { x = 8, y = 5 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      chips = 0,
      chips_gain = 5,
      last_played = "none",
    },
  },
  
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      -- Completely ignore High Card
      if context.scoring_name == "High Card" then return end

      if card.ability.extra.last_played == "none" or card.ability.extra.last_played == context.scoring_name then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          scalar_value = "chips_gain",
          operation = '+',
        })
      end
      
      card.ability.extra.last_played = context.scoring_name
    end

    if context.joker_main then
      if card.ability.extra.chips > 0 then
        return {
          chips = card.ability.extra.chips,
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "cloudzXIII", -- hell yeah
    colour = G.C.GOLD
  },
}