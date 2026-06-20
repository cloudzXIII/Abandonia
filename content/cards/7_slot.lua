SMODS.Joker {
  key = '7_slot',
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult_gain,
      }
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet14',
  pos = { x = 8, y = 1 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      mult_gain = 7,
    },

  },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:get_id() == 7 then
      local scoring_7_amount = 0
      for i, v in ipairs(context.scoring_hand) do
        if v:get_id() == 7 then
          scoring_7_amount = scoring_7_amount + 1
        end
      end
      if #G.jokers.cards == 7 then
        context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
        context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.mult_gain
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, card)
      end
      ABN.level_up_rank(context.other_card, "7", scoring_7_amount)
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,


  abn_artist_credits = {
    artist = "MyMainAccisanord",
  },
}
