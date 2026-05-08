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
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
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
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
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
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}

SMODS.Seal {
  key = "black",
  badge_colour = HEX("454545"),
  atlas = "AbandoniaSeals",
  pos = { x = 3, y = 0 },

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
          SMODS.add_card({ set = 'sigils' })
          G.GAME.consumeable_buffer = 0
          return true
        end
      }))
      return { message = localize('k_abn_plus_sigil'), colour = HEX("fd5f55") }
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}

SMODS.Seal {
  key = "teal",
  badge_colour = HEX("64a5a0"),
  atlas = "AbandoniaSeals",
  pos = { x = 4, y = 0 },

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
          SMODS.add_card({ set = "calamity_cards" })
          G.GAME.consumeable_buffer = 0
          return true
        end
      }))
      return { message = localize('k_abn_plus_calamity'), colour = G.C.SECONDARY_SET.Planet }
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}

SMODS.Seal {
  key = "white",
  badge_colour = HEX("dedede"),
  atlas = "AbandoniaSeals",
  pos = { x = 5, y = 0 },

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
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}
local old_ease_discard = ease_discard
function ease_discard(mod)
  if mod < 0 then
    local has_white_seal = false
    if G.hand and G.hand.highlighted then
      for _, card in ipairs(G.hand.highlighted) do
        if card.seal == "abn_white" then
          has_white_seal = true
          break
        end
      end
    end
    if has_white_seal then
      mod = mod + 1
    end
  end
  return old_ease_discard(mod)
end

SMODS.Seal {
  key = "brown",
  badge_colour = HEX("793307"),
  atlas = "AbandoniaSeals",
  pos = { x = 6, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        self.config.extra.xmult
      }
    }
  end,

  config = {
    extra = {
      xmult = 2
    }
  },

  calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play then
      return { x_mult = self.config.extra.xmult, colour = G.C.XMULT }
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}
