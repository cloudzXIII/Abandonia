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


-- Uncommon Hazard Tag
SMODS.Tag {
  key = "hazard_uncommon",
  min_ante = 2,
  atlas = "AbandoniaHazardTags",
  pos = { x = 0, y = 0 },
  config = { hazard = true, count = 2 },
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.count } }
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      local cards_created = 0

      if cards_created < tag.config.count then
        local card = SMODS.create_card {
          set = "Joker",
          rarity = "Uncommon",
          area = context.area,
          key_append = "abn_hazard_uncommon"
        }
        create_shop_card_ui(card, 'Joker', context.area)
        card.states.visible = false
        tag:yep('+', G.C.GREEN, function()
          card:start_materialize()
          card.ability.couponed = true
          card:set_cost()
          return true
        end)

        cards_created = cards_created + 1

        if cards_created >= tag.config.count then
          tag.triggered = true
        end

        return card
      end
    end
  end
}

-- Rare Hazard Tag
SMODS.Tag {
  key = "hazard_rare",
  min_ante = 2,
  atlas = "AbandoniaHazardTags",
  pos = { x = 1, y = 0 },
  config = { hazard = true, count = 2 },
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.count } }
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      local cards_created = 0
      local rares_in_posession = { 0 }
      for _, joker in ipairs(G.jokers.cards) do
        if joker.config.center.rarity == 3 and not rares_in_posession[joker.config.center.key] then
          rares_in_posession[1] = rares_in_posession[1] + 1
          rares_in_posession[joker.config.center.key] = true
        end
      end
      if #G.P_JOKER_RARITY_POOLS[3] > rares_in_posession[1] then
        if cards_created < tag.config.count then
          local card = SMODS.create_card {
            set = "Joker",
            rarity = "Rare",
            area = context.area,
            key_append = "abn_hazard_rare"
          }
          create_shop_card_ui(card, 'Joker', context.area)
          card.states.visible = false
          tag:yep('+', G.C.RED, function()
            card:start_materialize()
            card.ability.couponed = true
            card:set_cost()
            return true
          end)

          cards_created = cards_created + 1


          if cards_created >= tag.config.count then
            tag.triggered = true
          end
          return card
        else
          tag:nope()
        end
      end
    end
  end,
}

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
  pos = { x = 3, y = 2 },
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
  pos = { x = 0, y = 1 },
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
  pos = { x = 1, y = 1 },
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
  pos = { x = 2, y = 1 },
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
  pos = { x = 3, y = 1 },
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
  key = "hazard_pearlescent",

  atlas = "AbandoniaHazardTags",
  pos = { x = 4, y = 1 },
  config = { hazard = true, edition = "e_abn_pearlescent", count = 1 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_pearlescent
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_pearlescent", set = "Edition" }) }
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
  pos = { x = 0, y = 2 },
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
  pos = { x = 1, y = 2 },
  config = { hazard = true, edition = "e_abn_abandond", count = 3 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_abandond
    return { vars = { tag.config.count } }
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
  pos = { x = 2, y = 2 },
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

SMODS.Tag {
  key = "hazard_chromatic",

  atlas = "AbandoniaHazardTags",
  pos = { x = 4, y = 2 },
  config = { hazard = true, edition = "e_abn_chromatic", count = 1 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chromatic
    return { vars = { tag.config.count } }
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
  key = "hazard_reversal",

  atlas = "AbandoniaHazardTags",
  pos = { x = 0, y = 3 },
  config = { hazard = true, edition = "e_abn_reversal", count = 1 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_reversal
    return { vars = { tag.config.count } }
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
  key = "hazard_bit_rot",

  atlas = "AbandoniaHazardTags",
  pos = { x = 1, y = 3 },
  config = { hazard = true, edition = "e_abn_bit_rot", count = 1 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_bit_rot
    return { vars = { tag.config.count } }
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
  key = "hazard_reel",

  atlas = "AbandoniaHazardTags",
  pos = { x = 2, y = 3 },
  config = { hazard = true, edition = "e_abn_reel", count = 1 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_reel
    return { vars = { tag.config.count } }
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
  key = "hazard_collodion",

  atlas = "AbandoniaHazardTags",
  pos = { x = 3, y = 3 },
  config = { hazard = true, edition = "e_abn_collodion", count = 1 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_collodion
    return { vars = { tag.config.count } }
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
  key = "hazard_vintage",

  atlas = "AbandoniaHazardTags",
  pos = { x = 4, y = 3 },
  config = { hazard = true, edition = "e_abn_vintage", count = 1 },
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_vintage
    return { vars = { tag.config.count } }
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
  key = "hazard_investment",
  atlas = "AbandoniaHazardTags",
  pos = { x = 0, y = 4 },
  config = { hazard = true, dollars = 50 },
  
  loc_vars = function(self, info_queue, tag)
	return { vars = { tag.config.dollars } }
  end,
  
  apply = function(self, tag, context)
        if context.type == 'eval' then
            if G.GAME.last_blind and G.GAME.last_blind.boss then
                tag:yep('+', G.C.GOLD, function()
                    return true
                end)
                tag.triggered = true
                return {
                    dollars = tag.config.dollars,
                    condition = localize('ph_defeat_the_boss'),
                    pos = tag.pos,
                    tag = tag
                }
            end
        end
    end
}

SMODS.Tag {
  key = "hazard_voucher",
  atlas = "AbandoniaHazardTags",
  pos = { x = 1, y = 4 },
  config = { hazard = true, vouchers = 2 },
  
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.vouchers } }
  end,
  
  apply = function(self, tag, context)
    if context.type == 'voucher_add' then
      tag:yep('+', G.C.SECONDARY_SET.Voucher, function()
        for i = 1, tag.config.vouchers do
          local voucher = SMODS.add_voucher_to_shop(nil, true)
          if voucher then 
            voucher.from_tag = true 
          end
        end
        return true
      end)
      tag.triggered = true
    end
  end
}

SMODS.Tag {
  key = "hazard_reroll",
  atlas = "AbandoniaHazardTags",
  pos = { x = 2, y = 4 },
  config = { hazard = true, rerolls = 2 },
  
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.rerolls } }
  end,
  
  apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.GREEN, function()
                G.from_boss_tag = true
                G.FUNCS.reroll_boss()

                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.CONTROLLER.locks[lock] = nil
                                return true
                            end
                        }))
                        return true
                    end
                }))

                return true
            end)
            tag.triggered = true
			add_tag(Tag('tag_boss'))
            return true
        end
    end
}

SMODS.Tag {
  key = "hazard_standard",
  atlas = "AbandoniaHazardTags",
  pos = { x = 3, y = 4 },
  config = { hazard = true, rerolls = 2 },
  
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.rerolls } }
  end,
  
  apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
                local booster = SMODS.create_card { key = 'p_standard_mega_1', area = G.play }
                booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
                booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
                booster.T.w = G.CARD_W * 1.27
                booster.T.h = G.CARD_H * 1.27
                booster.cost = 0
                booster.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = booster } })
                booster:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
			add_tag(Tag('tag_standard'))
            return true
        end
    end
}

SMODS.Tag {
  key = "hazard_charm",
  atlas = "AbandoniaHazardTags",
  pos = { x = 4, y = 4 },
  config = { hazard = true, rerolls = 2 },
  
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.rerolls } }
  end,
  
  apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
                local booster = SMODS.create_card { key = 'p_arcana_mega_1', area = G.play }
                booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
                booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
                booster.T.w = G.CARD_W * 1.27
                booster.T.h = G.CARD_H * 1.27
                booster.cost = 0
                booster.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = booster } })
                booster:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
			add_tag(Tag('tag_charm'))
            return true
        end
    end
}

SMODS.Tag {
  key = "hazard_meteor",
  atlas = "AbandoniaHazardTags",
  pos = { x = 0, y = 5 },
  config = { hazard = true, rerolls = 2 },
  
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.rerolls } }
  end,
  
  apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
                local booster = SMODS.create_card { key = 'p_celestial_mega_1', area = G.play }
                booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
                booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
                booster.T.w = G.CARD_W * 1.27
                booster.T.h = G.CARD_H * 1.27
                booster.cost = 0
                booster.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = booster } })
                booster:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
			add_tag(Tag('tag_meteor'))
            return true
        end
    end
}

SMODS.Tag {
  key = "hazard_buffoon",
  atlas = "AbandoniaHazardTags",
  pos = { x = 1, y = 5 },
  config = { hazard = true, rerolls = 2 },
  
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.rerolls } }
  end,
  
  apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
                local booster = SMODS.create_card { key = 'p_buffoon_mega_1', area = G.play }
                booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
                booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
                booster.T.w = G.CARD_W * 1.27
                booster.T.h = G.CARD_H * 1.27
                booster.cost = 0
                booster.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = booster } })
                booster:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
			add_tag(Tag('tag_buffoon'))
            return true
        end
    end
}

SMODS.Tag {
  key = "hazard_ethereal",
  atlas = "AbandoniaHazardTags",
  pos = { x = 0, y = 6 },
  config = { hazard = true, rerolls = 2 },
  
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.rerolls } }
  end,
  
  apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
                local booster = SMODS.create_card { key = 'p_spectral_mega_1', area = G.play }
                booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
                booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
                booster.T.w = G.CARD_W * 1.27
                booster.T.h = G.CARD_H * 1.27
                booster.cost = 0
                booster.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = booster } })
                booster:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
			G.GAME.EtherealPacks = (G.GAME.EtherealPacks or 0 ) + 1
			if G.GAME.EtherealPacks % 2 == 1 then
				add_tag(Tag('tag_abn_hazard_ethereal'))
			end
            return true
        end
    end
}

SMODS.Tag {
  key = "hazard_weather",
  atlas = "AbandoniaHazardTags",
  pos = { x = 0, y = 7 },
  config = { hazard = true, rerolls = 2 },
  
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.rerolls } }
  end,
  
  apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
                local booster = SMODS.create_card { key = 'p_abn_weather_mega', area = G.play }
                booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
                booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
                booster.T.w = G.CARD_W * 1.27
                booster.T.h = G.CARD_H * 1.27
                booster.cost = 0
                booster.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = booster } })
                booster:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
			G.GAME.WeatherPacks = (G.GAME.WeatherPacks or 0 ) + 1
			if G.GAME.WeatherPacks % 2 == 1 then
				add_tag(Tag('tag_abn_hazard_weather'))
			end
            return true
        end
    end
}

SMODS.Tag {
  key = "hazard_calamity",
  atlas = "AbandoniaHazardTags",
  pos = { x = 1, y = 7 },
  config = { hazard = true, rerolls = 2 },
  
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.rerolls } }
  end,
  
  apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
                local booster = SMODS.create_card { key = 'p_abn_calamitybooster_m', area = G.play }
                booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
                booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
                booster.T.w = G.CARD_W * 1.27
                booster.T.h = G.CARD_H * 1.27
                booster.cost = 0
                booster.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = booster } })
                booster:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
			G.GAME.CalamityPacks = (G.GAME.CalamityPacks or 0 ) + 1
			if G.GAME.CalamityPacks % 2 == 1 then
				add_tag(Tag('tag_abn_hazard_calamity'))
			end
            return true
        end
    end
}

SMODS.Tag {
  key = "hazard_sigil",
  atlas = "AbandoniaHazardTags",
  pos = { x = 2, y = 7 },
  config = { hazard = true, rerolls = 2 },
  
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.rerolls } }
  end,
  
  apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
                local booster = SMODS.create_card { key = 'p_abn_sigil_mega_2', area = G.play }
                booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
                booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
                booster.T.w = G.CARD_W * 1.27
                booster.T.h = G.CARD_H * 1.27
                booster.cost = 0
                booster.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = booster } })
                booster:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
			G.GAME.SigilPacks = (G.GAME.SigilPacks or 0 ) + 1
			if G.GAME.SigilPacks % 2 == 1 then
				add_tag(Tag('tag_abn_hazard_sigil'))
			end
            return true
        end
    end
}

SMODS.Tag {
  key = "hazard_astro",
  atlas = "AbandoniaHazardTags",
  pos = { x = 3, y = 7 },
  config = { hazard = true, rerolls = 2 },
  
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.rerolls } }
  end,
  
  apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
                local booster = SMODS.create_card { key = 'p_abn_astro_mega_2', area = G.play }
                booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
                booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
                booster.T.w = G.CARD_W * 1.27
                booster.T.h = G.CARD_H * 1.27
                booster.cost = 0
                booster.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = booster } })
                booster:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
			G.GAME.AstroPacks = (G.GAME.AstroPacks or 0 ) + 1
			if G.GAME.AstroPacks % 2 == 1 then
				add_tag(Tag('tag_abn_hazard_astro'))
			end
            return true
        end
    end
}

SMODS.Tag {
  key = "hazard_nightshift",
  atlas = "AbandoniaHazardTags",
  pos = { x = 4, y = 7 },
  config = { hazard = true, rerolls = 2 },
  
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.rerolls } }
  end,
  
  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      local card = SMODS.create_card {
        set = "nightshift_cards",
        area = context.area,
        key = ABN.get_random_nightshift(),
        key_append = "abn_nightshift"
      }
      create_shop_card_ui(card)
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
  end
}

SMODS.Tag {
  key = "hazard_program",
  pos = { x = 2, y = 8 },
  atlas = "AbandoniaHazardTags",
  config = { hazard = true, rerolls = 2 },
  apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
                local booster = SMODS.create_card { key = 'p_abn_program_jumbo_1', area = G.play }
                booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
                booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
                booster.T.w = G.CARD_W * 1.27
                booster.T.h = G.CARD_H * 1.27
                booster.cost = 0
                booster.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = booster } })
                booster:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
			add_tag(Tag('tag_abn_program'))
            return true
        end
    end
}

SMODS.Tag {
  key = "hazard_handy",
  atlas = "AbandoniaHazardTags",
  pos = { x = 2, y = 5 },
  config = { hazard = true, dollars_per_hand = 2 },
  
  loc_vars = function(self, info_queue, tag)
	return { vars = { tag.config.dollars_per_hand, tag.config.dollars_per_hand * (G.GAME.hands_played or 0) } }
  end,
  
  apply = function(self, tag, context)
        if context.type == 'immediate' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.MONEY, function()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            ease_dollars((G.GAME.hands_played or 0) * tag.config.dollars_per_hand)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
  key = "hazard_garbage",
  atlas = "AbandoniaHazardTags",
  pos = { x = 3, y = 5 },
  config = { hazard = true, dollars_per_discard = 2 },
  
  loc_vars = function(self, info_queue, tag)
	return { vars = { tag.config.dollars_per_discard, tag.config.dollars_per_discard * (G.GAME.unused_discards or 0) } }
  end,
  
  apply = function(self, tag, context)
        if context.type == 'immediate' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.MONEY, function()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            ease_dollars((G.GAME.unused_discards or 0) * tag.config.dollars_per_discard)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
  key = "hazard_juggler",
  atlas = "AbandoniaHazardTags",
  pos = { x = 4, y = 5 },
  config = { hazard = true, h_size = 6 },
  
  loc_vars = function(self, info_queue, tag)
	return { vars = { tag.config.h_size } }
  end,
  
  apply = function(self, tag, context)
        if context.type == 'round_start_bonus' then
            tag:yep('+', G.C.BLUE, function()
                return true
            end)
            G.hand:change_size(tag.config.h_size)
            G.GAME.round_resets.temp_handsize = (G.GAME.round_resets.temp_handsize or 0) + tag.config.h_size
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
  key = "hazard_d6",
  atlas = "AbandoniaHazardTags",
  pos = { x = 1, y = 6 },
  config = { hazard = true, rerolls = 2 },
  
  loc_vars = function(self, info_queue, tag)
	return { vars = { tag.config.rerolls } }
  end,
  
  apply = function(self, tag, context)
        if context.type == 'shop_start' then
            tag:yep('+', G.C.GREEN, function()
				G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + tag.config.rerolls
                calculate_reroll_cost(true)
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
  key = "hazard_speed",
  atlas = "AbandoniaHazardTags",
  pos = { x = 2, y = 6 },
  config = { hazard = true, skip_bonus = 10 },
  
  loc_vars = function(self, info_queue, tag)
	return { vars = {tag.config.skip_bonus, tag.config.skip_bonus * ((G.GAME.skips or 0) + 1) } }
  end,
  
  apply = function(self, tag, context)
        if context.type == 'immediate' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.MONEY, function()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            ease_dollars((G.GAME.skips or 0) * tag.config.skip_bonus)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = "hazard_orbital",
    atlas = "AbandoniaHazardTags",
    min_ante = 2,
    pos = { x = 4, y = 6 },
    config = { hazard = true, levels = 3 },
    
    -- Pick two unique hands when the tag is created
    set_ability = function(self, tag)
        if not tag.ability.orbital_hands then
            tag.ability.orbital_hands = {}
            
            -- Gather all currently discoverable/playable poker hands
            local valid_hands = {}
            for k, v in pairs(G.GAME.hands) do
                if v.visible then 
                    table.insert(valid_hands, k)
                end
            end
            
            -- Fallback if the game hands list isn't ready or empty
            if #valid_hands == 0 then
                valid_hands = {"High Card", "Pair", "Two Pair", "Three of a Kind", "Straight", "Flush", "Full House", "Four of a Kind", "Straight Flush"}
            end
            
            -- Swapped: h1 is the hand name, h1_idx is the numerical index
            local h1, h1_idx = pseudorandom_element(valid_hands, 'hazard_orbital_h1')
            table.insert(tag.ability.orbital_hands, h1)
            table.remove(valid_hands, h1_idx) -- Correctly passes the number index now!
            
            -- Pull 2nd random hand
            local h2, _ = pseudorandom_element(valid_hands, 'hazard_orbital_h2')
            table.insert(tag.ability.orbital_hands, h2)
        end
    end,

    loc_vars = function(self, info_queue, tag)
        local hand1_loc = "[" .. localize('k_poker_hand') .. " 1]"
        local hand2_loc = "[" .. localize('k_poker_hand') .. " 2]"
        
        if tag and tag.ability.orbital_hands then
            hand1_loc = localize(tag.ability.orbital_hands[1], 'poker_hands')
            hand2_loc = localize(tag.ability.orbital_hands[2], 'poker_hands')
        end
        
        return {
            vars = { hand1_loc, hand2_loc, tag and tag.config.levels or self.config.levels }
        }
    end,
    
    apply = function(self, tag, context)
        if context.type == 'immediate' and tag.ability.orbital_hands then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            
            SMODS.upgrade_poker_hands({ 
                from = tag, 
                hands = tag.ability.orbital_hands, 
                level_up = tag.config.levels 
            })
            
            tag:yep('+', G.C.BLUE, function()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}