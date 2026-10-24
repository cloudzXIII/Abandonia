if not (SMODS.Mods["Fortlatro"] or {}).can_load then
  FN = FN or {}
  FN.AuraPool = FN.AuraPool or {}

  -- Create collection entry for Auras
  local prev_tabs = SMODS.current_mod.custom_collection_tabs
  SMODS.current_mod.custom_collection_tabs = function()
    local tabs = prev_tabs and prev_tabs() or {}
    tabs[#tabs + 1] = UIBox_button({
      button = 'your_collection_fn_auras',
      id = 'your_collection_fn_auras',
      label = { "Auras" },
      minw = 5,
      minh = 1
    })
    return tabs
  end

  -- Helper: checks if a Sticker is an Aura via its set
  function FN_is_aura(key)
    if not key or not SMODS.Stickers[key] then return false end
    return SMODS.Stickers[key].set == "aura"
  end

  local function aura_ui()
    local auras = {}

    for k, v in pairs(SMODS.Stickers) do
      if FN_is_aura(k) then
        auras[k] = v
      end
    end

    return SMODS.card_collection_UIBox(auras, { 5, 5 }, {
      snap_back = true,
      hide_single_page = true,
      collapse_single_page = true,
      center = 'c_base',
      h_mod = 1.18,
      back_func = 'your_collection_other_gameobjects',
      modify_card = function(card, center)
        card.ignore_pinned = true
        center:apply(card, true)

        if SMODS.Stickers[center.key].abn_artist_credits then
          card.ability.abn_artist_credits = SMODS.Stickers[center.key].abn_artist_credits
        end
      end,
    })
  end

  G.FUNCS.your_collection_fn_auras = function()
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
      definition = aura_ui()
    }
  end

  local function wrap_without_auras(func)
    -- Temporarily remove our auras from SMODS.Stickers
    local removed = {}
    for k, v in pairs(SMODS.Stickers) do
      if FN_is_aura(k) then
        removed[k] = v
        SMODS.Stickers[k] = nil
      end
    end

    local ret = func()

    -- Add them back once the UI was created
    for k, v in pairs(removed) do
      SMODS.Stickers[k] = v
    end

    return ret
  end

  -- Override Stickers tab in collection
  local stickers_ui_ref = create_UIBox_your_collection_stickers
  create_UIBox_your_collection_stickers = function()
    return wrap_without_auras(stickers_ui_ref)
  end

  -- Override Stickers tab in Additions
  local other_objects_ref = create_UIBox_Other_GameObjects
  create_UIBox_Other_GameObjects = function()
    return wrap_without_auras(other_objects_ref)
  end

  --- Tooltip builder for Auras
  --- @param type string
  --- @return table | nil
  function aura_tooltip(type)
    local key = 'fn_' .. type .. '_aura'
    local aura = SMODS.Stickers[key]
    local vars = {}

    if not aura then return end

    if aura.loc_vars then
      local dummy_card = { ability = {} }
      aura:apply(dummy_card, true)
      vars = aura:loc_vars({}, dummy_card).vars
    end

    return {
      set = 'Other',
      key = key,
      vars = vars
    }
  end

  -- Make remove_from_deck trigger on auras
  local card_remove_from_deck_ref = Card.remove_from_deck
  function Card:remove_from_deck(from_debuff)
    if self.ability then
      for sticker_key, active in pairs(self.ability) do
        if active and FN_is_aura(sticker_key) then
          local sticker_obj = SMODS.Stickers[sticker_key]
          if sticker_obj and sticker_obj.remove_from_deck then
            sticker_obj:remove_from_deck(self, from_debuff)
          end
        end
      end
    end
    card_remove_from_deck_ref(self, from_debuff)
  end

  local card_remove_ref = Card.remove
  function Card:remove()
    if self.ability then
      for sticker_key, active in pairs(self.ability) do
        if active and FN_is_aura(sticker_key) then
          local sticker_obj = SMODS.Stickers[sticker_key]
          if sticker_obj and sticker_obj.remove_from_deck then
            sticker_obj:remove_from_deck(self, false)
          end
        end
      end
    end
    card_remove_ref(self)
  end

  local card_remove_sticker_ref = Card.remove_sticker
  function Card:remove_sticker(sticker_key)
    if self.ability and self.ability[sticker_key] and FN_is_aura(sticker_key) then
      local sticker_obj = SMODS.Stickers[sticker_key]
      if sticker_obj and sticker_obj.remove_from_deck then
        sticker_obj:remove_from_deck(self, false)
      end
    end
    card_remove_sticker_ref(self, sticker_key)
  end

  -- Trigger add_to_deck effects on auras
  local card_add_to_deck_ref = Card.add_to_deck
  function Card:add_to_deck(from_debuff)
    card_add_to_deck_ref(self, from_debuff)
    if self.ability then
      for sticker_key, active in pairs(self.ability) do
        if active and FN_is_aura(sticker_key) then
          local sticker_obj = SMODS.Stickers[sticker_key]
          if sticker_obj and sticker_obj.add_to_deck then
            sticker_obj:add_to_deck(self, from_debuff)
          end
        end
      end
    end
  end

  local card_add_sticker_ref = Card.add_sticker
  function Card:add_sticker(sticker_key, silent)
    card_add_sticker_ref(self, sticker_key, silent)
    if self.ability and self.ability[sticker_key] and FN_is_aura(sticker_key) then
      local sticker_obj = SMODS.Stickers[sticker_key]
      if sticker_obj and sticker_obj.add_to_deck and self.added_to_deck then
        sticker_obj:add_to_deck(self, false)
      end
    end
  end

  -- Apply auras with this function
  function fn_add_aura(card, new_aura_key)
    if not new_aura_key then
      new_aura_key = SMODS.poll_object({ pool = FN.AuraPool, seed = "fn_aurapool" })
    end

    if card.ability and SMODS and SMODS.Sticker and SMODS.Sticker.obj_buffer then
      for _, sticker in ipairs(SMODS.Sticker.obj_buffer) do
        if card.ability[sticker] and FN_is_aura(sticker) then
          card:remove_sticker(sticker)
        end
      end
    end

    card:add_sticker(new_aura_key, true)
  end

  -- Inject auras into FN.AuraPool automatically upon load
  local old_sticker_inject = SMODS.Sticker.inject
  function SMODS.Sticker:inject()
    old_sticker_inject(self)
    if self.set == "aura" then
      table.insert(FN.AuraPool, self.key)
    end
  end
end

----------------------------------------------
------------IMPLEMENT AURAS IF FORTLATRO IS NOT PRESENT----------------------


local end_round_original = end_round
function end_round()
  local blind = G.GAME and G.GAME.blind
  local won = false
  local boss_key = nil

  if blind and blind.boss and blind.config and blind.config.blind then
    boss_key = blind.config.blind.key
    local chips, req = G.GAME.chips, blind.chips
    if to_big then chips, req = to_big(chips), to_big(req) end
    won = chips >= req
  end

  end_round_original()

  if won and boss_key then
    G.GAME.abn_seen_bosses = G.GAME.abn_seen_bosses or {}
    G.GAME.abn_unique_bosses = G.GAME.abn_unique_bosses or 0
    if not G.GAME.abn_seen_bosses[boss_key] then
      G.GAME.abn_seen_bosses[boss_key] = true
      G.GAME.abn_unique_bosses = G.GAME.abn_unique_bosses + 1
    end
  end
end

SMODS.Sticker {
  key = "globetrotter_aura",
  set = "aura",
  atlas = "AbandoniaAura",
  pos = { x = 0, y = 0 },
  badge_colour = G.C.GREEN,

  config = {
    extra = {
      ascadd = 0.25,
    },
  },

  set_ability = function(self, card)
    if not card.ability.globetrotter_aura_extra then
      card.ability.globetrotter_aura_extra = {
        ascadd = self.config.extra.ascadd or 0.25,
      }
    end
  end,

  loc_txt = {
    name = "Globetrotter Aura",
    label = "Globetrotter Aura",
    text = {
      "{C:gold}+#1#{} Asc. Power per {C:attention}unique{} Blind defeated this {C:attention}run{}",
      "{C:inactive}Currently:{} {C:gold}+#2#{} {C:inactive}Asc. Power",
    },
  },

  loc_vars = function(self, info_queue, card)
    local extra = card and card.ability and card.ability.globetrotter_aura_extra or self.config.extra
    local n = (G.GAME and G.GAME.abn_unique_bosses) or 0
    return {
      vars = {
        extra.ascadd,
        extra.ascadd * n,
      }
    }
  end,

  draw = function(self, card)
    local notilt = nil
    if card.area and card.area.config.type == "deck" then
      notilt = true
    end
    if not G.shared_stickers["abn_globetrotter_aura2"] then
      G.shared_stickers["abn_globetrotter_aura2"] =
          Sprite(0, 0, G.CARD_W, G.CARD_H, G.ASSET_ATLAS["abn_AbandoniaAura"], { x = 999, y = 999 })
    end

    if G.shared_stickers[self.key] then
      G.shared_stickers[self.key].role.draw_major = card
      G.shared_stickers[self.key]:draw_shader("dissolve", nil, nil, notilt, card.children.center)
    end

    G.shared_stickers["abn_globetrotter_aura2"].role.draw_major = card

    card.hover_tilt = card.hover_tilt / 2
    G.shared_stickers["abn_globetrotter_aura2"]:draw_shader("dissolve", nil, nil, notilt, card.children.center)
    G.shared_stickers["abn_globetrotter_aura2"]:draw_shader(
      "holo",
      nil,
      card.ARGS.send_to_shader,
      notilt,
      card.children.center
    )
    card.hover_tilt = card.hover_tilt * 2
  end,

  calculate = function(self, card, context)
    if not card.ability.globetrotter_aura_extra then
      card.ability.globetrotter_aura_extra = { ascadd = 0.25 }
    end
    local extra = card.ability.globetrotter_aura_extra

    local n = (G.GAME and G.GAME.abn_unique_bosses) or 0
    if n <= 0 then return end

    local scoring_playing_card = context.main_scoring and context.cardarea == G.play and not context.individual
    local scoring_joker = context.joker_main

    if scoring_playing_card or scoring_joker then
      return {
        asc = extra.ascadd * n,
        colour = G.C.SECONDARY_SET.Spectral,
        card = card,
      }
    end
  end,

  abn_artist_credits = {
    artist = "testing testing 123",
  },
}

SMODS.Consumable {
  key = 'creep',
  set = 'nightshift_cards',
  atlas = 'AbandoniaNightshift',
  pos = { x = 5, y = 1 },

  config = {
    extra = {
      cards = 1,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_globetrotter_aura", set = "Other", vars = { 0.25, 0.25 * (G.GAME.abn_unique_bosses or 0) } }
    return {
      vars = {
        card.ability.extra.cards
      }
    }
  end,

  can_use = function(self, card)
    if card.ability and card.ability.extra then
      local n = (G.hand and #G.hand.highlighted or 0) + (G.jokers and #G.jokers.highlighted or 0)
      return n >= 1 and n <= card.ability.extra.cards
    end
    return false
  end,

  use = function(self, card, area, copier)
    local highlightedCards = {}

    for _, category in ipairs({
      G.hand.highlighted,
      G.jokers.highlighted,
    }) do
      for i = 1, #category do
        table.insert(highlightedCards, category[i])
      end
    end

    for i = 1, math.min(#highlightedCards, card.ability.extra.cards) do
      local c = highlightedCards[i]
      local to_destroy = {}

      if c.ability and c.ability.set == 'Joker' then
        local rarity = c.config.center.rarity
        for _, j in ipairs(G.jokers.cards) do
          if j ~= c and j.config.center.rarity == rarity then
            to_destroy[#to_destroy + 1] = j
          end
        end
      elseif not SMODS.has_no_rank(c) then
        local id = c:get_id()
        for _, area_cards in ipairs({ G.hand.cards, G.deck.cards, G.playing_cards }) do
          for _, p in ipairs(area_cards) do
            if p ~= c and not SMODS.has_no_rank(p) and p:get_id() == id then
              to_destroy[#to_destroy + 1] = p
            end
          end
        end
      end

      fn_add_aura(c, "abn_globetrotter_aura")

      if #to_destroy > 0 then
        if SMODS.destroy_cards then
          SMODS.destroy_cards(to_destroy)
        else
          for _, v in ipairs(to_destroy) do
            if not v.ability.eternal then v:start_dissolve() end
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}
