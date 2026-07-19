-- Curtis Clown (coded by cloudzXIII)
SMODS.Joker {
  key = 'curtis_clown',

  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    info_queue[#info_queue + 1] = G.P_CENTERS.j_joker
    return { vars = { cae.x_chips, cae.x_chips_gain, cae.mult } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 8, y = 8 },
  soul_pos = { x = 9, y = 8 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_chips = 1.5, x_chips_gain = 0.09, mult = 1 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("abn_Sword") then
      if next(SMODS.find_card("j_joker")) and #G.hand.cards > 0 then
        for _, held in ipairs(G.hand.cards) do
          held.ability.perma_mult = (held.ability.perma_mult or 0) +
              card.ability.extra.mult
          SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.MULT }, held)
        end
      end
      if not context.blueprint then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_chips",
          scalar_value = "x_chips_gain",
        })
      end
      return {
        x_chips = card.ability.extra.x_chips,
        card = card,
        colour = G.C.CHIPS
      }
    end
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  abn_artist_credits = {
    artist = "Inky & Nrio",
  },

  in_pool = function(self, args)
    for _, playing in ipairs(G.playing_cards or {}) do
      if playing:is_suit("abn_Sword") then
        return true
      end
    end
  end
}
