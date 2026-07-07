-- July Jester (coded by cloudzXIII)
SMODS.Joker {
  key = 'july_jester',

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
  pos = { x = 4, y = 12 },
  soul_pos = { x = 5, y = 12 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_mult = 1.4, x_mult_gain = 0.08, dollars = 1 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("abn_Coin") then
      if next(SMODS.find_card("j_joker")) then
        local count = 0
        for _, v in ipairs(context.scoring_hand) do
          if v:is_suit("abn_Coin") then
            count = count + 1
          end
        end
        context.other_card.ability.perma_p_dollars = (context.other_card.ability.perma_p_dollars or 0) +
            (card.ability.extra.dollars * count)
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
    artist = "Hyperx & Da Gorbage Rat",
  },
  in_pool = function(self, args)
    for _, playing in ipairs(G.playing_cards or {}) do
      if playing:is_suit("abn_Coin") then
        return true
      end
    end
  end
}
