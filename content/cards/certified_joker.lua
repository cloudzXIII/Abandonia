-- Certified Joker
-- Coded by J8-Bit
-- Each played Ace gives X1.5 Mult and X1.2 Chips when scored


SMODS.Joker {
  key = 'certified_joker',

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  config = {
    extra = {
      ranks = { "Ace" },
      x_mult = 1.5,
      x_chips = 1.2,
    },
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.ranks[1], 'ranks'),
        card.ability.extra.x_mult,
        card.ability.extra.x_chips,
      }
    }
  end,
  rarity = 3,
  cost = 10,
  atlas = 'ABNJokerSheet5',
  pos = { x = 8, y = 2 },
  discovered = false,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local is_rank = false
      for index, rank in ipairs(card.ability.extra.ranks) do
        if context.other_card:get_id() == SMODS.Ranks[rank].id then
          is_rank = true
          break
        end
      end
      if is_rank then
        return {
          x_mult = card.ability.extra.x_mult,
          x_chips = card.ability.extra.x_chips,
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Modlich_303"
  },
}
