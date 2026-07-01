-- Lexica Consumables (coded by cloudzXIII)
SMODS.ConsumableType {
  key = "lexica",
  primary_colour = HEX("f4ae55"),
  secondary_colour = HEX("f4ae55"),
  collection_rows = { 6, 6 },
  shop_rate = 1,
  select_card = "consumeables"
}

local set_cost_ref = Card.set_cost -- for some reason hooking Card:set_sell_value() didn't work?
function Card:set_cost()
  local ret = set_cost_ref(self)
  if self.ability.set == "lexica" then
    self.sell_cost = 1
  end
  return ret
end

local function abn_activate_letter(self, card)
  set_consumeable_usage(card)
  SMODS.calculate_effect({ message = localize('k_abn_activated_ex'), colour = G.C.GREEN, sound = 'tarot1', }, card)
  SMODS.destroy_cards(card)
  SMODS.calculate_context({ abn_letter_activated = true })
  G.GAME.abn_letters_activated = (G.GAME.abn_letters_activated or 0) + 1
end

SMODS.Consumable {
  key = "a",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 0, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.other_joker and context.other_joker.edition and next(context.other_joker.edition) then
      local edition_key = context.other_joker.edition.key
      if edition_key and context.scoring_hand and #context.scoring_hand > 0 then
        G.E_MANAGER:add_event(Event({
          func = function()
            local first = context.scoring_hand[1]
            local last = context.scoring_hand[#context.scoring_hand]
            first:set_edition(edition_key, true)
            if last and last ~= first then
              last:set_edition(edition_key, true)
            end
            return true
          end
        }))
        abn_activate_letter(self, card)
      end
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "b",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 1, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, 'm_mult') then
        SMODS.calculate_effect({ mult = ((context.other_card.ability.perma_mult or 0) + 4) * 3 }, context.other_card)

        abn_activate_letter(self, card)
      end
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "c",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 2, y = 0 },
  config = { extra = { xchips = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xchips } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.poker_hands and next(context.poker_hands['Two Pair']) then
      SMODS.calculate_effect({ xchips = card.ability.extra.xchips }, context.other_card)
    end
    if context.after and context.main_eval then
      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "d",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 3, y = 0 },
  config = { extra = { chips = 10 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card.facing == 'back' then
      for i = 1, #G.playing_cards do
        local playing_card = G.playing_cards[i]
        if playing_card.ability.abn_perma_flipped then
          playing_card.ability.perma_bonus = (playing_card.ability.perma_bonus or 0) + card.ability.extra.chips
          playing_card.ability.abn_perma_flipped = false
        end
        if playing_card.facing == 'back' then
          playing_card:flip()
        end
      end
      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "e",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 4, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.skip_blind then
      G.E_MANAGER:add_event(Event({
        func = function()
          local tag_key = get_next_tag_key('abn_guaranteed_hazard_tag')
          add_tag(Tag(tag_key))
          return true
        end
      }))
      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "f",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 5, y = 0 },
  config = { extra = { xmult = 2 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS.Gold
    return { vars = { card.ability.extra.xmult } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.other_card.seal and context.other_card.seal == 'Gold' then
      for _, joker in ipairs(G.jokers.cards) do
        joker.ability.abn_perma_xmult = (joker.ability.abn_perma_xmult or 0) + card.ability.extra.xmult
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, joker)
      end
      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "g",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 6, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.before and context.poker_hands and next(context.poker_hands['Full House']) then
      local lowest = nil
      local temp_ID = 15
      for i = 1, #G.hand.cards do
        if temp_ID >= G.hand.cards[i].base.id and not SMODS.has_no_rank(G.hand.cards[i]) and not G.hand.cards[i]:is_face() then
          temp_ID = G.hand.cards[i].base.id
          lowest = G.hand.cards[i]
        end
      end

      local face_chips = 0
      local faces = {}
      for _, held in ipairs(G.hand.cards) do
        if held:is_face() then
          face_chips = face_chips + (held.ability.perma_bonus or 0) + held.base.nominal
          faces[#faces + 1] = held
        end
      end

      if lowest then
        SMODS.destroy_cards(faces)
        lowest.ability.perma_bonus = (lowest.ability.perma_bonus or 0) + face_chips
        SMODS.calculate_effect({ message = localize('k_upgrade_ex'), colour = G.C.FILTER }, lowest)

        abn_activate_letter(self, card)
      end
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "h",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 7, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == 'Tarot' then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          play_sound('timpani')
          SMODS.add_card({ key = context.consumeable.config.center.key, edition = "e_negative" })
          return true
        end
      }))
      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "i",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 8, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card and context.other_card.config.center == G.P_CENTERS.c_base then
        context.other_card.ability.perma_repetitions = (context.other_card.ability.perma_repetitions or 0) + 1
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
        abn_activate_letter(self, card)
      end
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "j",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 9, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.before and context.poker_hands and next(context.poker_hands['Straight']) then
      local numbered = 0
      for _, c in ipairs(context.full_hand) do
        if ABN.is_number(c) then numbered = numbered + 1 end
      end
      if numbered > 0 then
        SMODS.calculate_effect({ message = localize('k_level_up_ex'), colour = G.C.FILTER }, card)
        SMODS.smart_level_up_hand(card, "Straight", false, numbered)
        abn_activate_letter(self, card)
      end
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "k",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 0, y = 1 },
  config = { extra = { xmult_gain = 2 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
    return { vars = { card.ability.extra.xmult_gain } }
  end,
  calculate = function(self, card, context)
    if context.remove_playing_cards and not context.blueprint then
      local glass_cards = 0
      for _, removed_card in ipairs(context.removed) do
        if removed_card.shattered then glass_cards = glass_cards + 1 end
      end
      if glass_cards > 0 then
        for _, crd in ipairs(context.scoring_hand) do
          if not SMODS.has_enhancement(crd, 'm_glass') then
            crd.ability.perma_x_mult = (crd.ability.perma_x_mult or 1) + card.ability.extra.xmult_gain
            SMODS.calculate_effect({ message = localize('k_upgrade_ex'), colour = G.C.FILTER }, crd)
          end
        end
        abn_activate_letter(self, card)
      end
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "l",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 1, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.pseudorandom_result and context.result == false then
      SMODS.calculate_effect({ message = localize('k_level_up_ex'), colour = G.C.FILTER }, card)
      SMODS.smart_level_up_hand(card, ABN.most_played_hand(), nil, 1)
      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "m",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 2, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.poker_hand_changed and context.new_level > context.old_level and not card.ability.processing_level_up then
      -- Set a flag to prevent the infinite loop
      card.ability.processing_level_up = true

      SMODS.calculate_effect({ message = localize('k_level_up_ex'), colour = G.C.FILTER }, card)
      SMODS.smart_level_up_hand(card, ABN.most_played_hand(), nil, 1)
      abn_activate_letter(self, card)

      card.ability.processing_level_up = false
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "n",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 3, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
    info_queue[#info_queue + 1] = G.P_SEALS.abn_brown
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_wild') then
      for _, held in ipairs(G.hand.cards) do
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.1,
          func = function()
            held:set_seal('abn_brown', nil, true)
            return true
          end
        }))
      end
      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "o",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 4, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_gold') then
      context.other_card.ability.perma_bonus = ((context.other_card.ability.perma_bonus or 0) +
        context.other_card.base.nominal) * 3
      SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "p",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 5, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == 'Spectral' then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          play_sound('timpani')
          SMODS.add_card({ key = context.consumeable.config.center.key, edition = "e_negative" })
          return true
        end
      }))
      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "q",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 6, y = 1 },
  config = { extra = { chips = 50 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
    return { vars = { card.ability.extra.chips } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_stone') then
      for _, joker in ipairs(G.jokers.cards) do
        joker.ability.abn_perma_bonus = (joker.ability.abn_perma_bonus or 0) + card.ability.extra.chips
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, joker)
      end
      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

-- wip, this should probably make the next sigil effected hand get the editions and stuff but like
-- there is no way to check that, so i've just made it the next hand
SMODS.Consumable {
  key = "r",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 7, y = 1 },
  config = { extra = { used_sigil = false } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
    info_queue[#info_queue + 1] = G.P_SEALS.abn_violet
    return { vars = { card.ability.extra.used_sigil } }
  end,
  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == "sigils" then
      card.ability.extra.used_sigil = true
    end
    if context.before and card.ability.extra.used_sigil then
      for _, _card in ipairs(context.scoring_hand) do
        G.E_MANAGER:add_event(Event({
          func = function()
            _card:set_edition("e_polychrome", true)
            _card:set_seal('abn_violet', nil, true)
            _card:juice_up(0.3, 0.5)
            return true
          end
        }))
      end
      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "s",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 8, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    info_queue[#info_queue + 1] = G.P_CENTERS.c_soul
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.final_scoring_step then
      local has_light, has_dark = false, false
      for _, c in ipairs(context.full_hand) do
        if ABN.is_light(c) then has_light = true end
        if ABN.is_dark(c) then has_dark = true end
      end
      if has_light and has_dark then
        SMODS.destroy_cards(context.full_hand, nil, nil, true)
        G.E_MANAGER:add_event(Event({
          func = function()
            SMODS.add_card({ key = 'c_soul', edition = "e_negative" })
            return true
          end
        }))
        abn_activate_letter(self, card)
      end
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "t",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 9, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS.abn_skyblue
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.before and context.poker_hands and next(context.poker_hands['Flush']) then
      for _, c in ipairs(context.scoring_hand) do
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.1,
          func = function()
            c:set_seal('abn_skyblue', nil, true)
            return true
          end
        }))
      end

      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "u",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 0, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_gloss
    info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_bonus') then
      local crd = context.other_card
      G.E_MANAGER:add_event(Event({
        func = function()
          crd:set_edition("e_abn_gloss", true)
          crd:juice_up(0.3, 0.5)
          return true
        end
      }))
      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "v",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 1, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    info_queue[#info_queue + 1] = G.P_CENTERS.c_abn_body
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.final_scoring_step and context.scoring_name and context.scoring_name ~= 'High Card' then
      local all_dark = true
      for _, c in ipairs(context.full_hand) do
        if not ABN.is_dark(c) then
          all_dark = false; break
        end
      end
      if all_dark then
        SMODS.destroy_cards(context.full_hand, nil, nil, true)
        G.E_MANAGER:add_event(Event({
          func = function()
            SMODS.add_card({ key = 'c_abn_body', edition = "e_negative" })
            return true
          end
        }))
        abn_activate_letter(self, card)
      end
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "w",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 2, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_abandond
    info_queue[#info_queue + 1] = G.P_SEALS.Red
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_lucky') then
      local crd = context.other_card
      G.E_MANAGER:add_event(Event({
        func = function()
          crd:set_edition("e_abn_abandond", true)
          crd:set_seal('Red', nil, true)
          crd:juice_up(0.3, 0.5)
          return true
        end
      }))
      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "x",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 3, y = 2 },
  config = { extra = { chips = 20, mult = 8 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
  end,
  calculate = function(self, card, context)
    if context.before and context.scoring_name and next(context.poker_hands['abn_Spectrum']) then
      for _, joker in ipairs(G.jokers.cards) do
        joker.ability.abn_perma_mult = (joker.ability.abn_perma_mult or 0) + card.ability.extra.mult
        joker.ability.abn_perma_bonus = (joker.ability.abn_perma_bonus or 0) + card.ability.extra.chips
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, joker)
      end
      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "y",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 4, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.fix_probability and context.trigger_obj and context.trigger_obj.config and context.trigger_obj.config.center and context.trigger_obj.config.center.set and context.trigger_obj.config.center.set == "astro_cards" then
      return { numerator = context.denominator }
    end
    if context.using_consumeable and context.consumeable.ability.set == 'astro_cards' then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.5,
        func = function()
          SMODS.add_card({ set = 'Planet', edition = "e_negative", attributes = { "rank_planet" } })
          return true
        end
      }))
      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "z",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 5, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    info_queue[#info_queue + 1] = G.P_CENTERS.c_abn_mind
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.final_scoring_step and context.scoring_name and context.scoring_name ~= 'High Card' then
      local all_light = true
      for _, c in ipairs(context.full_hand) do
        if not ABN.is_light(c) then
          all_light = false; break
        end
      end
      if all_light then
        SMODS.destroy_cards(context.full_hand, nil, nil, true)
        G.E_MANAGER:add_event(Event({
          func = function()
            SMODS.add_card({ key = 'c_abn_mind', edition = "e_negative" })
            return true
          end
        }))
        abn_activate_letter(self, card)
      end
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "thorn",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 6, y = 2 },
  config = { extra = { chips = 10 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips } }
  end,
  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == 'nightshift_cards' then
      for _, joker in ipairs(G.jokers.cards) do
        joker.ability.abn_perma_bonus = (joker.ability.abn_perma_bonus or 0) + card.ability.extra.chips
        for _, sticker in ipairs(SMODS.Sticker.obj_buffer) do
          if joker.ability[sticker] then joker:remove_sticker(sticker) end
        end
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, joker)
      end
      abn_activate_letter(self, card)
    end
  end,
  abn_artist_credits = {
    artist = "Lazy"
  },
}

SMODS.Consumable {
  key = "yogh",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 7, y = 2 },
  config = { extra = { chips = 10 } },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_reversal
    return { vars = { card.ability.extra.chips } }
  end,

  calculate = function(self, card, context)
    if context.before then
      local triggered = false
      for _, scoring_card in ipairs(context.scoring_hand) do
        if scoring_card:is_suit('abn_Penumbra') then
          triggered = true
          scoring_card:set_edition({ abn_reversal = true }, true)
        end
      end
      if triggered then
        abn_activate_letter(self, card)
      end
    end
  end,

  abn_artist_credits = {
    artist = "Le Ginger"
  },
}

SMODS.Consumable {
  key = "eth",
  set = 'lexica',
  cost = 10,
  atlas = "abn_AbandoniaLetters",
  pos = { x = 8, y = 2 },
  config = { extra = { chips = 10 } },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_collodion
    return { vars = { card.ability.extra.chips } }
  end,

  calculate = function(self, card, context)
    if context.before then
      local triggered = false
      for _, scoring_card in ipairs(context.scoring_hand) do
        if scoring_card:is_suit('abn_Snow') then
          triggered = true
          scoring_card:set_edition({ abn_collodion = true }, true)
        end
      end
      if triggered then
        abn_activate_letter(self, card)
      end
    end
  end,

  abn_artist_credits = {
    artist = "Le Ginger"
  },
}
