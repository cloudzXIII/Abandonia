loc_colour()
G.C.ARTISTRY = HEX("9383a2")
G.C.ARTISTRY_SECONDARY = HEX("77b5d9")
G.ARGS.LOC_COLOURS["abn_Artistry"] = G.C.ARTISTRY

SMODS.ConsumableType {
  key = "artistry_cards",
  collection_rows = { 5, 5 },
  shop_rate = 0.0,
  primary_colour = G.C.ARTISTRY,
  secondary_colour = G.C.ARTISTRY_SECONDARY,
}

SMODS.UndiscoveredSprite {
  key = 'artistry_cards',
  atlas = 'abn_AbandoniaUndiscovered',
  pos = { x = 0, y = 2 },
}


SMODS.Consumable {
  key = "marquee",
  set = "artistry_cards",
  config = { extra = { common = 10, uncommon = 15, rare = 20, super_rare = 30, legendary = 35, parallel_rare = 40 } },
  pos = { x = 0, y = 0 },
  atlas = "AbandoniaArtistry",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.common,
        card.ability.extra.uncommon,
        card.ability.extra.rare,
        card.ability.extra.super_rare,
        card.ability.extra.legendary,
        card.ability.extra.parallel_rare,
      }
    }
  end,

  can_use = function(self, card)
    if G.hand and G.hand.highlighted and #G.hand.highlighted == 1 and G.jokers and G.jokers.highlighted and #G.jokers.highlighted == 1 then
      return true
    end
    return false
  end,

  use = function(self, card, area, copier)
    local target_card = G.hand.highlighted[1]
    local target_joker = G.jokers.highlighted[1]

    local rarity_gains = {
      [1] = card.ability.extra.common,
      [2] = card.ability.extra.uncommon,
      [3] = card.ability.extra.rare,
      [4] = card.ability.extra.legendary,
      ["abn_SuperRare"] = card.ability.extra.super_rare,
      ["abn_ParallelRare"] = card.ability.extra.parallel_rare,
    }

    local raw_rarity = target_joker.config.center.rarity
    local chip_gain = rarity_gains[raw_rarity] or card.ability.extra.common

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        target_joker:start_dissolve()
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        local updated = false
        for _, playing_card in ipairs(G.playing_cards) do
          if playing_card:is_suit(target_card.base.suit) then
            playing_card.ability.perma_bonus = (playing_card.ability.perma_bonus or 0) + chip_gain
            playing_card:juice_up(0.3, 0.3)
            updated = true
          end
        end

        if updated then
          card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') })
        end
        return true
      end
    }))
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}

SMODS.Consumable {
  key = "pencil",
  set = "artistry_cards",
  config = { extra = { common = 2, uncommon = 4, rare = 6, super_rare = 8, legendary = 10, parallel_rare = 12 } },
  pos = { x = 1, y = 0 },
  atlas = "AbandoniaArtistry",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.common,
        card.ability.extra.uncommon,
        card.ability.extra.rare,
        card.ability.extra.super_rare,
        card.ability.extra.legendary,
        card.ability.extra.parallel_rare,
      }
    }
  end,

  can_use = function(self, card)
    if G.hand and G.hand.highlighted and #G.hand.highlighted == 1 and G.jokers and G.jokers.highlighted and #G.jokers.highlighted == 1 then
      return true
    end
    return false
  end,

  use = function(self, card, area, copier)
    local target_card = G.hand.highlighted[1]
    local target_joker = G.jokers.highlighted[1]

    local rarity_gains = {
      [1] = card.ability.extra.common,
      [2] = card.ability.extra.uncommon,
      [3] = card.ability.extra.rare,
      [4] = card.ability.extra.legendary,
      ["abn_SuperRare"] = card.ability.extra.super_rare,
      ["abn_ParallelRare"] = card.ability.extra.parallel_rare,
    }

    local raw_rarity = target_joker.config.center.rarity
    local mult_gain = rarity_gains[raw_rarity] or card.ability.extra.common

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        target_joker:start_dissolve()
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        local updated = false
        for _, playing_card in ipairs(G.playing_cards) do
          if playing_card:is_suit(target_card.base.suit) then
            playing_card.ability.perma_mult = (playing_card.ability.perma_mult or 0) + mult_gain
            playing_card:juice_up(0.3, 0.3)
            updated = true
          end
        end

        if updated then
          card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') })
        end
        return true
      end
    }))
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}

SMODS.Consumable {
  key = "eraser",
  set = "artistry_cards",
  config = {
    extra = {
      common_chips = 10, common_mult = 2,
      uncommon_chips = 15, uncommon_mult = 4,
      rare_chips = 20, rare_mult = 6,
      super_rare_chips = 30, super_rare_mult = 8,
      legendary_chips = 35, legendary_mult = 10,
      parallel_rare_chips = 40, parallel_rare_mult = 12,
    }
  },
  pos = { x = 2, y = 0 },
  atlas = "AbandoniaArtistry",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.common_chips, card.ability.extra.common_mult,
        card.ability.extra.uncommon_chips, card.ability.extra.uncommon_mult,
        card.ability.extra.rare_chips, card.ability.extra.rare_mult,
        card.ability.extra.super_rare_chips, card.ability.extra.super_rare_mult,
        card.ability.extra.legendary_chips, card.ability.extra.legendary_mult,
        card.ability.extra.parallel_rare_chips, card.ability.extra.parallel_rare_mult,
      }
    }
  end,

  can_use = function(self, card)
    if G.hand and G.hand.highlighted and #G.hand.highlighted == 1 and G.jokers and G.jokers.highlighted and #G.jokers.highlighted == 1 then
      local target_card = G.hand.highlighted[1]
      if SMODS.has_no_rank(target_card) then
        return true
      end
    end
    return false
  end,

  use = function(self, card, area, copier)
    local target_joker = G.jokers.highlighted[1]

    local rarity_gains = {
      [1] = { chips = card.ability.extra.common_chips, mult = card.ability.extra.common_mult },
      [2] = { chips = card.ability.extra.uncommon_chips, mult = card.ability.extra.uncommon_mult },
      [3] = { chips = card.ability.extra.rare_chips, mult = card.ability.extra.rare_mult },
      [4] = { chips = card.ability.extra.legendary_chips, mult = card.ability.extra.legendary_mult },
      ["abn_SuperRare"] = { chips = card.ability.extra.super_rare_chips, mult = card.ability.extra.super_rare_mult },
      ["abn_ParallelRare"] = { chips = card.ability.extra.parallel_rare_chips, mult = card.ability.extra.parallel_rare_mult },
    }

    local raw_rarity = target_joker.config.center.rarity
    local gains = rarity_gains[raw_rarity] or
        { chips = card.ability.extra.common_chips, mult = card.ability.extra.common_mult }

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        target_joker:start_dissolve()
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        local updated = false
        for _, playing_card in ipairs(G.playing_cards) do
          if SMODS.has_no_rank(playing_card) then
            playing_card.ability.perma_bonus = (playing_card.ability.perma_bonus or 0) + gains.chips
            playing_card.ability.perma_mult = (playing_card.ability.perma_mult or 0) + gains.mult
            playing_card:juice_up(0.3, 0.3)
            updated = true
          end
        end

        if updated then
          card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') })
        end
        return true
      end
    }))
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}

SMODS.Consumable {
  key = "eyedropper",
  set = "artistry_cards",
  config = {
    extra = {
      common = 1,
      uncommon = 2,
      rare = 4,
      super_rare = 6,
      legendary = 8,
      parallel_rare = 10,
    }
  },
  pos = { x = 3, y = 0 },
  atlas = "AbandoniaArtistry",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.common,
        card.ability.extra.uncommon,
        card.ability.extra.rare,
        card.ability.extra.super_rare,
        card.ability.extra.legendary,
        card.ability.extra.parallel_rare,
      }
    }
  end,

  can_use = function(self, card)
    if G.hand and G.hand.highlighted and #G.hand.highlighted == 1 and G.jokers and G.jokers.highlighted and #G.jokers.highlighted == 1 then
      return true
    end
    return false
  end,

  use = function(self, card, area, copier)
    local target_card = G.hand.highlighted[1]
    local target_joker = G.jokers.highlighted[1]

    local rarity_gains = {
      [1] = card.ability.extra.common,
      [2] = card.ability.extra.uncommon,
      [3] = card.ability.extra.rare,
      [4] = card.ability.extra.legendary,
      ["abn_SuperRare"] = card.ability.extra.super_rare,
      ["abn_ParallelRare"] = card.ability.extra.parallel_rare,
    }

    local raw_rarity = target_joker.config.center.rarity
    local p_dollars_gain = rarity_gains[raw_rarity] or card.ability.extra.common

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        target_joker:start_dissolve()
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        local updated = false
        for _, playing_card in ipairs(G.playing_cards) do
          if playing_card:is_suit(target_card.base.suit) then
            playing_card.ability.perma_p_dollars = (playing_card.ability.perma_p_dollars or 0) + p_dollars_gain
            playing_card:juice_up(0.3, 0.3)
            updated = true
          end
        end

        if updated then
          card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') })
        end
        return true
      end
    }))
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}

SMODS.Consumable {
  key = "hand",
  set = "artistry_cards",
  config = {
    extra = {
      common = 0.3,
      uncommon = 0.6,
      rare = 0.9,
      super_rare = 1,
      legendary = 1.3,
      parallel_rare = 1.5,
    }
  },
  pos = { x = 4, y = 0 },
  atlas = "AbandoniaArtistry",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.common,
        card.ability.extra.uncommon,
        card.ability.extra.rare,
        card.ability.extra.super_rare,
        card.ability.extra.legendary,
        card.ability.extra.parallel_rare,
      }
    }
  end,

  can_use = function(self, card)
    if G.hand and G.hand.highlighted and #G.hand.highlighted == 1 and G.jokers and G.jokers.highlighted and #G.jokers.highlighted == 1 then
      return true
    end
    return false
  end,

  use = function(self, card, area, copier)
    local target_card = G.hand.highlighted[1]
    local target_joker = G.jokers.highlighted[1]

    local rarity_gains = {
      [1] = card.ability.extra.common,
      [2] = card.ability.extra.uncommon,
      [3] = card.ability.extra.rare,
      [4] = card.ability.extra.legendary,
      ["abn_SuperRare"] = card.ability.extra.super_rare,
      ["abn_ParallelRare"] = card.ability.extra.parallel_rare,
    }

    local raw_rarity = target_joker.config.center.rarity
    local x_chip_gain = rarity_gains[raw_rarity] or card.ability.extra.common

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        target_joker:start_dissolve()
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        local updated = false
        for _, playing_card in ipairs(G.playing_cards) do
          if playing_card:is_suit(target_card.base.suit) then
            playing_card.ability.perma_x_chips = (playing_card.ability.perma_x_chips or 1) + x_chip_gain
            playing_card:juice_up(0.3, 0.3)
            updated = true
          end
        end

        if updated then
          card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') })
        end
        return true
      end
    }))
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}

SMODS.Consumable {
  key = "move",
  set = "artistry_cards",
  config = {
    extra = {
      common = 0.1,
      uncommon = 0.2,
      rare = 0.4,
      super_rare = 0.6,
      legendary = 0.8,
      parallel_rare = 1,
    }
  },
  pos = { x = 5, y = 0 },
  atlas = "AbandoniaArtistry",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.common,
        card.ability.extra.uncommon,
        card.ability.extra.rare,
        card.ability.extra.super_rare,
        card.ability.extra.legendary,
        card.ability.extra.parallel_rare,
      }
    }
  end,

  can_use = function(self, card)
    if G.hand and G.hand.highlighted and #G.hand.highlighted == 1 and G.jokers and G.jokers.highlighted and #G.jokers.highlighted == 1 then
      return true
    end
    return false
  end,

  use = function(self, card, area, copier)
    local target_card = G.hand.highlighted[1]
    local target_joker = G.jokers.highlighted[1]

    local rarity_gains = {
      [1] = card.ability.extra.common,
      [2] = card.ability.extra.uncommon,
      [3] = card.ability.extra.rare,
      [4] = card.ability.extra.legendary,
      ["abn_SuperRare"] = card.ability.extra.super_rare,
      ["abn_ParallelRare"] = card.ability.extra.parallel_rare,
    }

    local raw_rarity = target_joker.config.center.rarity
    local x_mult_gain = rarity_gains[raw_rarity] or card.ability.extra.common

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        target_joker:start_dissolve()
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        local updated = false
        for _, playing_card in ipairs(G.playing_cards) do
          if playing_card:is_suit(target_card.base.suit) then
            playing_card.ability.perma_x_mult = (playing_card.ability.perma_x_mult or 1) + x_mult_gain
            playing_card:juice_up(0.3, 0.3)
            updated = true
          end
        end

        if updated then
          card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') })
        end
        return true
      end
    }))
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}

SMODS.Consumable {
  key = "paint",
  set = "artistry_cards",
  config = {
    extra = {
      common = 1,
      uncommon = 2,
      rare = 3,
      super_rare = 4,
      legendary = 6,
      parallel_rare = 8,
    }
  },
  pos = { x = 0, y = 1 },
  atlas = "AbandoniaArtistry",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.common,
        card.ability.extra.uncommon,
        card.ability.extra.rare,
        card.ability.extra.super_rare,
        card.ability.extra.legendary,
        card.ability.extra.parallel_rare,
      }
    }
  end,

  can_use = function(self, card)
    if G.hand and G.hand.highlighted and #G.hand.highlighted == 1 and G.jokers and G.jokers.highlighted and #G.jokers.highlighted == 1 then
      return true
    end
    return false
  end,

  use = function(self, card, area, copier)
    local target_card = G.hand.highlighted[1]
    local target_joker = G.jokers.highlighted[1]

    local rarity_gains = {
      [1] = card.ability.extra.common,
      [2] = card.ability.extra.uncommon,
      [3] = card.ability.extra.rare,
      [4] = card.ability.extra.legendary,
      ["abn_SuperRare"] = card.ability.extra.super_rare,
      ["abn_ParallelRare"] = card.ability.extra.parallel_rare,
    }

    local raw_rarity = target_joker.config.center.rarity
    local rank_levels_gain = rarity_gains[raw_rarity] or card.ability.extra.common

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        target_joker:start_dissolve()
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        local ranks_to_upgrade = {}
        for _, playing_card in ipairs(G.playing_cards) do
          if playing_card:is_suit(target_card.base.suit) then
            local rank_val = playing_card.base.value
            if rank_val and G.GAME.abn_rank_upgrades[rank_val] then
              ranks_to_upgrade[rank_val] = true
            end
          end
        end

        for rank_val, _ in pairs(ranks_to_upgrade) do
          ABN.level_up_rank(card, rank_val, rank_levels_gain)
        end
        return true
      end
    }))
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}

SMODS.Consumable {
  key = "line",
  set = "artistry_cards",
  config = {
    extra = {
      common = 1,
      uncommon = 2,
      rare = 3,
      super_rare = 4,
      legendary = 5,
      parallel_rare = 6,
    }
  },
  pos = { x = 1, y = 1 },
  atlas = "AbandoniaArtistry",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.common,
        card.ability.extra.uncommon,
        card.ability.extra.rare,
        card.ability.extra.super_rare,
        card.ability.extra.legendary,
        card.ability.extra.parallel_rare,
      }
    }
  end,

  can_use = function(self, card)
    if G.hand and G.hand.highlighted and #G.hand.highlighted == 1 and G.jokers and G.jokers.highlighted and #G.jokers.highlighted == 1 then
      return true
    end
    return false
  end,

  use = function(self, card, area, copier)
    local target_card = G.hand.highlighted[1]
    local target_joker = G.jokers.highlighted[1]

    local rarity_gains = {
      [1] = card.ability.extra.common,
      [2] = card.ability.extra.uncommon,
      [3] = card.ability.extra.rare,
      [4] = card.ability.extra.legendary,
      ["abn_SuperRare"] = card.ability.extra.super_rare,
      ["abn_ParallelRare"] = card.ability.extra.parallel_rare,
    }

    local raw_rarity = target_joker.config.center.rarity
    local retrigger_gain = rarity_gains[raw_rarity] or card.ability.extra.common

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        target_joker:start_dissolve()
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        local updated = false
        for _, playing_card in ipairs(G.playing_cards) do
          if playing_card:is_suit(target_card.base.suit) then
            playing_card.ability.perma_repetitions = (playing_card.ability.perma_repetitions or 0) + retrigger_gain
            playing_card:juice_up(0.3, 0.3)
            updated = true
          end
        end

        if updated then
          card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') })
        end
        return true
      end
    }))
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}


--[[
SMODS.Consumable {
    key = "rectangle",
    set = "artistry_cards",
    config = {
        extra = {
            common = 5,
            uncommon = 10,
            rare = 15,
            super_rare = 25,
            legendary = 50,
            parallel_rare = 90,
        }
    },
    pos = { x = 2, y = 1 },
    atlas = "AbandoniaArtistry",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.common,
                card.ability.extra.uncommon,
                card.ability.extra.rare,
                card.ability.extra.super_rare,
                card.ability.extra.legendary,
                card.ability.extra.parallel_rare,
            }
        }
    end,

    can_use = function(self, card)
        if G.hand and G.hand.highlighted and #G.hand.highlighted == 1 and G.jokers and G.jokers.highlighted and #G.jokers.highlighted == 1 then
            return true
        end
        return false
    end,

    use = function(self, card, area, copier)
        local target_card = G.hand.highlighted[1]
        local target_joker = G.jokers.highlighted[1]

        local rarity_gains = {
            [1] = card.ability.extra.common,
            [2] = card.ability.extra.uncommon,
            [3] = card.ability.extra.rare,
            [4] = card.ability.extra.legendary,
            ["abn_SuperRare"] = card.ability.extra.super_rare,
            ["abn_ParallelRare"] = card.ability.extra.parallel_rare,
        }

        local raw_rarity = target_joker.config.center.rarity
        local balance_gain = rarity_gains[raw_rarity] or card.ability.extra.common


        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))


        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                target_joker:start_dissolve()
                return true
            end
        }))


        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                local updated = false
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:is_suit(target_card.base.suit) then
                        playing_card.ability.abn_perma_balance = (playing_card.ability.abn_perma_balance or 0) + balance_gain
                        playing_card:juice_up(0.3, 0.3)
                        updated = true
                    end
                end

                if updated then
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') })
                end
                return true
            end
        }))
    end,

    abn_artist_credits = {
        artist = "Gud",
    },
}
--]]
