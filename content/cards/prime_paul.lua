if ((SMODS.Mods["allinjest"] or {}).can_load) then
  -- Prime Paul
  -- Coded by J8-Bit
  -- Each played 2, 3, 5, or 7 gives X1.17 Mult when scored


  SMODS.Joker {
    key = 'prime_paul',

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {
      extra = {
        ranks = { "2", "3", "5", "7", "abn_11", "abn_13" },
        x_mult = 1.17,
      },
    },
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          localize(card.ability.extra.ranks[1], 'ranks'),
          localize(card.ability.extra.ranks[2], 'ranks'),
          localize(card.ability.extra.ranks[3], 'ranks'),
          localize(card.ability.extra.ranks[4], 'ranks'),
          localize(card.ability.extra.ranks[5], 'ranks'),
          localize(card.ability.extra.ranks[6], 'ranks'),
          card.ability.extra.x_mult,
        }
      }
    end,
    rarity = 1,
    cost = 4,
    atlas = 'ABNJokerSheet5',
    pos = { x = 6, y = 3 },
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
          }
        end
      end
    end,
    abn_artist_credits = {
      artist = "Modlich_303"
    },
  }
end
