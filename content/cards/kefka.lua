-- Kefka (coded by cloudzXIII)
SMODS.Joker {
  key = 'kefka',

  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    return { vars = { cae.x_mult, cae.x_mult_gain } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 6, y = 6 },
  soul_pos = { x = 7, y = 6 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_mult = 1, x_mult_gain = 0.05 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and ABN.is_light(context.other_card) then
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
        local _rank = G.GAME.abn_rank_upgrades[scored_card.base.value]
        update_hand_text(
          { sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
          { handname = _rank.name .. "s", chips = _rank.chips, mult = _rank.mult, level = _rank.level }
        )
        ABN.level_up_rank(scored_card, scored_card.base.value)
        update_hand_text(
          { sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
          { mult = 0, chips = 0, handname = "", level = "" }
        )
      end
    end
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  abn_artist_credits = {
    artist = "Camostar34",
  },
}
