-- Mateo Mime (coded by cloudzXIII)
SMODS.Joker {
  key = 'mateo_mime',

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
    return { vars = { cae.x_chips, cae.x_chips_gain } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 4, y = 10 },
  soul_pos = { x = 5, y = 10 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_chips = 1.5, x_chips_gain = 0.04 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("abn_Coin") then
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
        colour = G.C.MULT
      }
    end
    if context.after and next(SMODS.find_card("j_joker")) then
      for _, scored_card in ipairs(context.scoring_hand) do
        if scored_card:is_suit("abn_Coin") then
          card:juice_up(0.3, 0.5)
          ABN.level_up_rank(scored_card, scored_card.base.value)
        end
      end
    end
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  abn_artist_credits = {
    artist = "Qunumeru & Da Gorbage Rat",
  },
  in_pool = function(self, args)
    for _, playing in ipairs(G.playing_cards or {}) do
      if playing:is_suit("abn_Coin") then
        return true
      end
    end
  end
}
