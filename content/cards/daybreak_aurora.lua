SMODS.Joker {
  key = 'daybreak_aurora',
  rarity = 2,
  atlas = 'ABNJokerSheet2',
  pos = { x = 4, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chipsj = 50, chipsc = 20 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chipsj, card.ability.extra.chipsc } }
  end,

  in_pool = function(self)
    if not G.playing_cards then return false end
    for _, card in ipairs(G.playing_cards) do
      if card and card.edition and card.edition.key == 'e_holo' then
        return true
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    -- Determine if this specific Joker is holographic to double the value
    local bonus = (card.edition and card.edition.holo) and 2 or 1

    -- Trigger for other holo Jokers
    if context.other_joker and context.other_joker.edition and context.other_joker.edition.holo then
      if context.other_joker ~= card then
        return {
          chips = card.ability.extra.chipsj * bonus,
          card = card
        }
      end
    end

    -- Trigger for holo cards played in the hand
    if context.individual and context.cardarea == G.play then
      if context.other_card.edition and context.other_card.edition.holo then
        return {
          chips = card.ability.extra.chipsc * bonus,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Sarcpot",
  },
}
