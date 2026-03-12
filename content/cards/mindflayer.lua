SMODS.Joker {
  key = 'mindflayer',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 9, y = 6 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 1, } },

  calculate = function(self, card, context)
    if context.abn_play_cards then
      for i = 1, #G.hand.highlighted do
        if G.hand.highlighted[i].facing == 'back' then
          G.hand.highlighted[i].mindflayer_flipped = true
        end
      end
    end
    if context.individual and context.cardarea == G.play and context.other_card and context.other_card.mindflayer_flipped then
      context.other_card.mindflayer_flipped = false
      context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0)
          + card.ability.extra.mult
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.MULT
      }
    end
  end,
  abn_artist_credits = {
    artist = "fattywapp"
  },
}
