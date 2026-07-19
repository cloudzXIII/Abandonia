-- Jinxie (coded by cloudzXIII)
SMODS.Joker {
  key = 'jinxie',

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
    return { vars = { cae.x_chips, cae.x_chips_gain, cae.chips } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 2, y = 13 },
  soul_pos = { x = 3, y = 13 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_chips = 1.5, x_chips_gain = 0.09, chips = 2 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("abn_Rose") then
      if next(SMODS.find_card("j_joker")) and #G.hand.cards > 0 then
        context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
            card.ability.extra.chips *
            (G.GAME.abn.suits_played_this_blind["abn_Rose"] or 0)
        SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.MULT }, context.other_card)
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
    artist = "Da Gorbage Rat & La Ginger",
  },

  in_pool = function(self, args)
    for _, playing in ipairs(G.playing_cards or {}) do
      if playing:is_suit("abn_Rose") then
        return true
      end
    end
  end
}
