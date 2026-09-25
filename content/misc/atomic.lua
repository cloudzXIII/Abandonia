loc_colour()
G.C.ATOMIC = HEX("f45e5e")
G.C.ATOMIC_SECONDARY = HEX("f45e5e")
G.ARGS.LOC_COLOURS["abn_Atomic"] = G.C.ATOMIC

SMODS.ConsumableType {
  key = "atomic",
  collection_rows = { 5, 5 },
  shop_rate = 0,
  primary_colour = G.C.ATOMIC,
  secondary_colour = G.C.ATOMIC_SECONDARY,
  text_colour = HEX("4f6367"),
}

SMODS.Consumable {
  key = "1h",
  set = "atomic",
  config = { extra = { cards = 2, xmult = 1.5 } },
  pos = { x = 0, y = 0 },
  atlas = "AbandoniaAtomic",
  cost = 4,
  discovered = false,
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
        card.ability.extra.xmult,
      }
    }
  end,

  can_use = function(self, card)
    return G.playing_cards and #G.playing_cards > 0
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.1,
      func = function()
        local all_cards = {}
        for _, v in ipairs(G.playing_cards) do
          table.insert(all_cards, v)
        end
        
        if #all_cards == 0 then return true end

        for i = #all_cards, 2, -1 do
          local j = pseudorandom('abn_1h_shuffle', 1, i)
          all_cards[i], all_cards[j] = all_cards[j], all_cards[i]
        end

        local targets = {}
        for i = 1, math.min(#all_cards, card.ability.extra.cards) do
          table.insert(targets, all_cards[i])
        end

        for _, target in ipairs(targets) do
          target:juice_up(0.8, 0.5)
          target.base.nominal = 1
		  if target.ability.perma_x_mult < card.ability.extra.xmult - 1 then
			target.ability.perma_x_mult = target.ability.perma_x_mult + card.ability.extra.xmult - 1
		  else
			target.ability.perma_x_mult = target.ability.perma_x_mult + card.ability.extra.xmult
		  end
        end

        return true
      end
    }))
  end,

  abn_artist_credits = { artist = "Scruffy" },
}

SMODS.Consumable {
  key = "d2h",
  set = "atomic",
  config = { extra = { cards = 2, asc_add = 0.25 } },
  pos = { x = 1, y = 0 },
  atlas = "AbandoniaAtomic",
  cost = 4,
  discovered = false,
  hidden = true,
  soul_set = "atomic",
  soul_rate = 0.03,
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
        card.ability.extra.asc_add,
      }
    }
  end,

  can_use = function(self, card)
    return G.playing_cards and #G.playing_cards > 0
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.1,
      func = function()
        local all_cards = {}
        for _, v in ipairs(G.playing_cards) do
          table.insert(all_cards, v)
        end
        
        if #all_cards == 0 then return true end

        for i = #all_cards, 2, -1 do
          local j = pseudorandom('abn_d2h_shuffle', 1, i)
          all_cards[i], all_cards[j] = all_cards[j], all_cards[i]
        end

        local targets = {}
        for i = 1, math.min(#all_cards, card.ability.extra.cards) do
          table.insert(targets, all_cards[i])
        end

        for _, target in ipairs(targets) do
          target:juice_up(0.8, 0.5)
          
          local rank_key = target.base and target.base.value
          local rank_data = (rank_key and G.GAME.abn_rank_upgrades) and G.GAME.abn_rank_upgrades[rank_key]
          local rank_level = rank_data and rank_data.level or 1
          
          target.ability.abn_perma_asc = target.ability.abn_perma_asc or 0
          
          local total_gain = card.ability.extra.asc_add * rank_level
          target.ability.abn_perma_asc = target.ability.abn_perma_asc + total_gain
        end

        return true
      end
    }))
  end,

  abn_artist_credits = { artist = "Scruffy" },
}

SMODS.Consumable {
  key = "2he",
  set = "atomic",
  config = { extra = { cards = 2, score = 300 } },
  pos = { x = 2, y = 0 },
  atlas = "AbandoniaAtomic",
  cost = 4,
  discovered = false,
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
        card.ability.extra.score,
      }
    }
  end,

  can_use = function(self, card)
    return G.playing_cards and #G.playing_cards > 0
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.1,
      func = function()
        local all_cards = {}
        for _, v in ipairs(G.playing_cards) do
          table.insert(all_cards, v)
        end
        
        if #all_cards == 0 then return true end

        for i = #all_cards, 2, -1 do
          local j = pseudorandom('abn_2he_shuffle', 1, i)
          all_cards[i], all_cards[j] = all_cards[j], all_cards[i]
        end

        local targets = {}
        for i = 1, math.min(#all_cards, card.ability.extra.cards) do
          table.insert(targets, all_cards[i])
        end

        for _, target in ipairs(targets) do
          target:juice_up(0.8, 0.5)
          target.ability.perma_score = (target.ability.perma_score or 0) + card.ability.extra.score
        end

        return true
      end
    }))
  end,

  abn_artist_credits = { artist = "Scruffy" },
}

SMODS.Consumable {
  key = "li3",
  set = "atomic",
  config = { extra = { cards = 2, xchips = 1 } },
  pos = { x = 3, y = 0 },
  atlas = "AbandoniaAtomic",
  cost = 4,
  discovered = false,
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
        card.ability.extra.xchips,
      }
    }
  end,

  can_use = function(self, card)
    return G.playing_cards and #G.playing_cards > 0
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.1,
      func = function()
        local all_cards = {}
        for _, v in ipairs(G.playing_cards) do
          table.insert(all_cards, v)
        end
        
        if #all_cards == 0 then return true end

        for i = #all_cards, 2, -1 do
          local j = pseudorandom('abn_li3_shuffle', 1, i)
          all_cards[i], all_cards[j] = all_cards[j], all_cards[i]
        end

        local targets = {}
        for i = 1, math.min(#all_cards, card.ability.extra.cards) do
          table.insert(targets, all_cards[i])
        end

        for _, target in ipairs(targets) do
          target:juice_up(0.8, 0.5)
          target.ability.perma_x_chips = (target.ability.perma_x_chips or 1) + card.ability.extra.xchips
        end

        return true
      end
    }))

    delay(0.4)
  end,

  abn_artist_credits = { artist = "Scruffy" },
}

SMODS.Consumable {
  key = "be4",
  set = "atomic",
  config = { extra = { cards = 2 } },
  pos = { x = 4, y = 0 }, 
  atlas = "AbandoniaAtomic",
  cost = 4,
  discovered = false,
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
      }
    }
  end,

  can_use = function(self, card)
    return G.hand.cards and #G.hand.cards > 0
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.1,
      func = function()
        local all_cards = {}
        for _, v in ipairs(G.playing_cards) do
          table.insert(all_cards, v)
        end
        
        if #all_cards == 0 then return true end

        for i = #all_cards, 2, -1 do
          local j = pseudorandom('abn_be4_shuffle', 1, i)
          all_cards[i], all_cards[j] = all_cards[j], all_cards[i]
        end

        local targets = {}
        for i = 1, math.min(#all_cards, card.ability.extra.cards) do
          table.insert(targets, all_cards[i])
        end

        local new_cards = {}
        for _, target in ipairs(targets) do
          target:juice_up(0.8, 0.5)
          local _card = copy_card(target)
          _card:add_to_deck()
          G.deck.config.card_limit = G.deck.config.card_limit + 1
          table.insert(G.playing_cards, _card)
          G.hand:emplace(_card)
          _card:start_materialize(nil, nil)
          table.insert(new_cards, _card)
        end

        playing_card_joker_effects(new_cards)

        return true
      end
    }))
  end,

  abn_artist_credits = { artist = "Scruffy" },
}

SMODS.Consumable {
  key = "5b",
  set = "atomic",
  config = { extra = { cards = 2, } },
  pos = { x = 0, y = 1 },
  atlas = "AbandoniaAtomic",
  cost = 4,
  discovered = false,
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
      }
    }
  end,

  can_use = function(self, card)
    return G.playing_cards and #G.playing_cards > 0
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.1,
      func = function()
        local all_cards = {}
        for _, v in ipairs(G.playing_cards) do
          table.insert(all_cards, v)
        end
        
        if #all_cards == 0 then return true end

        for i = #all_cards, 2, -1 do
          local j = pseudorandom('abn_5b_shuffle', 1, i)
          all_cards[i], all_cards[j] = all_cards[j], all_cards[i]
        end

        local targets = {}
        for i = 1, math.min(#all_cards, card.ability.extra.cards) do
          table.insert(targets, all_cards[i])
        end

        for _, target in ipairs(targets) do
          target:juice_up(0.8, 0.5)
          target.base.nominal = target.base.nominal * 3
        end

        return true
      end
    }))
  end,

  abn_artist_credits = { artist = "Scruffy" },
}

SMODS.Consumable {
  key = "6c",
  set = "atomic",
  config = { extra = { cards = 2, } },
  pos = { x = 1, y = 1 },
  atlas = "AbandoniaAtomic",
  cost = 4,
  discovered = false,
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
      }
    }
  end,

  can_use = function(self, card)
    return G.playing_cards and #G.playing_cards > 0
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.1,
      func = function()
        local all_cards = {}
        for _, v in ipairs(G.playing_cards) do
          table.insert(all_cards, v)
        end
        
        if #all_cards == 0 then return true end

        for i = #all_cards, 2, -1 do
          local j = pseudorandom('abn_6c_shuffle', 1, i)
          all_cards[i], all_cards[j] = all_cards[j], all_cards[i]
        end

        local targets = {}
        for i = 1, math.min(#all_cards, card.ability.extra.cards) do
          table.insert(targets, all_cards[i])
        end

        for _, target in ipairs(targets) do
          target:juice_up(0.8, 0.5)
          local nominal = (target.base and target.base.nominal) or 0
          local bonus = nominal * 2
          target.ability.perma_mult = (target.ability.perma_mult or 0) + bonus
        end

        return true
      end
    }))
  end,

  abn_artist_credits = { artist = "Scruffy" },
}

SMODS.Consumable {
  key = "7n",
  set = "atomic",
  config = { extra = { cards = 2 } },
  pos = { x = 2, y = 1 },
  atlas = "AbandoniaAtomic",
  cost = 4,
  discovered = false,
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
      }
    }
  end,

  can_use = function(self, card)
    if not G.playing_cards or #G.playing_cards < 2 then return false end
    
    local has_donor = false
    for _, v in ipairs(G.playing_cards) do
      if v.edition or v.seal then
        has_donor = true
        break
      end
    end
    
    return has_donor
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.1,
      func = function()
        local all_cards = {}
        local donor_pool = {}
        
        for _, v in ipairs(G.playing_cards) do
          table.insert(all_cards, v)
          if v.edition or v.seal then
            table.insert(donor_pool, v)
          end
        end
        
        if #all_cards < 2 or #donor_pool == 0 then return true end

        for i = #all_cards, 2, -1 do
          local j = pseudorandom('abn_7n_shuffle', 1, i)
          all_cards[i], all_cards[j] = all_cards[j], all_cards[i]
        end

        for i = #donor_pool, 2, -1 do
          local j = pseudorandom('abn_7n_donor_shuffle', 1, i)
          donor_pool[i], donor_pool[j] = donor_pool[j], donor_pool[i]
        end

        local targets = {}
        for i = 1, math.min(#all_cards, card.ability.extra.cards) do
          table.insert(targets, all_cards[i])
        end

        for idx, target in ipairs(targets) do
          local donor = donor_pool[((idx - 1) % #donor_pool) + 1]
          if donor and target ~= donor then
            target:juice_up(0.8, 0.5)
            
            if donor.edition then
              target:set_edition(donor.edition, true, true)
            end
            
            if donor.seal then
              target:set_seal(donor.seal, true)
            end
          end
        end

        return true
      end
    }))
  end,

  abn_artist_credits = { artist = "Scruffy" },
}

SMODS.Consumable {
  key = "8o",
  set = "atomic",
  config = { extra = { cards = 2, chips = 10, mult = 10 } },
  pos = { x = 3, y = 1 },
  atlas = "AbandoniaAtomic",
  cost = 4,
  discovered = false,
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
        card.ability.extra.chips,
        card.ability.extra.mult,
      }
    }
  end,

  can_use = function(self, card)
    return G.playing_cards and #G.playing_cards > 0
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.1,
      func = function()
        local all_cards = {}
        for _, v in ipairs(G.playing_cards) do
          table.insert(all_cards, v)
        end
        
        if #all_cards == 0 then return true end

        for i = #all_cards, 2, -1 do
          local j = pseudorandom('abn_8o_shuffle', 1, i)
          all_cards[i], all_cards[j] = all_cards[j], all_cards[i]
        end

        local targets = {}
        for i = 1, math.min(#all_cards, card.ability.extra.cards) do
          table.insert(targets, all_cards[i])
        end

        for _, target in ipairs(targets) do
          target:juice_up(0.8, 0.5)
          target.ability.perma_bonus = (target.ability.perma_bonus or 0) + card.ability.extra.chips
          target.ability.perma_mult = (target.ability.perma_mult or 0) + card.ability.extra.mult
        end

        return true
      end
    }))
  end,

  abn_artist_credits = { artist = "Scruffy" },
}

SMODS.Consumable {
  key = "9f",
  set = "atomic",
  config = { extra = { cards = 2, } },
  pos = { x = 4, y = 1 },
  atlas = "AbandoniaAtomic",
  cost = 4,
  discovered = false,
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
      }
    }
  end,

  can_use = function(self, card)
    return G.playing_cards and #G.playing_cards >= 2
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.1,
      func = function()
        local all_cards = {}
        for _, v in ipairs(G.playing_cards) do
          table.insert(all_cards, v)
        end
        
        if #all_cards < 2 then return true end

        for i = #all_cards, 2, -1 do
          local j = pseudorandom('abn_9f_shuffle', 1, i)
          all_cards[i], all_cards[j] = all_cards[j], all_cards[i]
        end

        local targets = {}
        for i = 1, math.min(#all_cards, card.ability.extra.cards) do
          table.insert(targets, all_cards[i])
        end

        local donor_pool = {}
        for i = 3, #all_cards do
          table.insert(donor_pool, all_cards[i])
        end
        if #donor_pool == 0 then
          donor_pool = all_cards
        else
          for i = #donor_pool, 2, -1 do
            local j = pseudorandom('abn_9f_donor_shuffle', 1, i)
            donor_pool[i], donor_pool[j] = donor_pool[j], donor_pool[i]
          end
        end

        for idx, target in ipairs(targets) do
          local donor = donor_pool[((idx - 1) % #donor_pool) + 1]
          if donor then
            target:juice_up(0.8, 0.5)
            local nominal = (donor.base and donor.base.nominal) or 0
            local bonus = nominal * 2
            target.ability.perma_bonus = (target.ability.perma_bonus or 0) + bonus
          end
        end

        return true
      end
    }))
  end,

  abn_artist_credits = { artist = "Scruffy" },
}