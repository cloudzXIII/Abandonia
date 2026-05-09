-- Planetary Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'planetary_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet8',
  pos = { x = 2, y = 4 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = {} },

  calculate = function(self, card, context)
    if context.after and G.GAME.current_round.hands_left == 0 then
      G.E_MANAGER:add_event(Event({
        func = (function()
          if G.GAME.last_hand_played then
            local _planet = nil
            for k, v in pairs(G.P_CENTER_POOLS.Planet) do
              if v.config.hand_type == G.GAME.last_hand_played then
                _planet = v.key
              end
            end
            SMODS.add_card { set = "Planet", key = _planet }
          end
          return true
        end)
      }))
    end
  end,
  abn_artist_credits = {
    artist = "Gud"
  },
}
