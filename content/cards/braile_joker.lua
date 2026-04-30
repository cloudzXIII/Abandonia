SMODS.Joker {
  key = 'braile_joker',

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.base, card.ability.extra.odds,
      'abn_braile_joker')
    return { vars = { numerator, denominator, card.ability.extra.xmult } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet2',
  pos = { x = 2, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 1.5, base = 1, odds = 2 } },

  calculate = function(self, card, context)
    if context.stay_flipped and context.to_area == G.hand and SMODS.pseudorandom_probability(card, 'braile_joker', card.ability.extra.base, card.ability.extra.odds, "abn_braile_joker") then
      return {
        stay_flipped = true
      }
    end
    if context.abn_play_cards then
      for i = 1, #G.hand.highlighted do
        if G.hand.highlighted[i].facing == 'back' then
          G.hand.highlighted[i].brail_flipped = true
        end
      end
    end
    if context.individual and context.cardarea == G.play and context.other_card and context.other_card.brail_flipped then
      context.other_card.brail_flipped = false
      return {
        x_mult = card.ability.extra.xmult,
        card = card
      }
    end
  end,
  abn_artist_credits = {
    artist = "Toyrapple"
  },
}
