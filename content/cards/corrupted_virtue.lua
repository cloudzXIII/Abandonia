-- Corrupted Virtue (coded by cloudzXIII)
SMODS.Joker {
  key = 'corrupted_virtue',

  rarity = 2,
  atlas = 'ABNJokerSheet14',
  pos = { x = 9, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    return { vars = {}, }
  end,
  calculate = function(self, card, context)
    if context.destroy_card and not context.blueprint then
      if #context.full_hand == 1 and context.destroy_card == context.full_hand[1] and context.full_hand[1]:get_id() == SMODS.Ranks.abn_13.id and G.GAME.current_round.hands_played == 0 then
        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
          G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
          G.E_MANAGER:add_event(Event({
            func = (function()
              SMODS.add_card {
                set = 'nightshift_cards',
                key = ABN.get_random_nightshift(),
                key_append = 'abn_corrupted_virtue'
              }
              G.GAME.consumeable_buffer = 0
              return true
            end)
          }))
          return {
            message = localize('k_abn_plus_nightshift'),
            colour = G.C.SECONDARY_SET.nightshift_cards,
            remove = true
          }
        end
        return {
          remove = true
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Comykel",
  },
  in_pool = function(self)
    return G.GAME.abn_13_played_this_run
  end
}
