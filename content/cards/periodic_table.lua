-- Periodic Table (coded by cloudzXIII)

SMODS.Joker {
  key = 'periodic_table',

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet5',
  pos = { x = 5, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = { extra = {} },

  calculate = function(self, card, context)
    if context.after and (G.GAME.chips + SMODS.calculate_round_score()) > G.GAME.blind.chips then
      local poker_hand = context.scoring_name
      local possible = context.display_name -- for royal flush
      G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
      G.E_MANAGER:add_event(Event({
        func = (function()
          G.E_MANAGER:add_event(Event({
            func = function()
              local _periodic = nil
              for _, periodic_center in pairs(G.P_CENTER_POOLS.periodic) do
                if (periodic_center.config.extra.hand == poker_hand) or (periodic_center.config.extra.hand == possible) then
                  _periodic = periodic_center.key
                end
              end
              if _periodic then
                SMODS.add_card({ key = _periodic })
              end
              G.GAME.consumeable_buffer = 0
              return true
            end
          }))
          SMODS.calculate_effect({ message = localize('k_plus_periodic'), colour = G.C.SECONDARY_SET.periodic },
            context.blueprint_card or card)
          return true
        end)
      }))
    end
  end,

  abn_artist_credits = {
    artist = "Sustato",
  },
}
