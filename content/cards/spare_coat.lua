-- Spare Coat (coded by cloudzXIII)
SMODS.Joker {
  key = 'spare_coat',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.mult_gain, localize(cae.type, 'poker_hands'), cae.score, cae.chips, cae.chips_gain } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet20',
  pos = { x = 9, y = 5 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { mult = 0, mult_gain = 3, type = "Three of a Kind", score = 50, chips = 0, chips_gain = 6 } },

  calculate = function(self, card, context)
    if context.before and next(context.poker_hands[card.ability.extra.type]) and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = '+',
        no_message = true
      })
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips_gain",
        operation = '+',
      })
      local has_snow = false
      for _, v in ipairs(context.scoring_hand) do
        if v:is_suit("abn_Snow") then
          has_snow = true
          break
        end
      end
      if has_snow then
        for _, v in ipairs(G.hand.cards) do
          if v and v:is_suit("abn_Snow") then
            v.ability.perma_score = (v.ability.perma_score or 0) + card.ability.extra.score
            SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.PURPLE }, v)
          end
        end
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips
      }
    end
  end,

  abn_artist_credits = {
    artist = "Vega",
  },
}
