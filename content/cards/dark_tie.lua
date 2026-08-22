-- Dark Tie (coded by cloudzXIII)
SMODS.Joker {
  key = 'dark_tie',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.mult_gain, localize(cae.type, 'poker_hands'), cae.mollars, cae.dollars, cae.dollars_gain } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet13',
  pos = { x = 8, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { mult = 0, mult_gain = 5, type = "Full House", mollars = 1, dollars = 0, dollars_gain = 1 } },

  calculate = function(self, card, context)
    if context.before and next(context.poker_hands[card.ability.extra.type]) then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = '+',
        no_message = true
      })
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "dollars",
        scalar_value = "dollars_gain",
        operation = '+',
      })

      local darks = 0
      for _, v in ipairs(context.scoring_hand) do
        if ABN.is_dark(v) then
          darks = darks + 1
        end
      end

      for _, v in ipairs(context.scoring_hand) do
        if v:is_suit("abn_Tie") then
          v.ability.perma_mult = (v.ability.perma_mult or 0) + (card.ability.extra.mollars * darks)
          v.ability.perma_p_dollars = (v.ability.perma_p_dollars or 0) + (card.ability.extra.mollars * darks)
          SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, v)
          break
        end
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        dollars = card.ability.extra.dollars,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Donut",
  },
}
