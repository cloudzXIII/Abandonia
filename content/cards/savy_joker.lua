-- Savy Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'savy_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.size } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet23',
  pos = { x = 6, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 12, size = 5 } },
  calculate = function(self, card, context)
    if context.joker_main then
      local evens = 0
      for _, v in ipairs(context.scoring_hand) do
        if ABN.is_even(v) then
          evens = evens + 1
        end
      end
      if evens >= card.ability.extra.size then
        return {
          mult = card.ability.extra.mult
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "GM36",
  },
}
