SMODS.Seal {
  key = "pink",
  badge_colour = HEX("ec7de7"),
  atlas = "AbandoniaSeals",
  pos = { x = 0, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
      }
    }
  end,

  config = {
    extra = {
    }
  },

  calculate = function(self, card, context)
    if context.discard and context.other_card == card and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = function()
          SMODS.add_card({ set = 'astro_cards' })
          G.GAME.consumeable_buffer = 0
          return true
        end
      }))
      return { message = localize('k_abn_plus_astro'), colour = HEX("5204ff") }
    end
  end
}

SMODS.Seal {
  key = "orange",
  badge_colour = HEX("f8a166"),
  atlas = "AbandoniaSeals",
  pos = { x = 1, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
      }
    }
  end,

  config = {
    extra = {
    }
  },

  calculate = function(self, card, context)
    if context.playing_card_end_of_round and context.cardarea == G.hand and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = function()
          local _planet = nil
          for k, v in pairs(G.P_CENTER_POOLS.Planet) do
            if v.config.rank == card.config.card.value then
              _planet = v.key
            end
          end
          if _planet then
            SMODS.add_card({ key = _planet })
          end
          G.GAME.consumeable_buffer = 0
          return true
        end
      }))
      return { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet }
    end
  end
}


SMODS.Seal {
  key = "grey",
  badge_colour = HEX("cfcfcf"),
  atlas = "AbandoniaSeals",
  pos = { x = 2, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        self.config.extra.dollars
      }
    }
  end,

  config = {
    extra = {
      dollars = 3
    }
  },

  calculate = function(self, card, context)
    if context.discard and context.other_card == card then
      return { dollars = self.config.extra.dollars, colour = G.C.MONEY }
    end
  end
}
