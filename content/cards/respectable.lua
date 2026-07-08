SMODS.Joker {
  key = 'respectable',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
      }
    }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet2',
  pos = { x = 6, y = 0 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local is_first_unenhanced = false
      for i = 1, #context.scoring_hand do
        if context.scoring_hand[i].config.center == G.P_CENTERS.c_base then
          is_first_unenhanced = context.scoring_hand[i] == context.other_card
          break
        end
      end
      if is_first_unenhanced then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_table = context.other_card.base,
          scalar_value = "nominal",
          operation = '+',
        })
      end
    end
  end,
  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}
