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

SMODS.UndiscoveredSprite {
  key = 'atomic',
  atlas = 'abn_AbandoniaUndiscovered',
  pos = { x = 1, y = 3 },
}

local function select_card_menu(self, card)
	card = copy_card(card, nil, 0.7)
	local card_map, deck_tables = {}, {}
	for k, v in ipairs(self:abn_atomic_card_list(card)) do
		if not card_map[#card_map] or #card_map[#card_map] > math.max(13, math.ceil(math.max(2 * math.sqrt(#self:abn_atomic_card_list(card)), #self:abn_atomic_card_list(card) / 5))) then
			card_map[#card_map+1] = {}
		end
		table.insert(card_map[#card_map], v)
	end
	G.GAME.abn_selecting_from_full_deck.card_map = card_map
	G.GAME.abn_selecting_from_full_deck.unselected = {}
	for i = 1, #card_map do
		local cardarea = CardArea(G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h, 6.5 * G.CARD_W, 0.6 * G.CARD_H, {
			card_limit = 15,
			type = 'title',
			highlight_limit = 0,
			card_w = G.CARD_W * 0.7,
			draw_layers = { 'card' },
			negative_info = 'playing_card'
		})
		table.insert(deck_tables, {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
			{n=G.UIT.O, config={object = cardarea}}
		}})
		for _, c in ipairs(card_map[i]) do
			local copy = copy_card(c, nil, 0.7)
			copy.T.x = cardarea.T.x + cardarea.T.w / 2
			copy.T.y = cardarea.T.y
			copy:hard_set_T()
			copy.abn_atomic_exists_for_selection = c
			cardarea:emplace(copy)
		end
		G.GAME.abn_selecting_from_full_deck.unselected[i] = cardarea
	end
	G.GAME.abn_selecting_from_full_deck.selected = {}
	local bottom_row = {
		{n = G.UIT.B, config = {w = 0.2, h = 0.1}},
		{n=G.UIT.O, config={object = card}},
	}
	for i = 1, #self.abn_atomic_selection_areas do
		G.GAME.abn_selecting_from_full_deck.selected[i] = CardArea(G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h, 4 * G.CARD_W / #self.abn_atomic_selection_areas, 0.6 * G.CARD_H, {
			card_limit = 10 / #self.abn_atomic_selection_areas,
			type = 'title',
			highlight_limit = 0,
			card_w = G.CARD_W * 0.7,
			draw_layers = { 'card' },
			negative_info = 'playing_card'
		})
		table.insert(bottom_row, {n=G.UIT.T, config={text = localize(self.abn_atomic_selection_areas[i]), colour = G.C.WHITE, scale = 0.6}})
		table.insert(bottom_row, {n=G.UIT.O, config={object = G.GAME.abn_selecting_from_full_deck.selected[i]}})
	end
	table.insert(bottom_row, {n = G.UIT.C,
		config = {
			align = 'cm', padding = 0.15,  r = 0.08,
			hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE,
			button = 'abn_atomic_select',
			func = 'abn_atomic_select_can_press'
		},
		nodes = {{n = G.UIT.R, nodes = {
			{n = G.UIT.T, config = {text = localize("b_select"), colour = G.C.UI.TEXT_LIGHT, scale = 0.4}},
			{n = G.UIT.B, config = {w = 0.1, h = 0.4}}
		}}}
	})
	return {n = G.UIT.ROOT, config = {align = "cm", colour = G.C.CLEAR}, nodes = {
		{n = G.UIT.C, config = {align = "cm", padding = 0.05, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes = {
			{n = G.UIT.R, config = {align = "cm"}, nodes = {
				{n = G.UIT.B, config = {w = 0.2, h = 0.1}},
				{n = G.UIT.C, config = {align = "cm", padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes = deck_tables}
			}},
			{n = G.UIT.R, config = {align = "cm"}, nodes = bottom_row},
		}}
	}}
end

G.FUNCS.abn_atomic_select_can_press = function(e)
	local can_use = false
	if G.GAME.abn_selecting_from_full_deck then
		local selected = {}
		for _, a in ipairs(G.GAME.abn_selecting_from_full_deck.selected) do
			for _, c in ipairs(a.cards) do
				table.insert(selected, c)
			end
		end
		local self = G.GAME.abn_selecting_from_full_deck.self
		local card = G.GAME.abn_selecting_from_full_deck.card
		if self:abn_atomic_can_use(card, selected) and #selected <= card.ability.extra.cards then
			can_use = true
		end
	end
	if can_use then
		e.config.button = "abn_atomic_select"
		e.config.colour = G.C.GREEN
	else
		e.config.button = nil
		e.config.colour = G.C.UI.BACKGROUND_INACTIVE
	end
end

G.FUNCS.abn_atomic_select = function(e)
	if G.GAME.abn_selecting_from_full_deck then
		local selected = G.GAME.abn_selecting_from_full_deck.selected
		local self = G.GAME.abn_selecting_from_full_deck.self
		local card = G.GAME.abn_selecting_from_full_deck.card
		local all_cards = {}
		for i = 1, #G.GAME.abn_selecting_from_full_deck.selected[1].cards do
			for j = 1, #G.GAME.abn_selecting_from_full_deck.selected do
				if G.GAME.abn_selecting_from_full_deck.selected[j].cards[i] then
					table.insert(all_cards, G.GAME.abn_selecting_from_full_deck.selected[j].cards[i].abn_atomic_exists_for_selection)
				end
			end
		end
		local targets = {}
		local filter_data = {}
		for i = 1, #all_cards do
			if not self.abn_atomic_filter or self:abn_atomic_filter(card, all_cards, i, targets, filter_data) then
				table.insert(targets, all_cards[i])
				if #targets >= card.ability.extra.cards then break end
			end
		end
		if self.abn_atomic_table_callback then
			self:abn_atomic_table_callback(card, targets, filter_data)
		else
			for _, target in ipairs(targets) do
				target:juice_up(0.8, 0.5)
				self:abn_atomic_callback(card, target, filter_data)
			end
		end
		play_sound("tarot1")
		G.GAME.abn_selecting_from_full_deck = nil
		G.FUNCS.exit_overlay_menu()
		SMODS.calculate_context({abn_atomic_effect_chosen = true, center = self, card = card})
	end
end

local original_game_update = Game.update
function Game:update(dt)
	original_game_update(self, dt)

	local target = G.CONTROLLER.hovering.target
	if G.GAME.abn_selecting_from_full_deck and target and target.abn_atomic_exists_for_selection and love.mouse.isDown(1) then
		target.abn_atomic_selected = not target.abn_atomic_selected
		target.area:remove_card(target)
		if target.abn_atomic_selected then
			local i = G.GAME.abn_selecting_from_full_deck.self:abn_atomic_which_area(G.GAME.abn_selecting_from_full_deck.selected, target)
			G.GAME.abn_selecting_from_full_deck.selected[i]:emplace(target)
		else
			local smallest = 1
			for i = 2, #G.GAME.abn_selecting_from_full_deck.unselected do
				if #G.GAME.abn_selecting_from_full_deck.unselected[i].cards < #G.GAME.abn_selecting_from_full_deck.unselected[smallest].cards then
					smallest = i
				end
			end
			G.GAME.abn_selecting_from_full_deck.unselected[smallest]:emplace(target)
		end
	end
end

ABN.AtomicCard = SMODS.Consumable:extend({
  set = 'atomic',
  cost = 4,
  atlas = "abn_AbandoniaAtomic",
  pos = { x = 0, y = 0 },
  discovered = false,
  abn_atomic_selection_areas = {"k_abn_chosen_cards"},
  abn_atomic_card_list = function(self, card)
	return G.playing_cards
  end,
  abn_atomic_which_area = function(self, areas, selected_card)
	return 1
  end,
  can_use = function(self, card)
    return self:abn_atomic_can_use(card, self:abn_atomic_card_list(card))
  end,
  abn_atomic_can_use = function(self, card, list)
    return list and #list > 0
  end,
  use = function(self, card, area, copier)
	G.GAME.abn_atomic_card_played = true
	if next(SMODS.find_card("j_abn_atomic_joker")) and not G.GAME.abn_copying_from_atomic_joker then
	  G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          play_sound('card1', 1)
          card:juice_up(0.3, 0.3)
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
          G.GAME.abn_selecting_from_full_deck = {card = card, self = self}
          G.FUNCS.overlay_menu({definition = select_card_menu(self, card)})
          return true
        end
      }))

	  delay(0.5)
	else
		G.E_MANAGER:add_event(Event({
		  trigger = 'after',
		  delay = 0.1,
		  func = function()
			G.GAME.abn_copying_from_atomic_joker = nil
		    local all_cards = {}
		    for _, v in ipairs(self:abn_atomic_card_list(card)) do
		      table.insert(all_cards, v)
		    end
		    if #all_cards == 0 then return true end
		    for i = #all_cards, 2, -1 do
		      local j = pseudorandom(self.key..'_shuffle', 1, i)
		      all_cards[i], all_cards[j] = all_cards[j], all_cards[i]
		    end
		    local targets = {}
			local filter_data = {}
		    for i = 1, #all_cards do
			  if not self.abn_atomic_filter or self:abn_atomic_filter(card, all_cards, i, targets, filter_data) then
		      	table.insert(targets, all_cards[i])
				if #targets >= card.ability.extra.cards then break end
			  end
		    end
			if self.abn_atomic_table_callback then
			  self:abn_atomic_table_callback(card, targets, filter_data)
			else
			  for _, target in ipairs(targets) do
				target:juice_up(0.8, 0.5)
				self:abn_atomic_callback(card, target, filter_data)
			  end
			end
		    return true
		  end
		}))
	end
  end,
  abn_artist_credits = { artist = "Tatsu" },
})

ABN.AtomicCard {
  key = "1h",
  config = { extra = { cards = 2, xmult = 1.5 } },
  pos = { x = 0, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
        card.ability.extra.xmult,
      }
    }
  end,

  abn_atomic_callback = function(self, card, target)
	target.base.nominal = 1
	if target.ability.perma_x_mult < card.ability.extra.xmult - 1 then
	  target.ability.perma_x_mult = target.ability.perma_x_mult + card.ability.extra.xmult - 1
	else
	  target.ability.perma_x_mult = target.ability.perma_x_mult + card.ability.extra.xmult
	end
  end,
}

ABN.AtomicCard {
  key = "d2h",
  config = { extra = { cards = 2, asc_add = 0.25 } },
  pos = { x = 1, y = 0 },
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

  abn_atomic_callback = function(self, card, target)
	local rank_key = target.base and target.base.value
	local rank_data = (rank_key and G.GAME.abn_rank_upgrades) and G.GAME.abn_rank_upgrades[rank_key]
	local rank_level = rank_data and rank_data.level or 1

	target.ability.abn_perma_asc = target.ability.abn_perma_asc or 0

	local total_gain = card.ability.extra.asc_add * rank_level
	target.ability.abn_perma_asc = target.ability.abn_perma_asc + total_gain
  end,
}

ABN.AtomicCard {
  key = "2he",
  config = { extra = { cards = 2, score = 300 } },
  pos = { x = 2, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
        card.ability.extra.score,
      }
    }
  end,

  abn_atomic_callback = function(self, card, target)
	target.ability.perma_score = (target.ability.perma_score or 0) + card.ability.extra.score
  end,
}

ABN.AtomicCard {
  key = "li3",
  config = { extra = { cards = 2, xchips = 1 } },
  pos = { x = 3, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
        card.ability.extra.xchips,
      }
    }
  end,

  abn_atomic_callback = function(self, card, target)
    target.ability.perma_x_chips = (target.ability.perma_x_chips or 1) + card.ability.extra.xchips
  end,
}

ABN.AtomicCard {
  key = "be4",
  config = { extra = { cards = 2 } },
  pos = { x = 4, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
      }
    }
  end,

  abn_atomic_card_list = function(self, card)
	return G.hand and G.hand.cards or {}
  end,

  abn_atomic_table_callback = function(self, card, targets)
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
  end,
}

ABN.AtomicCard {
  key = "5b",
  config = { extra = { cards = 2, } },
  pos = { x = 0, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
      }
    }
  end,

  abn_atomic_callback = function(self, card, target)
    target.base.nominal = target.base.nominal * 3
  end,
}

ABN.AtomicCard {
  key = "6c",
  config = { extra = { cards = 2, } },
  pos = { x = 1, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
      }
    }
  end,

  abn_atomic_callback = function(self, card, target)
	local nominal = (target.base and target.base.nominal) or 0
	local bonus = nominal * 2
	target.ability.perma_mult = (target.ability.perma_mult or 0) + bonus
  end,
}

ABN.AtomicCard {
  key = "7n",
  config = { extra = { cards = 4 } },
  pos = { x = 2, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards / 2,
      }
    }
  end,

  abn_atomic_selection_areas = {"k_abn_copy_from", "k_abn_into"},

  abn_atomic_which_area = function(self, areas, selected_card)
	if (selected_card.edition or selected_card.seal) and #areas[1].cards < 2 then
	  return 1
	else
	  return 2
	end
  end,

  abn_atomic_can_use = function(self, card, list)
    if not list or #list < 2 then return false end

    local has_donor = false
    for _, v in ipairs(G.playing_cards) do
      if v.edition or v.seal then
        has_donor = true
        break
      end
    end

    return has_donor
  end,

  abn_atomic_filter = function(self, card, all_cards, i, targets, filter_data)
	filter_data.copy_from = filter_data.copy_from or {}
	filter_data.copy_to = filter_data.copy_to or {}
    if (all_cards[i].edition or all_cards[i].seal) and #filter_data.copy_from < 2 then
	  table.insert(filter_data.copy_from, all_cards[i])
	  return true
	elseif #filter_data.copy_to < 2 then
	  table.insert(filter_data.copy_to, all_cards[i])
	  return true
	end
    return false
  end,

  abn_atomic_table_callback = function(self, card, targets, filter_data)
	if not filter_data.copy_from or not filter_data.copy_to then return end
	if #filter_data.copy_from == 2 and #filter_data.copy_to == 0 then
	  filter_data.copy_to[1] = table.remove(filter_data.copy_from, 2)
	end
	for i = 1, math.min(#filter_data.copy_from, #filter_data.copy_to) do
	  if filter_data.copy_from[i].edition then
		filter_data.copy_to[i]:set_edition(filter_data.copy_from[i].edition, true, true)
	  end
	  if filter_data.copy_from[i].seal then
		filter_data.copy_to[i]:set_seal(filter_data.copy_from[i].seal, true)
	  end
	  filter_data.copy_to[i]:juice_up(0.8, 0.5)
	end
  end,
}

ABN.AtomicCard {
  key = "8o",
  config = { extra = { cards = 2, chips = 10, mult = 10 } },
  pos = { x = 3, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards,
        card.ability.extra.chips,
        card.ability.extra.mult,
      }
    }
  end,

  abn_atomic_callback = function(self, card, target)
	target.ability.perma_bonus = (target.ability.perma_bonus or 0) + card.ability.extra.chips
	target.ability.perma_mult = (target.ability.perma_mult or 0) + card.ability.extra.mult
  end,
}

ABN.AtomicCard {
  key = "9f",
  config = { extra = { cards = 4, } },
  pos = { x = 4, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cards / 2,
      }
    }
  end,

  abn_atomic_selection_areas = {"k_abn_give_chips_from", "k_abn_into"},

  abn_atomic_which_area = function(self, areas, selected_card)
	if #areas[1].cards < 2 then
	  return 1
	else
	  return 2
	end
  end,

  abn_atomic_can_use = function(self, card, list)
    return list and #list >= 2
  end,

  abn_atomic_table_callback = function(self, card, targets)
	for i = 1, #targets, 2 do
	  if targets[i] and targets[i+1] then
		targets[i+1]:juice_up(0.8, 0.5)
		local nominal = (targets[i].base and targets[i].base.nominal) or 0
		targets[i+1].ability.perma_bonus = (targets[i+1].ability.perma_bonus or 0) + nominal * 2
	  end
	end
  end,
}
