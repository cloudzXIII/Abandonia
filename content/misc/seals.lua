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
      return { message = localize('k_abn_plus_calamity'), colour = G.C.SECONDARY_SET.calamity_cards }
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

SMODS.Seal {
  key = "violet",
  badge_colour = HEX("5600a4"),
  atlas = "AbandoniaSeals",
  pos = { x = 1, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        self.config.extra.xchips
      }
    }
  end,

  config = {
    extra = {
      xchips = 2
    }
  },

  calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play then
      return { x_chips = self.config.extra.xchips, colour = G.C.CHIPS }
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}

SMODS.Seal {
  key = "lavender",
  badge_colour = HEX("c68ede"),
  atlas = "AbandoniaSeals",
  pos = { x = 0, y = 1 },

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
    if context.cardarea == G.play and context.repetition then
      if context.abn_retriggered then
        return
      end
      local pos = ABN.get_pos(card, context.scoring_hand)
      local scoring_card = context.scoring_hand[pos - 1]
      if scoring_card and scoring_card ~= card then
        card_eval_status_text(card, 'extra', nil, nil, nil, {
          message = localize('k_again_ex'),
          colour = G.C.FILTER,
        })
        SMODS.score_card(scoring_card,
          {
            cardarea = G.play,
            full_hand = context.full_hand,
            scoring_hand = context.scoring_hand,
            scoring_name = context.scoring_name,
            poker_hands = context.poker_hands,
            abn_retriggered = true,
          })
      end
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}

SMODS.Seal {
  key = "skyblue",
  badge_colour = HEX("86b8de"),
  atlas = "AbandoniaSeals",
  pos = { x = 2, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
      }
    }
  end,

  config = { extra = {} },

  calculate = function(self, card, context)
  end,

  abn_artist_credits = {
    artist = "Vega",
  },
}
local oldsmodsscorecard = SMODS.score_card
function SMODS.score_card(card, context)
  local conditions = false
  if G.hand and G.hand.cards then
    for _, playing in ipairs(G.hand.cards) do
      if playing.seal and playing.seal == "abn_skyblue" then
        conditions = true
        break
      end
    end
  end

  if not G.scorehand and conditions and context.cardarea == G.hand then
    G.scorehand = true
    context.cardarea = G.play

    if card.seal and card.seal == "abn_skyblue" then
      SMODS.score_card(card, context)
    end

    context.cardarea = G.hand
    G.scorehand = nil
  end
  return oldsmodsscorecard(card, context)
end

SMODS.Seal {
  key = "brine",
  badge_colour = HEX("2660de"),
  atlas = "AbandoniaSeals",
  pos = { x = 1, y = 3 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        self.config.extra.chips,
        self.config.extra.chips_gain
      }
    }
  end,

  config = {
    extra = {
      chips = 0,
      chips_gain = 10
    }
  },

  calculate = function(self, card, context)
    if context.discard and context.other_card == card then
      SMODS.scale_card(card, {
        ref_table = self.config.extra,
        ref_value = "chips",
        scalar_value = "chips_gain",
        message_colour = G.C.CHIPS,
      })
    end
    if context.main_scoring and context.cardarea == G.play then
      return { chips = self.config.extra.chips }
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}

SMODS.Seal {
  key = "oxidized",
  badge_colour = HEX("c75323"),
  atlas = "AbandoniaSeals",
  pos = { x = 4, y = 1 },

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
    if context.remove_playing_cards then
      for _, pcard in ipairs(context.removed) do
        if pcard == card and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
          G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
          G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = function()
              local nightshift = ABN.get_random_nightshift()
              SMODS.add_card({ key = nightshift })
              G.GAME.consumeable_buffer = 0
              return true
            end
          }))
          return { message = localize('k_abn_plus_nightshift'), colour = HEX("1a6a5f") }
        end
      end
    end
  end,
  draw = function(self, card, layer)
    if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
      G.shared_seals[card.seal].role.draw_major = card
      G.shared_seals[card.seal]:draw_shader('dissolve', nil, nil, nil, card.children.center)
      G.shared_seals[card.seal]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}

SMODS.Seal {
  key = "brass",
  badge_colour = HEX("a07f1f"),
  atlas = "AbandoniaSeals",
  pos = { x = 5, y = 1 },

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
    if context.cardarea == G.play and context.repetition then
      if context.abn_retriggered then
        return
      end
      local pos = ABN.get_pos(card, context.scoring_hand)
      local scoring_card = context.scoring_hand[pos + 1]
      if scoring_card and scoring_card ~= card then
        card_eval_status_text(card, 'extra', nil, nil, nil, {
          message = localize('k_again_ex'),
          colour = G.C.FILTER,
        })
        SMODS.score_card(scoring_card,
          {
            cardarea = G.play,
            full_hand = context.full_hand,
            scoring_hand = context.scoring_hand,
            scoring_name = context.scoring_name,
            poker_hands = context.poker_hands,
            abn_retriggered = true,
          })
      end
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}

SMODS.Seal {
  key = "silver",
  badge_colour = HEX("bec7d4"),
  atlas = "AbandoniaSeals",
  pos = { x = 2, y = 0 },

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
          SMODS.add_card({ set = 'weather_report' })
          G.GAME.consumeable_buffer = 0
          return true
        end
      }))
      return { message = localize('k_abn_plus_weather'), colour = HEX("79b5c2") }
    end
  end,
  draw = function(self, card, layer)
    if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
      G.shared_seals[card.seal].role.draw_major = card
      G.shared_seals[card.seal]:draw_shader('dissolve', nil, nil, nil, card.children.center)
      G.shared_seals[card.seal]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}

SMODS.Seal {
  key = "copper",
  badge_colour = HEX("d97c42"),
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
    if context.discard and context.other_card == card and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = function()
          SMODS.add_card({ set = 'program_pack' })
          G.GAME.consumeable_buffer = 0
          return true
        end
      }))
      return { message = localize('k_abn_plus_program'), colour = HEX("5d6a58") }
    end
  end,
  draw = function(self, card, layer)
    if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
      G.shared_seals[card.seal].role.draw_major = card
      G.shared_seals[card.seal]:draw_shader('dissolve', nil, nil, nil, card.children.center)
      G.shared_seals[card.seal]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}

SMODS.Seal {
  key = "linguistic",
  badge_colour = HEX("eded49"),
  atlas = "AbandoniaSeals",
  pos = { x = 3, y = 3 },

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
          SMODS.add_card({ set = 'lexica' })
          G.GAME.consumeable_buffer = 0
          return true
        end
      }))
      return { message = localize('k_abn_plus_lexica'), colour = HEX("5d6a58") }
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}

SMODS.Seal {
  key = "rubicund",
  badge_colour = HEX("cd3440"),
  atlas = "AbandoniaSeals",
  pos = { x = 0, y = 3 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        self.config.extra.mult,
        self.config.extra.mult_gain
      }
    }
  end,

  config = {
    extra = {
      mult = 0,
      mult_gain = 4
    }
  },

  calculate = function(self, card, context)
    if context.discard and context.other_card == card then
      SMODS.scale_card(card, {
        ref_table = self.config.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        message_colour = G.C.MULT,
      })
    end
    if context.main_scoring and context.cardarea == G.play then
      return { mult = self.config.extra.mult }
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}
SMODS.Seal {
  key = "duality",
  badge_colour = HEX("a56be6"),
  atlas = "AbandoniaSeals",
  pos = { x = 6, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        self.config.extra.chips,
        self.config.extra.mult
      }
    }
  end,

  config = {
    extra = {
      chips = 2,
      mult = 1,
    }
  },

  calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play then
      local count = 0
      for _, v in ipairs(G.hand.cards) do
        if v.seal and v.seal == "abn_duality" then
          count = count + 1
        end
      end
      if count > 0 then
        card.ability.perma_bonus = (card.ability.perma_bonus or 0) + (self.config.extra.chips * count)
        card.ability.perma_mult = (card.ability.perma_mult or 0) + (self.config.extra.mult * count)
        SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = HEX("a56be6") }, card)
      end
    end
  end,
  abn_artist_credits = {
    artist = "Scientist"
  },
}

SMODS.Seal {
  key = "lime",
  badge_colour = HEX("68de24"),
  atlas = "AbandoniaSeals",
  pos = { x = 3, y = 1 },

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
          SMODS.add_card({ set = 'calligraphy' })
          G.GAME.consumeable_buffer = 0
          return true
        end
      }))
      return { message = localize('k_abn_plus_calligraphy'), colour = G.C.SECONDARY_SET.calligraphy }
    end
  end,
  abn_artist_credits = {
    artist = "C. Formula",
  },
}

if next(SMODS.find_mod("Spectrallib")) then
  SMODS.Seal {
    key = "rainbow",
    badge_colour = G.C.DARK_EDITION,
    atlas = "AbandoniaSeals",
    pos = { x = 3, y = 2 },

    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          self.config.extra.asc_power
        }
      }
    end,

    config = {
      extra = {
        asc_power = 0.25
      }
    },

    calculate = function(self, card, context)
      if context.main_scoring and context.cardarea == G.play then
        return {
          plus_asc = self.config.extra.asc_power
        }
      end
    end,
    abn_artist_credits = {
      artist = "Fairy One"
    },
  }
end

SMODS.Seal {
  key = "mirage",
  badge_colour = HEX("8e408f"),
  atlas = "AbandoniaSeals",
  pos = { x = 2, y = 3 },

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
          SMODS.add_card({ set = "illusion" })
          G.GAME.consumeable_buffer = 0
          return true
        end
      }))
      return { message = localize('k_abn_plus_illusion'), colour = G.C.SECONDARY_SET.illusion }
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}

SMODS.Seal {
  key = "inverse",
  badge_colour = HEX("de3030"),
  atlas = "AbandoniaSeals",
  pos = { x = 5, y = 3 },

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
    if context.main_scoring and context.cardarea == G.play then
      local chips = card:get_chip_bonus()
      return { mult = chips }
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}
