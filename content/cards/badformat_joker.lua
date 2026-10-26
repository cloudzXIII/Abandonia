SMODS.Joker {
  key = 'badformat_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.ABN_PLAGUED, G.C.WHITE, 1.0)
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet12',
  pos = { x = 6, y = 0 },
  cost = 12,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { echips = 2, emult = 2, bad_echips = -2, bad_emult = -2 } },
  pools = { ["Plagued"] = true, },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    return {
      vars = {
        card.ability.extra.echips,
        card.ability.extra.emult,
        card.ability.extra.bad_echips,
        card.ability.extra.bad_emult,
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
        local mayhem_chance = 0
        if (G.GAME.abn_max_mayhem or 0) > 0 then
          mayhem_chance = math.min((G.GAME.abn_mayhem or 0) / G.GAME.abn_max_mayhem, 1)
        end

        if pseudorandom('badformat_mayhem') < mayhem_chance then
          if pseudorandom('badformat_mayhem_bad') < mayhem_chance then
            return {
              emult = card.ability.extra.bad_emult,
              echips = card.ability.extra.bad_echips,
            }
          end
          return
        end

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