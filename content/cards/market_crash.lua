-- Market Crash (coded by cloudzXIII)
SMODS.Joker {
  key = 'market_crash',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.lost_money } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet23',
  pos = { x = 4, y = 2 },
  cost = 1,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, lost_money = 0 } },

  calculate = function(self, card, context)
    if context.money_altered and context.amount > 0 and not context.blueprint then
      local amount_lost = context.amount - 1
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          ease_dollars(-context.amount + 1)
          return true
        end
      }))
      card.ability.extra.lost_money = card.ability.extra.lost_money + (amount_lost)
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + amount_lost * 2
        end,
        message_colour = G.C.MULT
      })
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
    if context.selling_self then
      ease_dollars(card.ability.extra.lost_money)
    end
  end,

  abn_artist_credits = {
    artist = "GM36",
  },
}
