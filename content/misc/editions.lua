SMODS.Shader {
  key = 'chthonian',
  path = 'chthonian.fs',
}

-- Check utilities/value_manipulation.lua (If anyone finds a better implementation, feel free to change it)
SMODS.Edition {
  key = 'abn_chthonian',
  shader = "chthonian",
  discovered = true,
  config = { percent = 1.05 },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.edition.percent } }
  end,
  calculate = function(self, card, context)
  end,
  on_apply = function(card)
    ABN.mod_card_values(card, { multiplier = 2 })
    G.GAME.abn.cthonian = true
  end,
  on_remove = function(card)
    ABN.mod_card_values(card, { multiplier = 0.5 })
  end,
  abn_artist_credits = {
    artist = "Bro-Fly"
  },
}

SMODS.Shader {
  key = 'iridescent',
  path = 'iridescent.fs',
}

SMODS.Edition {
  key = 'abn_iridescent',
  shader = "iridescent",
  discovered = true,
  config = { x_mult = 2, dollars = 3, },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.edition.x_mult, card.edition.dollars } }
  end,
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      return {
        x_mult = card.edition.x_mult,
        dollars = card.edition.dollars
      }
    end
  end,
  on_apply = function(card)
  end,
  abn_artist_credits = {
    artist = "Bro-Fly"
  },
}

SMODS.Shader {
  key = 'abandond',
  path = 'abandond.fs',
}
SMODS.Edition {
  key = 'abn_abandond',
  shader = "abandond",
  discovered = true,
  config = { repetitions = 1, dollars = 3 },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.edition.repetitions, card.edition.dollars } }
  end,
  calculate = function(self, card, context)
    if ((context.repetition and context.cardarea == G.play) or context.retrigger_joker_check) and context.other_card == card then
      ease_dollars(-card.edition.dollars)
      return {
        repetitions = card.edition.repetitions
      }
    end
  end,
  abn_artist_credits = {
    artist = "Bro-Fly"
  },
}

SMODS.Shader {
  key = 'sunscourge',
  path = 'sunscourge.fs',
}
SMODS.Edition {
  key = 'abn_sunscourge',
  shader = "sunscourge",
  discovered = true,
  config = { chips = 2, mult = 2, multiplier = 2 },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.edition.chips, card.edition.mult } }
  end,
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      return {
        chips = card.edition.chips,
        mult = card.edition.mult
      }
    end
    if context.after and context.main_eval and not context.blueprint and SMODS.last_hand_oneshot then
      SMODS.scale_card(card, {
        ref_table = card.edition,
        ref_value = "chips",
        scalar_value = "multiplier",
        operation = 'X',
        no_message = true
      })
      SMODS.scale_card(card, {
        ref_table = card.edition,
        ref_value = "mult",
        scalar_value = "multiplier",
        operation = 'X',
        scaling_message = {
          message = localize("k_abn_oneshot"),
          colour = G.C.FILTER
        }
      })
    end
  end,
  abn_artist_credits = {
    artist = "Bro-Fly"
  },
}

SMODS.Shader {
  key = 'gloss',
  path = 'gloss.fs',
}
SMODS.Edition {
  key = 'abn_gloss',
  shader = "gloss",
  discovered = true,
  config = { x_chips = 2, dollars = 5, },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.edition.x_chips, card.edition.dollars } }
  end,
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      return {
        x_chips = card.edition.x_chips,
        dollars = card.edition.dollars
      }
    end
  end,
  abn_artist_credits = {
    artist = "Bro-Fly"
  },
}

SMODS.Shader {
  key = 'pearlescent',
  path = 'pearlescent.fs',
}
SMODS.Edition {
  key = 'abn_pearlescent',
  shader = "pearlescent",
  discovered = true,
  config = { chips = 100, mult = 20, },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.edition.mult, card.edition.chips } }
  end,
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      return {
        chips = card.edition.chips,
        mult = card.edition.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Bro-Fly"
  },
}

-- new editions
SMODS.Shader {
  key = 'chromatic',
  path = 'chromatic.fs',
}
SMODS.Edition {
  key = 'abn_chromatic',
  shader = "chromatic",
  discovered = true,
  config = { x_mult = 1.3, dollars = 4, x_chips = 1.5 },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.edition.x_chips, card.edition.x_mult, card.edition.dollars } }
  end,
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      return {
        x_chips = card.edition.x_chips,
        x_mult = card.edition.x_mult,
        dollars = card.edition.dollars
      }
    end
  end,
  abn_artist_credits = {
    artist = "Bro-Fly"
  },
}

SMODS.Shader {
  key = 'flash',
  path = 'flash.fs',
}
SMODS.Edition {
  key = 'abn_reversal',
  shader = "flash",
  discovered = true,
  config = {},
  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      return {
        message = localize('k_swapped_ex'),
        swap = true
      }
    end
  end,
  abn_artist_credits = {
    artist = "Bro-Fly"
  },
}

SMODS.Shader {
  key = 'exs',
  path = 'exs.fs',
}
SMODS.Edition {
  key = 'abn_bit_rot',
  shader = "exs",
  discovered = true,
  config = { emult = 1.3 },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.edition.emult } }
  end,
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      return {
        emult = card.edition.emult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Bro-Fly"
  },
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,
}

SMODS.Shader {
  key = 'cam',
  path = 'cam.fs',
}
SMODS.Edition {
  key = 'abn_reel',
  shader = "cam",
  discovered = true,
  config = { echips = 1.2 },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.edition.echips } }
  end,
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      return {
        echips = card.edition.echips
      }
    end
  end,
  abn_artist_credits = {
    artist = "Bro-Fly"
  },
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,
}

SMODS.Shader {
  key = 'orange',
  path = 'orange.fs',
}
SMODS.Edition {
  key = 'abn_collodion',
  shader = "orange",
  discovered = true,
  config = { percent = 20 },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.edition.percent } }
  end,
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      return {
        abn_balance_percent = card.ability.extra.percent
      }
    end
  end,
  abn_artist_credits = {
    artist = "Bro-Fly"
  },
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,
}

SMODS.Shader {
  key = 'plata',
  path = 'plata.fs',
}
SMODS.Edition {
  key = 'abn_vintage',
  shader = "plata",
  discovered = true,
  config = { chips = 2, mult = 1, dollars = 1 },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.edition.chips, card.edition.mult, card.edition.dollars } }
  end,
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      local level = ABN.count_planet_ranks_played(context.scoring_hand)
      return {
        chips = card.edition.chips * level,
        mult = card.edition.mult * level,
        dollars = card.edition.dollars * level
      }
    end
  end,
  abn_artist_credits = {
    artist = "Bro-Fly"
  },
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,
}


SMODS.Shader {
  key = 'white',
  path = 'white.fs',
}
SMODS.Edition {
  key = 'abn_bright',
  shader = "white",
  discovered = true,
  config = { chips = 20, mult = 8 },

  loc_vars = function(self, info_queue, card)
    if card and card.edition then
      return { vars = { card.edition.chips, card.edition.mult } }
    end
    return { vars = { self.config.chips, self.config.mult } }
  end,

  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      local scaling_factor = 0

      for i = 1, #context.scoring_hand do
        local scoring_card = context.scoring_hand[i]

        if ABN.is_light(scoring_card) then
          local rank_key = scoring_card.base.value
          local rank_data = G.GAME.abn_rank_upgrades[rank_key]

          if rank_data and rank_data.level and rank_data.level > 1 then
            scaling_factor = scaling_factor + rank_data.level
          end
        end
      end

      if scaling_factor > 0 then
        return {
          chips = (card.edition.chips or self.config.chips) * scaling_factor,
          mult = (card.edition.mult or self.config.mult) * scaling_factor,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Bro-Fly"
  },
}

SMODS.Shader {
  key = 'balablack',
  path = 'balablack.fs',
}
SMODS.Edition {
  key = 'abn_dark',
  shader = "balablack",
  discovered = true,
  config = { chips = 20, mult = 8 },

  loc_vars = function(self, info_queue, card)
    if card and card.edition then
      return { vars = { card.edition.chips, card.edition.mult } }
    end
    return { vars = { self.config.chips, self.config.mult } }
  end,

  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      local scaling_factor = 0

      for i = 1, #context.scoring_hand do
        local scoring_card = context.scoring_hand[i]

        if ABN.is_dark(scoring_card) then
          local rank_key = scoring_card.base.value
          local rank_data = G.GAME.abn_rank_upgrades[rank_key]

          if rank_data and rank_data.level and rank_data.level > 1 then
            scaling_factor = scaling_factor + rank_data.level
          end
        end
      end

      if scaling_factor > 0 then
        return {
          chips = (card.edition.chips or self.config.chips) * scaling_factor,
          mult = (card.edition.mult or self.config.mult) * scaling_factor,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Bro-Fly"
  },
}
