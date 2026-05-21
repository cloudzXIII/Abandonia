SMODS.Joker {
  key = 'badformat_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.BLACK, G.C.WHITE, 1.0)
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet12',
  pos = { x = 6, y = 0 },
  cost = 12,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { echips = 2, emult = 2 } },
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
    if context.individual and context.cardarea == G.play then
      if context.other_card and ABN.is_light(context.other_card) then
        return {
          emult = card.ability.extra.emult,
          echips = card.ability.extra.echips,
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Dogg-Fly & Vega",
  },
}
