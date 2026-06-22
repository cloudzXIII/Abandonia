-- Dimitri Jester (coded by cloudzXIII)
SMODS.Joker {
  key = 'dimitri_jester',

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
    return { vars = { cae.x_mult, cae.x_mult_gain, cae.dollars } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 2, y = 10 },
  soul_pos = { x = 3, y = 10 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_mult = 1, x_mult_gain = 0.04, dollars = 1 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") then
      if next(SMODS.find_card("j_joker")) then
        for _, joker in ipairs(G.jokers.cards or {}) do
          joker.ability.extra_value = (joker.ability.extra_value or 0) +
              card.ability.extra.dollars
          joker:set_cost()
          SMODS.calculate_effect({ message = localize('k_val_up'), colour = G.C.MONEY }, joker)
        end
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
        colour = G.C.MULT
      }
    end
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat & Vlambambo, Shinku",
  },
}
