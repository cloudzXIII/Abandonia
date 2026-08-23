SMODS.Sticker {
  key = 'pump_up',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 5 },
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
  pos = { x = 0, y = 0 },
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
  
  if self.config.abn_immortal then
    self.debuff = false
    self.perma_debuff = false
  end
end

local can_sell_ref = Card.can_sell_card
function Card:can_sell_card(context)
  local result = can_sell_ref(self, context)
  if self.config.abn_immortal then
    return true
  end
  return result
end

--#endregion

SMODS.Sticker {
  key = 'bullseye',
  atlas = "AbandoniaStickers",
  pos = { x = 4, y = 5 },
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
  pos = { x = 1, y = 6 },
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
  pos = { x = 4, y = 1 },
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
  key = 'vessel',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 1 },
  badge_colour = HEX("8a71e1"),
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
  pos = { x = 1, y = 4 },
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
  pos = { x = 2, y = 5 },
  badge_colour = HEX("fdcf51"),
  config = {},
}
local set_edition_ref = Card.set_edition
function Card:set_edition(edition, immediate, silent)
  if self.config.abn_crown then
    return
  end
  return set_edition_ref(self, edition, immediate, silent)
end

--#endregion

SMODS.Sticker {
  key = "flip",
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 2 },
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
  pos = { x = 3, y = 3 },
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
    if (context.pre_joker or (context.main_scoring and context.cardarea == G.play)) and SMODS.pseudorandom_probability(card, 'abn_fragile', card.ability[self.key].base, card.ability[self.key].odds) then
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = function()
          card:shatter()
          SMODS.calculate_context({ joker_type_destroyed = true, card = card, shatters = true })
          return true
        end
      }))
    end
  end
}
SMODS.Sticker {
  key = "abn_possibility",
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 1 },
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
  pos = { x = 2, y = 0 },
  badge_colour = HEX("e5e4e2"),
  config = {},
  
  calculate = function(self, card, context)
    if context.before then
      for i = 1, #context.scoring_hand do
        context.scoring_hand[i]:change_suit('abn_suitless')
      end
    end
  end
})

SMODS.Sticker({
  key = "square",
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 1 },
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
  pos = { x = 0, y = 7 },
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
      local first_number = nil
      for i = 1, #context.scoring_hand do
        if ABN.is_number(context.scoring_hand[i]) then
          first_number = context.scoring_hand[i]
          break
        end
      end
      
      if context.other_card == first_number then
        return {
          message = localize('k_again_ex'),
          repetitions = card.ability[self.key].repetitions,
          card = card
        }
      end
    end
  end
})

SMODS.Sticker({
  key = "top_hat",
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 7 },
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
      local first_enhanced = nil
      for i = 1, #context.scoring_hand do
        if context.scoring_hand[i].ability.set == "Enhanced" then
          first_enhanced = context.scoring_hand[i]
          break
        end
      end
      
      if context.other_card == first_enhanced then
        return {
          message = localize('k_again_ex'),
          repetitions = card.ability[self.key].repetitions,
          card = card
        }
      end
    end
  end
})

SMODS.Sticker({
  key = "cat_eye",
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 7 },
  badge_colour = HEX("74cca8"),
  loc_vars = function(self, info_queue, card)
  end,
  config = {
    repetitions = 1
  },
  
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      -- Find the first Ace in the scoring hand
      local first_ace = nil
      for i = 1, #context.scoring_hand do
        if context.scoring_hand[i]:get_id() == 14 then
          first_ace = context.scoring_hand[i]
          break
        end
      end
      
      -- If the current card being evaluated is that specific first Ace
      if context.other_card == first_ace then
        return {
          message = localize('k_again_ex'),
          repetitions = card.ability[self.key].repetitions,
          card = card
        }
      end
    end
  end
})

SMODS.Sticker({
  key = "negative_plus",
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 0 },
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
  pos = { x = 3, y = 0 },
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
  pos = { x = 4, y = 0 },
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
        mult = card.ability[self.key].dollars
      }
    end
  end
}

SMODS.Sticker {
  key = 'glove_hand',
  atlas = "AbandoniaStickers",
  pos = { x = 4, y = 6 },
  badge_colour = HEX("fd5f55"),
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].discards,
      }
    }
  end,
  config = {
    discards = 1
  },
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      ease_discard(card.ability[self.key].discards)
    end
  end,
}

SMODS.Sticker {
  key = 'spicy',
  atlas = "AbandoniaStickers",
  pos = { x = 3, y = 5 },
  badge_colour = HEX("eb6b43"),
  
  calculate = function(self, card, context)
    -- Trigger at the end of scoring if the round is won
    if context.final_scoring_step then
      local current_score = SMODS.calculate_round_score()
      local target_score = G.GAME.blind.chips
      
      if current_score > target_score then
        -- Define the specific keys we are allowed to double
        local valid_keys = {
          chips = true,
          mult = true,
        }
        
        local doubled = false
        
        
        if type(card.ability.extra) == "table" then
          for k, v in pairs(card.ability.extra) do
            if valid_keys[k] and type(v) == "number" then
              card.ability.extra[k] = v * 2
              doubled = true
            end
          end
        elseif type(card.ability.extra) == "number" then
          
        end
        
        for k, v in pairs(card.ability) do
          if valid_keys[k] and type(v) == "number" then
            card.ability[k] = v * 2
            doubled = true
          end
        end
        
        if doubled then
          return {
            message = 'Spicy!',
            colour = HEX("eb6b43"),
            card = card
          }
        end
      end
    end
  end,
}

SMODS.Sticker {
  key = 'x',
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 3 },
  badge_colour = HEX("f2994b"),
  config = { xmult = 5 },
  loc_vars = function(self, info_queue, card)
    return { vars = { (card.ability[self.key] and card.ability[self.key].xmult) or self.config.xmult } }
  end,
  
  calculate = function(self, card, context)
    -- If we found debuffed cards, return the XMult
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      for i, scoring_card in ipairs(context.scoring_hand) do
        if scoring_card.debuff then
          SMODS.calculate_effect({ xmult = card.ability[self.key].xmult }, card)
        end
      end
    end
  end,
}



SMODS.Sticker {
  key = 'spade',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 2 },
  badge_colour = HEX("3c4368"),
  
  calculate = function(self, card, context)
    for _, _card in ipairs(G.playing_cards or {}) do
      if not _card:is_suit("Spades") then
        _card:set_debuff(true)
      end
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit("Spades") then
        return {
          chips = context.other_card.base.nominal * 2
        }
      end
    end
  end,
}

SMODS.Sticker {
  key = 'heart',
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 2 },
  badge_colour = HEX("f03464"),
  
  calculate = function(self, card, context)
    for _, _card in ipairs(G.playing_cards or {}) do
      if not _card:is_suit("Hearts") then
        _card:set_debuff(true)
      end
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit("Hearts") then
        return {
          chips = context.other_card.base.nominal * 2
        }
      end
    end
  end,
}

SMODS.Sticker {
  key = 'club',
  atlas = "AbandoniaStickers",
  pos = { x = 3, y = 2 },
  badge_colour = HEX("235955"),
  
  calculate = function(self, card, context)
    for _, _card in ipairs(G.playing_cards or {}) do
      if not _card:is_suit("Clubs") then
        _card:set_debuff(true)
      end
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit("Clubs") then
        return {
          chips = context.other_card.base.nominal * 2
        }
      end
    end
  end,
}

SMODS.Sticker {
  key = 'diamond',
  atlas = "AbandoniaStickers",
  pos = { x = 4, y = 2 },
  badge_colour = HEX("f06b3f"),
  
  calculate = function(self, card, context)
    for _, _card in ipairs(G.playing_cards or {}) do
      if not _card:is_suit("Diamonds") then
        _card:set_debuff(true)
      end
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit("Diamonds") then
        return {
          chips = context.other_card.base.nominal * 2
        }
      end
    end
  end,
}


SMODS.Sticker {
  key = 'daytime',
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 3 },
  badge_colour = HEX("eba61c"),
  
  calculate = function(self, card, context)
    for _, _card in ipairs(G.playing_cards or {}) do
      if ABN.is_dark(_card) then
        _card:set_debuff(true)
      end
    end
    if context.individual and context.cardarea == G.play then
      if ABN.is_light(context.other_card) then
        return {
          chips = context.other_card.base.nominal * 2
        }
      end
    end
  end,
}

SMODS.Sticker {
  key = 'nighttime',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 3 },
  badge_colour = HEX("435b8c"),
  
  calculate = function(self, card, context)
    for _, _card in ipairs(G.playing_cards or {}) do
      if ABN.is_light(_card) then
        _card:set_debuff(true)
      end
    end
    if context.individual and context.cardarea == G.play then
      if ABN.is_dark(context.other_card) then
        return {
          chips = context.other_card.base.nominal * 2
        }
      end
    end
  end,
}

SMODS.Sticker {
  key = 'even_legacy',
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 8 },
  badge_colour = HEX("fd5f55"),
  
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if ABN.is_even(context.other_card) then
        return {
          chips = context.other_card.base.nominal * 3
        }
      elseif ABN.is_odd(context.other_card) then
        return {
          chips = 1
        }
      end
    end
  end,
}

SMODS.Sticker {
  key = 'odd_legacy',
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 12 },
  badge_colour = HEX("009cfd"),
  
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if ABN.is_odd(context.other_card) then
        return {
          chips = context.other_card.base.nominal * 3
        }
      elseif ABN.is_even(context.other_card) then
        return {
          chips = 1
        }
      end
    end
  end,
}

SMODS.Sticker {
  key = 'jimbo_legacy',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 12 },
  badge_colour = HEX("009cfd"),
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].chips,
      }
    }
  end,
  config = {
    chips = 50
  },
  
  calculate = function(self, card, context)
    if context.joker_main then
      local triggered = false
      for _, v in ipairs(G.jokers.cards) do
        if v:is_rarity("Common") then
          triggered = true
          SMODS.calculate_effect(
          { chips = self.config.chips, juice_card = v, message_card = v },
          card
        )
        break
      end
    end
    if triggered then return nil, true end
  end
end,
}

SMODS.Sticker {
  key = 'rejok_legacy',
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 12 },
  badge_colour = HEX("fda200"),
  
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
    if context.joker_main then
      local triggered = false
      for _, v in ipairs(G.jokers.cards) do
        if v:is_rarity("Uncommon") then
          triggered = true
          SMODS.calculate_effect(
          { chips = self.config.chips, juice_card = v, message_card = v },
          card
        )
        break
      end
    end
    if triggered then return nil, true end
  end
end,
}

SMODS.Sticker {
  key = 'obmij_legacy',
  atlas = "AbandoniaStickers",
  pos = { x = 3, y = 12 },
  badge_colour = HEX("fd5f55"),
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].mult,
      }
    }
  end,
  config = {
    mult = 20
  },
  
  calculate = function(self, card, context)
    if context.joker_main then
      local triggered = false
      for _, v in ipairs(G.jokers.cards) do
        if v:is_rarity("Rare") then
          triggered = true
          SMODS.calculate_effect(
          { mult = self.config.mult, juice_card = v, message_card = v },
          card
        )
        break
      end
    end
    if triggered then return nil, true end
  end
end,
}

SMODS.Sticker {
  key = 'jester_legacy',
  atlas = "AbandoniaStickers",
  pos = { x = 4, y = 12 },
  badge_colour = HEX("009cfd"),
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].mult,
      }
    }
  end,
  config = {
    mult = 40
  },
  
  calculate = function(self, card, context)
    if context.joker_main then
      local triggered = false
      for _, v in ipairs(G.jokers.cards) do
        if v:is_rarity("abn_SuperRare") then
          triggered = true
          SMODS.calculate_effect(
          { mult = self.config.mult, juice_card = v, message_card = v },
          card
        )
        break
      end
    end
    if triggered then return nil, true end
  end
end,
}

SMODS.Sticker {
  key = 'currency',
  atlas = "AbandoniaStickers",
  pos = { x = 3, y = 6 },
  badge_colour = HEX("86c06b"),
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].dollars,
      }
    }
  end,
  config = {
    dollars = 1
  },
  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      SMODS.calculate_effect({ dollars = card.ability[self.key].dollars }, card)
    end
  end,
}

SMODS.Sticker {
  key = 'chain',
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 6 },
  badge_colour = HEX("537df2"),
  loc_vars = function(self, info_queue, card)
  end,
  config = {
  },
  calculate = function(self, card, context)
    if context.pre_discard then
      local hand_count = #G.hand.cards
      for i = 1, hand_count do
        draw_card(G.hand, G.discard, i * 100 / hand_count, 'down', nil, nil, 0.07)
      end
    end
  end,
}

SMODS.Sticker {
  key = 'aim',
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 8 },
  badge_colour = HEX("ee7270"),
  loc_vars = function(self, info_queue, card)
  end,
  config = {
  },
  
  set_ability = function(self, card)
    if card.config.center.set == 'Joker' then
      card.states.drag.can = false
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.7,
        func = function()
          local in_use = {}
          for _, joker in pairs(G.jokers.cards) do
            if joker.ability and joker.ability.extra.aim then
              in_use[joker.ability.extra.aim] = true
            end
          end
          if #G.jokers.cards == 1 then in_use[1] = false end
          local position = pseudorandom(pseudoseed('aim_joker'), 1, #G.jokers.cards)
          while in_use[position] do
            position = pseudorandom(pseudoseed('aim_joker_reroll'), 1, #G.jokers.cards)
          end
          card.ability.extra.aim = position
          return true
        end
      }))
    end
  end,
  calculate = function(self, card, context)
    if context.after and card.config.center.set == 'Joker' then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.7,
        func = function()
          local in_use = {}
          for _, joker in pairs(G.jokers.cards) do
            if joker.ability and joker.ability.extra.aim then
              in_use[joker.ability.extra.aim] = true
            end
          end
          if #G.jokers.cards == 1 then in_use[1] = false end
          local position = pseudorandom(pseudoseed('aim_joker'), 1, #G.jokers.cards)
          while in_use[position] do
            position = pseudorandom(pseudoseed('aim_joker_reroll'), 1, #G.jokers.cards)
          end
          card.ability.extra.aim = position
          card.states.drag.can = false
          return true
        end
      }))
      return {
        message = '!',
        colour = self.badge_colour
      }
    end
  end
}

SMODS.Sticker {
  key = 'stinker',
  atlas = "AbandoniaStickers",
  pos = { x = 3, y = 8 },
  badge_colour = HEX("86e631"),
  loc_vars = function(self, info_queue, card)
  end,
  config = {
  },
  apply = function(self, card, val)
    card.ability[self.key] = val
    if G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability and v.ability.set and v.ability.set == "Spectral" then
          SMODS.debuff_card(v, val, "spectraldebuff")
        end
      end
    end
  end,
  
  calculate = function(self, card, context)
    if context.card_added and context.card.ability and context.card.ability.set and context.card.ability.set == "Spectral" then
      SMODS.debuff_card(context.card, true, "spectraldebuff")
    end
    
    if context.selling_self or ((context.selling_card or context.joker_type_destroyed) and context.card == card) and G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability and v.ability.set and v.ability.set == "Spectral" then
          SMODS.debuff_card(v, false, "spectraldebuff")
        end
      end
    end
  end,
  
}


SMODS.Sticker {
  key = 'bug',
  atlas = "AbandoniaStickers",
  pos = { x = 3, y = 11 },
  badge_colour = HEX("6462EC"),
  
  loc_vars = function(self, info_queue, card)
  end,
  config = {
  },
  apply = function(self, card, val)
    card.ability[self.key] = val
    if G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability and v.ability.set and v.ability.set == "Tarot" then
          SMODS.debuff_card(v, val, "tarotdebuff")
        end
      end
    end
  end,
  
  calculate = function(self, card, context)
    if context.card_added and context.card.ability and context.card.ability.set and context.card.ability.set == "Tarot" then
      SMODS.debuff_card(context.card, true, "tarotdebuff")
    end
    
    if context.selling_self or ((context.selling_card or context.joker_type_destroyed) and context.card == card) and G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability and v.ability.set and v.ability.set == "Tarot" then
          SMODS.debuff_card(v, false, "tarotdebuff")
        end
      end
    end
  end,
  
}
SMODS.Sticker {
  key = 'martini',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 11 },
  badge_colour = HEX("DB8B93"),
  
  loc_vars = function(self, info_queue, card)
  end,
  config = {
  },
  apply = function(self, card, val)
    card.ability[self.key] = val
    if G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability and v.ability.set and v.ability.set == "Planet" then
          SMODS.debuff_card(v, val, "planetdebuff")
        end
      end
    end
  end,
  
  calculate = function(self, card, context)
    if context.card_added and context.card.ability and context.card.ability.set and context.card.ability.set == "Planet" then
      SMODS.debuff_card(context.card, true, "planetdebuff")
    end
    
    if context.selling_self or ((context.selling_card or context.joker_type_destroyed) and context.card == card) and G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability and v.ability.set and v.ability.set == "Planet" then
          SMODS.debuff_card(v, false, "planetdebuff")
        end
      end
    end
  end,
  
}

SMODS.Sticker {
  key = 'lightbulb',
  atlas = "AbandoniaStickers",
  pos = { x = 3, y = 4 },
  badge_colour = HEX("34C9EA"),
  
  loc_vars = function(self, info_queue, card)
  end,
  config = {
  },
  apply = function(self, card, val)
    card.ability[self.key] = val
    if G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability and v.ability.set and (v.ability.set == "program_pack" or v.ability.set == "solid_state" )then
          SMODS.debuff_card(v, val, "lightbulbdebuff")
        end
      end
    end
  end,
  
  calculate = function(self, card, context)
    if context.card_added and context.card.ability and context.card.ability.set and (context.card.ability.set == "program_pack" or context.card.ability.set == "solid_state" ) then
      SMODS.debuff_card(context.card, true, "lightbulbdebuff")
    end
    
    if context.selling_self or ((context.selling_card or context.joker_type_destroyed) and context.card == card) and G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability and v.ability.set and (v.ability.set == "program_pack" or v.ability.set == "solid_state" ) then
          SMODS.debuff_card(v, false, "lightbulbdebuff")
        end
      end
    end
  end,
  
}

SMODS.Sticker {
  key = 'pawn',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 10 },
  badge_colour = HEX("C59873"),
  
  loc_vars = function(self, info_queue, card)
  end,
  config = {
  },
  apply = function(self, card, val)
    card.ability[self.key] = val
    if G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability and v.ability.set and (v.ability.set == "astro_cards" or v.ability.set == "sigils" )then
          SMODS.debuff_card(v, val, "pawndebuff")
        end
      end
    end
  end,
  
  calculate = function(self, card, context)
    if context.card_added and context.card.ability and context.card.ability.set and (context.card.ability.set == "astro_cards" or context.card.ability.set == "sigils" ) then
      SMODS.debuff_card(context.card, true, "pawndebuff")
    end
    
    if context.selling_self or ((context.selling_card or context.joker_type_destroyed) and context.card == card) and G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability and v.ability.set and (v.ability.set == "astro_cards" or v.ability.set == "sigils" ) then
          SMODS.debuff_card(v, false, "pawndebuff")
        end
      end
    end
  end,
  
}

SMODS.Sticker {
  key = 'road_block',
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 4 },
  badge_colour = HEX("4F6367"),
  
  loc_vars = function(self, info_queue, card)
  end,
  config = {
  },
  apply = function(self, card, val)
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.first_hand_drawn and not context.blueprint then
      local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
      juice_card_until(card, eval, true)
    end
    if context.final_scoring_step and G.GAME.current_round.hands_played == 0 then
      return {
        xchips = 0,
        xmult = 0,
        xscore = 0,
      }
    end
  end,
  
}

SMODS.Sticker {
  key = 'matchstick',
  atlas = "AbandoniaStickers",
  pos = { x = 3, y = 9 },
  badge_colour = HEX("E09C60"),
  loc_vars = function(self, info_queue, card)
  end,
  config = {
  },
  apply = function(self, card, val)
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.after and context.main_eval and not context.game_over and not context.blueprint then
      if SMODS.last_hand_oneshot then
        SMODS.destroy_cards(card)     
      end
    end
  end,
  
}

SMODS.Sticker {
  key = 'tnt',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 9 },
  badge_colour = HEX("F71D1D"),
  loc_vars = function(self, info_queue, card)
    return { vars = {self.config.extra.xmult}}
  end,
  config = {
    extra = { 
      xmult = 2, 
    }
  },
  apply = function(self, card, val)
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      return { xmult = self.config.extra.xmult }
    end
    if context.after then
      local die = pseudorandom_element(G.hand.cards,pseudoseed("abn_tnt"))
      if die then
        G.E_MANAGER:add_event(Event({
          func = function()
            SMODS.destroy_cards(die)
            return true
          end
        }))
      end
      
    end
  end,
  
}

SMODS.Sticker {
  key = 'bomb',
  atlas = "AbandoniaStickers",
  pos = { x = 4, y = 8 },
  badge_colour = HEX("506765"),
  loc_vars = function(self, info_queue, card)
  end,
  config = {
  },
  apply = function(self, card, val)
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.after and context.main_eval and not context.game_over and not context.blueprint then
      if SMODS.last_hand_oneshot then
        G.E_MANAGER:add_event(Event({
          func = function()
            SMODS.destroy_cards(G.play.cards)
            return true
          end
        }))
      end
    end
  end,
  
}

SMODS.Sticker {
  key = 'cigarettes',
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 9 },
  badge_colour = HEX("A62222"),
  apply = function(self, card, val)
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.after then
      local die = pseudorandom_element(G.playing_cards,pseudoseed("abn_tnt"))
      if die then
        G.E_MANAGER:add_event(Event({
          func = function()
            SMODS.destroy_cards(die)
            return true
          end
        }))
      end
      
    end
  end,
  
}
SMODS.Sticker {
  key = 'platano',
  atlas = "AbandoniaStickers",
  pos = { x = 3, y = 10 },
  badge_colour = HEX("97DB54"),
  loc_vars = function(self, info_queue, card)
    local n, d = SMODS.get_probability_vars(card,self.config.extra.n,self.config.extra.d,"abn_platano",pseudoseed("abn_platano"))
    return { vars = {self.config.extra.emult, n, d}}
  end,
  config = {
    extra = { 
      emult = 2,
      n = 1,
      d = 4,
    }
  },
  apply = function(self, card, val)
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      return { emult = self.config.extra.emult }
    end
    if context.after and SMODS.pseudorandom_probability(card,pseudoseed("abn_platano"),self.config.extra.n,self.config.extra.d,"abn_platano") then
      if G.jokers and G.jokers.cards then
        G.E_MANAGER:add_event(Event({
          func = function()
            SMODS.destroy_cards(G.jokers.cards)
            return true
          end
        }))
      end
      
    end
  end,
  
}

SMODS.Sticker {
  key = 'unholy_relic',
  atlas = "AbandoniaStickers",
  pos = { x = 4, y = 10 },
  badge_colour = HEX("5E5E5E"),
  
  loc_vars = function(self, info_queue, card)
  end,
  config = {
  },
  apply = function(self, card, val)
    card.ability[self.key] = val
    if G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability and v.ability.set and (v.ability.set == "ruinous_power" or v.ability.set == "nightshift_cards" )then
          SMODS.debuff_card(v, val, "unholy_relicdebuff")
        end
      end
    end
  end,
  
  calculate = function(self, card, context)
    if context.card_added and context.card.ability and context.card.ability.set and (context.card.ability.set == "ruinous_power" or context.card.ability.set == "nightshift_cards" ) then
      SMODS.debuff_card(context.card, true, "unholy_relicdebuff")
    end
    
    if context.selling_self or ((context.selling_card or context.joker_type_destroyed) and context.card == card) and G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability and v.ability.set and (v.ability.set == "ruinous_power" or v.ability.set == "nightshift_cards" ) then
          SMODS.debuff_card(v, false, "unholy_relicdebuff")
        end
      end
    end
  end,
  
}

SMODS.Sticker {
  key = 'cowboy_hat',
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 9 },
  badge_colour = HEX("4B3B3B"),
  
  loc_vars = function(self, info_queue, card)
  end,
  config = {
  },
  apply = function(self, card, val)
    card.ability[self.key] = val
    if G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability and v.ability.set and (v.ability.set == "weather_report" or v.ability.set == "lexica" )then
          SMODS.debuff_card(v, val, "cowboy_hatdebuff")
        end
      end
    end
  end,
  
  calculate = function(self, card, context)
    if context.card_added and context.card.ability and context.card.ability.set and (context.card.ability.set == "weather_report" or context.card.ability.set == "lexica" ) then
      SMODS.debuff_card(context.card, true, "cowboy_hatdebuff")
    end
    
    if context.selling_self or ((context.selling_card or context.joker_type_destroyed) and context.card == card) and G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability and v.ability.set and (v.ability.set == "weather_report" or v.ability.set == "lexica" ) then
          SMODS.debuff_card(v, false, "cowboy_hatdebuff")
        end
      end
    end
  end,
  
}



SMODS.Sticker {
  key = 'cactus',
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 11 },
  badge_colour = HEX("FFEAA6"),
  
  loc_vars = function(self, info_queue, card)
  end,
  config = {
  },
  apply = function(self, card, val)
    card.ability[self.key] = val
    if G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability and v.ability.set and (v.ability.set == "artistry_cards" or v.ability.set == "calligraphy" )then
          SMODS.debuff_card(v, val, "cactusdebuff")
        end
      end
    end
  end,
  
  calculate = function(self, card, context)
    if context.card_added and context.card.ability and context.card.ability.set and (context.card.ability.set == "artistry_cards" or context.card.ability.set == "calligraphy" ) then
      SMODS.debuff_card(context.card, true, "cactusdebuff")
    end
    
    if context.selling_self or ((context.selling_card or context.joker_type_destroyed) and context.card == card) and G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability and v.ability.set and (v.ability.set == "artistry_cards" or v.ability.set == "calligraphy" ) then
          SMODS.debuff_card(v, false, "cactusdebuff")
        end
      end
    end
  end,
  
}


SMODS.Sticker {
  key = 'stk_bonus',
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 13 },
  badge_colour = HEX("1FAEFF"),
  
  loc_vars = function(self, info_queue, card)
    return { vars = {self.config.extra.chips}}
  end,
  config = {
    extra = { 
      chips = 30,
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = self.config.extra.chips
      }
    end
  end,
}

SMODS.Sticker {
  key = 'stk_mult',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 13 },
  badge_colour = HEX("FE5F55"),
  
  loc_vars = function(self, info_queue, card)
    return { vars = {self.config.extra.mult}}
  end,
  config = {
    extra = { 
      mult = 4,
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = self.config.extra.mult
      }
    end
  end,
  
}

SMODS.Sticker {
  key = 'stk_wild',
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 13 },
  badge_colour = HEX("4F6367"),
  
  loc_vars = function(self, info_queue, card)
    return { vars = {}}
  end,
  config = {
    extra = { 
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
    end
    card.ability[self.key] = val
  end,
  
}

SMODS.Sticker {
  key = 'stk_gold',
  atlas = "AbandoniaStickers",
  pos = { x = 3, y = 13 },
  badge_colour = HEX("CCA757"),
  
  loc_vars = function(self, info_queue, card)
    return { vars = {self.config.extra.dollars}}
  end,
  config = {
    extra = { 
      dollars = 3,
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false then
      return {
        dollars = self.config.extra.dollars,
      }
    end
  end,
  
}

SMODS.Sticker {
  key = 'stk_steel',
  atlas = "AbandoniaStickers",
  pos = { x = 4, y = 13 },
  badge_colour = HEX("ADBDD7"),
  
  loc_vars = function(self, info_queue, card)
    return { vars = {self.config.extra.xmult}}
  end,
  config = {
    extra = { 
      xmult = 1.5,
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.final_scoring_step then
      return {
        xmult = self.config.extra.xmult
      }
    end
  end,
}

SMODS.Sticker {
  key = 'stk_stone',
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 14 },
  badge_colour = HEX("B9BDC2"),
  
  loc_vars = function(self, info_queue, card)
    return { vars = {self.config.extra.chips}}
  end,
  config = {
    extra = { 
      chips = 15,
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = self.config.extra.chips
      }
    end
    if context.modify_scoring_hand and not context.blueprint then
      return {
        add_to_hand = true
      }
    end
  end,
}

SMODS.Sticker {
  key = 'stk_glass',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 14 },
  badge_colour = HEX("89D4E5"),
  
  loc_vars = function(self, info_queue, card)
    local n, d = SMODS.get_probability_vars(card,self.config.extra.n,self.config.extra.d,"abn_stk_glass",pseudoseed("abn_stk_glass"))
    return { vars = {self.config.extra.xmult, n, d}}
  end,
  config = {
    extra = { 
      n = 1,
      d = 4,
      xmult = 2,
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        xmult = self.config.extra.xmult
      }
    end
    if (context.after and SMODS.pseudorandom_probability(card, "abn_stk_glass", self.config.extra.n,self.config.extra.d)) then
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = function()
          card:shatter()
          SMODS.calculate_context({ joker_type_destroyed = true, card = card, shatters = true })
          return true
        end
      }))
    end
  end,
}

SMODS.Sticker {
  key = 'stk_lucky',
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 14 },
  badge_colour = HEX("5EA07D"),
  
  loc_vars = function(self, info_queue, card)
    local n, d = SMODS.get_probability_vars(card,self.config.extra.n,self.config.extra.d,"abn_stk_lucky",pseudoseed("abn_stk_lucky"))
    local n2, d2 = SMODS.get_probability_vars(card,self.config.extra.n2,self.config.extra.d2,"abn_stk_lucky2",pseudoseed("abn_stk_lucky2"))
    return { vars = { n, d, self.config.extra.mult,n2, d2, self.config.extra.dollars,}}
  end,
  config = {
    extra = { 
      mult = 20,
      dollars = 20,
      n = 1,
      d = 4,
      n2 = 1,
      d2 = 15,
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      local ret = {}
      
      if SMODS.pseudorandom_probability(card, "abn_stk_lucky", self.config.extra.n,self.config.extra.d) then
        card.lucky_trigger = true
        ret.mult = self.config.extra.mult
      end
      if SMODS.pseudorandom_probability(card, "abn_stk_lucky2", self.config.extra.n2,self.config.extra.d2) then
        card.lucky_trigger = true
        ret.dollars = self.config.extra.dollars
      end
    end
    if context.after then
      local cats = SMODS.find_card("j_lucky_cat", false)
      if card.lucky_trigger == true then
        for _, cat in ipairs(cats) do
          
          SMODS.scale_card(cat, {
            ref_table = cat.ability,
            ref_value = "x_mult",
            scalar_value = "extra",
            scaling_message = {
              message_key = 'a_xmult',
              colour = G.C.RED
            }
          })
        end
        card.lucky_trigger = false
      end
      return ret
    end
  end,
  
}

SMODS.Sticker {
  key = 'stk_petroleum',
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 16 },
  badge_colour = HEX("374649"),
  
  loc_vars = function(self, info_queue, card)
    return { vars = {self.config.extra.chips,self.config.extra.dollars, n, d,}}
  end,
  config = {
    extra = { 
      chips = 100,
      dollars = 2,
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = self.config.extra.chips,
        dollars = self.config.extra.dollars
      }
    end
    if context.after and context.main_eval and not context.blueprint then
      if SMODS.last_hand_oneshot then
        card:juice_up(0.3, 0.4)
        card.ability.abn_burnt = true
        card:add_sticker("abn_stk_oilfire", true)  
      end
    end
  end,
  
}
SMODS.Sticker {
  key = 'stk_oilfire',
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 15 },
  badge_colour = HEX("AD6E52"),
  
  loc_vars = function(self, info_queue, card)
    local n, d = SMODS.get_probability_vars(card,self.config.extra.n,self.config.extra.d,"abn_stk_oilfire",pseudoseed("abn_stk_oilfire"))
    return { vars = {self.config.extra.mult,self.config.extra.dollars, n, d,}}
  end,
  config = {
    extra = { 
      mult = 10,
      dollars = 3,
      n = 1,
      d = 2,
      
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.before and card.ability.abn_burnt then
      card.ability.abn_burnt = nil
    end
    if context.joker_main then
      return {
        xmult = self.config.extra.xmult,
        dollars = -self.config.extra.dollars
      }
    end
    if (context.after 
    and SMODS.pseudorandom_probability(card, "abn_stk_oilfire", self.config.extra.n,self.config.extra.d)) 
    and not card.getting_sliced 
    and not card.ability.abn_burnt then
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = function()
          SMODS.destroy_cards(card)
          SMODS.calculate_context({ joker_type_destroyed = true, card = card, shatters = false })
          return true
        end
      }))
    end
  end,
  
}

SMODS.Sticker {
  key = 'stk_mercurial',
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 15 },
  badge_colour = HEX("FC80A1"),
  
  loc_vars = function(self, info_queue, card)
    local _key = card.ability[self.key .. "_t"] and card.ability[self.key .. "_t"] or self.config.extra
    return { vars = {_key.chips_mod,_key.chips,}}
  end,
  config = {
    extra = { 
      chips = 0,
      chips_mod = 5,
      
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
      card.ability[self.key .. "_t"] = {}

      for k, v in pairs(self.config.extra) do
          card.ability[self.key .. "_t"][k] = v
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = card.ability[self.key .. "_t"].chips
      }
    end
    if context.before then
      local suits, num = {}, 0
      for k, v in pairs(context.scoring_hand) do
        if not suits[v.base.suit] then
          suits[v.base.suit] = true
          num = num + 1
        end
      end
      for i = 1, num do
        SMODS.scale_card(card, {
          ref_table = card.ability[self.key .. "_t"],
          ref_value = "chips",
          scalar_value = "chips_mod",
          no_message = true
        })
      end
      if #context.scoring_hand > 0 then
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, card)
      end
    end
  end,
}

SMODS.Sticker {
  key = 'stk_kintsugi',
  atlas = "AbandoniaStickers",
  pos = { x = 3, y = 19 },
  badge_colour = HEX("E0AC55"),
  
  loc_vars = function(self, info_queue, card)
    local n1, d1 = SMODS.get_probability_vars(card, self.config.extra.n_clone, self.config.extra.d_clone, 'abn_stk_kintsugi_1')
    local n2, d2 = SMODS.get_probability_vars(card, self.config.extra.n_double, self.config.extra.d_double, 'abn_stk_kintsugi_2')
    local _key = card.ability[self.key .. "_t"] and card.ability[self.key .. "_t"] or self.config.extra
    return { vars = { _key.chips, _key.mult, _key.dollars, n1, d1, n2, d2 } }
  end,
  config = {
    extra = {
      chips = 1,
      mult = 1,
      dollars = 1,
      n_clone = 1,
      d_clone = 7,
      n_double = 1,
      d_double = 9,
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
      card.ability[self.key .. "_t"] = {}

      for k, v in pairs(self.config.extra) do
          card.ability[self.key .. "_t"][k] = v
      end
    end
    card.ability[self.key] = val
    card.ability.cloned = nil 
  end,
  
  calculate = function(self, card, context)
    if context.ante_change and context.ante_end then
        if card.ability.cloned == true then 
            card.ability.cloned = nil 
            return {
                message = localize("k_reset")
            }
        end
    end
    if context.remove_playing_cards 
    and not context.blueprint 
    and SMODS.pseudorandom_probability(card, "abn_stk_kintsugi_1", self.config.extra.n_clone, self.config.extra.d_clone) and not card.ability.cloned then
      card.ability.cloned = true
      local chosen_joker = card
      local is_negative = (card.edition and card.edition.key == "e_negative") and 1 or 0
      if #G.jokers.cards < G.jokers.config.card_limit + is_negative then
        
        local copied_joker = copy_card(chosen_joker, nil, nil, nil, chosen_joker.edition and chosen_joker.edition.negative)
        copied_joker.ability.cloned = true
        if copied_joker.ability.invis_rounds then copied_joker.ability.invis_rounds = 0 end
        if type(copied_joker.ability.extra) == "table" and copied_joker.ability.extra.invis_rounds then copied_joker.ability.extra.invis_rounds = 0 end
        copied_joker:add_to_deck()
        G.jokers:emplace(copied_joker)
      end
    end
    
    if context.joker_main then
      local ret = {}
      if SMODS.pseudorandom_probability(card, "abn_stk_kintsugi_1", self.config.extra.n_double, self.config.extra.d_double) then
        SMODS.scale_card(card, {
          ref_table = card.ability[self.key .. "_t"],
          ref_value = "chips",
          scalar_value = "chips",
          no_message = true,
        })
        SMODS.scale_card(card, {
          ref_table = card.ability[self.key .. "_t"],
          ref_value = "mult",
          scalar_value = "mult",
          no_message = true,
        })
        SMODS.scale_card(card, {
          ref_table = card.ability[self.key .. "_t"],
          ref_value = "dollars",
          scalar_value = "dollars",
          no_message = true,
        })
        ret.message = localize('k_upgrade_ex')
        ret.colour = G.C.ATTENTION
      end
      ret.chips = card.ability[self.key .. "_t"].chips
      ret.mult = card.ability[self.key .. "_t"].mult
      ret.dollars = card.ability[self.key .. "_t"].dollars
      ret.card = card
      return ret
    end
  end,
}
SMODS.Sticker {
  key = 'stk_infra',
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 16 },
  badge_colour = HEX("C55A84"),
  
  loc_vars = function(self, info_queue, card)
    local _key = card.ability[self.key .. "_t"] and card.ability[self.key .. "_t"] or self.config.extra
    return { vars = {_key.mult,_key.mult_mod,_key.chips,_key.chips_mod,}}
  end,
  config = {
    extra = { 
      mult = 0, 
      mult_mod = 2, 
      chips = 0, 
      chips_mod = 3,
      
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
      card.ability[self.key .. "_t"] = {}

      for k, v in pairs(self.config.extra) do
          card.ability[self.key .. "_t"][k] = v
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.before then
      if #context.scoring_hand > 3 then
        SMODS.scale_card(card, {
            ref_table = card.ability[self.key .. "_t"],
            ref_value = "mult",
            scalar_value = "mult_mod",
            operation = function(ref_table, ref_value, initial, change)
              ref_table[ref_value] = initial + #context.scoring_hand * change
            end,
            no_message = true
        })
        SMODS.scale_card(card, {
            ref_table = card.ability[self.key .. "_t"],
            ref_value = "chips",
            scalar_value = "chips_mod",
            operation = function(ref_table, ref_value, initial, change)
              ref_table[ref_value] = initial + #context.scoring_hand * change
            end,
            no_message = true
        })

        if #context.scoring_hand > 0 then
          SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, card)
        end
        return {
          mult = card.ability[self.key .. "_t"].mult,
          chips = card.ability[self.key .. "_t"].chips,
        }
      else
        SMODS.destroy_cards(card)
      end
    end

    if context.destroy_card and (context.cardarea == G.play or context.cardarea == 'unscored') and (#context.scoring_hand or 0) <= 3 and context.destroy_card == card then
      return { remove = true }
    end
  end,
}
SMODS.Sticker {
  key = 'stk_hazard',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 16 },
  badge_colour = HEX("F5C678"),
  
  loc_vars = function(self, info_queue, card)
    local n1, d1 = SMODS.get_probability_vars(card, self.config.extra.n1, self.config.extra.d1, 'abn_stk_hazard')
    local _key = card.ability[self.key .. "_t"] and card.ability[self.key .. "_t"] or self.config.extra
    return { vars = {_key.xmult,_key.xmult_mod,n1,d1,self.config.extra.xblind}}
  end,
  config = {
    extra = { 
      xmult = 2, 
      xmult_mod = 0.25, 
      n1 = 1, 
      d1 = 10,
      xblind = 1.1
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
      card.ability[self.key .. "_t"] = {}

      for k, v in pairs(self.config.extra) do
          card.ability[self.key .. "_t"][k] = v
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      local hazard_count = -1
      for i, v in ipairs(G.jokers.cards) do
        if v.ability[self.key] then
          hazard_count = hazard_count + 1
        end
      end

      if hazard_count >= 1 then
        SMODS.scale_card(card, {
          ref_table = card.ability[self.key .. "_t"],
          ref_value = "xmult",
          scalar_value = "xmult_mod",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + (hazard_count * change)
          end,
        })
      end

      return {
        xblindsize = self.config.extra.xblind,
        xmult = card.ability[self.key .. "_t"].xmult,
        card = card
      }
    end

    if context.retrigger_joker_check and context.other_card == card then
      if SMODS.pseudorandom_probability(card, "abn_stk_hazard", self.config.extra.n1, self.config.extra.d1) then
        return {
          message = localize('k_again_ex'),
          repetitions = 1,
          card = card
        }
      end
    end
  end,
}

SMODS.Sticker {
  key = 'stk_wallpaper',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 19 },
  badge_colour = HEX("C7B496"),
  
  loc_vars = function(self, info_queue, card)
    local _key = card.ability[self.key .. "_t"] and card.ability[self.key .. "_t"] or self.config.extra
    return { vars = {_key.mult,_key.mult_mod,_key.chips,_key.chips_mod,}}
  end,
  config = {
    extra = { 
      mult = 0, 
      mult_mod = 1, 
      chips = 0, 
      chips_mod = 2,
      
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
      card.ability[self.key .. "_t"] = {}

      for k, v in pairs(self.config.extra) do
          card.ability[self.key .. "_t"][k] = v
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.before then
      local seals_scored = 0
      local seals_held = 0
      for _, v in ipairs(context.scoring_hand) do
        if v.seal then
          seals_scored = seals_scored + 1
        end
      end
      for _, v in ipairs(G.hand.cards) do
        if v and v.seal then
          seals_held = seals_held + 1
        end
      end
      if seals_scored > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability[self.key .. "_t"],
          ref_value = "mult",
          scalar_value = "mult_mod",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + seals_scored * change
          end,
          no_message = true
        })
      end
      if seals_held > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability[self.key .. "_t"],
          ref_value = "chips",
          scalar_value = "chips_mod",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + seals_scored * change
          end,
          no_message = true
        })
      end
      if seals_scored > 0 or seals_held > 0 then
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, card)
      end
    end
    if context.joker_main then
      return {
        mult = card.ability[self.key .. "_t"].mult,
        chips = card.ability[self.key .. "_t"].chips
      }
    end
  end,
}

SMODS.Sticker {
  key = 'stk_fossil',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 15 },
  badge_colour = HEX("A58968"),
  
  loc_vars = function(self, info_queue, card)
    local n, d = SMODS.get_probability_vars(card,self.config.extra.n,self.config.extra.d,"abn_stk_fossil",pseudoseed("abn_stk_fossil"))
    return { vars = {self.config.extra.xmult,self.config.extra.dollars, n, d,}}
  end,
  config = {
    extra = { 
      xmult = 3,
      dollars = 10,
      n = 1,
      d = 2,
      
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        xmult = self.config.extra.xmult,
        dollars = self.config.extra.dollars
      }
    end
    if (context.after and SMODS.pseudorandom_probability(card, "abn_stk_fossil", self.config.extra.n,self.config.extra.d)) then
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = function()
          SMODS.destroy_cards(card)
          SMODS.calculate_context({ joker_type_destroyed = true, card = card, shatters = false })
          return true
        end
      }))
    end
  end,
  
}


ABN.monitor_suits = {
    {key = "diamonds",   suit="Diamonds",		x=1, y=17},
    {key = "spades",      suit="Spades",		x=2, y=17},
    {key = "clubs",         suit="Clubs",			x=3, y=17},
    {key = "hearts",        suit="Hearts",			x=4, y=17},
}
SMODS.Sticker {
    key = 'stk_monitor',
    atlas = "AbandoniaStickers",
    pos = { x = 0, y = 17 },
    badge_colour = HEX("56A786"),
    needs_enable_flag = true,
    rate = 0,
    
}
for _, suit in ipairs(ABN.monitor_suits) do
  SMODS.Sticker {
    key = 'stk_monitor_'..suit.key,
    atlas = "AbandoniaStickers",
    pos = { x = suit.x, y = suit.y },
    badge_colour = HEX("56A786"),
    no_collection = true,
    loc_vars = function(self, info_queue, card)
      return { vars = {self.config.extra.suit}}
    end,
    config = {
      extra = { 
        suit = suit.suit
      }
    },
    apply = function(self, card, val)
      if val then
        for _, key in ipairs(ABN.enh_stickers_list) do
          card:remove_sticker(key)
        end
      end
      card.ability[self.key] = val
    end,
    
    calculate = function(self, card, context)
      if context.final_scoring_step then
        local match_count = 0
        if context.scoring_hand then
          for _, sc in ipairs(context.scoring_hand) do
            if sc:is_suit(self.config.extra.suit) then
              match_count = match_count + 1
            end
          end
        end

        if match_count > 1 then
          return {
            e_mult = match_count,
            card = card,
          }
        end
      end
    end,
    
  }
end
























ABN.enh_stickers_vars = {
  abn_stk_bonus     = SMODS.Stickers["abn_stk_bonus"] and {
    SMODS.Stickers["abn_stk_bonus"].config.extra.chips
  },
  abn_stk_mult     =  SMODS.Stickers["abn_stk_mult"] and {
    SMODS.Stickers["abn_stk_mult"].config.extra.mult 
  },
  abn_stk_gold     =  SMODS.Stickers["abn_stk_gold"] and {
    SMODS.Stickers["abn_stk_gold"].config.extra.dollars 
  },
  abn_stk_stone     = SMODS.Stickers["abn_stk_stone"] and {
    SMODS.Stickers["abn_stk_stone"].config.extra.chips
  },
  abn_stk_glass     = SMODS.Stickers["abn_stk_glass"] and {
    SMODS.Stickers["abn_stk_glass"].config.extra.xmult, 
    SMODS.Stickers["abn_stk_glass"].config.extra.n, 
    SMODS.Stickers["abn_stk_glass"].config.extra.d,
  },
  abn_stk_steel     = SMODS.Stickers["abn_stk_steel"] and {
    SMODS.Stickers["abn_stk_steel"].config.extra.xmult 
  },
  abn_stk_lucky     = SMODS.Stickers["abn_stk_lucky"] and {
    SMODS.Stickers["abn_stk_lucky"].config.extra.n, 
    SMODS.Stickers["abn_stk_lucky"].config.extra.d, 
    SMODS.Stickers["abn_stk_lucky"].config.extra.mult,
    SMODS.Stickers["abn_stk_lucky"].config.extra.n2, 
    SMODS.Stickers["abn_stk_lucky"].config.extra.d2, 
    SMODS.Stickers["abn_stk_lucky"].config.extra.dollars,
  },
  abn_stk_fossil     = SMODS.Stickers["abn_stk_fossil"] and {
    SMODS.Stickers["abn_stk_fossil"].config.extra.xmult,
    SMODS.Stickers["abn_stk_fossil"].config.extra.dollars,
    SMODS.Stickers["abn_stk_fossil"].config.extra.n, 
    SMODS.Stickers["abn_stk_fossil"].config.extra.d,
  },
  abn_stk_petroleum     = SMODS.Stickers["abn_stk_petroleum"] and {
    SMODS.Stickers["abn_stk_petroleum"].config.extra.chips,
    SMODS.Stickers["abn_stk_petroleum"].config.extra.dollars,
  },
  abn_stk_oilfire     = SMODS.Stickers["abn_stk_oilfire"] and {
    SMODS.Stickers["abn_stk_oilfire"].config.extra.mult,
    SMODS.Stickers["abn_stk_oilfire"].config.extra.dollars,
    SMODS.Stickers["abn_stk_oilfire"].config.extra.n, 
    SMODS.Stickers["abn_stk_oilfire"].config.extra.d,
  },
  abn_stk_mercurial     = SMODS.Stickers["abn_stk_mercurial"] and {
    SMODS.Stickers["abn_stk_mercurial"].config.extra.chips_mod,
    SMODS.Stickers["abn_stk_mercurial"].config.extra.chips,
  },
  abn_stk_wallpaper     = SMODS.Stickers["abn_stk_wallpaper"] and {
    SMODS.Stickers["abn_stk_wallpaper"].config.extra.mult,
    SMODS.Stickers["abn_stk_wallpaper"].config.extra.mult_mod,
    SMODS.Stickers["abn_stk_wallpaper"].config.extra.chips,
    SMODS.Stickers["abn_stk_wallpaper"].config.extra.chips_mod,
  },
  abn_stk_kintsugi     = SMODS.Stickers["abn_stk_kintsugi"] and {
    SMODS.Stickers["abn_stk_kintsugi"].config.extra.chips,
    SMODS.Stickers["abn_stk_kintsugi"].config.extra.mult,
    SMODS.Stickers["abn_stk_kintsugi"].config.extra.dollars,
    SMODS.Stickers["abn_stk_kintsugi"].config.extra.n_clone, 
    SMODS.Stickers["abn_stk_kintsugi"].config.extra.d_clone, 
    SMODS.Stickers["abn_stk_kintsugi"].config.extra.n_double, 
    SMODS.Stickers["abn_stk_kintsugi"].config.extra.d_double, 
  },
  abn_stk_infra     = SMODS.Stickers["abn_stk_infra"] and {
    SMODS.Stickers["abn_stk_infra"].config.extra.mult,
    SMODS.Stickers["abn_stk_infra"].config.extra.mult_mod,
    SMODS.Stickers["abn_stk_infra"].config.extra.chips,
    SMODS.Stickers["abn_stk_infra"].config.extra.chips_mod,
  },
  abn_stk_hazard     = SMODS.Stickers["abn_stk_hazard"] and {
    SMODS.Stickers["abn_stk_hazard"].config.extra.xmult,
    SMODS.Stickers["abn_stk_hazard"].config.extra.xmult_mod,
    SMODS.Stickers["abn_stk_hazard"].config.extra.n1,
    SMODS.Stickers["abn_stk_hazard"].config.extra.d1,
    SMODS.Stickers["abn_stk_hazard"].config.extra.xblind,
  },
}