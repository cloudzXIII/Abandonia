SMODS.Joker {
  key = 'gris_gris_joker',

  loc_vars = function(self, info_queue)
    info_queue[#info_queue + 1] = G.P_SEALS.Blue
    info_queue[#info_queue + 1] = G.P_SEALS.Purple
    return {}
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet5',
  pos = { x = 0, y = 1 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  calculate = function(self, card, context)
    if context.before then
      G.GAME.consumeable_buffer = #G.consumeables.cards
    end
    if context.individual and context.cardarea == G.play and context.other_card.seal == 'Blue' and G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      local card_type = 'Planet'
      G.E_MANAGER:add_event(Event({
        func = (function()
          if G.GAME.last_hand_played then
            local _planet = 0
            for k, v in pairs(G.P_CENTER_POOLS.Planet) do
              if v.config.hand_type == G.GAME.last_hand_played then
                _planet = v.key
              end
            end
            SMODS.add_card { set = card_type, key = _planet }
          end
          return true
        end)
      }))
      G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
    elseif context.individual and context.cardarea == G.play and context.other_card.seal == 'Purple' and G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      G.E_MANAGER:add_event(Event({
        func = (function()
          SMODS.add_card { set = "Tarot", key_append = "8ba" }
          return true
        end)
      }))
      G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
    end
  end,
  abn_artist_credits = {
    artist = "Dallan",
  },
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if playing_card.seal and (playing_card.seal == "Blue" or playing_card.seal == "Purple") then
        return true
      end
    end
    return false
  end
}
