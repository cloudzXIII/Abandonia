-- Showdown Blinds

-- art by Meladaptive
SMODS.Blind({
  key = "magenta_magnet",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 9 },
  boss_colour = HEX("9e4d6e"),
  calculate = function(self, card, context)
    -- Triggered when entering the blind
    if context.setting_blind then
      G.GAME.MagnetChips = G.GAME.blind.chips
    end

    if context.first_hand_drawn and not G.GAME.blind.disabled then
      --blind size increases by 5% for each $ in G.GAME.dollars
      local multiplier = 1 + (0.05 * math.max(0, G.GAME.dollars))

      G.GAME.blind.chips = math.floor(G.GAME.blind.chips * multiplier)
      G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end
  end,

  disable = function(self)
    G.GAME.blind.chips = G.GAME.MagnetChips
    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
  end,

  abn_artist_credits = { -- jst realized this doesnt work :D
    artist = "Meladaptive",
  },
})

SMODS.Blind({
  key = "silver_star",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 10 },
  boss_colour = HEX("9facc4"),
  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end
    if ABN.is_light(card) and not card.debuff then -- <- add hre for more debuffs
      return true
    end
  end,
})

SMODS.Blind({
  key = "gold_belt",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 11 },
  boss_colour = HEX("a79475"),
  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end
    if ABN.is_light(card) then
      return true
    end
    return false
  end,
})

SMODS.Blind({
  key = "lime_lock",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 12 },
  boss_colour = HEX("afcc87"),
  set_blind = function(self)
    self.old_chips = G.GAME.blind.chips
    local a = 1
    for k, v in pairs(G.playing_cards) do
      if v.debuff then
        a = a + 1
      end
    end
    for i = 1, a do
      G.GAME.blind.chips = G.GAME.blind.chips + ((5 / G.GAME.blind.chips) * 100)
    end
    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    self.triggered = true
  end,
  defeat = function(self)
    self.triggered = false
    self.old_chips = nil
  end,
  disable = function(self)
    self.triggered = false
    if self.old_chips then
      G.GAME.blind.chips = self.old_chips
      G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end
    self.old_chips = nil
  end,
})

SMODS.Blind({
  key = "pink_pin",
  debuff = {
    h_size_le = 3,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 13 },
  boss = { showdown = true },
  boss_colour = HEX("c78bb3"),
})

SMODS.Blind({
  key = "slate_slab",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 14 },
  boss_colour = HEX("4f6c74"),

  calculate = function(self, card, context)
    if context.modify_scoring_hand then
      if context.full_hand and #context.full_hand > 0 then
        local first_card = context.full_hand[1]
        local last_card = context.full_hand[#context.full_hand]
        if context.other_card == first_card or context.other_card == last_card then
          return {
            remove_from_hand = true
          }
        end
      end
    end
  end,
})

SMODS.Blind({
  key = "azure_circle",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 15 },
  boss_colour = HEX("302edd"),
})

SMODS.Blind({
  key = "rainbow_oracle",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 16 },
  boss_colour = HEX("e0483e"),
  debuff_hand = function(self, cards, hand, handname, check)
    local suits = {}
    for k, v in pairs(cards) do
      if not suits[v.base.suit] then
        suits[v.base.suit] = true
      end
    end
    local a = 0
    for k, v in pairs(suits) do
      a = a + 1
    end
    if a < 4 then
      return true
    end
  end,
})
-- art by Grass

-- ==========================================
-- Impostors Failure Popup Helper
-- ==========================================
local function show_impostor_fail_text()
  local disp_text = "Impostor Played!"

  G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = G.SETTINGS.GAMESPEED * 0.05,
    blockable = false,
    func = function()
      play_sound('cancel', 0.8, 1.2)
      attention_text({
        scale = 0.75,
        text = disp_text,
        maxw = 14,
        hold = G.SETTINGS.GAMESPEED * (#disp_text * 0.04 + 1.2),
        align = 'cm',
        offset = { x = 0, y = -2.5 },
        major = G.play
      })
      return true
    end
  }))
end

SMODS.Blind({
  key = "wild_cherry",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 5 },
  boss_colour = HEX("ce54cc"),
  calculate = function(self, card, context)
    -- Triggered when entering the blind
    if context.setting_blind and not G.GAME.blind.disabled then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function()
          -- Gather all cards in the deck
          local all_cards = G.deck.cards
          if not all_cards or #all_cards == 0 then return true end

          -- FILTER: Only allow cards that are NOT already impostors
          local valid_base_cards = {}
          for _, c in ipairs(all_cards) do
            if not (c.ability and c.ability.is_impostor) then
              table.insert(valid_base_cards, c)
            end
          end

          -- Fallback: If your entire deck is somehow impostors, use the whole deck to prevent a softlock
          if #valid_base_cards == 0 then valid_base_cards = all_cards end

          -- Spawns 10 impostor clones into the deck
          local num_cards = 10
          local new_cards = {}

          for i = 1, num_cards do
            -- Grab a completely random, clean base card from our filtered pool
            local base_card = pseudorandom_element(valid_base_cards, pseudoseed('impostor_choice_' .. i))
            if not base_card then break end

            -- Clone the clean card
            local new_card = copy_card(base_card)

            -- Register the new clone into the game systems
            new_card:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, new_card)
            G.deck:emplace(new_card)

            -- Set the impostor flag
            new_card.ability.is_impostor = true

            -- =========================================================
            -- STABLE VISUAL ANOMALIES (Guaranteed exactly 1 effect)
            -- =========================================================
            local rand_val = pseudorandom(pseudoseed('impostor_weird_' .. i))
            local weird_modifier = math.floor(rand_val * 5) + 1

            if weird_modifier == 1 then
              -- size adjustments
              local scale_rand = pseudorandom(pseudoseed('impostor_scale_' .. i))
              local scale_mod = (scale_rand <= 0.5 and 1.15 or 0.85)
              new_card.ability.forced_scale = scale_mod

              local old_draw = new_card.draw
              new_card.draw = function(self, layer)
                if self.T and self.ability.forced_scale then
                  self.T.w = G.CARD_W * self.ability.forced_scale
                  self.T.h = G.CARD_H * self.ability.forced_scale
                end
                if old_draw then old_draw(self, layer) end
              end
            elseif weird_modifier == 2 then
              -- weird smudge / shader anomaly
              local chosen_shader = 'negative_shine'

              -- CONDITION CHECK: If the card has a native edition, overwrite shader to 'booster'
              if base_card.edition then
                chosen_shader = 'booster'
              end

              local old_draw = new_card.draw
              new_card.draw = function(self, layer)
                if old_draw then old_draw(self, layer) end
                if self.children and self.children.center then
                  self.children.center:draw_shader(chosen_shader, nil, self.ARGS.send_to_shader)
                end
              end
            elseif weird_modifier == 3 then
              -- no rank
              new_card.base.nominal = 0
              new_card.base.suit_nominal = 0
            elseif weird_modifier == 4 then
              -- text chip anomaly
              new_card.ability.perma_bonus = -6969
            elseif weird_modifier == 5 then
              -- text mult anomaly
              new_card.ability.perma_mult = 6767
            end

            -- Start materializing the copy with visual feedback
            new_card:start_materialize(nil, nil)
            new_card:juice_up(0.6, 0.6)
            table.insert(new_cards, new_card)
          end

          playing_card_joker_effects(new_cards)
          return true
        end
      }))
    end

    -- Before scoring: Reset the hand state tracking
    if context.before then
      G.GAME.ImpostorDetected = false
      G.GAME.ImpostorPenalty = 0
    end

    -- During scoring: Look for an impostor inside the scoring hand
    if context.scoring_hand then
      for _, c in ipairs(context.scoring_hand) do
        if c.ability and c.ability.is_impostor then
          G.GAME.ImpostorDetected = true
          break
        end
      end
    end

    -- Final scoring step: Record penalty AND fire the text event ONCE
    if context.final_scoring_step and G.GAME.ImpostorDetected then
      local result = SMODS.calculate_round_score()
      G.GAME.ImpostorPenalty = result
      show_impostor_fail_text()
    end
  end,

  disable = function(self)
    -- Clean out all impostors
    for _, card in ipairs(G.playing_cards) do
      if card.ability and card.ability.is_impostor then
        card:start_dissolve()
      end
    end
    G.GAME.ImpostorDetected = false
    G.GAME.ImpostorPenalty = 0
  end,

  defeat = function(self)
    self:disable()
  end
})

-- ==========================================
-- Hook into Game.update (State Trapping)
-- ==========================================
local old_update = Game.update
function Game:update(dt)
  old_update(self, dt)

  -- Apply subtraction right after round score settles (state 3)
  if G.STATE == 3 and G.GAME.ImpostorDetected and G.GAME.blind and not G.GAME.blind.disabled then
    G.GAME.chips = G.GAME.chips - (G.GAME.ImpostorPenalty or 0)
    G.GAME.ImpostorPenalty = 0
  end

  -- Apply subtraction during game state 19 evaluations
  if G.STATE == 19 and G.GAME.ImpostorDetected and G.GAME.blind and not G.GAME.blind.disabled then
    G.GAME.chips = G.GAME.chips - (G.GAME.ImpostorPenalty or 0)
    G.GAME.ImpostorPenalty = 0
  end
end

-- ==========================================
-- Game Over Interception Hook
-- ==========================================
local old_update_game_over = Game.update_game_over
function Game:update_game_over(dt)
  local current_chips = to_big(G.GAME.chips)
  local target_chips = to_big(G.GAME.blind.chips)
  local wafer_score = to_big(G.GAME.Wafer_Score or 0)

  if current_chips >= target_chips or (wafer_score > to_big(0) and (current_chips + wafer_score) >= target_chips) then
    if G.GAME.Wafer_Score_Applied == 0 and wafer_score > to_big(0) then
      G.GAME.Wafer_Score_Applied = 1
      G.GAME.chips = G.GAME.chips + G.GAME.Wafer_Score
    end

    G.STATE = G.STATES.HAND_PLAYED
    G.STATE_COMPLETE = true
    end_round()
    G.GAME.Wafer_Score = 0
    return
  elseif G.GAME.ImpostorDetected and G.GAME.current_round.hands_left > 0 then
    if G.deck and #G.deck.cards > 0 then
      local draw_count = G.hand.config.card_limit - #G.hand.cards
      SMODS.draw_cards(draw_count)
    end

    G.GAME.ImpostorDetected = false
    G.STATE = G.STATES.SELECTING_HAND
    return
  else
    G.GAME.ImpostorDetected = false
    old_update_game_over(self, dt)
  end
end

SMODS.Blind({
  key = "teal_tear",
  debuff = {
    h_size_le = 4,
    h_size_ge = 4,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 6 },
  boss = { showdown = true },
  boss_colour = HEX("4bdbcb"),
})

SMODS.Blind({
  key = "dark_shield",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 7 },
  boss_colour = HEX("9facc4"),
  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end
    if ABN.is_dark(card) and not card.debuff then --- <- add hre for more debuffs
      return true
    end
  end,
})

SMODS.Blind({
  key = "the_crown",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 8 },
  boss_colour = HEX("db6e3b"),
  debuff_hand = function(self, cards, hand, handname, check)
    local no = true
    for k, v in pairs(cards) do
      if v:is_face() then
        no = false
      end
    end
    return no
  end,
})

SMODS.Blind({
  key = "lima_anchor",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 29 },
  boss_colour = HEX("bde35b"),

  defeat = function(self)
    G.GAME.EdgingHands = 0
  end,

  calculate = function(self, card, context)
    if context.final_scoring_step and not G.GAME.blind.disabled then
      G.GAME.EdgingHands = (G.GAME.EdgingHands or 0) + 1
      if G.GAME.EdgingHands % 2 == 1 then
        return { xchips = -1 }
      end
    end
  end,
})

-- PinkR failure popup helper
local function show_pinkr_fail_text()
  local triggered = G.GAME.PinkRTriggers or 0
  local total = G.jokers and #G.jokers.cards or 0
  local disp_text = triggered .. " / " .. total .. " Jokers triggered"

  G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = G.SETTINGS.GAMESPEED * 0.05,
    blockable = false,
    func = function()
      play_sound('whoosh1', 0.6, 0.7)
      attention_text({
        scale = 0.75,
        text = disp_text,
        maxw = 14,
        hold = G.SETTINGS.GAMESPEED * (#disp_text * 0.04 + 1.2),
        align = 'cm',
        offset = { x = 0, y = -1 },
        major = G.play
      })
      return true
    end
  }))
end

SMODS.Blind({
  key = "pink_r",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 37 },
  boss_colour = HEX("e074a2"),

  in_pool = function(self)
    return G.jokers and #G.jokers.cards > 0
  end,

  calculate = function(self, card, context)
    -- Before scoring: reset counters
    if context.before then
      G.GAME.PinkRTriggers = 0
      G.GAME.PinkRFailed = false
      G.GAME.PinkRPenalty = 0
    end

    -- Each Joker trigger
    if context.post_trigger and not context.blueprint then
      G.GAME.PinkRTriggers = (G.GAME.PinkRTriggers or 0) + 1
    end

    -- After scoring: check success
    if context.after then
      local total_jokers = #G.jokers.cards
      local triggered = G.GAME.PinkRTriggers or 0
      G.GAME.PinkRFailed = (triggered < total_jokers)
    end

    -- Final scoring step: record the score to potentially subtract it later
    if context.final_scoring_step then
      local result = SMODS.calculate_round_score()
      G.GAME.PinkRPenalty = result
    end
  end,
  abn_artist_credits = {
    artist = "smoliconboi",
  },
})

-- Hook into Game.update
local old_update = Game.update
function Game:update(dt)
  old_update(self, dt)

  -- Apply penalty if trigger check failed during scoring states
  if (G.STATE == 3 or G.STATE == 19) and G.GAME.PinkRFailed and not G.GAME.blind.disabled then
    show_pinkr_fail_text()
    G.GAME.chips = G.GAME.chips - (G.GAME.PinkRPenalty or 0)
    G.GAME.PinkRFailed = true
    G.GAME.PinkRPenalty = 0
  end
end

-- Game Over Override
local old_update_game_over = Game.update_game_over
function Game:update_game_over(dt)
  -- Handle the specific PinkR failure scenario
  if G.GAME.PinkRFailed and G.GAME.current_round.hands_left > 0 then
    if G.deck and #G.deck.cards > 0 then
      local draw_count = G.hand.config.card_limit - #G.hand.cards
      if draw_count > 0 then
        SMODS.draw_cards(draw_count)
      end
    end
    -- Reset state so player can try again
    G.STATE = G.STATES.SELECTING_HAND
    G.GAME.PinkRFailed = false
    return
  else
    -- Fall back to standard game over logic
    old_update_game_over(self, dt)
  end
end

SMODS.Blind({
  key = "mint_e",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 33 },
  boss_colour = HEX("66cb94"),

  abn_artist_credits = {
    artist = "smoliconboi",
  },
})

SMODS.Blind({
  key = "notequal_teal",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 31 },
  boss_colour = HEX("64d5d4"),

  -- Only appears if the player has Jokers
  in_pool = function(self)
    return G.jokers and #G.jokers.cards > 0
  end,
  apply_to_joker = function(self, joker)
    -- Use a unique key for the debuff flag to prevent conflicts with other mods
    if not joker.ability or joker.ability.tealed then return end

    local changed_extra = false

    -- MODIFY extra FIRST (often used for scaling jokers)
    if type(joker.ability.extra) == "table" then
      for k, v in pairs(joker.ability.extra) do
        if type(v) == "number" then
          joker.ability.extra[k] = v / 2
          changed_extra = true
        end
      end
    elseif type(joker.ability.extra) == "number" then
      joker.ability.extra = joker.ability.extra / 2
      changed_extra = true
    end

    -- ONLY MODIFY base ability IF EXTRA WAS NOT CHANGED
    if not changed_extra then
      for k, v in pairs(joker.ability) do
        if type(v) == "number" and k ~= 'id' and k ~= 'groups' then
          if (k == "h_x_chips" or k == "x_mult" or k == "x_chips") then
            if v > 1 then joker.ability[k] = v / 2 end
          elseif v > 0 then
            joker.ability[k] = v / 2
          end
        end
      end
    end

    joker.ability.tealed = true
    joker.sell_cost = math.max(1, math.floor(joker.sell_cost / 2))
    joker:juice_up()
  end,

  remove_from_joker = function(self, joker)
    if not joker.ability or not joker.ability.tealed then return end

    local reverted_extra = false

    -- REVERT extra FIRST
    if type(joker.ability.extra) == "table" then
      for k, v in pairs(joker.ability.extra) do
        if type(v) == "number" then
          joker.ability.extra[k] = v * 2
          reverted_extra = true
        end
      end
    elseif type(joker.ability.extra) == "number" then
      joker.ability.extra = joker.ability.extra * 2
      reverted_extra = true
    end

    -- ONLY REVERT base ability IF EXTRA WAS NOT REVERTED
    if not reverted_extra then
      for k, v in pairs(joker.ability) do
        if type(v) == "number" and k ~= 'id' and k ~= 'groups' then
          if (k == "h_x_chips" or k == "x_mult" or k == "x_chips") then
            if v > 0.5 then joker.ability[k] = v * 2 end
          elseif v > 0 then
            joker.ability[k] = v * 2
          end
        end
      end
    end

    joker.ability.tealed = nil
    joker.sell_cost = joker.sell_cost * 2
    joker:juice_up()
  end,

  calculate = function(self, blind, context)
    -- Triggers when the blind is selected
    if context.setting_blind and not G.GAME.blind.disabled then
      for _, joker in ipairs(G.jokers.cards) do
        self:apply_to_joker(joker)
      end
    end
  end,

  disable = function(self)
    for _, joker in ipairs(G.jokers.cards) do
      self:remove_from_joker(joker)
    end
  end,

  defeat = function(self)
    if G.GAME.blind.disabled then return end
    for _, joker in ipairs(G.jokers.cards) do
      self:remove_from_joker(joker)
    end
  end,

  abn_artist_credits = {
    artist = "smoliconboi",
  },
})


local old_insert = SMODS.insert_repetitions

SMODS.insert_repetitions = function(repeat_table, value, source, tag)
  if G.GAME and G.GAME.blind and G.GAME.blind.name == 'Orange ±' and not G.GAME.blind.disabled then
    -- Block ALL retriggers
    return
  end

  -- Otherwise do normal retrigger behavior
  return old_insert(repeat_table, value, source, tag)
end

local old_insert = SMODS.insert_repetitions

SMODS.insert_repetitions = function(repeat_table, value, source, tag)
  if G.GAME and G.GAME.blind and G.GAME.blind.name == 'Hazard ±' and not G.GAME.blind.disabled then
    -- Block ALL retriggers
    return
  end

  -- Otherwise do normal retrigger behavior
  return old_insert(repeat_table, value, source, tag)
end


SMODS.Blind {
  key = 'orange_plus',
  config = {},
  boss = {
    showdown = true,
  },
  name = 'Orange ±',
  boss_colour = HEX("fd9e57"),
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 35 },
}

SMODS.Blind {
  key = 'turquoise_yot',
  config = {},
  boss = {
    showdown = true,
  },
  boss_colour = HEX("57aabd"),
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 39 },

  press_play = function(self)
    G.E_MANAGER:add_event(Event({
      func = function()
        local hand = G.hand.cards
        local count = #hand

        if count > 0 then
          -- destroy_count = ceil(25% of held cards)
          local destroy_count = math.ceil(count * 0.25)

          if destroy_count > 0 then
            -- copy hand to a temporary table
            local temp = {}
            for i, c in ipairs(hand) do
              temp[i] = c
            end

            -- shuffle table
            for i = #temp, 2, -1 do
              local j = math.random(i)
              temp[i], temp[j] = temp[j], temp[i]
            end

            -- destroy N random cards
            for i = 1, destroy_count do
              local selected_card = temp[i]
              if selected_card then
                -- In Balatro, it's safer to use the standard removal flow
                -- so things like Glass Card breaks or Sixth Sense trigger correctly
                selected_card:start_dissolve()

                -- trigger joker callbacks if applicable
                if selected_card.playing_card then
                  for j = 1, #G.jokers.cards do
                    eval_card(G.jokers.cards[j], {
                      cardarea = G.jokers,
                      remove_playing_cards = true,
                      removed = { selected_card }
                    })
                  end
                end
              end
            end
          end
        end
        return true
      end
    }))
  end,
}

SMODS.Blind({
  key = "bloody_chain",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 41 },
  boss_colour = HEX("f70000"),
  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end
    if (card.area == G.jokers) and card.config.center and card.config.center.rarity and card.config.center.rarity == 3 then
      return true
    end
  end,
})

SMODS.Blind({
  key = "ocean_rook",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 43 },
  boss_colour = HEX("009eff"),
  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end
    if card:get_id() and card:get_id() < 5 then
      return true
    end
  end,
})

SMODS.Blind({
  key = "murex_antisigma",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 45 },
  boss_colour = HEX("6d00db"),
  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end
    if card:get_id() and card:get_id() > 5 then
      return true
    end
  end,
})

SMODS.Blind({
  key = "belphegors_prime",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 47 },
  boss_colour = HEX("e18171"),
  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end

    -- Define the target ranks
    local primes = { [2] = true, [3] = true, [5] = true, [7] = true }
    local id = card:get_id()

    -- Debuff 2 3 5 and 7
    if id and primes[id] then
      return true
    end
  end,
})

SMODS.Blind({
  key = "tumeric_chakra",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 49 },
  boss_colour = HEX("efc03c"),
  debuff_hand = function(self, cards, hand, handname, check)
    if G.GAME.blind.disabled then return end

    -- Count unique suits in the current selection
    local suits_found = {}
    local count = 0
    for i = 1, #cards do
      local suit = cards[i].base.suit
      if not suits_found[suit] then
        suits_found[suit] = true
        count = count + 1
      end
    end

    -- Disallow the hand if it has fewer than 3 different suits
    if count < 3 then
      return true
    end
  end,
  get_loc_debuff_text = function(self)
    return "Must have 3 suits!"
  end,
  loc_vars = function(self)
    return { vars = { 3 } }
  end
})

SMODS.Blind({
  key = "azurite_axe",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 51 },
  boss_colour = HEX("4b71e4"),
  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end
    if (card.area == G.jokers) and card.config.center and card.config.center.rarity and card.config.center.rarity == 4 then
      return true
    end
  end,
})

SMODS.Blind({
  key = "amaranth_chalice",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 53 },
  boss_colour = HEX("e65495"),
  mult = 1,

  calculate = function(self, blind, context)
    if not blind.disabled and context.hand_drawn then
      -- Clear the old target first
      G.GAME.blind.amaranth_target = nil

      -- Pick a new random card from the current hand
      if G.hand and G.hand.cards[1] then
        local random_card = pseudorandom_element(G.hand.cards, pseudoseed('amaranth'))
        G.GAME.blind.amaranth_target = random_card
        SMODS.recalc_debuff(random_card)
      end
    end

    -- Blind Score Increase + Popup
    if context.first_hand_drawn and not blind.disabled then
      -- Display the popup message
      G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
          play_sound('whoosh1', 0.8, 0.7)
          attention_text({
            scale = 0.8,
            text = "X8 blind requirement",
            hold = 10,
            align = 'cm',
            offset = { x = 0, y = 0 },
            major = G.play
          })

          -- Update the actual score
          G.GAME.blind.chips = G.GAME.blind.chips * 8
          G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

          return true
        end
      }))
    end
  end,

  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end

    -- Check if this card is the current target
    if card.area == G.hand and G.GAME.blind.amaranth_target and card == G.GAME.blind.amaranth_target then
      return true
    end
  end,
})

SMODS.Blind({
  key = "inversion_arrow",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 55 },
  boss_colour = HEX("d4e3e5"),
  debuff_hand = function(self, cards, hand, handname, spec)
    if G.GAME.blind.disabled then return end

    local has_even = false
    local has_odd = false

    for i = 1, #cards do
      if ABN.is_odd(cards[i]) then
        has_odd = true
      elseif ABN.is_even(cards[i]) then
        has_even = true
      end
    end

    -- Hand is debuffed if it doesn't have at least one of each
    if not (has_even and has_odd) then
      return true
    end
  end,
})

SMODS.Blind({
  key = "acid_tower",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 57 },
  boss_colour = HEX("ccff33"),

  press_play = function(self)
    G.E_MANAGER:add_event(Event({
      func = function()
        -- Iterate backwards when removing items from a list to avoid indexing issues
        for i = #G.jokers.cards, 1, -1 do
          local joker = G.jokers.cards[i]
          -- Check if the joker has an edition (Foil, Holo, Poly, Neg)
          if joker.edition then
            -- Dissolve the card
            joker:start_dissolve()
          end
        end
        return true
      end
    }))
  end,
})

SMODS.Blind({
  key = "offbeat_triangle",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 71 },
  boss_colour = HEX("f5a600"),

  defeat = function(self)
    G.GAME.EdgingHands = 0
  end,

  calculate = function(self, card, context)
    if context.final_scoring_step and not G.GAME.blind.disabled then
      G.GAME.EdgingHands = (G.GAME.EdgingHands or 0) + 1
      if G.GAME.EdgingHands % 2 ~= 1 then
        return { xchips = -1 }
      end
    end
  end,
})

SMODS.Blind({
  key = "type_o_negative",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 63 },
  boss_colour = HEX("58605e"),
  calculate = function(self, card, context)
    -- Triggered when entering the blind: back up original chips and reset flag
    if context.setting_blind then
      G.GAME.SpectralChips = G.GAME.blind.chips
    end

    -- Trigger when the first hand is drawn and blind isn't disabled
    if context.first_hand_drawn and not G.GAME.blind.disabled then
      local unique_editions = {}
      local unique_count = 0

      -- Helper function to check and count editions
      local function check_card_edition(c)
        if c and c.edition and c.edition.type then
          local ed_type = c.edition.type
          if not unique_editions[ed_type] then
            unique_editions[ed_type] = true
            unique_count = unique_count + 1
          end
        end
      end

      -- Scan Jokers
      if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
          check_card_edition(j)
        end
      end

      -- Scan Playing Cards
      if G.playing_cards then
        for _, c in ipairs(G.playing_cards) do
          check_card_edition(c)
        end
      end

      -- Apply the multiplier if any unique editions were found
      if unique_count > 0 then
        G.GAME.blind.chips = G.GAME.blind.chips * unique_count
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
      end
    end
  end,

  disable = function(self)
    if G.GAME.SpectralChips then
      G.GAME.blind.chips = G.GAME.SpectralChips
      G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end
  end,
})

SMODS.Blind({
  key = "spectral_jewel",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 59 },
  boss_colour = HEX("416eac"),

  calculate = function(self, blind, context)
    -- Debuff the starting hand
    if context.first_hand_drawn and not G.GAME.blind.disabled then
      for _, card in ipairs(G.hand.cards) do
        card:set_debuff(true)
        card.wasdebuffed = true
      end
    end

    -- Debuff less than 2 suits
    if not G.GAME.blind.disabled and context.debuff_hand then
      local unique_suits = {}
      local suit_count = 0

      for _, card in ipairs(context.full_hand or {}) do
        local suit = card.base.suit
        if suit and not unique_suits[suit] then
          unique_suits[suit] = true
          suit_count = suit_count + 1
        end
      end

      if suit_count < 2 then
        blind.triggered = true
        return {
          debuff = true
        }
      end
    end
  end,

  disable = function(self)
    for _, card in ipairs(G.hand.cards) do
      card:set_debuff(false)
      card.wasdebuffed = false
    end
  end,
})

SMODS.Blind({
  key = "equal_brass",
  boss = {
    showdown = true,
  },
  debuff = {
    h_size_ge = 6,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 61 },
  boss_colour = HEX("d9a066"),

  defeat = function(self)
    SMODS.change_play_limit(-1)
    SMODS.change_discard_limit(-1)
  end,

  calculate = function(self, card, context)
    if context.setting_blind and not G.GAME.blind.disabled then
      SMODS.change_play_limit(1)
      SMODS.change_discard_limit(1)
    end

    -- change hand values
    if context.modify_hand and context.scoring_hand and not G.GAME.blind.disabled then
      local played_suits = {}

      for i = 1, #context.scoring_hand do
        local scoring_card = context.scoring_hand[i]

        -- suit check
        for suit_key, _ in pairs(SMODS.Suits) do
          if scoring_card:is_suit(suit_key) then
            played_suits[suit_key] = true
          end
        end
      end

      -- count suits
      local unplayed_suit_count = 0
      for suit_key, _ in pairs(SMODS.Suits) do
        if not played_suits[suit_key] then
          unplayed_suit_count = unplayed_suit_count + 1
        end
      end

      -- divide base mult
      if unplayed_suit_count > 0 then
        mult = mod_mult(mult / unplayed_suit_count)

        -- update UI
        update_hand_text({ delay = 0 }, { chips = hand_chips, mult = mult })
      end
    end
  end,
})

local function show_calamity_text(effect_id)
  local effect_strings = {
    [1] = "Destroy a random Joker if Blind is not won in one hand",
    [2] = "+1X Base",
    [3] = "Played enhancements are randomized before scoring",
    [4] = "Destroy one random card in hand after hand is played",
    [5] = "+0.2X Base per unused hand/discard",
    [6] = "Flip all cards in hand",
    [7] = "Divide Mult by number of played cards",
  }
  local disp_text = effect_strings[effect_id] or "Calamity!"

  G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = G.SETTINGS.GAMESPEED * 0.05,
    blockable = false,
    func = function()
      play_sound('cancel', 0.8, 1.2)
      attention_text({
        scale = 0.75,
        text = disp_text,
        maxw = 14,
        hold = G.SETTINGS.GAMESPEED * (#disp_text * 0.04 + 1.2),
        align = 'cm',
        offset = { x = 0, y = -2.5 }, -- Raised so it stays above cards
        major = G.play
      })
      return true
    end
  }))
end

SMODS.Blind({
  key = "calamity_x",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 65 },
  boss_colour = HEX("42d0c4"),
  mult = 2,

  calculate = function(self, card, context)
    if context.before and not G.GAME.blind.disabled then
      -- Pick a random effect
      local effect = pseudorandom('calamity_choice', 1, 4)
      G.GAME.blind.calamity_effect = effect

      -- Display the chosen effect
      show_calamity_text(effect)

      -- +1X Base
      if effect == 2 then
        G.GAME.blind.mult = G.GAME.blind.mult + 1
        G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante) * G.GAME.blind.mult *
            G.GAME.starting_params.ante_scaling
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
      end

      -- Randomize Enhancements
      if effect == 3 then
        local enhanced_list = {}
        for i = 1, #G.play.cards do
          local target_card = G.play.cards[i]
          -- If the card is NOT a base card, it means it is already enhanced
          if target_card.config.center ~= G.P_CENTERS.c_base then
            table.insert(enhanced_list, target_card)
          end
        end

        -- If we found enhanced cards, randomize their enhancements using SMODS.poll_enhancement
        if #enhanced_list > 0 then
          for _, enhanced_card in ipairs(enhanced_list) do
            local enhancement_key = { key = 'calamity_enh', guaranteed = true }
            local random_enhancement = G.P_CENTERS[SMODS.poll_enhancement(enhancement_key)]

            if random_enhancement then
              enhanced_card:set_ability(random_enhancement, nil, true)
              enhanced_card:juice_up()
            end
          end
        end
      end

      if effect == 4 and #G.play.cards > 0 then
        local destroyed_target = pseudorandom_element(G.play.cards, 'calamity_destroy')
        destroyed_target.should_destroy = true
      end
    end

    -- Destroy a random card
    if context.destroy_card and context.cardarea == G.play and not G.GAME.blind.disabled then
      if context.destroy_card.should_destroy then
        return { remove = true }
      end
    end

    -- Joker destroy
    if context.after then
      local effect = G.GAME.blind.calamity_effect

      if effect == 1 and #G.jokers.cards > 0 then
        local result = SMODS.calculate_round_score()
        if result < G.GAME.blind.chips then
          local sacrificed_joker = pseudorandom_element(G.jokers.cards, 'calamity_joker')
          G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
              sacrificed_joker:start_dissolve()
              return true
            end
          }))
        end
      end

      -- Clear the effect tracking flag for the next hand
      G.GAME.blind.calamity_effect = nil
    end
  end,
})

SMODS.Blind({
  key = "gilded_labrys",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 67 }, --six seveennnn /srs
  boss_colour = HEX("fde698"),

  calculate = function(self, card, context)
    -- trigger every hand
    if context.hand_drawn then
      G.GAME.EdgingHands = (G.GAME.EdgingHands or 0) + 1
      for _, c in ipairs(G.playing_cards) do
        -- Debuff evens
        if G.GAME.EdgingHands % 2 ~= 1 and not G.GAME.blind.disabled then
          if ABN.is_even(c) then
            c:set_debuff(true)
            c.wasdebuffed = true
          elseif ABN.is_odd(c) then
            c:set_debuff(false)
            c.wasdebuffed = false
          end
          -- Debuff odds
        elseif G.GAME.EdgingHands % 2 == 1 and not G.GAME.blind.disabled then
          if ABN.is_even(c) then
            c:set_debuff(false)
            c.wasdebuffed = false
          elseif ABN.is_odd(c) then
            c:set_debuff(true)
            c.wasdebuffed = true
          end
        end
      end
    end
  end,

  disable = function(self)
    for _, card in ipairs(G.playing_cards) do
      card:set_debuff(false)
      card.wasdebuffed = false
    end
  end,

  defeat = function(self)
    G.GAME.EdgingHands = 0
  end,

})


local original_game_update = Game.update

function Game:update(dt)
  original_game_update(self, dt)

  if G.STAGE ~= G.STAGES.RUN then return end

  if G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_abn_mauve_moth' and not G.GAME.blind.disabled then
    if G.jokers and G.jokers.cards then
      for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]

        j.states.drag.can = false
      end
    end
    for _, c in ipairs(G.playing_cards) do
      c.states.drag.can = false
    end
  end

  if G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_abn_mauve_moth' and G.GAME.blind.disabled or G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_abn_mauve_moth' and G.STATE == 8 then
    if G.jokers and G.jokers.cards then
      for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]

        j.states.drag.can = true
      end
    end
    for _, c in ipairs(G.playing_cards) do
      c.states.drag.can = true
    end
  end
end

SMODS.Blind({
  key = "mauve_moth",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 69 }, -- nice
  boss_colour = HEX("c292a1"),

  calculate = function(self, card, context)
    if G.hand and G.hand.highlighted then
      for i = 1, #G.hand.highlighted do
        G.hand.highlighted[i].ability.forced_selection = true
      end
    end
  end,
})

SMODS.Blind({
  key = "ominous_sigil",
  boss = {
    showdown = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 73 },
  boss_colour = HEX("fd5f55"),

  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)
    if context.setting_blind then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          local original_highlighted_limit = G.hand.config.highlighted_limit

          G.hand.config.highlighted_limit = 9999

          local discarded_count = 0
          local any_selected = false

          local half_deck_size = math.floor(#G.deck.cards / 2)
          local all_cards = { G.hand.cards, G.deck.cards }

          if half_deck_size > 0 then
            for i = 1, half_deck_size do
              local selected_card = G.deck.cards[#G.deck.cards]
              if selected_card then
                G.hand:add_to_highlighted(selected_card, true)

                for k, v in ipairs(G.deck.cards) do
                  if v == selected_card then
                    table.remove(G.deck.cards, k)
                    break
                  end
                end

                any_selected = true
              end
            end
          end

          -- Discard selected highlighted cards
          if any_selected then
            G.FUNCS.discard_cards_from_highlighted(nil, true)
          end

          G.hand:unhighlight_all()
          G.hand.config.highlighted_limit = original_highlighted_limit

          return true
        end
      }))
    end

    if context.modify_scoring_hand then
      local is_scoring = false
      for _, scoring_card in ipairs(context.scoring_hand) do
        if scoring_card == context.other_card then
          is_scoring = true
          break
        end
      end

      if is_scoring then
        return {
          remove_from_hand = true
        }
      else
        return {
          add_to_hand = true
        }
      end
    end
  end,
})
-- Hazard Blinds
-- Hazard Heart

SMODS.Blind({
  key = "hazard_magnet",
  boss = {
    showdown = true,
    hazard_blind = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 21 },
  boss_colour = HEX("9e4d6e"),

  calculate = function(self, card, context)
    -- Triggered when entering the blind to save the original requirement
    if context.setting_blind then
      G.GAME.MagnetChips = G.GAME.blind.chips
    end

    -- Apply scaling and debuffs when the first hand is drawn
    if context.first_hand_drawn and not G.GAME.blind.disabled then
      -- Blind size increases by 10% for each $ in G.GAME.dollars
      local multiplier = 1 + (0.10 * math.max(0, G.GAME.dollars))
      G.GAME.blind.chips = math.floor(G.GAME.blind.chips * multiplier)
      G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

      -- Debuff all cards if player has discards
      if G.GAME.current_round.discards_left > 0 then
        for _, c in ipairs(G.playing_cards) do
          c:set_debuff(true)
        end
      end
    end

    if G.STATE == 1 and G.GAME.current_round.discards_left == 0 and not G.GAME.blind.disabled then
      G.GAME.blind:disable()
    end
  end,

  disable = function(self)
    -- Restore original chips
    G.GAME.blind.chips = G.GAME.MagnetChips or G.GAME.blind.chips
    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

    for _, c in ipairs(G.playing_cards) do
      c:set_debuff(false)
      c.wasdebuffed = false
    end
  end,
})

SMODS.Blind({
  key = "hazard_star",
  boss = {
    showdown = true,
    hazard_blind = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 22 },
  boss_colour = HEX("9facc4"),
  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end
    if ABN.is_light(card) and not card.debuff then -- <- add hre for more debuffs
      return true
    end
  end,
  set_blind = function(self)
    self.discard_removed = G.GAME.starting_params.discard_limit - 1
    SMODS.change_discard_limit(-self.discard_removed)
  end,
  disable = function(self)
    SMODS.change_discard_limit(self.discard_removed)
  end,
  defeat = function(self)
    SMODS.change_discard_limit(self.discard_removed)
  end,
})

-- Hook into end of round
local end_round_original = end_round
function end_round()
  -- Initialize the tracker if it doesn't exist yet
  G.GAME.AnteOverscore = G.GAME.AnteOverscore or 0

  -- Get current scored chips and the required blind chips
  local scored_chips = G.GAME.chips or 0
  local required_chips = (G.GAME.blind and G.GAME.blind.chips) or 0

  -- Calculate the AnteOverscore
  if scored_chips > required_chips then
    local excess = scored_chips - required_chips
    G.GAME.AnteOverscore = G.GAME.AnteOverscore + excess
  end


  -- Check if this round was a Boss Blind
  if G.GAME.blind and G.GAME.blind.boss then
    G.GAME.AnteOverscore = 0
  end


  -- Call the original end_round
  end_round_original()
end

SMODS.Blind({
  key = "hazard_belt",
  boss = {
    showdown = true,
    hazard_blind = true,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 23 },
  boss_colour = HEX("a79475"),
  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end
    if ABN.is_light(card) then
      return true
    end
    return false
  end,

  calculate = function(self, blind, context)
    if context.setting_blind and not G.GAME.blind.disabled then
      G.GAME.blind.chips = G.GAME.blind.chips + G.GAME.AnteOverscore
      G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end
  end,

  disable = function(self)
    G.GAME.blind.chips = G.GAME.blind.chips - G.GAME.AnteOverscore
    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
  end,
})

SMODS.Blind({
  key = "hazard_pin",
  debuff = {
    h_size_le = 2,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 25 },
  boss = { showdown = true, hazard_blind = true },
  boss_colour = HEX("c78bb3"),
  calculate = function(self, blind, context)
    if not blind.disabled then
      if context.debuff_card and context.debuff_card.area == G.jokers then
        if context.debuff_card.ability.hazard_pin then
          return {
            debuff = true,
          }
        end
      end
      if context.press_play and G.jokers.cards[1] then
        blind.triggered = true
        blind.prepped = true
      end
      if context.hand_drawn then
        if blind.prepped and G.jokers.cards[1] then
          local prev_chosen_set = {}
          local fallback_jokers = {}
          local jokers = {}
          for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].ability.hazard_pin then
              prev_chosen_set[G.jokers.cards[i]] = true
              G.jokers.cards[i].ability.hazard_pin = nil
              if G.jokers.cards[i].debuff then
                SMODS.recalc_debuff(G.jokers.cards[i])
              end
            end
          end
          for i = 1, #G.jokers.cards do
            if not G.jokers.cards[i].debuff then
              if not prev_chosen_set[G.jokers.cards[i]] then
                jokers[#jokers + 1] = G.jokers.cards[i]
              end
              table.insert(fallback_jokers, G.jokers.cards[i])
            end
          end
          if #jokers == 0 then
            jokers = fallback_jokers
          end
          local _card = G.jokers.cards[#G.jokers.cards]
          if _card then
            _card.ability.hazard_pin = true
            SMODS.recalc_debuff(_card)
            _card:juice_up()
            blind:wiggle()
          end
        end
      end
    end
    if context.hand_drawn then
      blind.prepped = nil
    end
  end,
})

SMODS.Blind({
  key = "hazard_lock",
  boss = {
    showdown = true,
    hazard_blind = true
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 24 },
  boss_colour = HEX("afcc87"),
  set_blind = function(self)
    self.old_chips = G.GAME.blind.chips
    local undebuffed_playing_cards = {}
    for k, v in pairs(G.playing_cards) do
      if not v.debuff then
        undebuffed_playing_cards[#undebuffed_playing_cards + 1] = v
      end
    end
    for i = 1, 12 do
      if #undebuffed_playing_cards > 0 then
        local dcard = pseudorandom_element(undebuffed_playing_cards, pseudoseed("seeding"))
        SMODS.debuff_card(dcard, true, "dbuffed_by_hazzard_lock")
        for k, v in pairs(undebuffed_playing_cards) do
          if v == dcard then
            table.remove(undebuffed_playing_cards, k)
          end
        end
      end
    end
    local a = 1
    for k, v in pairs(G.playing_cards) do
      if v.debuff then
        a = a + 1
      end
    end
    for i = 1, a do
      G.GAME.blind.chips = G.GAME.blind.chips + ((7 / G.GAME.blind.chips) * 100)
    end
    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    self.triggered = true
  end,
  defeat = function(self)
    for k, v in pairs(G.playing_cards) do
      SMODS.debuff_card(v, false, "dbuffed_by_hazzard_lock")
    end
    self.triggered = false
    self.old_chips = nil
  end,
  disable = function(self)
    for k, v in pairs(G.playing_cards) do
      SMODS.debuff_card(v, false, "dbuffed_by_hazzard_lock")
    end
    self.triggered = false
    if self.old_chips then
      G.GAME.blind.chips = self.old_chips
      G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end
    self.old_chips = nil
  end,
})

SMODS.Blind({
  key = "hazard_slab",
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 26 },
  boss = { showdown = true, hazard_blind = true },
  boss_colour = HEX("4f6c74"),

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.setting_blind then
      blind.effect.hands = {}
      for _, poker_hand in ipairs(G.handlist) do
        blind.effect.hands[poker_hand] = false
      end
    end

    if context.before and not context.blueprint then
      local handname = context.scoring_name

      if blind.effect.hands and blind.effect.hands[handname] then
        G.GAME.blind.chips = G.GAME.blind.chips * 1.5
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        blind.triggered = true
      end
    end

    if context.after and not context.blueprint then
      local handname = context.scoring_name
      if blind.effect.hands then
        blind.effect.hands[handname] = true
      end
    end

    if context.modify_scoring_hand then
      if context.full_hand and #context.full_hand > 0 then
        local first_card = context.full_hand[1]
        local last_card = context.full_hand[#context.full_hand]
        if context.other_card == first_card or context.other_card == last_card then
          return {
            remove_from_hand = true
          }
        end
      end
    end
  end,
})

SMODS.Blind({
  key = "hazard_circle",
  boss = {
    showdown = true,
    hazard_blind = true
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 27 },
  boss_colour = HEX("302edd"),
  calculate = function(self, blind, context)
    if context.before and not G.GAME.blind.disabled then
      local undebuffed_cards = {}
      for k, v in pairs(G.play.cards) do
        if not v.debuff then
          undebuffed_cards[#undebuffed_cards + 1] = v
        end
      end
      if #undebuffed_cards > 0 then
        local a = pseudorandom_element(undebuffed_cards, pseudoseed("seedseed"))
        SMODS.debuff_card(a, true, "debuffed_by_hazardc")
      end
    end
  end,
  defeat = function(self)
    for k, v in pairs(G.playing_cards) do
      SMODS.debuff_card(v, false, "debuffed_by_hazardc")
    end
    self.triggered = false
    self.old_chips = nil
  end,
  disable = function(self)
    for k, v in pairs(G.playing_cards) do
      SMODS.debuff_card(v, false, "debuffed_by_hazardc")
    end
  end
})

SMODS.Blind({
  key = "hazard_oracle",
  boss = {
    showdown = true,
    hazard_blind = true
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 28 },
  boss_colour = HEX("e0483e"),
  debuff_hand = function(self, cards, hand, handname, check)
    local suits = {}
    for k, v in pairs(cards) do
      if not suits[v.base.suit] then
        suits[v.base.suit] = true
      end
    end
    local a = 0
    for k, v in pairs(suits) do
      a = a + 1
    end
    if a < 5 then
      return true
    end
  end,
  calculate = function(self, blind, context)
    if not blind.disabled then
      if context.debuff_card and context.debuff_card.area == G.jokers then
        if context.debuff_card.ability.hazard_pin then
          return {
            debuff = true,
          }
        end
      end
      if context.press_play and G.jokers.cards[1] then
        blind.triggered = true
        blind.prepped = true
      end
      if context.hand_drawn then
        if blind.prepped and G.jokers.cards[1] then
          local prev_chosen_set = {}
          local fallback_jokers = {}
          local jokers = {}
          for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].ability.hazard_pin then
              prev_chosen_set[G.jokers.cards[i]] = true
              G.jokers.cards[i].ability.hazard_pin = nil
              if G.jokers.cards[i].debuff then
                SMODS.recalc_debuff(G.jokers.cards[i])
              end
            end
          end
          for i = 1, #G.jokers.cards do
            if not G.jokers.cards[i].debuff then
              if not prev_chosen_set[G.jokers.cards[i]] then
                jokers[#jokers + 1] = G.jokers.cards[i]
              end
              table.insert(fallback_jokers, G.jokers.cards[i])
            end
          end
          if #jokers == 0 then
            jokers = fallback_jokers
          end
          local _card = G.jokers.cards[#G.jokers.cards]
          if _card then
            _card.ability.hazard_pin = true
            SMODS.recalc_debuff(_card)
            _card:juice_up()
            blind:wiggle()
          end
        end
      end
    end
    if context.hand_drawn then
      blind.prepped = nil
    end
  end,
})

SMODS.Blind({
  key = "hazard_cherry",
  boss = {
    showdown = true,
    hazard_blind = true
  },
  debuff = {
    h_size_ge = 5,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 17 },
  boss_colour = HEX("ce54cc"),

  calculate = function(self, card, context)
    -- Triggered when entering the blind
    if context.setting_blind and not G.GAME.blind.disabled then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function()
          -- Gather all cards in the deck
          local all_cards = G.deck.cards
          if not all_cards or #all_cards == 0 then return true end

          -- FILTER: Only allow cards that are NOT already impostors
          local valid_base_cards = {}
          for _, c in ipairs(all_cards) do
            if not (c.ability and c.ability.is_impostor) then
              table.insert(valid_base_cards, c)
            end
          end

          -- Fallback: If your entire deck is somehow impostors, use the whole deck to prevent a softlock
          if #valid_base_cards == 0 then valid_base_cards = all_cards end

          -- Spawns 20 impostor clones into the deck
          local num_cards = 20
          local new_cards = {}

          for i = 1, num_cards do
            -- Grab a completely random, clean base card from our filtered pool
            local base_card = pseudorandom_element(valid_base_cards, pseudoseed('impostor_choice_' .. i))
            if not base_card then break end

            -- Clone the clean card
            local new_card = copy_card(base_card)

            -- Register the new clone into the game systems
            new_card:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, new_card)
            G.deck:emplace(new_card)

            -- Set the impostor flag
            new_card.ability.is_impostor = true

            -- =========================================================
            -- STABLE VISUAL ANOMALIES (Guaranteed exactly 1 effect)
            -- =========================================================
            local rand_val = pseudorandom(pseudoseed('impostor_weird_' .. i))
            local weird_modifier = math.floor(rand_val * 5) + 1

            if weird_modifier == 1 then
              -- size adjustments
              local scale_rand = pseudorandom(pseudoseed('impostor_scale_' .. i))
              local scale_mod = (scale_rand <= 0.5 and 1.15 or 0.85)
              new_card.ability.forced_scale = scale_mod

              local old_draw = new_card.draw
              new_card.draw = function(self, layer)
                if self.T and self.ability.forced_scale then
                  self.T.w = G.CARD_W * self.ability.forced_scale
                  self.T.h = G.CARD_H * self.ability.forced_scale
                end
                if old_draw then old_draw(self, layer) end
              end
            elseif weird_modifier == 2 then
              -- weird smudge / shader anomaly
              local chosen_shader = 'negative_shine'

              -- CONDITION CHECK: If the card has a native edition, overwrite shader to 'booster'
              if base_card.edition then
                chosen_shader = 'booster'
              end

              local old_draw = new_card.draw
              new_card.draw = function(self, layer)
                if old_draw then old_draw(self, layer) end
                if self.children and self.children.center then
                  self.children.center:draw_shader(chosen_shader, nil, self.ARGS.send_to_shader)
                end
              end
            elseif weird_modifier == 3 then
              -- no rank
              new_card.base.nominal = 0
              new_card.base.suit_nominal = 0
            elseif weird_modifier == 4 then
              -- text chip anomaly
              new_card.ability.perma_bonus = -6969
            elseif weird_modifier == 5 then
              -- text mult anomaly
              new_card.ability.perma_mult = 6767
            end

            -- Start materializing the copy with visual feedback
            new_card:start_materialize(nil, nil)
            new_card:juice_up(0.6, 0.6)
            table.insert(new_cards, new_card)
          end

          playing_card_joker_effects(new_cards)
          return true
        end
      }))
    end

    -- Before scoring: Reset the hand state tracking
    if context.before then
      G.GAME.ImpostorDetected = false
      G.GAME.ImpostorPenalty = 0
    end

    -- During scoring: Look for an impostor inside the scoring hand
    if context.scoring_hand then
      for _, c in ipairs(context.scoring_hand) do
        if c.ability and c.ability.is_impostor then
          G.GAME.ImpostorDetected = true
          break
        end
      end
    end

    -- Final scoring step: Record penalty AND fire the text event ONCE
    if context.final_scoring_step and G.GAME.ImpostorDetected then
      local result = SMODS.calculate_round_score()
      G.GAME.ImpostorPenalty = result
      show_impostor_fail_text()
    end
  end,

  disable = function(self)
    -- Clean out all impostors
    for _, card in ipairs(G.playing_cards) do
      if card.ability and card.ability.is_impostor then
        card:start_dissolve()
      end
    end
    G.GAME.ImpostorDetected = false
    G.GAME.ImpostorPenalty = 0
  end,

  defeat = function(self)
    self:disable()
  end
})

SMODS.Blind({
  key = "hazard_tear",
  debuff = {
    h_size_le = 3,
    h_size_ge = 3,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 18 },
  boss = { showdown = true, hazard_blind = true },
  boss_colour = HEX("9facc4"),
  calculate = function(self, blind, context)
    if context.after and not self.triggered and not G.GAME.blind.disabled then
      self.triggered = true
      for k, v in pairs(G.jokers.cards) do
        SMODS.debuff_card(v, true, "hazard_shield")
      end
    end
  end,
  disable = function(self)
    self.triggered = false
    for k, v in pairs(G.jokers.cards) do
      SMODS.debuff_card(v, false, "hazard_shield")
    end
  end,
  defeat = function(self)
    self.triggered = false
    for k, v in pairs(G.jokers.cards) do
      SMODS.debuff_card(v, false, "hazard_shield")
    end
  end
})

SMODS.Blind({
  key = "hazard_shield",
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 19 },
  boss = { showdown = true, hazard_blind = true },
  boss_colour = HEX("4bdbcb"),
  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end
    if ABN.is_dark(card) and not card.debuff then --- <- add hre for more debuffs
      return true
    end
  end,
  calculate = function(self, blind, context)
    if context.after and not self.triggered and not G.GAME.blind.disabled then
      self.triggered = true
      for k, v in pairs(G.jokers.cards) do
        SMODS.debuff_card(v, true, "hazard_tear_debuff")
      end
    end
  end,
  disable = function(self)
    self.triggered = false
    for k, v in pairs(G.jokers.cards) do
      SMODS.debuff_card(v, false, "hazard_tear_debuff")
    end
  end,
  defeat = function(self)
    self.triggered = false
    for k, v in pairs(G.jokers.cards) do
      SMODS.debuff_card(v, false, "hazard_tear_debuff")
    end
  end
})

SMODS.Blind({
  key = "hazard_crown",
  boss = {
    showdown = true,
    hazard_blind = true
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 20 },
  boss_colour = HEX("db6e3b"),
  debuff_hand = function(self, cards, hand, handname, check)
    local no = true
    for k, v in pairs(cards) do
      if v:get_id() == 12 or v:get_id() == 13 then
        no = false
      end
    end
    return no
  end,
})

SMODS.Blind({
  key = "hazard_heart",
  dollars = 8,
  mult = 2,
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 0 },
  boss = { showdown = true, hazard_blind = true },
  boss_colour = HEX("ac3232"),

  calculate = function(self, blind, context)
    if not blind.disabled then
      if context.debuff_card and context.debuff_card.area == G.jokers then
        if context.debuff_card.ability.hazard_heart_chosen then
          return {
            debuff = true,
          }
        end
      end

      if context.debuff_card and context.debuff_card.area == G.hand then
        if context.debuff_card.ability.hazard_heart_chosen then
          return {
            debuff = true,
          }
        end
      end

      if context.hand_drawn then
        if not blind.hazard_heart_prepped then
          blind.hazard_heart_prepped = true

          for _, joker in ipairs(G.jokers.cards) do
            if joker.ability.hazard_heart_chosen then
              joker.ability.hazard_heart_chosen = nil
              if joker.debuff then
                SMODS.recalc_debuff(joker)
              end
            end
          end

          for _, card in ipairs(G.hand.cards) do
            if card.ability.hazard_heart_chosen then
              card.ability.hazard_heart_chosen = nil
              if card.debuff then
                SMODS.recalc_debuff(card)
              end
            end
          end

          local joker_pool = {}
          for _, joker in ipairs(G.jokers.cards) do
            if not joker.debuff then
              joker_pool[#joker_pool + 1] = joker
            end
          end

          for i = 1, math.min(2, #joker_pool) do
            local chosen, pos = pseudorandom_element(joker_pool, "hazard_heart_joker_" .. i)
            if chosen then
              chosen.ability.hazard_heart_chosen = true
              SMODS.recalc_debuff(chosen)
              chosen:juice_up()
              table.remove(joker_pool, pos)
            end
          end

          if #G.hand.cards > 0 then
            local chosen_card = pseudorandom_element(G.hand.cards, "hazard_heart_hand")
            if chosen_card then
              chosen_card.ability.hazard_heart_chosen = true
              SMODS.recalc_debuff(chosen_card)
              chosen_card:juice_up()
            end
          end

          blind:wiggle()
        end
      end
    end

    if context.setting_blind then
      blind.hazard_heart_prepped = nil
    end
    if context.press_play then
      blind.hazard_heart_prepped = nil
    end
  end,

  disable = function(self)
    for _, joker in ipairs(G.jokers.cards) do
      joker.ability.hazard_heart_chosen = nil
      if joker.debuff then
        SMODS.recalc_debuff(joker)
      end
    end
    for _, card in ipairs(G.playing_cards) do
      card.ability.hazard_heart_chosen = nil
      if card.debuff then
        SMODS.recalc_debuff(card)
      end
    end
  end,

  defeat = function(self)
    for _, joker in ipairs(G.jokers.cards) do
      joker.ability.hazard_heart_chosen = nil
      if joker.debuff then
        SMODS.recalc_debuff(joker)
      end
    end
    for _, card in ipairs(G.playing_cards) do
      card.ability.hazard_heart_chosen = nil
      if card.debuff then
        SMODS.recalc_debuff(card)
      end
    end
  end,
})

-- Hazard Bell
SMODS.Blind({
  key = "hazard_bell",
  dollars = 8,
  mult = 2,
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 1 },
  boss = { showdown = true, hazard_blind = true },
  boss_colour = HEX("009cfd"),

  calculate = function(self, blind, context)
    if not blind.disabled then
      if context.hand_drawn then
        for _, playing_card in ipairs(G.playing_cards) do
          playing_card.ability.forced_selection = nil
        end

        if #G.hand.cards > 0 then
          G.hand:unhighlight_all()

          local pool = {}
          for _, card in ipairs(G.hand.cards) do
            pool[#pool + 1] = card
          end

          local first, pos = pseudorandom_element(pool, "hazard_bell_1")
          if first then
            first.ability.forced_selection = true
            G.hand:add_to_highlighted(first)
            table.remove(pool, pos)
          end

          if #pool > 0 then
            local second = pseudorandom_element(pool, "hazard_bell_2")
            if second then
              second.ability.forced_selection = true
              G.hand:add_to_highlighted(second)
            end
          end

          blind:wiggle()
        end
      end
    end
  end,

  recalc_debuff = function(self, card, from_blind)
    local temp = G.GAME.blind and G.GAME.blind.disabled
    if temp or not G.jokers then
      return false
    end
    if card.area == G.jokers and #G.jokers.cards > 0 and card == G.jokers.cards[1] and not temp then
      return true
    end
    return false
  end,

  update = function(self, blind, dt)
    local temp = G.GAME.blind and G.GAME.blind.disabled
    if not temp and G.jokers then
      for _, v in ipairs(G.jokers.cards) do
        G.GAME.blind:debuff_card(v, true)
      end
    end
  end,

  disable = function(self)
    for _, playing_card in ipairs(G.playing_cards) do
      playing_card.ability.forced_selection = nil
    end
  end,

  defeat = function(self)
    for _, playing_card in ipairs(G.playing_cards) do
      playing_card.ability.forced_selection = nil
    end
  end,
})

-- Hazard Acorn
SMODS.Blind({
  key = "hazard_acorn",
  dollars = 8,
  mult = 2,
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 2 },
  boss = { showdown = true, hazard_blind = true },
  boss_colour = HEX("fda200"),
  recalc_debuff = function(self, card, from_blind)
    local temp = G.GAME.blind and G.GAME.blind.disabled
    if temp or not G.jokers then
      return false
    end
    if card.area == G.jokers and #G.jokers.cards > 0 and card == G.jokers.cards[#G.jokers.cards] and not temp then
      return true
    end
    return false
  end,

  update = function(self, blind, dt)
    local temp = G.GAME.blind and G.GAME.blind.disabled
    if not temp and G.jokers then
      for _, v in ipairs(G.jokers.cards) do
        G.GAME.blind:debuff_card(v, true)
      end
    end
  end,
  set_blind = function(self)
    for _, joker in ipairs(G.jokers.cards) do
      if joker.facing == "front" then
        joker:flip()
      end
    end
  end,
  press_play = function(self)
    if #G.jokers.cards > 0 then
      G.jokers:unhighlight_all()

      if #G.jokers.cards > 1 then
        G.E_MANAGER:add_event(Event({
          trigger = "after",
          delay = 0.2,
          func = function()
            G.E_MANAGER:add_event(Event({
              func = function()
                G.jokers:shuffle("aajk")
                play_sound("cardSlide1", 0.85)
                return true
              end,
            }))
            delay(0.15)
            G.E_MANAGER:add_event(Event({
              func = function()
                G.jokers:shuffle("aajk")
                play_sound("cardSlide1", 1.15)
                return true
              end,
            }))
            delay(0.15)
            G.E_MANAGER:add_event(Event({
              func = function()
                G.jokers:shuffle("aajk")
                play_sound("cardSlide1", 1)
                return true
              end,
            }))
            delay(0.3)
            return true
          end,
        }))
      end
    end
  end,
})

-- Hazard Leaf
SMODS.Blind({
  key = "hazard_leaf",
  dollars = 8,
  mult = 2,
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 3 },
  boss = { showdown = true, hazard_blind = true },
  boss_colour = HEX("56a786"),

  calculate = function(self, blind, context)
    if not blind.disabled then
      if context.setting_blind then
        blind.hazard_leaf_sold = 0
      end

      if context.debuff_card and context.debuff_card.area ~= G.jokers then
        if (blind.hazard_leaf_sold or 0) < 2 then
          return {
            debuff = true,
          }
        end
      end

      if context.selling_card and context.card.ability.set == "Joker" then
        blind.hazard_leaf_sold = (blind.hazard_leaf_sold or 0) + 1

        if blind.hazard_leaf_sold >= 2 then
          G.E_MANAGER:add_event(Event({
            trigger = "immediate",
            func = function()
              blind:disable()
              return true
            end,
          }))
        else
          blind:wiggle()
        end
      end
    end
  end,
})

-- Hazard Vessel
SMODS.Blind({
  key = "hazard_vessel",
  dollars = 8,
  mult = 8,
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 4 },
  boss = { showdown = true, hazard_blind = true },
  boss_colour = HEX("8a71e1"),

  calculate = function(self, blind, context)
    if not blind.disabled then
      if context.hand_drawn then
        for _, card in ipairs(G.hand.cards) do
          if card.ability.hazard_vessel_chosen then
            card.ability.hazard_vessel_chosen = nil
            if card.debuff then
              SMODS.recalc_debuff(card)
            end
          end
        end

        if G.hand.cards[1] then
          G.hand.cards[1].ability.hazard_vessel_chosen = true
          SMODS.recalc_debuff(G.hand.cards[1])
          G.hand.cards[1]:juice_up()
          blind:wiggle()
        end
      end

      if context.debuff_card and context.debuff_card.area == G.hand then
        if context.debuff_card.ability.hazard_vessel_chosen then
          return {
            debuff = true,
          }
        end
      end
    end
  end,

  disable = function(self)
    for _, card in ipairs(G.playing_cards) do
      card.ability.hazard_vessel_chosen = nil
      if card.debuff then
        SMODS.recalc_debuff(card)
      end
    end
  end,

  defeat = function(self)
    for _, card in ipairs(G.playing_cards) do
      card.ability.hazard_vessel_chosen = nil
      if card.debuff then
        SMODS.recalc_debuff(card)
      end
    end
  end,
})

SMODS.Blind({
  key = "hazard_anchor",
  boss = { showdown = true, hazard_blind = true },
  debuff = { h_size_ge = 5 },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 30 },
  boss_colour = HEX("bde35b"),

  defeat = function(self)
    G.GAME.EdgingHands = 0
  end,



  calculate = function(self, card, context)
    if context.final_scoring_step and not G.GAME.blind.disabled then
      G.GAME.EdgingHands = (G.GAME.EdgingHands or 0) + 1
      if G.GAME.EdgingHands % 2 == 1 then
        return { xchips = -1 }
      end
    end
  end,
})

SMODS.Blind({
  key = "hazard_r",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 38 },
  boss_colour = HEX("e074a2"),

  in_pool = function(self)
    return G.jokers and #G.jokers.cards > 0
  end,

  calculate = function(self, blind, context)
    if not blind.disabled and context.debuff_hand then
      -- context.scoring_name is the internal key of the played hand (e.g., 'Flush')
      local hand_level = G.GAME.hands[context.scoring_name].level
      if hand_level >= 3 then
        blind.triggered = true
        return {
          debuff = true
        }
      end
    end

    -- Before scoring: reset counters
    if context.before then
      G.GAME.PinkRTriggers = 0
      G.GAME.PinkRFailed = false
      G.GAME.PinkRPenalty = 0
    end

    -- Each Joker trigger
    if context.post_trigger and not context.blueprint then
      G.GAME.PinkRTriggers = (G.GAME.PinkRTriggers or 0) + 1
    end

    -- After scoring: check success
    if context.after then
      local total_jokers = #G.jokers.cards
      local triggered = G.GAME.PinkRTriggers or 0
      G.GAME.PinkRFailed = (triggered < total_jokers)
    end

    -- Final scoring step: record the score to potentially subtract it later
    if context.final_scoring_step then
      local result = SMODS.calculate_round_score()
      G.GAME.PinkRPenalty = result
    end
  end,
  abn_artist_credits = {
    artist = "smoliconboi",
  },
})

SMODS.Blind({
  key = "hazard_e",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 34 },
  boss_colour = HEX("66cb94"),

  calculate = function(self, blind, context)
    if not blind.disabled and context.debuff_hand then
      if #context.scoring_hand == 2 then
        blind.triggered = true
        return {
          debuff = true
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "smoliconboi",
  },
})

SMODS.Blind({
  key = "hazard_notequal",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 32 },
  boss_colour = HEX("64d5d4"),

  -- Only appears if the player has Jokers
  in_pool = function(self)
    return G.jokers and #G.jokers.cards > 0
  end,

  -- APPLY EFFECT
  apply_to_joker = function(self, joker)
    -- Use a unique key for the debuff flag to prevent conflicts with other mods
    if not joker.ability or joker.ability.tealed then return end

    local changed_extra = false

    -- MODIFY extra FIRST (often used for scaling jokers)
    if type(joker.ability.extra) == "table" then
      for k, v in pairs(joker.ability.extra) do
        if type(v) == "number" then
          joker.ability.extra[k] = v / 2
          changed_extra = true
        end
      end
    elseif type(joker.ability.extra) == "number" then
      joker.ability.extra = joker.ability.extra / 2
      changed_extra = true
    end

    -- ONLY MODIFY base ability IF EXTRA WAS NOT CHANGED
    if not changed_extra then
      for k, v in pairs(joker.ability) do
        if type(v) == "number" and k ~= 'id' and k ~= 'groups' then
          if (k == "h_x_chips" or k == "x_mult" or k == "x_chips") then
            if v > 1 then joker.ability[k] = v / 2 end
          elseif v > 0 then
            joker.ability[k] = v / 2
          end
        end
      end
    end

    joker.ability.tealed = true
    joker.sell_cost = math.max(1, math.floor(joker.sell_cost / 2))
    joker:juice_up()
  end,
  remove_from_joker = function(self, joker)
    if not joker.ability or not joker.ability.tealed then return end

    local reverted_extra = false

    -- REVERT extra FIRST
    if type(joker.ability.extra) == "table" then
      for k, v in pairs(joker.ability.extra) do
        if type(v) == "number" then
          joker.ability.extra[k] = v * 2
          reverted_extra = true
        end
      end
    elseif type(joker.ability.extra) == "number" then
      joker.ability.extra = joker.ability.extra * 2
      reverted_extra = true
    end

    -- ONLY REVERT base ability IF EXTRA WAS NOT REVERTED
    if not reverted_extra then
      for k, v in pairs(joker.ability) do
        if type(v) == "number" and k ~= 'id' and k ~= 'groups' then
          if (k == "h_x_chips" or k == "x_mult" or k == "x_chips") then
            if v > 0.5 then joker.ability[k] = v * 2 end
          elseif v > 0 then
            joker.ability[k] = v * 2
          end
        end
      end
    end

    joker.ability.tealed = nil
    joker.sell_cost = joker.sell_cost * 2
    joker:juice_up()
  end,

  calculate = function(self, blind, context)
    -- Triggers when the blind is selected
    if context.setting_blind and not G.GAME.blind.disabled then
      for _, joker in ipairs(G.jokers.cards) do
        self:apply_to_joker(joker)
      end
    end

    if not blind.disabled and context.debuff_hand then
      if #context.scoring_hand == 3 then
        blind.triggered = true
        return {
          debuff = true
        }
      end
    end
  end,

  disable = function(self)
    for _, joker in ipairs(G.jokers.cards) do
      self:remove_from_joker(joker)
    end
  end,

  defeat = function(self)
    if G.GAME.blind.disabled then return end
    for _, joker in ipairs(G.jokers.cards) do
      self:remove_from_joker(joker)
    end
  end,

  abn_artist_credits = {
    artist = "smoliconboi",
  },
})

SMODS.Blind {
  key = 'hazard_plus',
  config = {},
  boss = { showdown = true, hazard_blind = true },
  debuff = { suit = "Hearts" },
  name = 'Hazard ±',
  boss_colour = HEX("fd9e57"),
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 36 },
}

SMODS.Blind {
  key = 'hazard_yot',
  config = {},
  boss = { showdown = true, hazard_blind = true },
  debuff = { suit = "Spades" },
  boss_colour = HEX("57aabd"),
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 40 },

  press_play = function(self)
    G.E_MANAGER:add_event(Event({
      func = function()
        local hand = G.hand.cards
        local count = #hand

        if count > 0 then
          -- destroy_count = ceil(50% of held cards)
          local destroy_count = math.ceil(count * 0.50)

          if destroy_count > 0 then
            -- copy hand to a temporary table
            local temp = {}
            for i, c in ipairs(hand) do
              temp[i] = c
            end

            -- shuffle table
            for i = #temp, 2, -1 do
              local j = math.random(i)
              temp[i], temp[j] = temp[j], temp[i]
            end

            -- destroy N random cards
            for i = 1, destroy_count do
              local selected_card = temp[i]
              if selected_card then
                -- In Balatro, it's safer to use the standard removal flow
                -- so things like Glass Card breaks or Sixth Sense trigger correctly
                selected_card:start_dissolve()

                -- trigger joker callbacks if applicable
                if selected_card.playing_card then
                  for j = 1, #G.jokers.cards do
                    eval_card(G.jokers.cards[j], {
                      cardarea = G.jokers,
                      remove_playing_cards = true,
                      removed = { selected_card }
                    })
                  end
                end
              end
            end
          end
        end
        return true
      end
    }))
  end,
}

SMODS.Blind({
  key = "hazard_chain",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 42 },
  boss_colour = HEX("f70000"),
  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end
    if (card.area == G.jokers) and card.config.center and card.config.center.rarity and card.config.center.rarity == 3 then
      return true
    end
  end,

  calculate = function(self, blind, context)
    if not blind.disabled then
      -- modify_hand is called right when the hand is played to determine base Chips/Mult
      if context.modify_hand then
        -- chips and mult are the base values for the poker hand played
        blind.triggered = true
        mult = mod_mult(math.max(math.floor(mult * 0.5 + 0.5), 1))
        hand_chips = mod_chips(math.max(math.floor(hand_chips * 0.5 + 0.5), 0))
        update_hand_text({ sound = 'chips2', modded = true }, { chips = hand_chips, mult = mult })
      end
    end
  end,
})
SMODS.Blind({
  key = "hazard_rook",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 44 },
  boss_colour = HEX("009eff"),
  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end
    if card:get_id() and card:get_id() < 5 then
      return true
    end
  end,

  calculate = function(self, blind, context)
    if not blind.disabled then
      if context.setting_blind then
        blind.hands = {}
        for _, poker_hand in ipairs(G.handlist) do
          blind.hands[poker_hand] = false
        end
      end
      if context.debuff_hand then
        if blind.hands[context.scoring_name] then
          blind.triggered = true
          return {
            debuff = true
          }
        end
        if not context.check then
          blind.hands[context.scoring_name] = true
        end
      end
    end
  end
})
SMODS.Blind({
  key = "hazard_antisigma",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 46 },
  boss_colour = HEX("6d00db"),
  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end
    if card:get_id() and card:get_id() > 5 then
      return true
    end
  end,
  calculate = function(self, blind, context)
    if not blind.disabled then
      if context.hand_drawn then
        local any_forced = nil
        for _, playing_card in ipairs(G.hand.cards) do
          if playing_card.ability.forced_selection then
            any_forced = true
          end
        end
        if not any_forced then
          G.hand:unhighlight_all()
          local forced_card = pseudorandom_element(G.hand.cards, 'vremade_cerulean_bell')
          forced_card.ability.forced_selection = true
          G.hand:add_to_highlighted(forced_card)
        end
      end
    end
  end,
  disable = function(self)
    for _, playing_card in ipairs(G.playing_cards) do
      playing_card.ability.forced_selection = nil
    end
  end
})

SMODS.Blind({
  key = "hazard_belphegor",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 48 },
  boss_colour = HEX("e18171"),
  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end

    -- Define the target ranks
    local primes = { [2] = true, [3] = true, [5] = true, [7] = true }
    local id = card:get_id()

    -- Debuff 2 3 5 and 7
    if id and primes[id] then
      return true
    end
  end,
  get_loc_debuff_text = function(self)
    return G.GAME.blind.loc_debuff_text ..
        (G.GAME.blind.only_hand and ' [' .. localize(G.GAME.blind.only_hand, 'poker_hands') .. ']' or '')
  end,
  calculate = function(self, blind, context)
    if not blind.disabled then
      if context.setting_blind then
        blind.only_hand = false
      end
      if context.debuff_hand then
        if blind.only_hand and blind.only_hand ~= context.scoring_name then
          blind.triggered = true
          return {
            debuff = true
          }
        end
        if not context.check then
          blind.only_hand = context.scoring_name
        end
      end
    end
  end
})

SMODS.Blind({
  key = "hazard_chakra",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 50 },
  boss_colour = HEX("efc03c"),
  debuff_hand = function(self, cards, hand, handname, check)
    if G.GAME.blind.disabled then return end

    -- Count unique suits in the current selection
    local suits_found = {}
    local count = 0
    for i = 1, #cards do
      local suit = cards[i].base.suit
      if not suits_found[suit] then
        suits_found[suit] = true
        count = count + 1
      end
    end

    -- Disallow the hand if it has fewer than 3 different suits
    if count < 3 or G.GAME.current_round.discards_left > 0 then
      return true
    end
  end,
  get_loc_debuff_text = function(self)
    return "Must have 3 suits and 0 discards!"
  end,
  loc_vars = function(self)
    return { vars = { 3 } }
  end
})


SMODS.Blind({
  key = "hazard_axe",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 52 },
  boss_colour = HEX("4b71e4"),
  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then
      return false
    end
    if (card.area == G.jokers) and card.config.center and card.config.center.rarity and card.config.center.rarity == 4 then
      return true
    end
  end,
  debuff_hand = function(self, cards, hand, handname, check)
    if G.GAME.blind.disabled then return end

    -- Check if any card in the hand is a Spade
    local has_spade = false
    for i = 1, #cards do
      if cards[i]:is_suit("Spades") then
        has_spade = true
        break
      end
    end

    -- Debuff the hand if it doesn't contain a Spade
    if not has_spade then
      return true
    end
  end,
  get_loc_debuff_text = function(self)
    return "Must include a Spade!"
  end
})

SMODS.Blind({
  key = "hazard_chalice",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 54 },
  boss_colour = HEX("e65495"),
  mult = 1,

  calculate = function(self, blind, context)
    if not blind.disabled then
      -- Refresh targets every time a hand is drawn
      if context.hand_drawn then
        -- Joker Debuff Logic
        for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].ability.hazard_chalice_joker then
            G.jokers.cards[i].ability.hazard_chalice_joker = nil
            G.jokers.cards[i].wasdebuffed = false
            G.jokers.cards[i]:set_debuff(false)
            SMODS.recalc_debuff(G.jokers.cards[i])
          end
        end

        if G.jokers.cards[1] then
          local random_joker = pseudorandom_element(G.jokers.cards, pseudoseed('hazard_joker'))
          random_joker.ability.hazard_chalice_joker = true
          SMODS.recalc_debuff(random_joker)
          random_joker:juice_up()
        end

        -- Playing Card Debuff Logic
        G.GAME.blind.amaranth_target = nil
        if G.hand and G.hand.cards[1] then
          local random_card = pseudorandom_element(G.hand.cards, pseudoseed('amaranth'))
          G.GAME.blind.amaranth_target = random_card
        end
        blind:wiggle()
      end

      -- Blind Score Increase + Popup
      if context.first_hand_drawn then
        -- Display the popup message
        G.E_MANAGER:add_event(Event({
          trigger = 'immediate',
          func = function()
            play_sound('whoosh1', 0.8, 0.7)
            attention_text({
              scale = 0.8,
              text = "X9 blind requirement",
              hold = 10,
              align = 'cm',
              offset = { x = 0, y = 0 },
              major = G.play
            })

            -- Update the actual score
            G.GAME.blind.chips = G.GAME.blind.chips * 9
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

            return true
          end
        }))
      end
    end
  end,

  recalc_debuff = function(self, card, from_blind)
    if G.GAME.blind.disabled then return false end
    if card.area == G.hand and G.GAME.blind.amaranth_target and card == G.GAME.blind.amaranth_target then
      return true
    end
    if card.area == G.jokers and card.ability.hazard_chalice_joker then
      return true
    end
  end,

  disable = function(self)
    for _, joker in ipairs(G.jokers.cards) do
      joker.ability.hazard_chalice_joker = nil
    end
    G.GAME.blind.amaranth_target = nil
  end,

  defeat = function(self)
    for _, joker in ipairs(G.jokers.cards) do
      joker.ability.hazard_chalice_joker = nil
    end
    G.GAME.blind.amaranth_target = nil
  end
})

SMODS.Blind({
  key = "hazard_arrow",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 56 },
  boss_colour = HEX("d4e3e5"),

  -- Localization variables for the UI to show the 1 in 5 chance
  loc_vars = function(self)
    local numerator, denominator = SMODS.get_probability_vars(self, 1, 5, 'hazard_arrow_flip')
    return { vars = { numerator, denominator } }
  end,

  -- Debuff Logic: Hand is debuffed if it doesn't have both an Even and an Odd card
  debuff_hand = function(self, cards, hand, handname, spec)
    if G.GAME.blind.disabled then return end

    local has_even = false
    local has_odd = false

    for i = 1, #cards do
      local id = cards[i]:get_id()

      if id == 14 then
        -- Treat Ace as Odd
        has_odd = true
      elseif id < 11 then
        -- Check numeric cards 2 through 10
        if id % 2 == 0 then
          has_even = true
        else
          has_odd = true
        end
      end
    end

    if not (has_even and has_odd) then
      return true
    end
  end,

  -- Flipping Logic: 1/5 cards stay flipped when drawn to hand
  calculate = function(self, blind, context)
    if not blind.disabled then
      if context.stay_flipped and context.to_area == G.hand and
          SMODS.pseudorandom_probability(blind, 'hazard_arrow_flip', 1, 5) then
        return {
          stay_flipped = true
        }
      end
    end
  end,

  -- Cleanup Logic: Flip cards back over when the blind is defeated or disabled
  disable = function(self)
    for i = 1, #G.hand.cards do
      if G.hand.cards[i].facing == 'back' then
        G.hand.cards[i]:flip()
      end
    end
  end,
})

SMODS.Blind({
  key = "hazard_tower",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  debuff = { h_size_ge = 5 },
  pos = { x = 0, y = 58 },
  boss_colour = HEX("ccff33"),

  press_play = function(self)
    G.E_MANAGER:add_event(Event({
      func = function()
        -- Iterate backwards when removing items from a list to avoid indexing issues
        for i = #G.jokers.cards, 1, -1 do
          local joker = G.jokers.cards[i]
          -- Check if the joker has an edition (Foil, Holo, Poly, Neg)
          if joker.edition then
            -- Dissolve the card
            joker:start_dissolve()
          end
        end
        return true
      end
    }))
  end,
})

SMODS.Blind({
  key = "hazard_triangle",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 72 },
  boss_colour = HEX("f5a600"),

  defeat = function(self)
    G.GAME.EdgingHands = 0
  end,

  calculate = function(self, blind, context)
    -- Suit Debuff Mechanic
    if not blind.disabled and context.debuff_hand then
      local unique_suits = {}
      local suit_count = 0

      for _, card in ipairs(context.full_hand or {}) do
        local suit = card.base.suit
        if suit and not unique_suits[suit] then
          unique_suits[suit] = true
          suit_count = suit_count + 1
        end
      end

      if suit_count > 4 then
        blind.triggered = true
        return {
          debuff = true
        }
      end
    end

    --Even hands debuff
    if context.final_scoring_step and not blind.disabled then
      G.GAME.EdgingHands = (G.GAME.EdgingHands or 0) + 1
      if G.GAME.EdgingHands % 2 ~= 1 then
        return { xchips = -1 }
      end
    end
  end,
})

-- ==========================================
-- Hazard Negative Failure Popup Helper
-- ==========================================
local function show_hazard_fail_text()
  local disp_text = "All cards must score!"

  G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = G.SETTINGS.GAMESPEED * 0.05,
    blockable = false,
    func = function()
      play_sound('cancel', 0.8, 1.2)
      attention_text({
        scale = 0.75,
        text = disp_text,
        maxw = 14,
        hold = G.SETTINGS.GAMESPEED * (#disp_text * 0.04 + 1.2),
        align = 'cm',
        offset = { x = 0, y = -2.5 },
        major = G.play
      })
      return true
    end
  }))
end

SMODS.Blind({
  key = "hazard_negative",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 64 },
  boss_colour = HEX("58605e"),
  calculate = function(self, card, context)
    -- Triggered when entering the blind: back up original chips
    if context.setting_blind then
      G.GAME.SpectralChips = G.GAME.blind.chips
    end

    -- Trigger when the first hand is drawn and blind isn't disabled
    if context.first_hand_drawn and not G.GAME.blind.disabled then
      local unique_editions = {}
      local unique_count = 0

      -- Helper function to check and count editions
      local function check_card_edition(c)
        if c and c.edition then
          local ed_type = c.edition.type or next(c.edition)
          if ed_type and ed_type ~= 'key' and not unique_editions[ed_type] then
            unique_editions[ed_type] = true
            unique_count = unique_count + 1
          end
        end
      end

      -- Scan Jokers
      if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
          check_card_edition(j)
        end
      end

      -- Scan Playing Cards
      if G.playing_cards then
        for _, c in ipairs(G.playing_cards) do
          check_card_edition(c)
        end
      end

      -- Apply linear multiplier (e.g., 2 editions = x5.0)
      if unique_count > 0 then
        local multiplier = unique_count * 2.5
        G.GAME.blind.chips = G.GAME.blind.chips * multiplier
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
      end
    end

    -- ====================================================================
    -- MATCHING HAND COUNT LOGIC (Impostor-style state trapping)
    -- ====================================================================
    if not G.GAME.blind.disabled then
      -- Before scoring: Reset trackers
      if context.before then
        G.GAME.HazardMismatchDetected = false
        G.GAME.HazardPenalty = 0
      end

      -- During scoring: Compare full hand size to scoring hand size
      if context.scoring_hand and context.full_hand then
        if #context.full_hand ~= #context.scoring_hand then
          G.GAME.HazardMismatchDetected = true
        end
      end

      -- Final scoring step: Record the score to nullify and pop up text
      if context.final_scoring_step and G.GAME.HazardMismatchDetected then
        local result = SMODS.calculate_round_score()
        G.GAME.HazardPenalty = result
        show_hazard_fail_text()
      end
    end
  end,

  disable = function(self)
    if G.GAME.SpectralChips then
      G.GAME.blind.chips = G.GAME.SpectralChips
      G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end
    G.GAME.HazardMismatchDetected = false
    G.GAME.HazardPenalty = 0
  end,

  defeat = function(self)
    self:disable()
  end
})

-- ==========================================
-- Hook into Game.update (State Trapping)
-- ==========================================
local old_update = Game.update
function Game:update(dt)
  old_update(self, dt)

  -- Subtract the scored points if a mismatch occurred (State 3 and 19)
  if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.HazardMismatchDetected then
    if G.STATE == 3 or G.STATE == 19 then
      G.GAME.chips = G.GAME.chips - (G.GAME.HazardPenalty or 0)
      G.GAME.HazardPenalty = 0
    end
  end
end

-- ==========================================
-- Game Over Interception Hook Adaptation
-- ==========================================
local old_update_game_over = Game.update_game_over
function Game:update_game_over(dt)
  if G.GAME.blind and G.GAME.HazardMismatchDetected and G.GAME.current_round.hands_left > 0 then
    -- Mimic Impostors handling: redraw to hand limit and continue round
    if G.deck and #G.deck.cards > 0 then
      local draw_count = G.hand.config.card_limit - #G.hand.cards
      SMODS.draw_cards(draw_count)
    end

    G.GAME.HazardMismatchDetected = false
    G.STATE = G.STATES.SELECTING_HAND
    return
  else
    old_update_game_over(self, dt)
  end
end

SMODS.Blind({
  key = "hazard_jewel",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 60 },
  boss_colour = HEX("416eac"),

  calculate = function(self, blind, context)
    -- Debuff the starting hand
    if context.first_hand_drawn and not blind.disabled then
      for _, card in ipairs(G.hand.cards) do
        card:set_debuff(true)
        card.wasdebuffed = true
      end
    end

    -- Hazard evaluations before scoring
    if not blind.disabled and context.debuff_hand then
      local hand_size = #(context.full_hand or {})

      -- no 3 or 5
      if hand_size == 3 or hand_size == 5 then
        blind.triggered = true
        return {
          debuff = true
        }
      end

      -- must play 3+ suits
      local unique_suits = {}
      local suit_count = 0

      for _, card in ipairs(context.full_hand or {}) do
        local suit = card.base.suit
        if suit and not unique_suits[suit] then
          unique_suits[suit] = true
          suit_count = suit_count + 1
        end
      end

      if suit_count < 3 then
        blind.triggered = true
        return {
          debuff = true
        }
      end
    end
  end,

  disable = function(self)
    for _, card in ipairs(G.hand.cards) do
      card:set_debuff(false)
      card.wasdebuffed = false
    end
  end,
})

SMODS.Blind({
  key = "hazard_brass",
  boss = { showdown = true, hazard_blind = true },
  debuff = {
    h_size_ge = 6,
  },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 62 },
  boss_colour = HEX("d9a066"),

  defeat = function(self)
    SMODS.change_play_limit(-1)
    SMODS.change_discard_limit(-1)
  end,

  calculate = function(self, card, context)
    if context.setting_blind and not G.GAME.blind.disabled then
      SMODS.change_play_limit(1)
      SMODS.change_discard_limit(1)
    end

    -- change hand values
    if context.modify_hand and context.scoring_hand and not G.GAME.blind.disabled then
      local played_suits = {}

      for i = 1, #context.scoring_hand do
        local scoring_card = context.scoring_hand[i]

        -- suit check
        for suit_key, _ in pairs(SMODS.Suits) do
          if scoring_card:is_suit(suit_key) then
            played_suits[suit_key] = true
          end
        end
      end

      -- flip cards
      if G.hand.cards then
        for _, card in ipairs(G.hand.cards) do
          if card.facing == 'front' then
            card:flip()
          end
        end
      end

      -- count suits
      local unplayed_suit_count = 0
      for suit_key, _ in pairs(SMODS.Suits) do
        if not played_suits[suit_key] then
          unplayed_suit_count = unplayed_suit_count + 1
        end
      end

      -- divide base mult
      if unplayed_suit_count > 0 then
        mult = mod_mult(mult / unplayed_suit_count)

        -- update UI
        update_hand_text({ delay = 0 }, { chips = hand_chips, mult = mult })
      end
    end
  end,
})

SMODS.Blind({
  key = "hazard_x",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 66 },
  boss_colour = HEX("42d0c4"),
  mult = 2,

  calculate = function(self, card, context)
    if context.before and not G.GAME.blind.disabled then
      -- Pick a random effect
      local effect = pseudorandom('calamity_choice', 1, 7)
      G.GAME.blind.calamity_effect = effect

      -- Display the chosen effect
      show_calamity_text(effect)

      -- +1X Base
      if effect == 2 then
        G.GAME.blind.mult = G.GAME.blind.mult + 1
        G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante) * G.GAME.blind.mult *
            G.GAME.starting_params.ante_scaling
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
      end

      -- Randomize Enhancements
      if effect == 3 then
        local enhanced_list = {}
        for i = 1, #G.play.cards do
          local target_card = G.play.cards[i]
          if target_card.config.center ~= G.P_CENTERS.c_base then
            table.insert(enhanced_list, target_card)
          end
        end

        if #enhanced_list > 0 then
          for _, enhanced_card in ipairs(enhanced_list) do
            local enhancement_key = { key = 'calamity_enh', guaranteed = true }
            local random_enhancement = G.P_CENTERS[SMODS.poll_enhancement(enhancement_key)]

            if random_enhancement then
              enhanced_card:set_ability(random_enhancement, nil, true)
              enhanced_card:juice_up()
            end
          end
        end
      end

      -- +0.2X Base
      if effect == 5 then
        G.GAME.blind.mult = G.GAME.blind.mult + (0.2 * G.GAME.current_round.discards_left) +
            (0.2 * G.GAME.current_round.hands_left)
        G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante) * G.GAME.blind.mult *
            G.GAME.starting_params.ante_scaling
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
      end

      -- Flip cards
      if effect == 6 then
        for _, card in ipairs(G.hand.cards) do
          if card.facing == 'front' then
            card:flip()
          end
        end
      end

      if effect == 4 and #G.play.cards > 0 then
        local destroyed_target = pseudorandom_element(G.play.cards, 'calamity_destroy')
        destroyed_target.should_destroy = true
      end
    end

    -- Destroy a random card
    if context.destroy_card and context.cardarea == G.play and not G.GAME.blind.disabled then
      if context.destroy_card.should_destroy then
        return { remove = true }
      end
    end

    if context.modify_hand and context.scoring_hand and not G.GAME.blind.disabled and current_effect == 7 then
      mult = mod_mult(mult / #context.full_hand)
      -- update UI
      update_hand_text({ delay = 0 }, { chips = hand_chips, mult = mult })
    end

    -- Joker destroy
    if context.after then
      local effect = G.GAME.blind.calamity_effect

      if effect == 1 and #G.jokers.cards > 0 then
        local result = SMODS.calculate_round_score()
        if result < G.GAME.blind.chips then
          local sacrificed_joker = pseudorandom_element(G.jokers.cards, 'calamity_joker')
          G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
              sacrificed_joker:start_dissolve()
              return true
            end
          }))
        end
      end

      -- Reset
      G.GAME.blind.calamity_effect = nil
    end
  end,
})

SMODS.Blind({
  key = "hazard_labrys",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 68 },
  boss_colour = HEX("fde698"),

  debuff_hand = function(self, cards, hand, handname, check)
    if G.GAME.blind.disabled then return end

    -- If the current evaluated poker hand is in our banned table, block it!
    if G.GAME.banned_labrys_hands and G.GAME.banned_labrys_hands[handname] then
      return true
    end
  end,

  calculate = function(self, card, context)
    -- trigger every hand
    if context.hand_drawn then
      G.GAME.EdgingHands = (G.GAME.EdgingHands or 0) + 1
      for _, c in ipairs(G.playing_cards) do
        -- Debuff evens
        if G.GAME.EdgingHands % 2 ~= 1 and not G.GAME.blind.disabled then
          if ABN.is_even(c) then
            c:set_debuff(true)
            c.wasdebuffed = true
          elseif ABN.is_odd(c) then
            c:set_debuff(false)
            c.wasdebuffed = false
          end
          -- Debuff odds
        elseif G.GAME.EdgingHands % 2 == 1 and not G.GAME.blind.disabled then
          if ABN.is_even(c) then
            c:set_debuff(false)
            c.wasdebuffed = false
          elseif ABN.is_odd(c) then
            c:set_debuff(true)
            c.wasdebuffed = true
          end
        end
      end
    end

    -- Ban discarded hands
    if context.pre_discard and not context.hook then
      if G.hand.highlighted and #G.hand.highlighted > 0 then
        local discarded_hand_type, _ = G.FUNCS.get_poker_hand_info(G.hand.highlighted)

        if discarded_hand_type and discarded_hand_type ~= 'Egg' then
          if not G.GAME.banned_labrys_hands then G.GAME.banned_labrys_hands = {} end
          if not G.GAME.banned_labrys_hands[discarded_hand_type] then
            G.GAME.banned_labrys_hands[discarded_hand_type] = true
          end
        end
      end
    end

    if context.before then
      -- find most played hand
      local max_played = -1
      for k, v in pairs(G.GAME.hands) do
        if v.visible and v.played > max_played then
          max_played = v.played
        end
      end

      local most_played_hands = {}
      if max_played >= 0 then
        for k, v in pairs(G.GAME.hands) do
          if v.visible and v.played == max_played then
            most_played_hands[k] = true
          end
        end
      end

      -- if most played hand double requirement
      if most_played_hands[context.scoring_name] then
        G.GAME.blind.chips = G.GAME.blind.chips * 2
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
      end
    end
  end,

  disable = function(self)
    for _, card in ipairs(G.playing_cards) do
      card:set_debuff(false)
      card.wasdebuffed = false
    end
  end,

  defeat = function(self)
    G.GAME.EdgingHands = 0
  end,

})

local original_game_update = Game.update

function Game:update(dt)
  original_game_update(self, dt)

  if G.STAGE ~= G.STAGES.RUN then return end

  if G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_abn_hazard_moth' and not G.GAME.blind.disabled then
    if G.jokers and G.jokers.cards then
      for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]

        j.states.drag.can = false
      end
    end
    for _, c in ipairs(G.playing_cards) do
      c.states.drag.can = false
    end
  end

  if G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_abn_hazard_moth' and G.GAME.blind.disabled or G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_abn_hazard_moth' and G.STATE == 8 then
    if G.jokers and G.jokers.cards then
      for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]

        j.states.drag.can = true
      end
    end
    for _, c in ipairs(G.playing_cards) do
      c.states.drag.can = true
    end
  end
end

local draw_to_hand_ref = G.FUNCS.draw_from_deck_to_hand
G.FUNCS.draw_from_deck_to_hand = function(e)
  if G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_abn_hazard_moth' and not G.GAME.blind.disabled then
    if #G.hand.cards > 0 then
      return
    end
  end

  -- Call the original logic
  draw_to_hand_ref(e)
end

SMODS.Blind({
  key = "hazard_moth",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 70 },
  boss_colour = HEX("c292a1"),
  mult = 7,

  calculate = function(self, blind, context)
    if G.hand and G.hand.highlighted then
      for i = 1, #G.hand.highlighted do
        G.hand.highlighted[i].ability.forced_selection = true
      end
    end

    if blind.disabled then
      G.GAME.blind.mult = 2
      G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante) * G.GAME.blind.mult *
          G.GAME.starting_params.ante_scaling
      G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end
  end,
})

SMODS.Blind({
  key = "hazard_sigil",
  boss = { showdown = true, hazard_blind = true },
  atlas = "AbandoniaBlinds",
  pos = { x = 0, y = 74 },
  boss_colour = HEX("fd5f55"),

  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  drawn_to_hand = function(self)
    self:sync_remaining_uses()
  end,

  use_discard = function(self)
    self:sync_remaining_uses()
  end,

  sync_remaining_uses = function(self)
    if G.GAME and G.GAME.current_round then
      local remaining_hands = G.GAME.current_round.hands_left
      local remaining_discards = G.GAME.current_round.discards_left
      local min_value = math.min(remaining_hands, remaining_discards)

      G.GAME.current_round.hands_left = min_value
      G.GAME.current_round.discards_left = min_value

      if min_value == 0 then
        G.E_MANAGER:add_event(Event({
          func = function()
            G.STATE = G.STATES.HAND_PLAYED
            G.STATE_COMPLETE = true
            end_round()
            return true
          end
        }))
      end
    end
  end,

  calculate = function(self, card, context)
    if context.setting_blind then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          local original_highlighted_limit = G.hand.config.highlighted_limit

          G.hand.config.highlighted_limit = 9999

          local discarded_count = 0
          local any_selected = false

          local half_deck_size = math.floor(#G.deck.cards / 2)
          local all_cards = { G.hand.cards, G.deck.cards }

          if half_deck_size > 0 then
            for i = 1, half_deck_size do
              local selected_card = G.deck.cards[#G.deck.cards]
              if selected_card then
                G.hand:add_to_highlighted(selected_card, true)

                for k, v in ipairs(G.deck.cards) do
                  if v == selected_card then
                    table.remove(G.deck.cards, k)
                    break
                  end
                end

                any_selected = true
              end
            end
          end

          -- Discard selected highlighted cards
          if any_selected then
            G.FUNCS.discard_cards_from_highlighted(nil, true)
          end

          G.hand:unhighlight_all()
          G.hand.config.highlighted_limit = original_highlighted_limit

          return true
        end
      }))
    end

    if context.modify_scoring_hand then
      local is_scoring = false
      for _, scoring_card in ipairs(context.scoring_hand) do
        if scoring_card == context.other_card then
          is_scoring = true
          break
        end
      end

      if is_scoring then
        return {
          remove_from_hand = true
        }
      else
        return {
          add_to_hand = true
        }
      end
    end
  end,
})

-- Invasion Blinds

SMODS.Sound({
  key = 'music_invasion_blind',
  path = 'music_bluff.ogg',
  pitch = 1,
  speed = 1,
  select_music_track = function(self)
    if G.GAME.blind and G.GAME.blind.config and G.GAME.blind.config.blind
        and G.GAME.blind.config.blind.boss and G.GAME.blind.config.blind.boss.invasion_blind then
      return 1e10
    end
  end
})

SMODS.Blind {
  key = "blasphemous_bow",
  dollars = 6,
  mult = 2,
  debuff = { suit = "abn_Bow" },
  boss = { min = 4, invasion_blind = true },
  atlas = "InvasionBlinds",
  pos = { x = 0, y = 4 },
  boss_colour = HEX("3f2c6d"),
  calculate = function(self, blind, context)
    if context.debuff_hand then
      if context.scoring_name == "Pair" then
        blind.triggered = true
        return {
          debuff = true
        }
      end
    end
  end
}

SMODS.Blind {
  key = "pernicious_penumbra",
  dollars = 6,
  mult = 2,
  debuff = { suit = "abn_Penumbra" },
  boss = { min = 4, invasion_blind = true },
  atlas = "InvasionBlinds",
  pos = { x = 0, y = 5 },
  boss_colour = HEX("8570c7"),
  calculate = function(self, blind, context)
    if context.debuff_hand then
      if context.scoring_name == "Full House" then
        blind.triggered = true
        return {
          debuff = true
        }
      end
    end
  end
}

SMODS.Blind {
  key = "deductible_delirium",
  dollars = 6,
  mult = 2,
  debuff = {},
  boss = { min = 4, invasion_blind = true },
  atlas = "InvasionBlinds",
  pos = { x = 0, y = 6 },
  boss_colour = HEX("f13938"),
  calculate = function(self, blind, context)
    if context.debuff_hand then
      if context.scoring_name == "Three of a Kind" then
        blind.triggered = true
        return {
          debuff = true
        }
      end
    end
  end,
  recalc_debuff = function(self, card, from_blind)
    if card:get_id() == 14 and not card.debuff then
      return true
    end
  end,
}

SMODS.Blind {
  key = "tyrannic_tie",
  dollars = 6,
  mult = 2,
  debuff = { suit = "abn_Tie" },
  boss = { min = 4, invasion_blind = true },
  atlas = "InvasionBlinds",
  pos = { x = 0, y = 7 },
  boss_colour = HEX("82e888"),
  calculate = function(self, blind, context)
    if context.debuff_hand then
      if context.scoring_name == "Pair" then
        blind.triggered = true
        return {
          debuff = true
        }
      end
    end
  end
}

local function abn_count_suits(cards)
  local suits = {}
  for _, v in ipairs(cards) do
    suits[v.base.suit] = true
  end

  local unique_suits = 0
  for _ in pairs(suits) do
    unique_suits = unique_suits + 1
  end
  return unique_suits
end
SMODS.Blind {
  key = "genocidal_gene",
  dollars = 6,
  mult = 2,
  boss = { min = 4, invasion_blind = true },
  atlas = "InvasionBlinds",
  pos = { x = 0, y = 8 },
  boss_colour = HEX("f13938"),
  calculate = function(self, blind, context)
    if context.debuff_hand then
      if context.scoring_name == "Straight" then
        blind.triggered = true
        return {
          debuff = true
        }
      end
    end
  end,
  debuff_hand = function(self, cards, hand, handname, check)
    if abn_count_suits(cards) ~= 2 then
      return true
    end
    return false
  end,
}

SMODS.Blind {
  key = "key_knuckle",
  dollars = 6,
  mult = 2,
  debuff = {},
  boss = { min = 4, invasion_blind = true },
  atlas = "InvasionBlinds",
  pos = { x = 0, y = 21 },
  boss_colour = HEX("f13938"),
  calculate = function(self, blind, context)
    if context.discard then
      return {
        remove = true
      }
    end
  end,
  recalc_debuff = function(self, card, from_blind)
    if not SMODS.has_no_rank(card) and card:get_id() and card:get_id() > 4 and not card.debuff then
      return true
    end
  end,
}

SMODS.Blind {
  key = "nocturnal_needle",
  dollars = 6,
  mult = 2,
  boss = { min = 4, invasion_blind = true },
  atlas = "InvasionBlinds",
  pos = { x = 0, y = 1 },
  boss_colour = HEX("f13938"),
  calculate = function(self, blind, context)
    if context.final_scoring_step then
      for _, v in ipairs(context.full_hand) do
        if v.seal then
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
              v:set_seal(nil)
              v:juice_up(0.3, 0.5)
              return true
            end
          }))
        end
      end
    end
    if context.debuff_card and context.debuff_card.base.suit == "abn_suitless" then
      return { debuff = true }
    end
  end,
}

SMODS.Blind {
  key = "nostalgic_nail",
  dollars = 6,
  mult = 2,
  boss = { min = 4, invasion_blind = true },
  atlas = "InvasionBlinds",
  pos = { x = 0, y = 2 },
  boss_colour = HEX("f13938"),
  calculate = function(self, blind, context)
    if context.before then
      for _, card in ipairs(context.scoring_hand) do
        if G.GAME.abn_rank_upgrades[card.base.value] and G.GAME.abn_rank_upgrades[card.base.value].level > 1 then
          ABN.level_up_rank(card, card.base.value, -1)
        end
      end
      if G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played > 0 then
        return {
          xblindsize = G.GAME.hands[context.scoring_name].played
        }
      end
    end
  end,
}

SMODS.Blind {
  key = "nauseous_numb",
  dollars = 6,
  mult = 2,

  debuff = { h_size_ge = 4, h_size_le = 4 },
  boss = { min = 4, invasion_blind = true },
  atlas = "InvasionBlinds",
  pos = { x = 0, y = 3 },
  boss_colour = HEX("f13938"),
  calculate = function(self, blind, context)
    if context.final_scoring_step then
      local even = {}
      for _, v in ipairs(context.full_hand) do
        if ABN.is_even(v) then
          even[#even + 1] = v
        end
      end
      SMODS.destroy_cards(even)
    end
  end,
}

SMODS.Blind {
  key = "murder_machine",
  dollars = 6,
  mult = 2,

  debuff = { h_size_ge = 4, h_size_le = 4 },
  boss = { min = 4, invasion_blind = true },
  atlas = "InvasionBlinds",
  pos = { x = 0, y = 0 },
  boss_colour = HEX("f13938"),
  calculate = function(self, blind, context)
    if context.final_scoring_step then
      local blind_chips = G.GAME.blind and G.GAME.blind.chips or 0
      local result = SMODS.calculate_round_score() + G.GAME.chips

      if G.GAME.current_round.hands_played == 0 or result >= blind_chips then
        local cards_to_destroy = {}
        for _, v in ipairs(context.full_hand) do
          cards_to_destroy[#cards_to_destroy + 1] = v
        end
        SMODS.destroy_cards(cards_to_destroy)
      end
    end
  end,
}
