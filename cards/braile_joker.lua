SMODS.Joker {
  key = 'braile_joker',

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.base, card.ability.extra.odds,
      'abn_eye_exam')
    return { vars = { numerator, denominator, card.ability.extra.x_mult } }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 2, y = 6 },
  cost = 8,
  discovered = true,
  blueprint_compat = true,

  config = { extra = { x_mult = 1.5, base = 1, odds = 2 } },

  calculate = function(self, card, context)
    if context.stay_flipped and context.to_area == G.hand and SMODS.pseudorandom_probability(card, 'eye_exam', card.ability.extra.base, card.ability.extra.odds, "abn_eye_exam") then
      return {
        stay_flipped = true
      }
    end
    if context.abn_play_cards then
      card.ability.extra.card_list = {}
      for i = 1, #G.hand.highlighted do
        if G.hand.highlighted[i].facing == 'back' then
          table.insert(card.ability.extra.card_list, G.hand.highlighted[i])
        end
      end
    end
    if context.individual and context.cardarea == G.play and context.other_card then
      local condition = false
      for i = 1, #card.ability.extra.card_list do
        local flipped_card = card.ability.extra.card_list[i]
        if context.other_card == flipped_card then
          condition = true
          break
        end
      end
      if condition then
        return {
          x_mult = card.ability.extra.xmult,
          card = card
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Toyrapple"
  },
}
