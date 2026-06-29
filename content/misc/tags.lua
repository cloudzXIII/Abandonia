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

SMODS.Tag {
  key = "chromatic",
  pos = { x = 5, y = 0 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chromatic
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card.temp_edition = nil
          context.card:set_edition("e_abn_chromatic", true)
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
    return G.P_CENTERS["e_abn_chromatic"].discovered
  end
}

SMODS.Tag {
  key = "reversal",
  pos = { x = 0, y = 1 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_reversal
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card.temp_edition = nil
          context.card:set_edition("e_abn_reversal", true)
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
    return G.P_CENTERS["e_abn_reversal"].discovered
  end
}

SMODS.Tag {
  key = "bit_rot",
  pos = { x = 1, y = 1 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_bit_rot
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card.temp_edition = nil
          context.card:set_edition("e_abn_bit_rot", true)
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
    return G.P_CENTERS["e_abn_bit_rot"].discovered
  end
}

SMODS.Tag {
  key = "reel",
  pos = { x = 2, y = 1 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_reel
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card.temp_edition = nil
          context.card:set_edition("e_abn_reel", true)
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
    return G.P_CENTERS["e_abn_reel"].discovered
  end
}

SMODS.Tag {
  key = "collodion",
  pos = { x = 3, y = 1 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_collodion
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card.temp_edition = nil
          context.card:set_edition("e_abn_collodion", true)
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
    return G.P_CENTERS["e_abn_collodion"].discovered
  end
}

SMODS.Tag {
  key = "vintage",
  pos = { x = 4, y = 1 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_vintage
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card.temp_edition = nil
          context.card:set_edition("e_abn_vintage", true)
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
    return G.P_CENTERS["e_abn_vintage"].discovered
  end
}

SMODS.Tag {
  key = "unknown",
  pos = { x = 2, y = 3 },
  atlas = "AbandoniaTags",

  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
  end,

  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      local chosen_rarity_num = math.floor(pseudorandom('tag_rarity') * 3) + 1
      local rarity_map = { [1] = "Common", [2] = "Uncommon", [3] = "Rare" }
      local chosen_rarity_str = rarity_map[chosen_rarity_num]

      local jokers_in_possession = { 0 }
      for _, joker in ipairs(G.jokers.cards) do
        if joker.config.center.rarity == chosen_rarity_num and not jokers_in_possession[joker.config.center.key] then
          jokers_in_possession[1] = jokers_in_possession[1] + 1
          jokers_in_possession[joker.config.center.key] = true
        end
      end

      if #G.P_JOKER_RARITY_POOLS[chosen_rarity_num] > jokers_in_possession[1] then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true

        local card = SMODS.create_card {
          set = "Joker",
          rarity = chosen_rarity_str,
          area = context.area,
          key_append = "unknown"
        }
        create_shop_card_ui(card, 'Joker', context.area)
        card.states.visible = false

        tag:yep('+', G.C.BLUE, function()
          card:start_materialize()
          card.ability.couponed = true
          card:set_cost()

          if card.facing == "front" then
            card:flip()
          end
          card.ability.abn_perma_flipped = true

          G.CONTROLLER.locks[lock] = nil
          return true
        end)

        tag.triggered = true
        return card
      else
        tag:nope()
      end
    end
  end,
}

-- Calamity Tag
SMODS.Tag {
  key = "calamity",
  min_ante = 2,
  pos = { x = 4, y = 2 },
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
  pos = { x = 5, y = 2 },
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
  pos = { x = 0, y = 3 },
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
  pos = { x = 1, y = 4 },
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
  pos = { x = 0, y = 4 },
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
  pos = { x = 3, y = 4 },
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

-- Flip Tag
SMODS.Tag {
  key = "flip",
  pos = { x = 2, y = 4 },
  atlas = "AbandoniaTags",

  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
  end,

  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true

      local chosen_set = pseudorandom('abn_tag_set') > 0.5 and "Enhanced" or "Enhanced"

      local card = SMODS.create_card {
        set = chosen_set,
        area = context.area,
        key_append = "flip"
      }

      create_shop_card_ui(card, 'Standard', context.area)
      card.states.visible = false

      tag:yep('+', G.C.BLUE, function()
        card:start_materialize()
        card.ability.couponed = true
        card:set_cost()

        if card.facing == "front" then
          card:flip()
        end
        card.ability.abn_perma_flipped = true

        G.CONTROLLER.locks[lock] = nil
        return true
      end)

      tag.triggered = true
      return card
    end
  end,
}

-- Hazard Tag
SMODS.Tag {
  key = "hazard",
  pos = { x = 5, y = 3 },
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
  pos = { x = 1, y = 3 },
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
  pos = { x = 1, y = 2 },
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
  pos = { x = 3, y = 3 },
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
  pos = { x = 5, y = 1 },
  atlas = "AbandoniaTags",
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
      return true
    end
  end
}

SMODS.Tag {
  key = "rank_planet",
  pos = { x = 4, y = 3 },
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
  pos = { x = 0, y = 2 },
  atlas = "AbandoniaTags",
  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true
      tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
        local booster = SMODS.create_card { key = 'p_abn_continent_normal_1', area = G.play }
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

SMODS.Tag {
  key = "solid",
  pos = { x = 2, y = 2 },
  atlas = "AbandoniaTags",
  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true
      tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
        local booster = SMODS.create_card { key = 'p_abn_solid_normal_2', area = G.play }
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

SMODS.Tag {
  key = "patch",
  pos = { x = 4, y = 4 },
  atlas = "AbandoniaTags",

  loc_vars = function(self, info_queue, tag)
  end,

  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      -- Generates a random number (1 or 2) for Common or Uncommon
      local chosen_rarity_num = math.floor(pseudorandom('tag_rarity') * 2) + 1
      local rarity_map = { [1] = "Common", [2] = "Uncommon" }
      local chosen_rarity_str = rarity_map[chosen_rarity_num]

      local jokers_in_possession = { 0 }
      for _, joker in ipairs(G.jokers.cards) do
        if joker.config.center.rarity == chosen_rarity_num and not jokers_in_possession[joker.config.center.key] then
          jokers_in_possession[1] = jokers_in_possession[1] + 1
          jokers_in_possession[joker.config.center.key] = true
        end
      end

      if #G.P_JOKER_RARITY_POOLS[chosen_rarity_num] > jokers_in_possession[1] then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true

        local card = SMODS.create_card {
          set = "Joker",
          rarity = chosen_rarity_str,
          area = context.area,
          key_append = "unknown"
        }
        create_shop_card_ui(card, 'Joker', context.area)
        card.states.visible = false

        tag:yep('+', G.C.BLUE, function()
          card:start_materialize()
          card.ability.couponed = true
          card:set_cost()

          -- sticker list
          local abn_stickers = {
            'abn_pump_up', 'abn_bullseye', 'abn_shovel',
            'abn_weight', 'abn_possiblity', 'abn_square',
            'abn_lightning_bolt', 'abn_top_hat', 'abn_spicy',
            'abn_lucky',
          }


          local chosen_sticker = pseudorandom_element(abn_stickers, pseudoseed('tag_sticker'))
          card:add_sticker(chosen_sticker, true)


          G.CONTROLLER.locks[lock] = nil
          return true
        end)

        tag.triggered = true
        return card
      else
        tag:nope()
      end
    end
  end,
}

SMODS.Tag {
  key = "plague",
  pos = { x = 0, y = 5 },
  atlas = "AbandoniaTags",

  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      local owned_jokers = {}
      if G.jokers and G.jokers.cards then
        for _, joker in ipairs(G.jokers.cards) do
          if joker.config.center and joker.config.center.key then
            owned_jokers[joker.config.center.key] = true
          end
        end
      end

      local uncommons = {
        "j_abn_fit_to_shape", "j_abn_handbook_of_a_conman",
        "j_abn_asylum_joker", "j_abn_degraded_data_joker"
      }
      local rares = {
        "j_abn_blood_money", "j_abn_manga_panel_joker", "j_abn_monitor_joker",
        "j_abn_fractured_identity_joker", "j_abn_scantron_joker",
        "j_abn_ransomware_joker", "j_abn_badformat_joker"
      }


      local base_pool = {}
      for _, j in ipairs(uncommons) do table.insert(base_pool, j) end
      for _, j in ipairs(rares) do table.insert(base_pool, j) end


      local available_pool = {}
      for _, joker_key in ipairs(base_pool) do
        if not owned_jokers[joker_key] then
          table.insert(available_pool, joker_key)
        end
      end

      if #available_pool == 0 then
        available_pool = base_pool
      end

      local chosen_joker = pseudorandom_element(available_pool, pseudoseed('plague_tag_spawn'))

      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true

      local card = SMODS.create_card {
        set = "Joker",
        area = context.area,
        key = chosen_joker,
        key_append = "plague_tag"
      }
      create_shop_card_ui(card, 'Joker', context.area)
      card.states.visible = false

      tag:yep('+', G.C.GREEN, function()
        card:start_materialize()

        card.ability.couponed = true
        card:set_cost()

        G.CONTROLLER.locks[lock] = nil
        return true
      end)

      tag.triggered = true
      return card
    end
  end,
}

SMODS.Tag {
  key = "virus",
  pos = { x = 5, y = 4 },
  atlas = "AbandoniaTags",

  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  apply = function(self, tag, context)
    if context.type == 'store_joker_create' then
      local owned_jokers = {}
      if G.jokers and G.jokers.cards then
        for _, joker in ipairs(G.jokers.cards) do
          if joker.config.center and joker.config.center.key then
            owned_jokers[joker.config.center.key] = true
          end
        end
      end

      local base_pool = {}
      for key, center in pairs(G.P_CENTERS) do
        if center.set == "Joker" and (center.rarity == "abn_VirusRare" or (center.pools and center.pools["abn_VirusRare"])) then
          table.insert(base_pool, key)
        end
      end

      local available_pool = {}
      for _, joker_key in ipairs(base_pool) do
        if not owned_jokers[joker_key] then
          table.insert(available_pool, joker_key)
        end
      end


      if #available_pool == 0 then
        available_pool = base_pool
      end


      if #available_pool == 0 then
        tag:nope()
        return
      end


      local chosen_joker = pseudorandom_element(available_pool, pseudoseed('virus_rare_tag_spawn'))

      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true

      local card = SMODS.create_card {
        set = "Joker",
        area = context.area,
        key = chosen_joker,
        key_append = "virus_rare_tag"
      }
      create_shop_card_ui(card, 'Joker', context.area)
      card.states.visible = false

      tag:yep('+', G.C.GREEN, function()
        card:start_materialize()

        card.ability.couponed = true
        card:set_cost()

        G.CONTROLLER.locks[lock] = nil
        return true
      end)

      tag.triggered = true
      return card
    end
  end,
}
