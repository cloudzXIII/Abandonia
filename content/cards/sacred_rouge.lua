SMODS.Joker {
  key = 'sacred_rouge',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return {
      vars = {
        cae.chips,
        cae.mult
      }
    }
  end,

  rarity = 2,
  atlas = 'AbandoniaJokers',
  pos = { x = 0, y = 0 },
  soul_pos = { x = 0, y = 0 },
  cost = 7,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      chips = 80,
      mult = 8
    },
  },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local chip_count = 0
      local mult_count = 0
      for i = 1, #context.full_hand do
        if context.full_hand[i] ~= context.other_card and not context.full_hand[i].debuff then
          if context.full_hand[i].base.value == context.other_card.base.value then
            mult_count = 1
          end
          if context.full_hand[i].base.suit == context.other_card.base.suit and not context.full_hand[i].debuff then
            chip_count = 1
          end
        end
      end
      return {
        chips = card.ability.extra.chips * chip_count,
        mult = card.ability.extra.mult * mult_count
      }
    end
  end,
  abn_artist_credits = {
    artist = "Bunnet"
  },
}
