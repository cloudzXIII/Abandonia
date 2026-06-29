-- Hieroglyph (coded by cloudzXIII)
SMODS.Joker {
  key = 'hieroglyph',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS["m_abn_fossil"]
    local cae = card.ability.extra
    return { vars = {} }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet5',
  pos = { x = 1, y = 0 },
  cost = 5,
  discovered = false,
  blueprint_compat = false,

  config = { extra = {} },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == "unscored" then
      local _card = context.other_card


      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function()
          play_sound('tarot1')
          _card:flip()
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.25,
        func = function()
          play_sound('card1')
          _card:juice_up(0.3, 0.1)
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          _card:set_ability("m_abn_fossil")
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.55,
        func = function()
          play_sound('tarot2')
          _card:flip()
          return true
        end
      }))
      return {
        message = localize("k_upgrade_ex"),
        card = _card
      }
    end
  end,

  abn_artist_credits = {
    artist = "Modlich_303",
  },
}
