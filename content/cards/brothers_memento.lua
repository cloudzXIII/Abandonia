-- Brother's Memento (coded by cloudzXIII)
SMODS.Joker {
  key = 'brothers_memento',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet10',
  pos = { x = 2, y = 4 },
  pixel_size = { h = 95 / 1.2 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 3 } },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
      local is_first_ace = false
      for i = 1, #context.scoring_hand do
        if context.scoring_hand[i]:get_id() == 14 then
          is_first_ace = context.scoring_hand[i] == context.other_card
          break
        end
      end
      if is_first_ace then
        return {
          xmult = card.ability.extra.xmult
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}