-- Weather Report Consumables (coded by cloudzXIII)
SMODS.ConsumableType {
  key = "weather_report",
  primary_colour = HEX("79b5c2"),
  secondary_colour = HEX("79b5c2"),
  collection_rows = { 5, 5 },
  shop_rate = 4,
  select_card = "consumeables",
}

ABN.WeatherReport = SMODS.Consumable:extend({
  set = 'weather_report',
  cost = 4,
  atlas = "abn_AbandoniaWeatherReport",
  pos = { x = 0, y = 0 },
  pixel_size = { w = 67, h = 95 },
  display_size = { w = 67, h = 75 },
  keep_on_use = function(self, card) return true end,
  can_use = function(self, card)
    return G.GAME.blind and G.GAME.blind.in_blind
  end,
  -- to do: come up with better extinct message
  destroy_at_end_of_round = function(self, card, context)
    if context.end_of_round and context.main_eval and not context.blueprint and context.game_over == false then
      if not next(SMODS.find_card("j_abn_baba_joker")) then
        SMODS.calculate_context({ abn_weather_destroyed_but_not_triggered = true, card = card }) -- we love long contexts
        SMODS.calculate_effect({ message = localize("k_extinct_ex") }, card)
        SMODS.destroy_cards(card, nil, nil, true)
        set_consumeable_usage(card)
      end
    end
    
  end,
  abn_artist_credits = {
    artist = "matheo000"
  },
})

-- Remove use button if passive effect
local use_and_sell_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
  local buttons = use_and_sell_ref(card)
  if card.ability and card.ability.set == "weather_report" and not card.config.center.use and card.area == G.pack_cards and G.pack_cards then
    return {
      n = G.UIT.ROOT,
      config = { padding = 0, colour = G.C.CLEAR },
      nodes = {
        {
          n = G.UIT.R,
          config = { ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5 * card.T.w - 0.15, maxw = 0.9 * card.T.w - 0.15, minh = 0.3 * card.T.h, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'use_card', func = 'can_select_card' },
          nodes = {
            { n = G.UIT.T, config = { text = localize('b_select'), colour = G.C.UI.TEXT_LIGHT, scale = 0.45, shadow = true } }
          }
        },
      }
    }
  end
  if card.ability and card.ability.set == "weather_report" and not card.config.center.use then
    local sell = {
      n = G.UIT.ROOT,
      config = { padding = 0, colour = G.C.CLEAR },
      nodes = {
        {
          n = G.UIT.C,
          config = { padding = 0.15, align = 'cl' },
          nodes = {
            buttons.nodes[1].nodes[1]
          }
        },
      }
    }
    return sell
  end

  return buttons
end

ABN.WeatherReport {
  key = "clear_sky",
  pos = { x = 1, y = 0 },

  config = { extra = { repetitions = 1 } },
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      if context.other_card.config.center == G.P_CENTERS.c_base then
        return {
          repetitions = card.ability.extra.repetitions,
        }
      end
    end
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "cloudz", -- haha get it cause cloudzXIII :p
  pos = { x = 2, y = 0 },
  config = { max_highlighted = 1 },
  can_use = function(self, card)
    return G.GAME.blind and G.GAME.blind.in_blind
        and G.jokers and #G.jokers.highlighted == 1
        and #G.jokers.cards > 1
  end,
  keep_on_use = function(self, card) return false end,
  use = function(self, card, area, copier)
    local jokers = {}
    for i = 1, #G.jokers.cards do
      if G.jokers.cards[i] ~= G.jokers.highlighted[1] then
        jokers[#jokers + 1] = G.jokers.cards[i]
      end
    end

    G.jokers.highlighted[1].getting_sliced = true
    G.E_MANAGER:add_event(Event({
      func = function()
        card:juice_up(0.8, 0.8)
        G.jokers.highlighted[1]:start_dissolve({ G.C.RED }, nil, 1.6)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.5,
      func = function()
        if #G.jokers.cards < G.jokers.config.card_limit then
          local chosen_joker = pseudorandom_element(jokers, 'abn_cloudzxiii')
          local copied_joker = copy_card(chosen_joker)
          copied_joker:add_to_deck()
          G.jokers:emplace(copied_joker)
          SMODS.calculate_effect({ message = localize("k_duplicated_ex") }, card)
        end
        G.jokers:unhighlight_all()
        return true
      end
    }))
    delay(0.6)
  end,
  calculate = function(self, card, context)
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "rain",
  pos = { x = 3, y = 0 },
  config = { extra = { uses = 4 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.uses } }
  end,
  can_use = function(self, card)
    return G.GAME.blind and G.GAME.blind.in_blind
        and G.hand and #G.hand.cards > 0
        and card.ability.extra.uses > 0
  end,
  keep_on_use = function(self, card)
    card.ability.extra.uses = card.ability.extra.uses - 1
    return card.ability.extra.uses > 0
  end,
  use = function(self, card, area, copier)
    local source = pseudorandom_element(G.hand.cards, 'abn_rain')
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        if source then
          G.playing_card = (G.playing_card and G.playing_card + 1) or 1
          local copy = copy_card(source, nil, nil, G.playing_card)
          copy:add_to_deck()
          G.deck.config.card_limit = G.deck.config.card_limit + 1
          table.insert(G.playing_cards, copy)
          G.hand:emplace(copy)
          copy:start_materialize()
          SMODS.calculate_context({ playing_card_added = true, cards = { copy } })
        end
        return true
      end
    }))
    delay(0.5)
  end,
  calculate = function(self, card, context)
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "snow",
  pos = { x = 4, y = 0 },
  config = { extra = { discards = 1 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return {
      vars = {
        cae.discards
      }
    }
  end,
  calculate = function(self, card, context)
    if context.setting_blind then
      ease_discard(card.ability.extra.discards)
    end
    if context.after and context.main_eval and not context.blueprint then
      for _, v in ipairs(context.full_hand) do
        if not v:is_suit("abn_Snow") then
          SMODS.destroy_cards(v)
        end
      end
    end
    self:destroy_at_end_of_round(card, context)
  end,
  add_to_deck = function(self, card, from_debuff)
    if G.GAME.blind and G.GAME.blind.in_blind then
      ease_discard(card.ability.extra.discards)
    end
  end
}

ABN.WeatherReport {
  key = "storm",
  pos = { x = 5, y = 0 },
  config = { max_highlighted = 2 },
  can_use = function(self, card)
    return G.GAME.blind and G.GAME.blind.in_blind and G.hand and #G.hand.highlighted > 0 and
        #G.hand.highlighted <= card.ability.max_highlighted
  end,
  keep_on_use = function(self, card) return false end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        card:juice_up(0.3, 0.5)
        local cen_pool = {}
        for _, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
          if not v.overrides_base_rank then
            cen_pool[#cen_pool + 1] = v.key
          end
        end
        for i = 1, #G.hand.highlighted do
          local enhancement = SMODS.poll_enhancement({
            guaranteed = true,
            options = cen_pool,
            key = "abn_storm_enhancement"
          })
          local edition = SMODS.poll_edition({ guaranteed = true, no_negative = true, key = "abn_storm_edition" })
          local seal = SMODS.poll_seal({ guaranteed = true, key = "abn_storm_seal" })

          G.hand.highlighted[i]:set_edition(edition, true)
          G.hand.highlighted[i]:set_seal(seal, nil, true)
          G.hand.highlighted[i]:set_ability(enhancement)
        end
        G.hand:unhighlight_all()
        return true
      end
    }))
    delay(0.6)
  end,
  calculate = function(self, card, context)
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport { -- to do
  key = "wind",
  pos = { x = 0, y = 1 },
  config = {},
  can_use = function(self, card)
    return G.GAME.blind and G.GAME.blind.in_blind
        and G.hand and #G.hand.cards > 0
  end,
  keep_on_use = function(self, card) return false end,
  use = function(self, card, area, copier)
    local non_selected = {}
    for _, c in ipairs(G.hand.cards) do
      if not c.highlighted then
        non_selected[#non_selected + 1] = c
      end
    end

    for _, c in ipairs(non_selected) do
      draw_card(G.hand, G.discard, 100, 'down', false, c)
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        SMODS.draw_cards(#non_selected)
        return true
      end
    }))
    delay(0.6)
  end,
  calculate = function(self, card, context)
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "hail",
  pos = { x = 1, y = 1 },
  config = { extra = { base = 1, odds = 2 } },
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.base, card.ability.extra.odds,
      'abn_hail')
    return { vars = { numerator, denominator } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round then
      if SMODS.pseudorandom_probability(card, 'abn_hail', card.ability.extra.base, card.ability.extra.odds, 'abn_hail') then
        SMODS.destroy_cards(context.other_card)
        return nil, true
      end
    end
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "fog",
  pos = { x = 2, y = 1 },
  config = { extra = { xmult = 6 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,
  calculate = function(self, card, context)
    if context.stay_flipped and context.to_area == G.hand then
      return { stay_flipped = true }
    end
    if context.joker_main then
      return { x_mult = card.ability.extra.xmult }
    end
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "rainbow",
  pos = { x = 3, y = 1 },
  config = { extra = { amount = 3 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.amount } }
  end,
  can_use = function(self, card)
    return G.GAME.blind and G.GAME.blind.in_blind
        and G.hand and #G.hand.cards > 0 and next(SMODS.Edition:get_edition_cards(G.hand, true))
  end,
  keep_on_use = function(self, card) return false end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        for i = 1, card.ability.extra.amount do
          local edition = SMODS.poll_edition { key = "abn_rainbow", guaranteed = true, no_negative = true }
          local editionless = {}
          for _, v in ipairs(G.hand.cards) do
            if not v.edition then
              editionless[#editionless + 1] = v
            end
          end
          local card_to_enhance = pseudorandom_element(editionless, "abn_rainbow")
          if card_to_enhance then
            card_to_enhance:set_edition(edition, true)
            card:juice_up(0.3, 0.5)
          end
        end
        return true
      end
    }))
  end,
  calculate = function(self, card, context)
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "tornado",
  pos = { x = 4, y = 1 },
  config = { extra = { hands = 1 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.hands } }
  end,
  calculate = function(self, card, context)
    if context.setting_blind then
      ease_hands_played(card.ability.extra.hands)
    end
    if context.discard then
      SMODS.destroy_cards(context.other_card)
    end
    self:destroy_at_end_of_round(card, context)
  end,
  add_to_deck = function(self, card, from_debuff)
    if G.GAME.blind.in_blind then
      G.E_MANAGER:add_event(Event({
        func = function()
          ease_hands_played(card.ability.extra.hands)
          return true
        end
      }))
    end
  end
}

ABN.WeatherReport {
  key = "hurricane",
  pos = { x = 5, y = 1 },
  config = { extra = { count = 5 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
    local cae = card.ability.extra
    return { vars = { cae.count } }
  end,
  can_use = function(self, card)
    return G.GAME.blind and G.GAME.blind.in_blind
        and #G.deck.cards > 0
  end,
  keep_on_use = function(self, card) return false end,
  use = function(self, card, area, copier)
    local normal_cards = {}
    for _, c in ipairs(G.hand.cards) do
      normal_cards[#normal_cards + 1] = c
    end

    for i = 1, card.ability.extra.count do
      draw_card(G.deck, G.hand, i * 100 / card.ability.extra.count, 'up', true)
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.6,
      func = function()
        for _, held in ipairs(G.hand.cards) do
          local just_drawn = true
          for _, old_card in ipairs(normal_cards) do
            if held == old_card then
              just_drawn = false
              break
            end
          end
          if just_drawn then
            held:flip()
            held.ability.abn_perma_flipped = true
          end
        end
        return true
      end
    }))
    delay(0.8)
  end,
  calculate = function(self, card, context)
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "ash_cloud",
  pos = { x = 0, y = 2 },
  config = { extra = { hands = 1 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    local cae = card.ability.extra
    return { vars = { cae.hands } }
  end,
  calculate = function(self, card, context)
    if context.setting_blind then
      G.E_MANAGER:add_event(Event({
        func = function()
          ease_hands_played(card.ability.extra.hands)
          SMODS.calculate_effect(
            { message = localize { type = 'variable', key = 'a_hands', vars = { card.ability.extra.hands } } },
            card)
          return true
        end
      }))
    end
    if context.debuff_card and ABN.is_light(context.debuff_card) then
      return { debuff = true }
    end
    self:destroy_at_end_of_round(card, context)
  end,
  add_to_deck = function(self, card, from_debuff)
    if G.GAME.blind.in_blind then
      G.E_MANAGER:add_event(Event({
        func = function()
          ease_hands_played(card.ability.extra.hands)
          return true
        end
      }))
    end
  end
}

ABN.WeatherReport {
  key = "drought_weather",
  pos = { x = 1, y = 2 },
  can_use = function(self, card)
    if not (G.GAME.blind and G.GAME.blind.in_blind) then return false end
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("Clubs") then return true end
    end
    return false
  end,
  keep_on_use = function(self, card) return false end,
  use = function(self, card, area, copier)
    local clubs = {}
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("Clubs") then
        clubs[#clubs + 1] = c
      end
    end

    for _, c in ipairs(clubs) do
      SMODS.destroy_cards(c)
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        SMODS.draw_cards(#clubs)
        return true
      end
    }))

    delay(0.8)
  end,
  calculate = function(self, card, context)
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "frigid",
  pos = { x = 2, y = 2 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    return {
      vars = {

      }
    }
  end,
  calculate = function(self, card, context)
    if context.before then
      for _, v in ipairs(context.scoring_hand) do
        if ABN.is_light(v) then
          local edition = SMODS.poll_edition({ guaranteed = true, no_negative = true, key = "abn_frigid" })
          v:set_edition(edition, true)
        end
      end
    end
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "pollen",
  pos = { x = 3, y = 2 },
  can_use = function(self, card)
    if not (G.GAME.blind and G.GAME.blind.in_blind) then return false end
    for _, c in ipairs(G.hand.cards) do
      if c.ability.set == "Enhanced" then
        return true
      end
    end
    return false
  end,
  keep_on_use = function(self, card) return false end,
  use = function(self, card, area, copier)
    local enhanced = {}
    for _, c in ipairs(G.hand.cards) do
      if c.ability.set == "Enhanced" then
        enhanced[#enhanced + 1] = c
      end
    end
    for _, c in ipairs(enhanced) do
      draw_card(G.hand, G.discard, 100, 'down', false, c)
    end
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        SMODS.draw_cards(#enhanced)
        return true
      end
    }))
    delay(0.7)
  end,

  calculate = function(self, card, context)
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "blizzard_weather",
  pos = { x = 4, y = 2 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    return {
      vars = {

      }
    }
  end,
  calculate = function(self, card, context)
    if context.before then
      for _, v in ipairs(context.scoring_hand) do
        if ABN.is_dark(v) then
          local edition = SMODS.poll_edition({ guaranteed = true, no_negative = true, key = "abn_frigid" })
          v:set_edition(edition, true)
        end
      end
    end
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "sandstorm",
  pos = { x = 5, y = 2 },
  can_use = function(self, card)
    if not (G.GAME.blind and G.GAME.blind.in_blind) then return false end
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("abn_Snow") then return true end
    end
    return false
  end,
  keep_on_use = function(self, card) return false end,
  use = function(self, card, area, copier)
    local snows = {}
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("abn_Snow") then
        snows[#snows + 1] = c
      end
    end

    for _, c in ipairs(snows) do
      SMODS.destroy_cards(c)
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        SMODS.draw_cards(#snows)
        return true
      end
    }))

    delay(0.8)
  end,
  calculate = function(self, card, context)
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "smog",
  pos = { x = 0, y = 3 },
  can_use = function(self, card)
    if not (G.GAME.blind and G.GAME.blind.in_blind) then return false end
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("Hearts") then return true end
    end
    return false
  end,
  keep_on_use = function(self, card) return false end,
  use = function(self, card, area, copier)
    local hearts = {}
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("Hearts") then
        hearts[#hearts + 1] = c
      end
    end

    for _, c in ipairs(hearts) do
      SMODS.destroy_cards(c)
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        SMODS.draw_cards(#hearts)
        return true
      end
    }))

    delay(0.8)
  end,
  calculate = function(self, card, context)
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "dust_devil",
  pos = { x = 1, y = 3 },
  can_use = function(self, card)
    if not (G.GAME.blind and G.GAME.blind.in_blind) then return false end
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("Spades") then return true end
    end
    return false
  end,
  keep_on_use = function(self, card) return false end,
  use = function(self, card, area, copier)
    local spades = {}
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("Spades") then
        spades[#spades + 1] = c
      end
    end

    for _, c in ipairs(spades) do
      SMODS.destroy_cards(c)
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        SMODS.draw_cards(#spades)
        return true
      end
    }))

    delay(0.8)
  end,
  calculate = function(self, card, context)
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "acid_rain",
  pos = { x = 2, y = 3 },
  can_use = function(self, card)
    if not (G.GAME.blind and G.GAME.blind.in_blind) then return false end
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("Diamonds") then return true end
    end
    return false
  end,
  keep_on_use = function(self, card) return false end,
  use = function(self, card, area, copier)
    local diamonds = {}
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("Diamonds") then
        diamonds[#diamonds + 1] = c
      end
    end

    for _, c in ipairs(diamonds) do
      SMODS.destroy_cards(c)
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        SMODS.draw_cards(#diamonds)
        return true
      end
    }))

    delay(0.8)
  end,
  calculate = function(self, card, context)
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "fire_rainbow",
  pos = { x = 3, y = 3 },
  config = { extra = { triggered = false, spectrum_played = false, type = "abn_Spectrum" } },
  can_use = function(self, card)
    return G.GAME.blind and G.GAME.blind.in_blind and not card.ability.extra.triggered
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        card.ability.extra.triggered = true
        SMODS.calculate_effect({ message = localize('k_active_ex'), colour = G.C.FILTER }, card)
        return true
      end
    }))
    delay(0.4)
  end,
  calculate = function(self, card, context)
    if card.ability.extra.triggered then
      if context.before and next(context.poker_hands[card.ability.extra.type]) then
        card.ability.extra.triggered = false
        card.ability.extra.spectrum_played = true
        SMODS.calculate_effect({ message = localize('k_level_up_ex'), colour = G.C.FILTER }, card)
        SMODS.smart_level_up_hand(card, context.scoring_name)
      end
      if context.destroy_card and context.cardarea == G.play and card.abiity.extra.spectrum_played then
        return {
          remove = true
        }
      end
      --[[ hmm should it be destroyed after use?
      if context.after and context.main_eval and not context.blueprint and card.ability.extra.spectrum_played then
        SMODS.destroy_cards(card)
      end
      --]]
    end
    self:destroy_at_end_of_round(card, context)
  end,
}

ABN.WeatherReport {
  key = "dew",
  pos = { x = 4, y = 3 },
  config = { extra = { hands = 1 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    local cae = card.ability.extra
    return { vars = { cae.hands } }
  end,
  calculate = function(self, card, context)
    if context.setting_blind then
      G.E_MANAGER:add_event(Event({
        func = function()
          ease_hands_played(card.ability.extra.hands)
          SMODS.calculate_effect(
            { message = localize { type = 'variable', key = 'a_hands', vars = { card.ability.extra.hands } } },
            card)
          return true
        end
      }))
    end
    if context.debuff_card and ABN.is_dark(context.debuff_card) then
      return { debuff = true }
    end
    self:destroy_at_end_of_round(card, context)
  end,
  add_to_deck = function(self, card, from_debuff)
    if G.GAME.blind and G.GAME.blind.in_blind then
      G.E_MANAGER:add_event(Event({
        func = function()
          ease_hands_played(card.ability.extra.hands)
          return true
        end
      }))
    end
  end
}
