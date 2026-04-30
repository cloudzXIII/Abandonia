SMODS.Joker {
  key = 'ambigram',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet1',
  pos = { x = 5, y = 0 },
  cost = 14,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 4, symmetrical = false } },

  calculate = function(self, card, context)
    if context.before then
      local ranks = {}
      for i = 1, #context.full_hand do
        table.insert(ranks, context.full_hand[i]:get_id())
      end

      local is_symmetrical = true
      for i = 1, #ranks do
        if ranks[i] ~= ranks[#ranks - i + 1] then
          is_symmetrical = false
          break
        end
      end

      card.ability.symmetrical = is_symmetrical
    end
    if context.individual and context.cardarea == G.play then
      if card.ability.symmetrical then
        return {
          mult = card.ability.extra.mult
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "thingie53",
  },
}
