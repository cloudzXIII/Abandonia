-- Double Hubble (coded by cloudzXIII)
SMODS.Joker {
  key = 'double_hubble',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.mult } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet23',
  pos = { x = 3, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 12 } },
  calculate = function(self, card, context)
    if context.joker_main and G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played % 2 == 0 then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "GM36",
  },
}
