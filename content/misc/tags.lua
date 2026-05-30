-- Gloss Tag
SMODS.Tag {
  key = "gloss",
  pos = { x = 0, y = 0 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_gloss
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_gloss", set = "Edition" })
      }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card.temp_edition = nil
          context.card:set_edition("e_abn_gloss", true)
          context.card.ability.couponed = true
          context.card:set_cost()
          G.CONTROLLER.locks[lock] = nil
          return true
        end)
        tag.triggered = true
        return true
      end
    end
  end,
  in_pool = function(self, args)
    return G.P_CENTERS["e_abn_gloss"].discovered
  end
}

-- Pearlescent Tag
SMODS.Tag {
  key = "pearlescent",
  pos = { x = 1, y = 0 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_pearlescent
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_pearlescent", set = "Edition" })
      }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card.temp_edition = nil
          context.card:set_edition("e_abn_pearlescent", true)
          context.card.ability.couponed = true
          context.card:set_cost()
          G.CONTROLLER.locks[lock] = nil
          return true
        end)
        tag.triggered = true
        return true
      end
    end
  end,
  in_pool = function(self, args)
    return G.P_CENTERS["e_abn_pearlescent"].discovered
  end
}

-- Iridescent Tag
SMODS.Tag {
  key = "iridescent",
  pos = { x = 2, y = 0 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_iridescent
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_iridescent", set = "Edition" })
      }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card.temp_edition = nil
          context.card:set_edition("e_abn_iridescent", true)
          context.card.ability.couponed = true
          context.card:set_cost()
          G.CONTROLLER.locks[lock] = nil
          return true
        end)
        tag.triggered = true
        return true
      end
    end
  end,
  in_pool = function(self, args)
    return G.P_CENTERS["e_abn_iridescent"].discovered
  end
}

-- Abandon Tag
SMODS.Tag {
  key = "abandon",
  pos = { x = 3, y = 0 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_abandond
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_abandond", set = "Edition" })
      }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card.temp_edition = nil
          context.card:set_edition("e_abn_abandond", true)
          context.card.ability.couponed = true
          context.card:set_cost()
          G.CONTROLLER.locks[lock] = nil
          return true
        end)
        tag.triggered = true
        return true
      end
    end
  end,
  in_pool = function(self, args)
    return G.P_CENTERS["e_abn_abandond"].discovered
  end
}

-- Sunscourge Tag
SMODS.Tag {
  key = "sunscourge",
  pos = { x = 4, y = 0 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_sunscourge
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_sunscourge", set = "Edition" })
      }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card.temp_edition = nil
          context.card:set_edition("e_abn_sunscourge", true)
          context.card.ability.couponed = true
          context.card:set_cost()
          G.CONTROLLER.locks[lock] = nil
          return true
        end)
        tag.triggered = true
        return true
      end
    end
  end,
  in_pool = function(self, args)
    return G.P_CENTERS["e_abn_sunscourge"].discovered
  end
}

-- Calamity Tag
SMODS.Tag {
  key = "calamity",
  min_ante = 2,
  pos = { x = 0, y = 1 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.p_abn_calamitybooster
  end,
  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true
      tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
        local booster = SMODS.create_card { key = 'p_abn_calamitybooster', area = G.play }
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
      return true
    end
  end
}

-- Sigil Tag
SMODS.Tag {
  key = "sigil",
  min_ante = 2,
  pos = { x = 1, y = 1 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.p_abn_sigil_normal_1
  end,
  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true
      tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
        local booster = SMODS.create_card { key = 'p_abn_sigil_normal_1', area = G.play }
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
      return true
    end
  end
}

-- Astro Tag
SMODS.Tag {
  key = "astro",
  min_ante = 2,
  pos = { x = 2, y = 1 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.p_abn_astro_normal_1
  end,
  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true
      tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
        local booster = SMODS.create_card { key = 'p_abn_astro_normal_1', area = G.play }
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
      return true
    end
  end
}

-- Lefty Tag
SMODS.Tag {
  key = "lefty",
  pos = { x = 1, y = 2 },
  atlas = "AbandoniaTags",
  config = { hands = 1 },
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.hands } }
  end,
  apply = function(self, tag, context)
    if context.type == 'round_start_bonus' then
      tag:yep('+', G.C.BLUE, function()
        return true
      end)
      ease_hands_played(tag.config.hands)
      tag.triggered = true
      return true
    end
  end
}

-- Trash Tag
SMODS.Tag {
  key = "trash",
  pos = { x = 2, y = 2 },
  atlas = "AbandoniaTags",
  config = { discards = 1 },
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.discards } }
  end,
  apply = function(self, tag, context)
    if context.type == 'round_start_bonus' then
      tag:yep('+', G.C.RED, function()
        return true
      end)
      ease_discard(tag.config.discards)
      tag.triggered = true
      return true
    end
  end
}

-- Top-filled Tag
SMODS.Tag {
  key = "top_filled",
  min_ante = 2,
  pos = { x = 3, y = 2 },
  atlas = "AbandoniaTags",
  config = { spawn_jokers = 2 },
  loc_vars = function(self, info_queue, tag)
    return { vars = { tag.config.spawn_jokers } }
  end,
  apply = function(self, tag, context)
    if context.type == 'immediate' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true
      tag:yep('+', G.C.PURPLE, function()
        for _ = 1, tag.config.spawn_jokers do
          if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
            SMODS.add_card {
              set = "Joker",
              rarity = "Uncommon",
              key_append = "abn_top"
            }
          end
        end
        G.CONTROLLER.locks[lock] = nil
        return true
      end)
      tag.triggered = true
      return true
    end
  end
}

-- Unrevealed Tag
SMODS.Tag {
  key = "unrevealed",
  pos = { x = 4, y = 2 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      local random_rarity = pseudorandom_element({ 'Common', 'Uncommon', 'Rare' })
      local card = SMODS.create_card {
        set = "Joker",
        rarity = random_rarity,
        area = context.area,
        key_append = "abn_unrevealed"
      }
      create_shop_card_ui(card, 'Joker', context.area)
      card.states.visible = false
      tag:yep('+', G.C.PURPLE, function()
        card:start_materialize()
        if card.facing == 'front' then
          card:flip()
        end
        card.ability.abn_perma_flipped = true
        card.ability.couponed = true
        card:set_cost()
        return true
      end)
      tag.triggered = true
      return card
    end
  end
}

-- Hazard Tag
SMODS.Tag {
  key = "hazard",
  pos = { x = 0, y = 2 },
  atlas = "AbandoniaTags",
  apply = function(self, tag, context)
    local lock = tag.ID
    G.CONTROLLER.locks[lock] = true
    tag:yep('+', G.C.BLUE, function()
      local tag_key = get_next_tag_key('abn_guaranteed_hazard_tag')
      add_tag(Tag(tag_key))
      G.CONTROLLER.locks[lock] = nil
      return true
    end)
    tag.triggered = true
  end
}


-- Nightshift Tag
SMODS.Tag {
  key = "nightshift",
  pos = { x = 4, y = 1 },
  atlas = "AbandoniaTags",
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
  key = "weather_report",
  pos = { x = 5, y = 0 },
  atlas = "AbandoniaTags",
  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      local card = SMODS.create_card {
        set = "weather_report",
        area = context.area,
        key_append = "abn_weather_report"
      }
      create_shop_card_ui(card)
      card.states.visible = false
      tag:yep('+', G.C.SECONDARY_SET.weather_report, function()
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
  key = "lexica",
  pos = { x = 5, y = 1 },
  atlas = "AbandoniaTags",
  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      local card = SMODS.create_card {
        set = "lexica",
        area = context.area,
        key_append = "abn_lexica"
      }
      create_shop_card_ui(card)
      card.states.visible = false
      tag:yep('+', G.C.SECONDARY_SET.lexica, function()
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
  key = "program",
  pos = { x = 5, y = 2 },
  atlas = "AbandoniaTags",
  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      local card = SMODS.create_card {
        set = "program_pack",
        area = context.area,
        key_append = "abn_program"
      }
      create_shop_card_ui(card)
      card.states.visible = false
      tag:yep('+', G.C.SECONDARY_SET.program_pack, function()
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
  key = "rank_planet",
  pos = { x = 2, y = 3 },
  atlas = "AbandoniaTags",
  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      local card = SMODS.create_card {
        set = "Planet",
        attributes = { "rank_planet" },
        area = context.area,
        key_append = "abn_rank_planet"
      }
      create_shop_card_ui(card)
      card.states.visible = false
      tag:yep('+', G.C.SECONDARY_SET.program_pack, function()
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
  key = "continent",
  pos = { x = 3, y = 3 },
  atlas = "AbandoniaTags",
  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      local card = SMODS.create_card {
        set = "continent",
        area = context.area,
        key_append = "abn_continent"
      }
      create_shop_card_ui(card)
      card.states.visible = false
      tag:yep('+', G.C.SECONDARY_SET.continent, function()
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
