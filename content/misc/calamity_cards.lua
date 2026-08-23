SMODS.ConsumableType {
  key = "calamity_cards",
  collection_rows = { 6, 6 },
  shop_rate = 0.0,
  primary_colour = HEX("c39854"),
  secondary_colour = HEX("c3a37a"),
}

SMODS.UndiscoveredSprite {
  key = 'calamity_cards',
  atlas = 'abn_AbandoniaUndiscovered',
  pos = { x = 3, y = 0 },
}

ABN.CalamityCard = SMODS.Consumable:extend({
  set = 'calamity_cards',
  cost = 4,
  atlas = "abn_AbandoniaCalamity",
  pos = { x = 0, y = 0 },

  config = { extra = { remove_enh = { 'm_stone', 'm_steel' }, bonus = { "perma_bonus" }, perma_bonus = 30 } },

  loc_vars = function(self, info_queue, card)
    for i = 1, #card.ability.extra.remove_enh do
      info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.remove_enh[i]]
    end
    return {
      vars = {
      }
    }
  end,

  can_use = function(self, card)
    return G.playing_cards and #G.playing_cards > 0
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    for _, v in ipairs(G.playing_cards) do
      for i = 1, #card.ability.extra.remove_enh do
        local current = card.ability.extra.remove_enh[i]
        if SMODS.has_enhancement(v, current) then
          v:set_ability('c_base')
          for _, bonus in ipairs(card.ability.extra.bonus) do
            v.ability[bonus] = (v.ability[bonus] or 0) + card.ability.extra[bonus]
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Grass"
  },
})

ABN.CalamityCard {
  key = "eruption",
  pos = { x = 0, y = 0 },

  config = { extra = { remove_enh = { 'm_stone', 'm_steel' }, bonus = { "perma_bonus" }, perma_bonus = 30 } },
  loc_vars = function(self, info_queue, card)
    for i = 1, #card.ability.extra.remove_enh do
      info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.remove_enh[i]]
    end
    return {
      vars = {
        card.ability.extra.perma_bonus
      }
    }
  end,
}

ABN.CalamityCard {
  key = "tsunami",
  pos = { x = 1, y = 0 },

  config = { extra = { remove_enh = { 'm_abn_oilfire', 'm_abn_petroleum' }, bonus = { "perma_x_mult" }, perma_x_mult = 1 } },
  loc_vars = function(self, info_queue, card)
    for i = 1, #card.ability.extra.remove_enh do
      info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.remove_enh[i]]
    end
    return {
      vars = {
        card.ability.extra.perma_x_mult
      }
    }
  end,
}

ABN.CalamityCard {
  key = "cyclone",
  pos = { x = 2, y = 0 },

  config = { extra = { remove_enh = { 'm_glass', 'm_abn_mercurial' }, bonus = { "perma_x_chips" }, perma_x_chips = 1 } },
  loc_vars = function(self, info_queue, card)
    for i = 1, #card.ability.extra.remove_enh do
      info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.remove_enh[i]]
    end
    return {
      vars = {
        card.ability.extra.perma_x_chips
      }
    }
  end,
}

ABN.CalamityCard {
  key = "flood",
  pos = { x = 3, y = 0 },

  config = { extra = { remove_enh = { 'm_abn_hot_iron', 'm_wild' }, bonus = { "perma_mult", "perma_p_dollars" }, perma_mult = 10, perma_p_dollars = 5, } },
  loc_vars = function(self, info_queue, card)
    for i = 1, #card.ability.extra.remove_enh do
      info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.remove_enh[i]]
    end
    return {
      vars = {
        card.ability.extra.perma_p_dollars,
        card.ability.extra.perma_mult,
      }
    }
  end,
}

ABN.CalamityCard {
  key = "tornado_calamity",
  pos = { x = 4, y = 0 },

  config = { extra = { remove_enh = { 'm_mult', 'm_bonus' }, bonus = { "perma_mult", "perma_bonus" }, perma_mult = 15, perma_bonus = 10, } },
  loc_vars = function(self, info_queue, card)
    for i = 1, #card.ability.extra.remove_enh do
      info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.remove_enh[i]]
    end
    return {
      vars = {
        card.ability.extra.perma_mult,
        card.ability.extra.perma_bonus
      }
    }
  end,
}

ABN.CalamityCard {
  key = "tremor",
  pos = { x = 5, y = 0 },

  config = { extra = { remove_enh = { 'm_abn_teatag', 'm_abn_teastain', 'm_gold' }, bonus = { "perma_mult", "perma_p_dollars" }, perma_mult = 12, perma_p_dollars = 6, } },
  loc_vars = function(self, info_queue, card)
    for i = 1, #card.ability.extra.remove_enh do
      info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.remove_enh[i]]
    end
    return {
      vars = {
        card.ability.extra.perma_p_dollars,
        card.ability.extra.perma_mult,
      }
    }
  end,
}

ABN.CalamityCard {
  key = "avalanche",
  pos = { x = 1, y = 1 },

  config = { extra = { bonus = { "perma_bonus", "perma_mult", "perma_p_dollars" }, perma_bonus = 4, perma_mult = 2, perma_p_dollars = 1, } },
  loc_vars = function(self, info_queue, card)
    local count = 0
    if G.consumeables and #G.consumeables.cards > 0 then
      local held_consumeables = {}
      for _, v in ipairs(G.consumeables.cards) do
        if #held_consumeables < 40 then
          held_consumeables[#held_consumeables + 1] = v
        end
      end

      count = #held_consumeables
    end
    return {
      vars = {
        card.ability.extra.perma_p_dollars,
        card.ability.extra.perma_mult,
        card.ability.extra.perma_bonus,
        card.ability.extra.perma_p_dollars * count,
        card.ability.extra.perma_mult * count,
        card.ability.extra.perma_bonus * count,
      }
    }
  end,
  can_use = function(self, card)
    return G.consumeables and #G.consumeables.cards > 0 and G.playing_cards and #G.playing_cards > 0
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    local held_consumeables = {}
    for _, v in ipairs(G.consumeables.cards) do
      if #held_consumeables < 40 then
        held_consumeables[#held_consumeables + 1] = v
      end
    end

    local count = #held_consumeables
    SMODS.destroy_cards(held_consumeables, nil, true)

    for _, v in ipairs(G.playing_cards) do
      for _, bonus in ipairs(card.ability.extra.bonus) do
        v.ability[bonus] = (v.ability[bonus] or 0) + (card.ability.extra[bonus] * count)
      end
    end
  end,

}


ABN.CalamityCard {
  key = "blizzard",
  pos = { x = 2, y = 1 },

  config = { extra = { bonus = { "abn_perma_bonus", "abn_perma_mult" }, abn_perma_bonus = 4, abn_perma_mult = 2, } },
  loc_vars = function(self, info_queue, card)
    local count = 0
    if G.playing_cards and #G.playing_cards > 0 then
      local faces = {}
      for _, v in ipairs(G.playing_cards) do
        if v:is_face() then
          faces[#faces + 1] = v
        end
      end

      count = #faces
    end
    return {
      vars = {
        card.ability.extra.abn_perma_mult,
        card.ability.extra.abn_perma_bonus,
        card.ability.extra.abn_perma_mult * count,
        card.ability.extra.abn_perma_bonus * count,
      }
    }
  end,
  can_use = function(self, card)
    return G.playing_cards and #G.playing_cards > 0 and G.jokers and #G.jokers.cards > 0
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    local faces = {}
    for _, v in ipairs(G.playing_cards) do
      if v:is_face() then
        faces[#faces + 1] = v
      end
    end

    local count = #faces

    SMODS.destroy_cards(faces, nil, true)

    for _, v in ipairs(G.jokers.cards) do
      for _, bonus in ipairs(card.ability.extra.bonus) do
        v.ability[bonus] = (v.ability[bonus] or 0) + (card.ability.extra[bonus] * count)
      end
      SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, v)
    end
  end,

}


ABN.CalamityCard {
  key = "plague",
  pos = { x = 3, y = 1 },

  config = { extra = { bonus = { "abn_perma_bonus", "abn_perma_mult" }, abn_perma_bonus = 10, abn_perma_mult = 4, } },
  loc_vars = function(self, info_queue, card)
    local count = 0
    if G.playing_cards and #G.playing_cards > 0 then
      local aces = {}
      for _, v in ipairs(G.playing_cards) do
        if v:get_id() == 14 then
          aces[#aces + 1] = v
        end
      end

      count = #aces
    end
    return {
      vars = {
        card.ability.extra.abn_perma_mult,
        card.ability.extra.abn_perma_bonus,
        card.ability.extra.abn_perma_mult * count,
        card.ability.extra.abn_perma_bonus * count,
      }
    }
  end,
  can_use = function(self, card)
    return G.playing_cards and #G.playing_cards > 0 and G.jokers and #G.jokers.cards > 0
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    local aces = {}
    for _, v in ipairs(G.playing_cards) do
      if v:get_id() == 14 then
        aces[#aces + 1] = v
      end
    end

    local count = #aces

    SMODS.destroy_cards(aces, nil, true)

    for _, v in ipairs(G.jokers.cards) do
      for _, bonus in ipairs(card.ability.extra.bonus) do
        v.ability[bonus] = (v.ability[bonus] or 0) + (card.ability.extra[bonus] * count)
      end
      SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, v)
    end
  end,

}

ABN.CalamityCard {
  key = "drought",
  pos = { x = 4, y = 1 },

  config = { extra = { bonus = { "perma_bonus", "perma_mult", }, perma_bonus = 25, perma_mult = 10, } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.perma_mult,
        card.ability.extra.perma_bonus,
      }
    }
  end,
  can_use = function(self, card)
    return G.playing_cards and #G.playing_cards > 0
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    for _, v in ipairs(G.playing_cards) do
      if v.edition then
        v.edition = nil
        for _, bonus in ipairs(card.ability.extra.bonus) do
          v.ability[bonus] = (v.ability[bonus] or 0) + card.ability.extra[bonus]
        end
      end
    end
  end,
}

ABN.CalamityCard {
  key = "heatwave",
  pos = { x = 5, y = 1 },

  config = { extra = { bonus = { "perma_bonus", "perma_mult", }, perma_bonus = 10, perma_mult = 4 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.perma_mult,
        card.ability.extra.perma_bonus,
      }
    }
  end,
  can_use = function(self, card)
    return G.playing_cards and #G.playing_cards > 0 and G.hand and #G.hand.highlighted == 1 and
        not SMODS.has_no_suit(G.hand.highlighted[1])
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    local suits = {}
    local selected_suit = G.hand.highlighted[1].base.suit
    for _, v in ipairs(G.playing_cards) do
      if v:is_suit(selected_suit) and not SMODS.has_any_suit(v) then
        suits[#suits + 1] = v
      end
    end

    SMODS.destroy_cards(suits, nil, true)

    for _, v in ipairs(G.playing_cards) do
      for _, bonus in ipairs(card.ability.extra.bonus) do
        v.ability[bonus] = (v.ability[bonus] or 0) + card.ability.extra[bonus]
      end
    end
  end,
}

ABN.CalamityCard {
  key = "fire_swirl",
  pos = { x = 0, y = 4 },

  config = { extra = { remove_enh = { 'm_abn_polkadot', 'm_abn_infra' }, bonus = { "perma_mult" } } },
  loc_vars = function(self, info_queue, card)
    for i = 1, #card.ability.extra.remove_enh do
      info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.remove_enh[i]]
    end
    return {
      vars = {
      }
    }
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    for _, v in ipairs(G.playing_cards) do
      for i = 1, #card.ability.extra.remove_enh do
        local current = card.ability.extra.remove_enh[i]
        if SMODS.has_enhancement(v, current) then
          v:set_ability('c_base')
          for _, bonus in ipairs(card.ability.extra.bonus) do
            v.ability[bonus] = (v.ability[bonus] or 0) + v.base.nominal
          end
        end
      end
    end
  end,
}

ABN.CalamityCard {
  key = "minefire",
  pos = { x = 4, y = 4 },

  config = { extra = { remove_enh = { 'm_abn_kintsugi', 'm_abn_zen' }, bonus = { "perma_mult", "perma_repetitions" }, perma_mult = 15, perma_repetitions = 1 } },
  loc_vars = function(self, info_queue, card)
    for i = 1, #card.ability.extra.remove_enh do
      info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.remove_enh[i]]
    end
    return {
      vars = {
        card.ability.extra.perma_mult,
        card.ability.extra.perma_repetitions,
      }
    }
  end,
}


ABN.CalamityCard {
  key = "mudslide",
  pos = { x = 2, y = 4 },

  config = { extra = { planet_rank = 1 } },
  loc_vars = function(self, info_queue, card)
    local count = 0
    if G.playing_cards and #G.playing_cards > 0 then
      local cards_to_destroy = {}
      for _, v in ipairs(G.playing_cards) do
        if v:get_id() and v:get_id() > 9 and not SMODS.has_no_rank(v) then
          cards_to_destroy[#cards_to_destroy + 1] = v
        end
      end

      --count = #cards_to_destroy
    end
    return {
      vars = {
        card.ability.extra.planet_rank,
        --card.ability.extra.planet_rank * count,
      }
    }
  end,
  can_use = function(self, card)
    return G.playing_cards and #G.playing_cards > 0
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    local cards_to_destroy = {}
    for _, v in ipairs(G.playing_cards) do
      if v:get_id() and v:get_id() > 9 and not SMODS.has_no_rank(v) then
        cards_to_destroy[#cards_to_destroy + 1] = v
      end
    end

    --local count = #cards_to_destroy

    SMODS.destroy_cards(cards_to_destroy, nil, true)

    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.2,
      func = function()
        local upgrade = {}
        for _, v in ipairs(G.playing_cards) do
          local rank = v.base.value
          if not upgrade[rank] then
            upgrade[rank] = true
            if G.GAME.abn_rank_upgrades[rank] then
              ABN.level_up_rank(card, rank, card.ability.extra.planet_rank, true)
            end
          end
        end
        return true
      end,
    }))
  end,

}

if next(SMODS.find_mod("Spectrallib")) then
  ABN.CalamityCard {
    key = "sinkhole",
    pos = { x = 1, y = 4 },

    config = { extra = { planet_rank = 1, bonus = { "perma_p_dollars", "slib_perma_plus_asc" }, slib_perma_plus_asc = 0.25, perma_p_dollars = 2 } },
    loc_vars = function(self, info_queue, card)
      local affected_cards = {}
      for _, v in ipairs(G.playing_cards or {}) do
        local rank = v.base.value
        if G.GAME.abn_rank_upgrades[rank] and G.GAME.abn_rank_upgrades[rank].level > 1 then
          affected_cards[#affected_cards + 1] = v
        end
      end

      local upgrade = {}
      local levels_lost = 0
      for _, v in ipairs(affected_cards) do
        local rank = v.base.value
        if not upgrade[rank] then
          upgrade[rank] = true
          levels_lost = levels_lost + 1
        end
      end
      return {
        vars = {
          card.ability.extra.perma_p_dollars,
          card.ability.extra.slib_perma_plus_asc,
          card.ability.extra.perma_p_dollars * levels_lost,
          card.ability.extra.slib_perma_plus_asc * levels_lost,
        }
      }
    end,
    can_use = function(self, card)
      return G.playing_cards and #G.playing_cards > 0
    end,

    use = function(self, card, area, copier)
      G.E_MANAGER:add_event(Event({
        func = function()
          play_sound('tarot1')
          card:juice_up(0.3, 0.5)
          return true
        end
      }))

      local affected_cards = {}
      for _, v in ipairs(G.playing_cards) do
        local rank = v.base.value
        if G.GAME.abn_rank_upgrades[rank] and G.GAME.abn_rank_upgrades[rank].level > 1 then
          affected_cards[#affected_cards + 1] = v
        end
      end

      local upgrade = {}
      local levels_lost = 0
      for _, v in ipairs(affected_cards) do
        local rank = v.base.value
        if not upgrade[rank] then
          upgrade[rank] = true
          ABN.level_up_rank(card, rank, -1, true)
          levels_lost = levels_lost + 1
        end
      end

      for _, v in ipairs(affected_cards) do
        for _, bonus in ipairs(card.ability.extra.bonus) do
          v.ability[bonus] = (v.ability[bonus] or 0) + (card.ability.extra[bonus] * levels_lost)
        end
      end
    end,

  }

  ABN.CalamityCard {
    key = "cas_crater",
    pos = { x = 3, y = 4 },

    config = { extra = { remove_enh = { 'm_abn_sew', 'm_abn_cotton', }, bonus = { "slib_perma_plus_asc", "perma_mult" }, slib_perma_plus_asc = 1, perma_mult = 10 } },
    loc_vars = function(self, info_queue, card)
      for i = 1, #card.ability.extra.remove_enh do
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.remove_enh[i]]
      end
      return {
        vars = {
          card.ability.extra.slib_perma_plus_asc,
          card.ability.extra.perma_mult,
        }
      }
    end,
  }
  ABN.CalamityCard {
    key = "wildfire",
    pos = { x = 0, y = 1 },

    config = { extra = { remove_enh = { 'm_lucky', 'm_abn_ocean', }, bonus = { "slib_perma_plus_asc" }, slib_perma_plus_asc = 0.25, } },
    loc_vars = function(self, info_queue, card)
      for i = 1, #card.ability.extra.remove_enh do
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.remove_enh[i]]
      end
      return {
        vars = {
          card.ability.extra.slib_perma_plus_asc
        }
      }
    end,
  }

  SMODS.Consumable {
    key = 'big_rip',
    set = "calamity_cards",
    pos = { x = 4, y = 3 },
    hidden = true,
    atlas = "AbandoniaCalamity",
    config = { ascension_power = 2 },
    soul_set = "calamity_cards",
    use = function(self, card, area, copier)
      local c = copy_table(G.C.UI_CHIPS)
      local m = copy_table(G.C.UI_MULT)
      update_hand_text(
        { sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
        { handname = localize("k_all_hands"), chips = "...", mult = "...", level = "..." }
      )
      delay(1.0)
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.2,
        func = function()
          play_sound("tarot1")
          ease_colour(G.C.UI_CHIPS, HEX("ffb400"), 0.1)
          ease_colour(G.C.UI_MULT, HEX("ffb400"), 0.1)
          if card.juice_up then card:juice_up(0.8, 0.5) end
          G.E_MANAGER:add_event(Event({
            trigger = "after",
            blockable = false,
            blocking = false,
            delay = 1.2,
            func = function()
              ease_colour(G.C.UI_CHIPS, c, 1)
              ease_colour(G.C.UI_MULT, m, 1)
              return true
            end,
          }))
          return true
        end,
      }))
      update_hand_text({ sound = "button", volume = 0.7, pitch = 0.9, delay = 0 },
        { level = "+" .. card.ability.ascension_power })
      delay(1.6)
      update_hand_text(
        { sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
        { mult = 0, chips = 0, handname = "", level = "" }
      )

      for i, v in pairs(G.GAME.hands) do
        SMODS.upgrade_poker_hands({
          instant = true,
          hands = i,
          from = card,
          ascension_power = card.ability
              .ascension_power
        })
      end


      for _, v in ipairs(G.jokers.cards) do
        v:add_sticker("abn_fragile", true)
        v:add_sticker("rental", true)
      end
    end,
    can_use = function(self, card)
      return (G.jokers and #G.jokers.cards >= 1) and true or false
    end,
    abn_artist_credits = {
      artist = "comykel",
    },
  }
end
