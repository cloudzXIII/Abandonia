SMODS.Joker {
  key = 'fit_to_shape',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.ABN_PLAGUED, G.C.WHITE, 1.0)
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet12',
  pos = { x = 1, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { echips = 1.6, emult = 1.8 } },
  pools = { ["Plagued"] = true, },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.echips,
        card.ability.extra.emult
      }
    }
  end,

  -- only available on jimbo stakes
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)
    if context.joker_main and #context.full_hand == 4 then
      return {
        emult = card.ability.extra.emult,
        echips = card.ability.extra.echips,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Inky & Vega",
  },
}
