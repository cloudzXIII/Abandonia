SMODS.Joker {
  key = 'negative_suit',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    local negative_tally = 0
    if G.playing_cards then
      for _, playing_card in ipairs(G.playing_cards) do
        if playing_card.edition and playing_card.edition.key == "e_negative" then
          negative_tally = negative_tally + 1
        end
      end
    end
    return { vars = { card.ability.extra.chips, card.ability.extra.chips * negative_tally, localize({ type = 'name_text', key = "e_negative", set = "Edition" }) } }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 0, y = 7 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 20 } },

  calculate = function(self, card, context)
    if context.joker_main then
      local negative_tally = 0
      for _, playing_card in ipairs(G.playing_cards) do
        if playing_card.edition and playing_card.edition.key == "e_negative" then
          negative_tally = negative_tally + 1
        end
      end
      return {
        chips = card.ability.extra.chips * negative_tally,
      }
    end
  end,
  abn_artist_credits = {
    artist = "Ton",
  },
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards) do
      if playing_card.edition and playing_card.edition.key == "e_negative" then
        return true
      end
    end
    return false
  end
}
