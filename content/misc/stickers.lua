SMODS.Sticker {
  key = 'pump_up',
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 0 },
  badge_colour = HEX("fda0a5"),
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].mult,
      }
    }
  end,
  config = {
    mult = 10
  },
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      SMODS.calculate_effect({ mult = card.ability[self.key].mult }, card)
    end
  end,

}

--#region Immortal
SMODS.Sticker {
  key = 'immortal',
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 0 },
  badge_colour = HEX("daa54e"),
  sets = { Joker = true },
  calculate = function(self, card, context)
    if context.check_eternal and context.other_card == card then
      return {
        no_destroy = true
      }
    end
  end
}

local set_debuff_ref = Card.set_debuff
function Card:set_debuff(should_debuff)
  set_debuff_ref(self, should_debuff)

  if self.ability.abn_immortal then
    self.debuff = false
    self.perma_debuff = false
  end
end

local can_sell_ref = Card.can_sell_card
function Card:can_sell_card(context)
  local result = can_sell_ref(self, context)
  if self.ability.abn_immortal then
    return true
  end
  return result
end

--#endregion

SMODS.Sticker {
  key = 'bullseye',
  atlas = "AbandoniaStickers",
  pos = { x = 3, y = 0 },
  badge_colour = HEX("3cb4ff"),
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].chips,
      }
    }
  end,
  config = {
    chips = 100
  },
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      SMODS.calculate_effect({ chips = card.ability[self.key].chips }, card)
    end
  end,
}

SMODS.Sticker {
  key = 'shovel',
  atlas = "AbandoniaStickers",
  pos = { x = 4, y = 1 },
  badge_colour = HEX("a6a6a6"),
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].x_chips,
      }
    }
  end,
  config = {
    x_chips = 2
  },
  calculate = function(self, card, context)
    if (context.pre_joker or (context.main_scoring and context.cardarea == G.play)) and G.GAME.current_round.hands_played == 0 then
      SMODS.calculate_effect({ x_chips = card.ability[self.key].x_chips }, card)
    end
  end,
}

SMODS.Sticker {
  key = 'downgrade',
  atlas = "AbandoniaStickers",
  pos = { x = 5, y = 4 },
  badge_colour = HEX("b73d2f"),
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].mult,
      }
    }
  end,
  config = {
    mult = -5
  },
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      SMODS.calculate_effect({ mult = card.ability[self.key].mult }, card)
    end
  end,
}

SMODS.Sticker {
  key = 'violet',
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 4 },
  badge_colour = HEX("8a71e1"),
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].percent * 100,
      }
    }
  end,
  config = {
    percent = 0.1
  },
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = function()
          G.GAME.blind.chips = math.floor(G.GAME.blind.chips + G.GAME.blind.chips * card.ability[self.key].percent)
          G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
          return true
        end
      }))
      SMODS.calculate_effect({ message = localize("k_abn_increased") }, card)
    end
  end,
}

SMODS.Sticker {
  key = "weight",
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 2 },
  badge_colour = HEX("676388"),
  sets = { Joker = true },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].x_chips,
      }
    }
  end,
  config = {
    x_chips = 2
  },
  apply = function(self, card, val)
    card.ability[self.key] = val
    if val and self.config and next(self.config) then
      card.ability[self.key] = {}
      for k, v in pairs(self.config) do
        if type(v) == 'table' then
          card.ability[self.key][k] = copy_table(v)
        else
          card.ability[self.key][k] = v
          if k == 'card_limit' or k == 'extra_slots_used' then
            card.ability[k] = (card.ability[k] or 0) + v
          end
        end
      end
    end
    card.states.drag.can = not val
  end,
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      SMODS.calculate_effect({ x_chips = card.ability[self.key].x_chips }, card)
    end
  end
}

--region Crown: Card cannot change editions
SMODS.Sticker {
  key = "crown",
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 0 },
  badge_colour = HEX("fdcf51"),
  config = {},
}
local set_edition_ref = Card.set_edition
function Card:set_edition(edition, immediate, silent)
  if self.ability.abn_crown then
    return
  end
  return set_edition_ref(self, edition, immediate, silent)
end

--#endregion

SMODS.Sticker {
  key = "flip",
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 5 },
  badge_colour = HEX("1f4a8f"),

  config = {},
  calculate = function(self, card, context)
    if context.after then
      card:flip()
    end
  end
}

SMODS.Sticker {
  key = "fragile",
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 6 },
  badge_colour = HEX("e6d5c3"),
  sets = { Default = true },

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, card.ability[self.key].base,
      card.ability[self.key].odds, 'abn_fragile')
    return {
      vars = {
        numerator,
        denominator
      }
    }
  end,
  config = {
    base = 1,
    odds = 4
  },
  calculate = function(self, card, context)
    if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and
        SMODS.pseudorandom_probability(card, 'abn_fragile', card.ability[self.key].base, card.ability[self.key].odds) then
      card.glass_trigger = true
      return { remove = true }
    end
  end
}
SMODS.Sticker {
  key = "abn_possibility",
  atlas = "AbandoniaStickers",
  pos = { x = 3, y = 4 },
  badge_colour = HEX("469c79"),
  config = {},
  calculate = function(self, card, context)
    if context.press_play and G.GAME.current_round.hands_played == 0 then
      G.GAME.abn_possibility_sticker = true
      SMODS.calculate_effect({ message = "Active!", colour = G.C.GREEN }, card)
    end
  end
}

SMODS.Sticker({
  key = "question_mark",
  atlas = "AbandoniaStickers",
  pos = { x = 4, y = 3 },
  badge_colour = HEX("e5e4e2"),
  config = {},

  calculate = function(self, card, context)
    if context.before then
      local target = pseudorandom_element(context.scoring_hand, "abn_question_mark")
      target:set_ability("m_stone", true)
      return { message = localize('k_stone'), colour = G.C.FILTER }
    end
  end
})

SMODS.Sticker({
  key = "square",
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 4 },
  badge_colour = HEX("95d5f5"),
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].x_chips,
      }
    }
  end,
  config = {
    x_chips = 4
  },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.scoring_hand[1] == context.other_card then
        return {
          x_chips = card.ability[self.key].x_chips,
        }
      end
    end
  end
})

SMODS.Sticker({
  key = "lightning_bolt",
  atlas = "AbandoniaStickers",
  pos = { x = 4, y = 0 },
  badge_colour = HEX("83e9f8"),
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].repetitions,
      }
    }
  end,
  config = {
    repetitions = 1
  },

  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      if context.scoring_hand[1] == context.other_card and ABN.is_number(context.other_card) then
        return {
          repetitions = card.ability[self.key].repetitions,
        }
      end
    end
  end
})

SMODS.Sticker({
  key = "top_hat",
  atlas = "AbandoniaStickers",
  pos = { x = 5, y = 0 },
  badge_colour = HEX("5e7977"),
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].repetitions,
      }
    }
  end,
  config = {
    repetitions = 1
  },

  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      if context.scoring_hand[1] == context.other_card and context.other_card.ability.set == "Enhanced" then
        return {
          repetitions = card.ability[self.key].repetitions,
        }
      end
    end
  end
})

SMODS.Sticker({
  key = "cat_eye",
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 1 },
  badge_colour = HEX("74cca8"),
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].repetitions,
      }
    }
  end,
  config = {
    repetitions = 1
  },

  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      if context.scoring_hand[1] == context.other_card and context.other_card:get_id() == 14 then
        return {
          repetitions = card.ability[self.key].repetitions,
        }
      end
    end
  end
})

SMODS.Sticker({
  key = "negative_plus",
  atlas = "AbandoniaStickers",
  pos = { x = 3, y = 3 },
  badge_colour = HEX("454e4d"),
  config = {},

  calculate = function(self, card, context)
    if context.after and G.GAME.current_round.hands_left == 0 then
      local target = pseudorandom_element(context.scoring_hand, "abn_negative_plus")
      target:set_edition("e_negative", true)
      return { message = localize('k_negative'), colour = G.C.DARK_EDITION }
    end
  end
})

SMODS.Sticker({
  key = "eraser",
  atlas = "AbandoniaStickers",
  pos = { x = 5, y = 3 },
  badge_colour = HEX("ffffff"),
  config = {},

  calculate = function(self, card, context)
    if context.before then
      local left = context.scoring_hand[1]
      if left and left.ability.set == "Enhanced" then
        left:set_ability('c_base', true)
        return { message = localize('k_cleared'), colour = G.C.WHITE }
      end
    end
  end
})

SMODS.Sticker {
  key = "lucky",
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 4 },
  badge_colour = HEX("75ce84"),

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, card.ability[self.key].base,
      card.ability[self.key].odds, 'abn_lucky')
    return {
      vars = {
        numerator,
        denominator,
        card.ability[self.key].dollars,
      }
    }
  end,
  config = {
    base = 1,
    odds = 6,
    dollars = 10
  },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and
        SMODS.pseudorandom_probability(card, 'abn_fragile', card.ability[self.key].base, card.ability[self.key].odds) then
      return {
        dollars = card.ability[self.key].dollars
      }
    end
  end
}
