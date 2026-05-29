-- Joker Republic (coded by cloudzXIII)
SMODS.Joker {
  key = 'joker_republic',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
      }
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet7',
  pos = { x = 0, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      continent_used = false
    },
  },
  calculate = function(self, card, context)
    if context.setting_blind and context.blind.key == "bl_big" and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
      G.E_MANAGER:add_event(Event({
        func = (function()
          G.E_MANAGER:add_event(Event({
            func = function()
              SMODS.add_card {
                set = 'continent',
                key_append = 'abn_republic'
              }
              G.GAME.consumeable_buffer = 0
              return true
            end
          }))
          SMODS.calculate_effect({ message = localize('k_abn_plus_continent'), colour = G.C.SECONDARY_SET.continent },
            context.blueprint_card or card)
          return true
        end)
      }))
      return nil, true
    end
    if context.using_consumeable and context.consumeable.ability.set == "continent" then
      card.ability.extra.continent_used = true
    end
    if context.before and card.ability.extra.continent_used then
      card.ability.extra.continent_used = false
      ABN.level_up_rank(context.scoring_hand[1], context.scoring_hand[1].base.value, 1)
    end
  end,
  abn_artist_credits = {
    artist = "Littleroot",
  },
  in_pool = function(self)
    return G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.continent and
        G.GAME.consumeable_usage_total.continent > 0
  end
}
