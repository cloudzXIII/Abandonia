-- Classified Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'classified_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
    return { vars = { card.ability.extra.dollars, card.ability.extra.chips_gain, card.ability.extra.chips } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet10',
  pos = { x = 3, y = 5 },
  cost = 2,
  discovered = false,
  blueprint_compat = false,

  config = { extra = { dollars = 4, chips = 0, chips_gain = 10 } },

  abn_artist_credits = {
    artist = "Flote"
  },
  abn_use_config = { colour = G.C.RED, text = "UNFLIP", cost = 4 },
  can_use = function(self, card)
    if G.hand and G.hand.highlighted and #G.hand.highlighted > 0 then
      for i = 1, #G.hand.highlighted do
        if G.hand.highlighted[i].facing ~= 'back' then
          return false
        end
      end
      return G.GAME.dollars >= card.ability.extra.dollars
    end
    return false
  end,
  use = function(self, card)
    ease_dollars(-card.ability.extra.dollars)
    for i = 1, #G.hand.highlighted do
      G.hand.highlighted[i].ability.abn_perma_flipped = false
      G.hand.highlighted[i]:flip()
    end
    SMODS.scale_card(card, {
      ref_table = card.ability.extra,
      ref_value = "chips",
      scalar_value = "chips_gain",
      operation = '+',
    })
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    for i = 1, #G.jokers.cards do
      local v = G.jokers.cards[i]
      if not v.ability.abn_perma_flipped then
        if v.facing == 'front' then
          v:flip()
        end
        v.ability.abn_perma_flipped = true
      end
    end
    for i = 1, #G.playing_cards do
      local v = G.playing_cards[i]
      if not v.ability.abn_perma_flipped then
        if v.facing == 'front' then
          v:flip()
        end
        v.ability.abn_perma_flipped = true
      end
    end
  end,
}
