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
  config = { chips = 5, mult = 5, multiplier = 2 },
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
  key = 'pearlenscene',
  path = 'pearlenscene.fs',
}
SMODS.Edition {
  key = 'abn_pearlenscene',
  shader = "pearlenscene",
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
