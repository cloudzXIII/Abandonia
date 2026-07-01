-- Ishihara Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'ishihara_joker',
  rarity = 1,
  atlas = 'ABNJokerSheet8',
  pos = { x = 7, y = 5 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { chips = 0 } },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    return { vars = { card.ability.extra.chips } }
  end,

  in_pool = function(self)
    for _, card in ipairs(G.playing_cards or {}) do
      if ABN.is_light(card) and card.edition and card.edition.negative then
        return true
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if ABN.is_light(context.other_card) and context.other_card.edition and context.other_card.edition.negative then
        card.ability.extra.chips = card.ability.extra.chips + context.other_card.base.nominal
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.CHIPS,
          card = card
        }
      end
    end

    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Vega",
  },
}
