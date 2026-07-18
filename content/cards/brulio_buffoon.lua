-- Brulio Buffoon (coded by cloudzXIII)
SMODS.Joker {
  key = 'brulio_buffoon',

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
    return { vars = { cae.x_mult, cae.x_mult_gain, cae.mult } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 6, y = 10 },
  soul_pos = { x = 7, y = 10 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_mult = 1.5, x_mult_gain = 0.09, mult = 2 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("abn_Chalice") then
      if next(SMODS.find_card("j_joker")) then
        local rank = context.other_card.base.value
        local level = G.GAME.abn_rank_upgrades[rank] and G.GAME.abn_rank_upgrades[rank].level or 1
        if level > 1 then
          context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
              (card.ability.extra.mult * level)
          SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.MULT }, context.other_card)
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
    artist = "Dogg-Fly & Vlambambo",
  },

  in_pool = function(self, args)
    for _, playing in ipairs(G.playing_cards or {}) do
      if playing:is_suit("abn_Chalice") then
        return true
      end
    end
  end
}
