-- Freddy Jester (coded by cloudzXIII)
SMODS.Joker {
  key = 'freddy_jester',

  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.j_joker
    local cae = card.ability.extra
    return { vars = { cae.x_mult, cae.x_mult_gain, cae.chips } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 0, y = 9 },
  soul_pos = { x = 1, y = 9 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_mult = 1, x_mult_gain = 0.04, chips = 25 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("abn_Penumbra") then
      if next(SMODS.find_card("j_joker")) then
        context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + card.ability.extra
            .chips
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
      end
      if not context.blueprint then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
        })
      end
      return {
        x_mult = card.ability.extra.x_mult,
        card = card,
        colour = G.C.RED
      }
    end
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  abn_artist_credits = {
    artist = "Inky & Vlambambo",
  },
}
