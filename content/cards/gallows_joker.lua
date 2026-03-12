SMODS.Joker {
  key = 'gallows_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.c_hanged_man
    local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.base, card.ability.extra.odds,
      'abn_gallows_joker')
    return { vars = { numerator, denominator } }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 8, y = 3 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { base = 1, odds = 4, tarot = "c_hanged_man" } },

  calculate = function(self, card, context)
    if context.remove_playing_cards and not context.blueprint then
      for _, removed_card in ipairs(context.removed) do
        if removed_card:is_face() then
          if SMODS.pseudorandom_probability(card, 'gallows_joker', card.ability.extra.base, card.ability.extra.odds, "abn_gallows_joker") and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
              func = (function()
                G.E_MANAGER:add_event(Event({
                  func = function()
                    SMODS.add_card {
                      set = 'Tarot',
                      key = card.ability.extra.tarot,
                      key_append = 'abn_gallows_joker'
                    }
                    G.GAME.consumeable_buffer = 0
                    return true
                  end
                }))
                SMODS.calculate_effect({ message = localize('k_plus_tarot'), colour = G.C.PURPLE },
                  context.blueprint_card or card)
                return true
              end)
            }))
          end
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "lolhappy909_lol"
  },
}
