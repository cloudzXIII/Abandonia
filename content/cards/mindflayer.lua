SMODS.Joker {
  key = 'mindflayer',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet2',
  pos = { x = 9, y = 1 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 1, } },

  calculate = function(self, card, context)
    if context.press_play and not context.blueprint then
      --Checking the full G.hand accounts for any cards that might be force-added to hand by other effects
      for _, c in ipairs(G.hand.cards) do
        if c.facing == 'back' then
          c.mindflayer_flipped = true
        end
      end
    end
    if context.individual and context.cardarea == G.play and context.other_card and (context.other_card.mindflayer_flipped or context.other_card.ability and context.other_card.ability.abn_perma_flipped) then
      context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0)
          + card.ability.extra.mult
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.MULT
      }
    end
    if (context.after or context.debuffed_hand) and not context.blueprint then
      for _, c in ipairs(G.playing_cards) do
        if c.facing == 'back' then
          c.mindflayer_flipped = nil
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "fattywapp"
  },
  in_pool = function(self, args)
    for _, card in ipairs(G.playing_cards or {}) do
      if card.ability and card.ability.abn_perma_flipped then
        return true
      end
    end
    return false
  end
}
