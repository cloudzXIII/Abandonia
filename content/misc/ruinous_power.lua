SMODS.ConsumableType {
  key = "ruinous_power",
  collection_rows = { 5, 5 },
  shop_rate = 0.0,
  primary_colour = HEX("b26370"),
  secondary_colour = HEX("272727"),
}

SMODS.UndiscoveredSprite {
  key = 'ruinous_power',
  atlas = 'abn_AbandoniaUndiscovered',
  pos = { x = 3, y = 1 },
}

local use_and_sell_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
  local buttons = use_and_sell_ref(card)

  if card.area == G.ruinous_powers then
    return {
      n = G.UIT.ROOT, config = { padding = 0, colour = G.C.CLEAR }, nodes = {}
    }
  end

  return buttons
end

ABN.states = {
  slot_visible = 1,
  areas_moving = false
}

ABN.custom_card_areas = function(game)
  game.ruinous_powers = CardArea(
    game.consumeables.T.x, game.consumeables.T.y - 4,
    game.consumeables.T.w, game.consumeables.T.h,
    { card_limit = 1, type = 'ruinous_powers_hide', highlight_limit = 1 }
  )
  game.ruinous_powers.config.align_buttons = true
  -- below was put cause the game was crashing without it?
  game.ruinous_powers.config.card_limits = game.ruinous_powers.config.card_limits or {}
  game.ruinous_powers.config.card_limits.extra_slots_used = game.ruinous_powers.config.card_limits.extra_slots_used
      or 0


  ABN.states.slot_visible = 1
  ABN.animate_areas()
end

function ABN.animate_areas(animate)
  ABN.states.areas_moving = true
  if ABN.states.slot_visible == -1 then
    ease_alignment('consumeables', 0, -4, true, animate)
    ease_alignment('ruinous_powers', -4, 0, nil, animate)
  else
    ease_alignment('ruinous_powers', 0, -4, true, animate)
    ease_alignment('consumeables', -4, 0, nil, animate)
  end
  G.E_MANAGER:add_event(Event({
    func = function()
      ABN.states.areas_moving = false
      return true;
    end
  }))
end

function ease_alignment(area, from_value, to_value, hide, instant, type)
  type = type or 'y'
  if not G[area] then return end
  if instant then
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      blocking = true,
      blockable = false,
      func = function()
        G[area].T[type] = to_value
        G[area].VT[type] = to_value
        G[area].config.type = hide and 'ruinous_powers_hide' or 'joker'
        return true;
      end
    }))
  else
    if not hide then
      G[area].VT[type] = from_value
      G[area].T[type] = from_value
      G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        blocking = true,
        blockable = false,
        func = function()
          G[area].config.type = 'joker'
          return true
        end
      }))
    end
    G.E_MANAGER:add_event(Event({
      trigger = 'ease',
      delay = 0.7,
      blocking = false,
      blockable = false,
      ref_table = G[area].T,
      ref_value = type,
      ease_to = to_value,
      func = (function(t) return t end)
    }))
    if hide then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.7,
        blocking = true,
        blockable = false,
        func = function()
          G[area].config.type = 'ruinous_powers_hide'
          G[area].T[type] = to_value
          return true
        end
      }))
    end
  end
end

local abn_card_area_emplace = CardArea.emplace
function CardArea:emplace(card, location, stay_flipped)
  if (self == G.consumeables and ABN.states.slot_visible ~= 1) or (self == G.ruinous_powers and ABN.states.slot_visible ~= -1) then
    G.FUNCS.toggle_consumeables_ruinous()
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = function()
        abn_card_area_emplace(self, card, location, stay_flipped)
        return true
      end
    }))
    return
  end
  abn_card_area_emplace(self, card, location, stay_flipped)
end

G.FUNCS.toggle_consumeables_ruinous = function(e)
  ABN.states.slot_visible = ABN.states.slot_visible * -1
  play_sound('paper1')
  ABN.animate_areas()
end

G.FUNCS.abn_can_toggle_consumeables_ruinous = function(e)
  if not ABN.states.areas_moving and not (not skip_check and ((G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0))) then
    e.config.colour = G.C.SECONDARY_SET.ruinous_power
    e.config.button = 'toggle_consumeables_ruinous'
  else
    e.config.colour = G.C.UI.BACKGROUND_INACTIVE
    e.config.button = nil
  end
end

local abn_card_juice_up = Card.juice_up
function Card:juice_up(scale, rot)
  if self.area and not self.states.hover.is and ((self.area == G.consumeables and ABN.states.slot_visible ~= 1) or (self.area == G.ruinous_powers and ABN.states.slot_visible ~= -1)) and not self.juicing_until then
    G.FUNCS.toggle_consumeables_ruinous()
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.7,
      func = function()
        return true
      end
    }), nil, true)
  end
  abn_card_juice_up(self, scale, rot)
end

local abn_card_start_dissolve = Card.start_dissolve
function Card:start_dissolve(...)
  if self.area and not self.states.hover.is and ((self.area == G.consumeables and ABN.states.slot_visible ~= 1) or (self.area == G.ruinous_powers and ABN.states.slot_visible ~= -1)) then
    G.FUNCS.toggle_consumeables_ruinous()
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.7,
      func = function()
        return true
      end
    }), nil, true)
  end
  abn_card_start_dissolve(self, ...)
end

local abn_card_eval_status_text = card_eval_status_text
function card_eval_status_text(card, ...)
  G.E_MANAGER:add_event(Event({
    trigger = 'immediate',
    func = function()
      if ((card.area == G.consumeables and ABN.states.slot_visible ~= 1) or (card.area == G.ruinous_powers and ABN.states.slot_visible ~= -1)) then
        G.FUNCS.toggle_consumeables_ruinous()
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.7,
          func = function()
            return true
          end
        }), nil, true)
      end
      return true
    end
  }))
  abn_card_eval_status_text(card, ...)
end

--#endregion


SMODS.Consumable {
  key = "elder_sign",
  set = "ruinous_power",
  config = { extra = { e_mult = 2.5, min_deck_size = 15, used_up = false } },
  pos = { x = 0, y = 0 },
  soul_pos = { x = 0, y = 1 },
  atlas = "AbandoniaRuin",
  cost = 4,
  discovered = false,
  hidden = true,
  soul_set = "calamity_cards",
  soul_rate = 0.035,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.e_mult, card.ability.extra.min_deck_size } }
  end,

  can_use = function(self, card)
    if card.area == G.consumeables or card.area == G.pack_cards then
      if G.ruinous_powers and #G.ruinous_powers.cards < G.ruinous_powers.config.card_limit then
        return true
      end
    end
    return false
  end,

  -- Moves card into G.ruinous_powers when 'USE' is pressed
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      func = function()
        local copy = copy_card(card)
        G.ruinous_powers:emplace(copy)
        return true
      end
    }))
  end,

  calculate = function(self, card, context)
    -- Only trigger passive effects if sitting in the custom area
    if card.area ~= G.ruinous_powers then return end

    -- emult
    if context.individual and context.cardarea == G.play then
      return {
        e_mult = card.ability.extra.e_mult,
        card = card
      }
    end


    if context.destroying_card and context.scoring_hand then
      return true
    end

    -- Self-destruct
    if G.playing_cards and #G.playing_cards < card.ability.extra.min_deck_size and not card.ability.extra.used_up then
      card.ability.extra.used_up = true
      card:start_dissolve()
    end
  end,

  abn_artist_credits = {
    artist = "0kronix",
  },
}

SMODS.Consumable {
  key = "yellow_sign",
  set = "ruinous_power",
  config = { extra = { reduction_pct = 0.90, min_deck_size = 15, used_up = false } },
  pos = { x = 1, y = 0 },
  soul_pos = { x = 1, y = 1 },
  atlas = "AbandoniaRuin",
  cost = 4,
  discovered = false,
  hidden = true,
  soul_set = "calamity_cards",
  soul_rate = 0.035,

  loc_vars = function(self, info_queue, card)
    return { vars = { (1 - card.ability.extra.reduction_pct) * 100, card.ability.extra.min_deck_size } }
  end,

  can_use = function(self, card)
    if card.area == G.consumeables or card.area == G.pack_cards then
      if G.ruinous_powers and #G.ruinous_powers.cards < G.ruinous_powers.config.card_limit then
        return true
      end
    end
    return false
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      func = function()
        local copy = copy_card(card)
        G.ruinous_powers:emplace(copy)
        return true
      end
    }))
  end,

  calculate = function(self, card, context)
    -- Only trigger passive effects if sitting in the custom area
    if card.area ~= G.ruinous_powers then return end

    if context.individual and context.cardarea == G.play then
      local currentCard = context.other_card
      if currentCard and G.GAME.blind then
        local new_chips = G.GAME.blind.chips * card.ability.extra.reduction_pct

        if new_chips < 1 then
          new_chips = 0
        end

        G.GAME.blind.chips = new_chips
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

        currentCard:juice_up()

        return {
          extra = { message = "-10%!", colour = G.C.MULT },
          colour = G.C.MULT,
          card = currentCard
        }
      end
    end

    if context.before and context.scoring_hand and #context.scoring_hand > 0 then
      local destroy_count = #context.scoring_hand
      local destroyed_cards = {}

      local available_deck = {}
      for _, c in ipairs(G.playing_cards) do
        if not c.destroyed then
          table.insert(available_deck, c)
        end
      end

      pseudoshuffle(available_deck, pseudoseed('yellow_sign'))

      for i = 1, math.min(destroy_count, #available_deck) do
        available_deck[i].destroyed = true
        table.insert(destroyed_cards, available_deck[i])
      end

      if #destroyed_cards > 0 then
        G.E_MANAGER:add_event(Event({
          func = function()
            for _, c in ipairs(destroyed_cards) do
              c:start_dissolve()
            end
            return true
          end
        }))
      end
    end

    -- Self-destruct
    if G.playing_cards and #G.playing_cards < card.ability.extra.min_deck_size and not card.ability.extra.used_up then
      card.ability.extra.used_up = true
      card:start_dissolve()
    end
  end,

  abn_artist_credits = {
    artist = "0kronix",
  },
}

SMODS.Consumable {
  key = "sacrifice_brand",
  set = "ruinous_power",
  config = { extra = { e_mult = 1.5, e_chips = 1.3, } },
  pos = { x = 2, y = 0 },
  soul_pos = { x = 2, y = 1 },
  atlas = "AbandoniaRuin",
  cost = 4,
  discovered = false,
  hidden = true,
  soul_set = "calamity_cards",
  soul_rate = 0.035,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.j_joker
    return { vars = { card.ability.extra.e_chips, card.ability.extra.e_mult, } }
  end,

  can_use = function(self, card)
    if card.area == G.consumeables or card.area == G.pack_cards then
      if G.ruinous_powers and #G.ruinous_powers.cards < G.ruinous_powers.config.card_limit then
        return true
      end
    end
    return false
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      func = function()
        local copy = copy_card(card)
        G.ruinous_powers:emplace(copy)
        return true
      end
    }))
  end,

  calculate = function(self, card, context)
    if card.area ~= G.ruinous_powers then return end

    if context.setting_blind then
      if G.jokers and #G.jokers.cards > 0 then
        local destructible_jokers = {}
        for _, j in ipairs(G.jokers.cards) do
          if not j.ability.eternal then
            table.insert(destructible_jokers, j)
          end
        end

        if #destructible_jokers >= 2 then
          pseudoshuffle(destructible_jokers, pseudoseed('sacrifice_brand_destroy'))
          for i = 1, 2 do
            destructible_jokers[i]:start_dissolve()
          end

          -- Spawn Base Joker
          G.E_MANAGER:add_event(Event({
            func = function()
              local base_joker = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_joker')
              base_joker:add_to_deck()
              G.jokers:emplace(base_joker)
              return true
            end
          }))

          -- Legendary Pool Spawn
          local pool = {
            "j_abn_jenson", "j_abn_arkham", "j_abn_jennia", "j_abn_mike_jester",
            "j_abn_july_jester", "j_abn_mikhail_jester", "j_abn_robert_jester",
            "j_abn_jerry_jester", "j_abn_reggy_jester", "j_abn_mitch_jester",
            "j_abn_zack_comic", "j_abn_corbin_clown", "j_abn_maurice_jester",
            "j_abn_freddy_jester", "j_abn_klyde_clown", "j_abn_conrad_joker",
            "j_abn_faruk_jester", "j_abn_jinxie", "j_abn_brulio_buffoon",
            "j_abn_rando_jester", "j_abn_curtis_clown", "j_abn_mateo_mime",
            "j_abn_dimitri_jester"
          }

          local chosen_key = pseudorandom_element(pool, pseudoseed('sacrifice_brand_spawn'))

          G.E_MANAGER:add_event(Event({
            func = function()
              local custom_joker = create_card('Joker', G.jokers, nil, nil, nil, nil, chosen_key)
              custom_joker:add_to_deck()
              G.jokers:emplace(custom_joker)
              return true
            end
          }))

          card:juice_up()
        end
      end
    end

    if context.other_joker then
      return {
        e_mult = card.ability.extra.e_mult,
        e_chips = card.ability.extra.e_chips,
        card = card
      }
    end

    if context.end_of_round and context.main_eval and not context.blueprint and G.GAME.blind and G.GAME.blind.boss then
      if G.jokers and #G.jokers.cards < 5 then
        card:start_dissolve()
      end
    end
  end,

  abn_artist_credits = {
    artist = "0kronix",
  },
}

SMODS.Consumable {
  key = "hunter_rune",
  set = "ruinous_power",
  config = { extra = { e_mult = 1.8 } },
  pos = { x = 3, y = 0 },
  soul_pos = { x = 3, y = 1 },
  atlas = "AbandoniaRuin",
  cost = 4,
  discovered = false,
  hidden = true,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.e_mult } }
  end,

  can_use = function(self, card)
    if card.area == G.consumeables or card.area == G.pack_cards then
      if G.ruinous_powers and #G.ruinous_powers.cards < G.ruinous_powers.config.card_limit then
        return true
      end
    end
    return false
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      func = function()
        local copy = copy_card(card)
        G.ruinous_powers:emplace(copy)
        return true
      end
    }))
  end,

  calculate = function(self, card, context)
    if card.area ~= G.ruinous_powers then return end

    if context.setting_blind then
      local consumable_count = 0
      if G.consumeables and G.consumeables.cards then
        consumable_count = #G.consumeables.cards
      end

      if consumable_count == 0 then
        -- Search active jokers for ruinous_joker
        local ruinous = nil
        if G.jokers and G.jokers.cards then
          for _, j in ipairs(G.jokers.cards) do
            if j.config.center.key == "j_abn_ruinous_joker" then
              ruinous = j
              break
            end
          end
        end

        if ruinous then
          -- Joker exists: Destroy it and show "Saved!" animation
          card_eval_status_text(ruinous, 'extra', nil, nil, nil, {
            message = localize('k_saved_ex'),
            colour = G.C.RED
          })

          G.E_MANAGER:add_event(Event({
            func = function()
              ruinous:start_dissolve()
              return true
            end
          }))
        else
          -- No joker: Game Over
          G.E_MANAGER:add_event(Event({
            func = function()
              G.STATE = G.STATES.GAME_OVER
              G.STATE_COMPLETE = false
              return true
            end
          }))
        end
      end
    end

    if context.other_consumeable and context.other_consumeable ~= card then
      return {
        e_mult = card.ability.extra.e_mult,
        card = card
      }
    end

    if context.end_of_round and context.main_eval and not context.blueprint then
      if G.consumeables and #G.consumeables.cards > 0 then
        for _, c in ipairs(G.consumeables.cards) do
          c:start_dissolve()
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "0kronix",
  },
}

SMODS.Consumable {
  key = "geas_mark",
  set = "ruinous_power",
  config = { extra = { suit = nil, e_mult = 2, e_chips = 2 } },
  pos = { x = 5, y = 0 },
  soul_pos = { x = 5, y = 1 },
  atlas = "AbandoniaRuin",
  cost = 4,
  discovered = false,
  hidden = true,
  soul_set = "calamity_cards",
  soul_rate = 0.035,

  loc_vars = function(self, info_queue, card)
    local chosen_suit = card.ability.extra.suit and localize(card.ability.extra.suit, 'suits_singular') or "[suit]"
    return { vars = { chosen_suit, card.ability.extra.e_mult, card.ability.extra.e_chips, colours = { G.C.SUITS[card.ability.extra.suit] or G.C.UI.TEXT_INACTIVE } } }
  end,

  can_use = function(self, card)
    if card.area == G.consumeables or card.area == G.pack_cards then
      if G.ruinous_powers and #G.ruinous_powers.cards < G.ruinous_powers.config.card_limit then
        return true
      end
    end
    return false
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      func = function()
        local copy = copy_card(card)
        G.ruinous_powers:emplace(copy)
        return true
      end
    }))
  end,

  calculate = function(self, card, context)
    if card.area ~= G.ruinous_powers then return end

    if context.setting_blind then
      local available_suits = {}
      local seen = {}

      if G.playing_cards then
        for _, c in ipairs(G.playing_cards) do
          local s = c.base.suit
          if s and not seen[s] then
            table.insert(available_suits, s)
            seen[s] = true
          end
        end
      end

      if #available_suits > 0 then
        card.ability.extra.suit = pseudorandom_element(available_suits, pseudoseed('geas_mark'))
        return {
          message = localize(card.ability.extra.suit, 'suits_singular'),
          colour = G.C.SUITS[card.ability.extra.suit] or G.C.FILTER,
          card = card
        }
      end
    end

    if context.before then
      if card.ability.extra.suit then
        local scored_suit = false

        for _, played_card in ipairs(context.scoring_hand) do
          if played_card:is_suit(card.ability.extra.suit) then
            scored_suit = true
            break
          end
        end

        if not scored_suit then
          -- Search active jokers for ruinous_joker
          local ruinous = nil
          if G.jokers and G.jokers.cards then
            for _, j in ipairs(G.jokers.cards) do
              if j.config.center.key == "j_abn_ruinous_joker" then
                ruinous = j
                break
              end
            end
          end

          if ruinous then
            -- Joker exists: Destroy it and show "Saved!" animation
            card_eval_status_text(ruinous, 'extra', nil, nil, nil, {
              message = localize('k_saved_ex'),
              colour = G.C.RED
            })

            G.E_MANAGER:add_event(Event({
              func = function()
                ruinous:start_dissolve()
                return true
              end
            }))
          else
            -- No joker: Game Over
            G.E_MANAGER:add_event(Event({
              func = function()
                G.STATE = G.STATES.GAME_OVER
                G.STATE_COMPLETE = false
                return true
              end
            }))
          end
        end
      end
    end

    if context.joker_main and card.ability.extra.suit then
      local has_suit = false
      for _, played_card in ipairs(context.scoring_hand) do
        if played_card:is_suit(card.ability.extra.suit) then
          has_suit = true
          break
        end
      end

      if has_suit then
        return {
          e_mult = card.ability.extra.e_mult,
          e_chips = card.ability.extra.e_chips,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "0kronix",
  },
}
