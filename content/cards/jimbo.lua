SMODS.Joker {
  key = 'jimbo',

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
    return { vars = { cae.x_mult, cae.x_mult_gain, cae.mult } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 6, y = 8 },
  soul_pos = { x = 7, y = 8 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_mult = 1.5, x_mult_gain = 0.04, mult = 4 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit('Hearts') then
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

    if context.before and next(SMODS.find_card('j_joker')) then
      for i = 1, #context.scoring_hand do
        local scoring_card = context.scoring_hand[i]

        scoring_card.ability.perma_mult = (scoring_card.ability.perma_mult or 0) + card.ability.extra.mult

        SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.MULT }, card)
      end
    end
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  abn_artist_credits = {
    artist = "Vlambambo & Gfs",
  },
}
