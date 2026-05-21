-- Brother's Memento (coded by cloudzXIII)
SMODS.Joker {
  key = 'brothers_memento',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet12',
  pos = { x = 7, y = 3 },
  pixel_size = { h = 95 / 1.2 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 3 } },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_face() then
      local is_first_face = false
      for i = 1, #context.scoring_hand do
        if context.scoring_hand[i]:is_face() then
          is_first_face = context.scoring_hand[i] == context.other_card
          break
        end
      end
      if is_first_face then
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
