-- Uboa (coded by cloudzXIII)
SMODS.Joker { -- this kinda gives me ghaster...
  key = 'uboa',

  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    return { vars = { cae.x_mult, cae.x_mult_gain } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 0, y = 5 },
  soul_pos = { x = 1, y = 5 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_mult = 1, x_mult_gain = 0.05 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit('abn_Penumbra') then
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
    if context.after and (G.GAME.chips + SMODS.calculate_round_score()) > G.GAME.blind.chips then
      for _, scored_card in ipairs(context.scoring_hand) do
        card:juice_up(0.3, 0.5)
        ABN.level_up_rank(scored_card, scored_card.base.value)
      end
    end
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  abn_artist_credits = {
    artist = "astellarsblue",
  },

  in_pool = function(self, args)
    for _, playing in ipairs(G.playing_cards or {}) do
      if playing:is_suit("abn_Penumbra") then
        return true
      end
    end
  end
}
