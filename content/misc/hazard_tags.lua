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
  key = "hazard_handy",
  atlas = "AbandoniaHazardTags",
  pos = { x = 2, y = 4 },
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