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