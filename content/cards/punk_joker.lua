-- Punk Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'punk_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    info_queue[#info_queue + 1] = { key = 'e_negative_playing_card', set = 'Edition', config = { extra = 1 } }
    return { vars = { cae.x_chips, cae.x_chips_gain } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet2',
  pos = { x = 1, y = 5 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_chips = 1, x_chips_gain = 0.1 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card.base.suit == "abn_suitless" then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "x_chips",
        scalar_value = "x_chips_gain",
        operation = '+',
      })
      if not context.other_card.edition then
        local is_first_null = false
        for i = 1, #context.scoring_hand do
          if context.scoring_hand[i].base.suit == "abn_suitless" and not context.scoring_hand[i].edition then
            is_first_null = context.scoring_hand[i] == context.other_card
            break
          end
        end
        if is_first_null then
          local _card = context.other_card
          G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            delay = 0.1,
            func = function()
              _card:set_edition("e_negative", true)
              return true
            end
          }))
        end
      end
    end
    if context.joker_main and card.ability.extra.x_chips > 1 then -- idk if this is intentional but like the message shows even at X1 chips :thonk:
      return {
        x_chips = card.ability.extra.x_chips
      }
    end
  end,
  abn_artist_credits = {
    artist = "Vlambambo",
  },
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if playing_card.base.suit == "abn_suitless" then
        return true
      end
    end
    return false
  end
}
