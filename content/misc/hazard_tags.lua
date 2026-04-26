--#region Setup
G.FUNCS.abn_hazard_tags = function(e)
  if G.GAME.abn_hazard_tag_tab then
    G.GAME.abn_hazard_tag_tab = false
  else
    G.GAME.abn_hazard_tag_tab = true
  end
end

local abn_game_init_game_object_ref = Game.init_game_object
function Game:init_game_object()
  local t = abn_game_init_game_object_ref(self)
  t.abn_hazard_tag_tab = false
  t.previous_abn_hazard_tag_tab = false
  t.abn_hazard_tag_rate = t.abn_hazard_tag_rate or 2
  return t
end

--#endregion

SMODS.Tag {
  key = "hazard_super",

  atlas = "AbandoniaHazardTags",
  pos = { x = 2, y = 0 },
  config = { hazard = true },

  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      local card = SMODS.create_card {
        set = "Joker",
        rarity = "abn_SuperRare",
        area = context.area,
      }
      create_shop_card_ui(card, 'Joker', context.area)
      card.states.visible = false
      tag:yep('+', G.C.PURPLE, function()
        card:start_materialize()
        card.ability.couponed = true
        card:set_cost()
        return true
      end)
      tag.triggered = true
      return card
    end
  end,
  in_pool = function(self, args)
    if pseudorandom("seed") > 0.9 then
      return true
    end
  end
}

SMODS.Tag {
  key = "hazard_parallel",

  atlas = "AbandoniaHazardTags",
  pos = { x = 3, y = 0 },
  config = { hazard = true },
  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      local card = SMODS.create_card {
        set = "Joker",
        rarity = "abn_ParallelRare",
        area = context.area,
      }
      create_shop_card_ui(card, 'Joker', context.area)
      card.states.visible = false
      tag:yep('+', G.C.PURPLE, function()
        card:start_materialize()
        card.ability.couponed = true
        card:set_cost()
        return true
      end)
      tag.triggered = true
      return card
    end
  end,
  in_pool = function(self, args)
    if pseudorandom("seed") > 1 then
      return true
    end
  end
}

SMODS.Tag {
  key = "hazard_legendary",

  atlas = "AbandoniaHazardTags",
  pos = { x = 4, y = 0 },
  config = { hazard = true },
  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      local card = SMODS.create_card {
        set = "Joker",
        rarity = "Legendary",
        area = context.area,
      }
      create_shop_card_ui(card, 'Joker', context.area)
      card.states.visible = false
      tag:yep('+', G.C.PURPLE, function()
        card:start_materialize()
        card.ability.couponed = true
        card:set_cost()
        return true
      end)
      tag.triggered = true
      return card
    end
  end,
  in_pool = function(self, args)
    if pseudorandom("seed") > 0.7 then
      return true
    end
  end
}

SMODS.Tag {
  key = "hazard_negative",

  atlas = "AbandoniaHazardTags",
  pos = { x = 0, y = 1 },
  config = { hazard = true, edition = "e_negative", count = 3 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    return {
      vars = { tag.config.count,
        localize({ type = 'name_text', key = "e_negative", set = "Edition" }) }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'immediate' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true

      tag:yep('++', G.C.DARK_EDITION, function()
        return true
      end)

      if G.jokers and #G.jokers.cards > 0 then
        local filtered = {}
        for _, v in ipairs(G.jokers.cards) do
          if not v.edition then
            table.insert(filtered, v)
          end
        end
        local joker = pseudorandom_element(filtered)

        if joker then
          joker:set_edition(tag.config.edition, true)
        end
      end

      local cards_applied = 0
      for _, card in ipairs(G.playing_cards) do
        if cards_applied < tag.config.count and not card.edition then
          card:set_edition(tag.config.edition, true)
          cards_applied = cards_applied + 1
        end
      end

      G.CONTROLLER.locks[lock] = nil
      tag.triggered = true
      return true
    end
  end
}

SMODS.Tag {
  key = "hazard_foil",

  atlas = "AbandoniaHazardTags",
  pos = { x = 1, y = 1 },
  config = { hazard = true, edition = "e_foil", count = 3 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
    return {
      vars = { tag.config.count,
        localize({ type = 'name_text', key = "e_foil", set = "Edition" }) }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'immediate' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true

      tag:yep('++', G.C.DARK_EDITION, function()
        return true
      end)

      if G.jokers and #G.jokers.cards > 0 then
        local filtered = {}
        for _, v in ipairs(G.jokers.cards) do
          if not v.edition then
            table.insert(filtered, v)
          end
        end
        local joker = pseudorandom_element(filtered)

        if joker then
          joker:set_edition(tag.config.edition, true)
        end
      end

      local cards_applied = 0
      for _, card in ipairs(G.playing_cards) do
        if cards_applied < tag.config.count and not card.edition then
          card:set_edition(tag.config.edition, true)
          cards_applied = cards_applied + 1
        end
      end

      G.CONTROLLER.locks[lock] = nil
      tag.triggered = true
      return true
    end
  end
}

SMODS.Tag {
  key = "hazard_holo",

  atlas = "AbandoniaHazardTags",
  pos = { x = 2, y = 1 },
  config = { hazard = true, edition = "e_holo", count = 3 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
    return {
      vars = { tag.config.count,
        localize({ type = 'name_text', key = "e_holo", set = "Edition" }) }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'immediate' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true

      tag:yep('++', G.C.DARK_EDITION, function()
        return true
      end)

      if G.jokers and #G.jokers.cards > 0 then
        local filtered = {}
        for _, v in ipairs(G.jokers.cards) do
          if not v.edition then
            table.insert(filtered, v)
          end
        end
        local joker = pseudorandom_element(filtered)

        if joker then
          joker:set_edition(tag.config.edition, true)
        end
      end

      local cards_applied = 0
      for _, card in ipairs(G.playing_cards) do
        if cards_applied < tag.config.count and not card.edition then
          card:set_edition(tag.config.edition, true)
          cards_applied = cards_applied + 1
        end
      end

      G.CONTROLLER.locks[lock] = nil
      tag.triggered = true
      return true
    end
  end
}

SMODS.Tag {
  key = "hazard_polychrome",

  atlas = "AbandoniaHazardTags",
  pos = { x = 3, y = 1 },
  config = { hazard = true, edition = "e_polychrome", count = 3 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
    return {
      vars = { tag.config.count,
        localize({ type = 'name_text', key = "e_polychrome", set = "Edition" }) }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'immediate' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true

      tag:yep('++', G.C.DARK_EDITION, function()
        return true
      end)

      if G.jokers and #G.jokers.cards > 0 then
        local filtered = {}
        for _, v in ipairs(G.jokers.cards) do
          if not v.edition then
            table.insert(filtered, v)
          end
        end
        local joker = pseudorandom_element(filtered)

        if joker then
          joker:set_edition(tag.config.edition, true)
        end
      end

      local cards_applied = 0
      for _, card in ipairs(G.playing_cards) do
        if cards_applied < tag.config.count and not card.edition then
          card:set_edition(tag.config.edition, true)
          cards_applied = cards_applied + 1
        end
      end

      G.CONTROLLER.locks[lock] = nil
      tag.triggered = true
      return true
    end
  end
}

SMODS.Tag {
  key = "hazard_gloss",

  atlas = "AbandoniaHazardTags",
  pos = { x = 4, y = 1 },
  config = { hazard = true, edition = "e_abn_gloss", count = 1 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_gloss
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_gloss", set = "Edition" }) }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'immediate' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true

      tag:yep('++', G.C.DARK_EDITION, function()
        return true
      end)

      if G.jokers and #G.jokers.cards > 0 then
        local filtered = {}
        for _, v in ipairs(G.jokers.cards) do
          if not v.edition then
            table.insert(filtered, v)
          end
        end
        local joker = pseudorandom_element(filtered)

        if joker then
          joker:set_edition(tag.config.edition, true)
        end
      end

      local cards_applied = 0
      for _, card in ipairs(G.playing_cards) do
        if cards_applied < tag.config.count and not card.edition then
          card:set_edition(tag.config.edition, true)
          cards_applied = cards_applied + 1
        end
      end

      G.CONTROLLER.locks[lock] = nil
      tag.triggered = true
      return true
    end
  end
}

SMODS.Tag {
  key = "hazard_pearlenscene",

  atlas = "AbandoniaHazardTags",
  pos = { x = 0, y = 2 },
  config = { hazard = true, edition = "e_abn_pearlenscene", count = 1 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_pearlenscene
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_pearlenscene", set = "Edition" }) }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'immediate' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true

      tag:yep('++', G.C.DARK_EDITION, function()
        return true
      end)

      if G.jokers and #G.jokers.cards > 0 then
        local filtered = {}
        for _, v in ipairs(G.jokers.cards) do
          if not v.edition then
            table.insert(filtered, v)
          end
        end
        local joker = pseudorandom_element(filtered)

        if joker then
          joker:set_edition(tag.config.edition, true)
        end
      end

      local cards_applied = 0
      for _, card in ipairs(G.playing_cards) do
        if cards_applied < tag.config.count and not card.edition then
          card:set_edition(tag.config.edition, true)
          cards_applied = cards_applied + 1
        end
      end

      G.CONTROLLER.locks[lock] = nil
      tag.triggered = true
      return true
    end
  end
}

SMODS.Tag {
  key = "hazard_iridescent",

  atlas = "AbandoniaHazardTags",
  pos = { x = 1, y = 2 },
  config = { hazard = true, edition = "e_abn_iridescent", count = 1 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_iridescent
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_iridescent", set = "Edition" }) }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'immediate' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true

      tag:yep('++', G.C.DARK_EDITION, function()
        return true
      end)

      if G.jokers and #G.jokers.cards > 0 then
        local filtered = {}
        for _, v in ipairs(G.jokers.cards) do
          if not v.edition then
            table.insert(filtered, v)
          end
        end
        local joker = pseudorandom_element(filtered)

        if joker then
          joker:set_edition(tag.config.edition, true)
        end
      end

      local cards_applied = 0
      for _, card in ipairs(G.playing_cards) do
        if cards_applied < tag.config.count and not card.edition then
          card:set_edition(tag.config.edition, true)
          cards_applied = cards_applied + 1
        end
      end

      G.CONTROLLER.locks[lock] = nil
      tag.triggered = true
      return true
    end
  end
}

SMODS.Tag {
  key = "hazard_abandon",

  atlas = "AbandoniaHazardTags",
  pos = { x = 2, y = 2 },
  config = { hazard = true, edition = "e_abn_abandond", count = 1 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_abandond
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_abandond", set = "Edition" }) }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'immediate' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true

      tag:yep('++', G.C.DARK_EDITION, function()
        return true
      end)

      if G.jokers and #G.jokers.cards > 0 then
        local filtered = {}
        for _, v in ipairs(G.jokers.cards) do
          if not v.edition then
            table.insert(filtered, v)
          end
        end
        local joker = pseudorandom_element(filtered)

        if joker then
          joker:set_edition(tag.config.edition, true)
        end
      end

      local cards_applied = 0
      for _, card in ipairs(G.playing_cards) do
        if cards_applied < tag.config.count and not card.edition then
          card:set_edition(tag.config.edition, true)
          cards_applied = cards_applied + 1
        end
      end

      G.CONTROLLER.locks[lock] = nil
      tag.triggered = true
      return true
    end
  end
}

SMODS.Tag {
  key = "hazard_sunscourge",

  atlas = "AbandoniaHazardTags",
  pos = { x = 3, y = 2 },
  config = { hazard = true, edition = "e_abn_sunscourge", count = 1 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_sunscourge
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_sunscourge", set = "Edition" }) }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'immediate' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true

      tag:yep('++', G.C.DARK_EDITION, function()
        return true
      end)

      if G.jokers and #G.jokers.cards > 0 then
        local filtered = {}
        for _, v in ipairs(G.jokers.cards) do
          if not v.edition then
            table.insert(filtered, v)
          end
        end
        local joker = pseudorandom_element(filtered)

        if joker then
          joker:set_edition(tag.config.edition, true)
        end
      end

      local cards_applied = 0
      for _, card in ipairs(G.playing_cards) do
        if cards_applied < tag.config.count and not card.edition then
          card:set_edition(tag.config.edition, true)
          cards_applied = cards_applied + 1
        end
      end

      G.CONTROLLER.locks[lock] = nil
      tag.triggered = true
      return true
    end
  end
}
