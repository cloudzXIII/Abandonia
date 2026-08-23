-- Shrewd Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'shrewd_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips, cae.size } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet23',
  pos = { x = 7, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 100, size = 5 } },
  calculate = function(self, card, context)
    if context.joker_main then
      local odds = 0
      for _, v in ipairs(context.scoring_hand) do
        if ABN.is_odd(v) then
          odds = odds + 1
        end
      end
      if odds >= card.ability.extra.size then
        return {
          chips = card.ability.extra.chips
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "GM36",
  },
}
