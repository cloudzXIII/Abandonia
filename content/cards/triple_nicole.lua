-- Triple Nicole (coded by cloudzXIII)
SMODS.Joker {
  key = 'triple_nicole',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet23',
  pos = { x = 4, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 80 } },
  calculate = function(self, card, context)
    if context.joker_main and G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played % 2 == 1 then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,
  abn_artist_credits = {
    artist = "GM36",
  },
}
