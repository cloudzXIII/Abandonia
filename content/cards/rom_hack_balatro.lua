SMODS.Joker {
  key = 'rom_hack_balatro',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.ABN_PLAGUED, G.C.WHITE, 1.0)
  end,

  rarity = "abn_SuperRare",
  atlas = 'ABNJokerSheet12',
  pos = { x = 4, y = 0 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 8, xchips = 3, dollars = 10 } },
  pools = { ["Plagued"] = true, },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.xchips,
        card.ability.extra.dollars
      }
    }
  end,

  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)
    if context.other_joker and context.other_joker ~= card and not context.other_joker.config.center.original_mod then
      return {
        xmult = card.ability.extra.xmult,
        xchips = card.ability.extra.xchips,
        dollars = card.ability.extra.dollars,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "Dogg-Fly & Vega",
  },
}
