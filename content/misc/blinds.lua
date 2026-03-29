-- Showdown Blinds

-- art by Meladaptive
SMODS.Blind({
	key = "magenta_magnet",
	boss = {
		showdown = true,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 9 },
	boss_colour = HEX("9e4d6e"),
	debuff_hand = function(self, cards, hand, handname, check)
		local no = true
		for k, v in pairs(cards) do
			if SMODS.has_enhancement(v, "m_gold") or SMODS.has_enhancement(v, "m_steel") then
				no = false
			end
		end
		return no
	end,
	abn_artist_credits = { -- jst realized this doesnt work :D
		artist = "Meladaptive",
	},
})

SMODS.Blind({
	key = "silver_star",
	boss = {
		showdown = true,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 10 },
	boss_colour = HEX("9facc4"),
	recalc_debuff = function(self, card, from_blind)
		if G.GAME.blind.disabled then
			return false
		end
		if card:is_suit("Diamonds") or card:is_suit("Hearts") and not card.debuff then -- <- add hre for more debuffs
			return true
		end
	end,
})

SMODS.Blind({
	key = "gold_belt",
	boss = {
		showdown = true,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 11 },
	boss_colour = HEX("a79475"),
	debuff_hand = function(self, cards, hand, handname, check)
		local no = true
		for k, v in pairs(cards) do
			if SMODS.has_enhancement(v, "m_lucky") then
				no = false
			end
		end
		return no
	end,
})

SMODS.Blind({
	key = "lime_lock",
	boss = {
		showdown = true,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 12 },
	boss_colour = HEX("afcc87"),
	set_blind = function(self)
		self.old_chips = G.GAME.blind.chips
		local a = 1
		for k, v in pairs(G.playing_cards) do
			if v.debuff then
				a = a + 1
			end
		end
		for i = 1, a do
			G.GAME.blind.chips = G.GAME.blind.chips + ((5 / G.GAME.blind.chips) * 100)
		end
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		self.triggered = true
	end,
	defeat = function(self)
		self.triggered = false
		self.old_chips = nil
	end,
	disable = function(self)
		self.triggered = false
		if self.old_chips then
			G.GAME.blind.chips = self.old_chips
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		end
		self.old_chips = nil
	end,
})

SMODS.Blind({
	key = "pink_pin",
	debuff = {
		h_size_le = 3,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 13 },
	boss = { showdown = true },
	boss_colour = HEX("c78bb3"),
})

SMODS.Blind({
	key = "slate_slab",
	boss = {
		showdown = true,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 14 },
	boss_colour = HEX("4f6c74"),
	debuff_hand = function(self, cards, hand, handname, check)
		local no = true
		for k, v in pairs(cards) do
			if SMODS.has_enhancement(v, "m_stone") then
				no = false
			end
		end
		return no
	end,
})

SMODS.Blind({
	key = "azure_circle",
	boss = {
		showdown = true,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 15 },
	boss_colour = HEX("302edd"),
})

SMODS.Blind({
	key = "rainbow_oracle",
	boss = {
		showdown = true,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 16 },
	boss_colour = HEX("e0483e"),
	debuff_hand = function(self, cards, hand, handname, check)
		local suits = {}
		for k, v in pairs(cards) do
			if not suits[v.base.suit] then
				suits[v.base.suit] = true
			end
		end
		local a = 0
		for k, v in pairs(suits) do
			a = a + 1
		end
		if a < 4 then
			return true
		end
	end,
})
-- art by Grass

SMODS.Blind({
	key = "wild_cherry",
	boss = {
		showdown = true,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 5 },
	boss_colour = HEX("ce54cc"),
	debuff_hand = function(self, cards, hand, handname, check)
		local no = true
		for k, v in pairs(cards) do
			if SMODS.has_enhancement(v, "m_wild") then
				no = false
			end
		end
		return no
	end,
})

SMODS.Blind({
	key = "teal_tear",
	debuff = {
		h_size_le = 4,
		h_size_ge = 4,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 6 },
	boss = { showdown = true },
	boss_colour = HEX("4bdbcb"),
})

SMODS.Blind({
	key = "dark_shield",
	boss = {
		showdown = true,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 7 },
	boss_colour = HEX("9facc4"),
	recalc_debuff = function(self, card, from_blind)
		if G.GAME.blind.disabled then
			return false
		end
		if card:is_suit("Clubs") or card:is_suit("Spades") and not card.debuff then --- <- add hre for more debuffs
			return true
		end
	end,
})

SMODS.Blind({
	key = "the_crown",
	boss = {
		showdown = true,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 8 },
	boss_colour = HEX("db6e3b"),
	debuff_hand = function(self, cards, hand, handname, check)
		local no = true
		for k, v in pairs(cards) do
			if v:is_face() then
				no = false
			end
		end
		return no
	end,
})

-- Hazard Blinds
-- Hazard Heart

SMODS.Blind({
	key = "hazard_magnet",
	boss = {
		showdown = true,
		hazard_blind = true,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 21 },
	boss_colour = HEX("9e4d6e"),
	debuff_hand = function(self, cards, hand, handname, check)
		local no = true
		local gold, steel = false, false
		for k, v in pairs(cards) do
			if SMODS.has_enhancement(v, "m_gold") then
				gold = true
			end
			if SMODS.has_enhancement(v, "m_steel") then
				steel = true
			end
			if gold and steel then
				no = false
			end
		end
		return no
	end,
	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.debuff_card and context.debuff_card.area == G.jokers then
				if context.debuff_card.ability.hazard_magnet_chosen then
					return {
						debuff = true,
					}
				end
			end
			if context.press_play and G.jokers.cards[1] then
				blind.triggered = true
				blind.prepped = true
			end
			if context.hand_drawn then
				if blind.prepped and G.jokers.cards[1] then
					local prev_chosen_set = {}
					local fallback_jokers = {}
					local jokers = {}
					for i = 1, #G.jokers.cards do
						if G.jokers.cards[i].ability.hazard_magnet_chosen then
							prev_chosen_set[G.jokers.cards[i]] = true
							G.jokers.cards[i].ability.hazard_magnet_chosen = nil
							if G.jokers.cards[i].debuff then
								SMODS.recalc_debuff(G.jokers.cards[i])
							end
						end
					end
					for i = 1, #G.jokers.cards do
						if not G.jokers.cards[i].debuff then
							if not prev_chosen_set[G.jokers.cards[i]] then
								jokers[#jokers + 1] = G.jokers.cards[i]
							end
							table.insert(fallback_jokers, G.jokers.cards[i])
						end
					end
					if #jokers == 0 then
						jokers = fallback_jokers
					end
					local _card = pseudorandom_element(jokers, "vremade_crimson_heart")
					if _card then
						_card.ability.hazard_magnet_chosen = true
						SMODS.recalc_debuff(_card)
						_card:juice_up()
						blind:wiggle()
					end
				end
			end
		end
		if context.hand_drawn then
			blind.prepped = nil
		end
	end,
	disable = function(self)
		for _, joker in ipairs(G.jokers.cards) do
			joker.ability.hazard_magnet_chosen = nil
		end
	end,
	defeat = function(self)
		for _, joker in ipairs(G.jokers.cards) do
			joker.ability.hazard_magnet_chosen = nil
		end
	end,
})

SMODS.Blind({
	key = "hazard_star",
	boss = {
		showdown = true,
    hazard_blind = true,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 22},
	boss_colour = HEX("9facc4"),
	recalc_debuff = function(self, card, from_blind)
		if G.GAME.blind.disabled then
			return false
		end
		if card:is_suit("Diamonds") or card:is_suit("Hearts") and not card.debuff then -- <- add hre for more debuffs
			return true
		end
	end,
  set_blind = function(self)
    self.discard_removed = G.GAME.starting_params.discard_limit-1
    SMODS.change_discard_limit(-self.discard_removed )
  end,
  	disable = function(self)
      SMODS.change_discard_limit(self.discard_removed)
	end,
	defeat = function(self)
      SMODS.change_discard_limit(self.discard_removed)
	end,
})

SMODS.Blind({
	key = "hazard_belt",
	boss = {
		showdown = true,
    hazard_blind = true,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 23 },
	boss_colour = HEX("a79475"),
	debuff_hand = function(self, cards, hand, handname, check)
		local no = true
		for k, v in pairs(cards) do
			if SMODS.has_enhancement(v, "m_lucky") then
				no = false
			end
		end
		return no
	end,
  set_blind = function(self)
    self.old_chips = G.GAME.blind.chips
  end,
  calculate = function(self,blind,context)
    if context.individual and (context.other_card.ability.set == "Enhanced" or context.other_card.ability.set == "Default")  and not context.end_of_round then --< said per car trigger so uh / limiting it with playing cards
        G.GAME.blind.chips = G.GAME.blind.chips +  ((5 / G.GAME.blind.chips) * 100)
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        blind:juice_up()
    end
  end,
  	defeat = function(self)
		self.triggered = false
		self.old_chips = nil
	end,
	disable = function(self)
		self.triggered = false
		if self.old_chips then
			G.GAME.blind.chips = self.old_chips
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		end
		self.old_chips = nil
	end,
})

SMODS.Blind({
	key = "hazard_pin",
	debuff = {
		h_size_le = 2,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 25},
	boss = { showdown = true, hazard_blind = true },
	boss_colour = HEX("c78bb3"),
  calculate = function(self, blind, context)
		if not blind.disabled then
			if context.debuff_card and context.debuff_card.area == G.jokers then
				if context.debuff_card.ability.hazard_pin then
					return {
						debuff = true,
					}
				end
			end
			if context.press_play and G.jokers.cards[1] then
				blind.triggered = true
				blind.prepped = true
			end
			if context.hand_drawn then
				if blind.prepped and G.jokers.cards[1] then
					local prev_chosen_set = {}
					local fallback_jokers = {}
					local jokers = {}
					for i = 1, #G.jokers.cards do
						if G.jokers.cards[i].ability.hazard_pin then
							prev_chosen_set[G.jokers.cards[i]] = true
							G.jokers.cards[i].ability.hazard_pin = nil
							if G.jokers.cards[i].debuff then
								SMODS.recalc_debuff(G.jokers.cards[i])
							end
						end
					end
					for i = 1, #G.jokers.cards do
						if not G.jokers.cards[i].debuff then
							if not prev_chosen_set[G.jokers.cards[i]] then
								jokers[#jokers + 1] = G.jokers.cards[i]
							end
							table.insert(fallback_jokers, G.jokers.cards[i])
						end
					end
					if #jokers == 0 then
						jokers = fallback_jokers
					end
					local _card = G.jokers.cards[#G.jokers.cards]
					if _card then
						_card.ability.hazard_pin = true
						SMODS.recalc_debuff(_card)
						_card:juice_up()
						blind:wiggle()
					end
				end
			end
		end
		if context.hand_drawn then
			blind.prepped = nil
		end
	end,
})

SMODS.Blind({
	key = "hazard_lock",
	boss = {
		showdown = true,
    hazard_blind = true
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 24 },
	boss_colour = HEX("afcc87"),
	set_blind = function(self)
		self.old_chips = G.GAME.blind.chips
    local undebuffed_playing_cards = {}
    for k, v in pairs(G.playing_cards) do
      if not v.debuff then
        undebuffed_playing_cards[#undebuffed_playing_cards+1] = v
      end
    end
    for i = 1, 12 do
      if #undebuffed_playing_cards>0 then
        local dcard = pseudorandom_element(undebuffed_playing_cards, pseudoseed("seeding") )
        SMODS.debuff_card(dcard, true, "dbuffed_by_hazzard_lock")
        for k, v in pairs(undebuffed_playing_cards) do
          if v == dcard then
            table.remove(undebuffed_playing_cards, k)
          end
        end
      end
    end
		local a = 1
		for k, v in pairs(G.playing_cards) do
			if v.debuff then
				a = a + 1
			end
		end
		for i = 1, a do
			G.GAME.blind.chips = G.GAME.blind.chips + ((7 / G.GAME.blind.chips) * 100)
		end
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		self.triggered = true
	end,
	defeat = function(self)
    for k, v in pairs(G.playing_cards) do
      SMODS.debuff_card(v, false, "dbuffed_by_hazzard_lock")
    end
		self.triggered = false
		self.old_chips = nil
	end,
	disable = function(self)
     for k, v in pairs(G.playing_cards) do
      SMODS.debuff_card(v, false, "dbuffed_by_hazzard_lock")
    end
		self.triggered = false
		if self.old_chips then
			G.GAME.blind.chips = self.old_chips
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		end
		self.old_chips = nil
	end,
})

SMODS.Blind({
	key = "hazard_slab",
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 26},
	boss = { showdown = true, hazard_blind = true },
	boss_colour = HEX("4f6c74"),
	debuff_hand = function(self, cards, hand, handname, check)
		local no = true
		for k, v in pairs(cards) do
			if SMODS.has_enhancement(v, "m_stone") then
				no = false
			end
		end
		return no
	end,
  calculate = function(self, blind, context)
		if not blind.disabled then
			if context.debuff_card and context.debuff_card.area == G.jokers then
				if context.debuff_card.ability.hazard_pin then
					return {
						debuff = true,
					}
				end
			end
			if context.press_play and G.jokers.cards[1] then
				blind.triggered = true
				blind.prepped = true
			end
			if context.hand_drawn then
				if blind.prepped and G.jokers.cards[1] then
					local prev_chosen_set = {}
					local fallback_jokers = {}
					local jokers = {}
					for i = 1, #G.jokers.cards do
						if G.jokers.cards[i].ability.hazard_pin then
							prev_chosen_set[G.jokers.cards[i]] = true
							G.jokers.cards[i].ability.hazard_pin = nil
							if G.jokers.cards[i].debuff then
								SMODS.recalc_debuff(G.jokers.cards[i])
							end
						end
					end
					for i = 1, #G.jokers.cards do
						if not G.jokers.cards[i].debuff then
							if not prev_chosen_set[G.jokers.cards[i]] then
								jokers[#jokers + 1] = G.jokers.cards[i]
							end
							table.insert(fallback_jokers, G.jokers.cards[i])
						end
					end
					if #jokers == 0 then
						jokers = fallback_jokers
					end
					local _card = G.jokers.cards[1]
					if _card then
						_card.ability.hazard_pin = true
						SMODS.recalc_debuff(_card)
						_card:juice_up()
						blind:wiggle()
					end
				end
			end
		end
		if context.hand_drawn then
			blind.prepped = nil
		end
	end,
})

SMODS.Blind({
	key = "hazard_circle",
	boss = {
		showdown = true,
    hazard_blind = true
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 27 },
	boss_colour = HEX("302edd"),
  calculate = function(self,blind,context)
    if context.before and not G.GAME.blind.disabled then
     local  undebuffed_cards = {}
      for k, v in pairs(G.play.cards) do
        if not v.debuff then
            undebuffed_cards[#undebuffed_cards+1] = v
        end
      end
      if #undebuffed_cards>0 then
      local a = pseudorandom_element(undebuffed_cards, pseudoseed("seedseed"))
      SMODS.debuff_card(a, true, "debuffed_by_hazardc")
    end
    end
  end,
  defeat = function(self)
    for k, v in pairs(G.playing_cards) do
      SMODS.debuff_card(v, false, "debuffed_by_hazardc")
    end
		self.triggered = false
		self.old_chips = nil
	end,
	disable = function(self)
     for k, v in pairs(G.playing_cards) do
      SMODS.debuff_card(v, false, "debuffed_by_hazardc")
    end
  end
})

SMODS.Blind({
	key = "hazard_oracle",
	boss = {
		showdown = true,
    hazard_blind = true
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 28 },
	boss_colour = HEX("e0483e"),
	debuff_hand = function(self, cards, hand, handname, check)
		local suits = {}
		for k, v in pairs(cards) do
			if not suits[v.base.suit] then
				suits[v.base.suit] = true
			end
		end
		local a = 0
		for k, v in pairs(suits) do
			a = a + 1
		end
		if a < 5 then
			return true
		end
	end,
    calculate = function(self, blind, context)
		if not blind.disabled then
			if context.debuff_card and context.debuff_card.area == G.jokers then
				if context.debuff_card.ability.hazard_pin then
					return {
						debuff = true,
					}
				end
			end
			if context.press_play and G.jokers.cards[1] then
				blind.triggered = true
				blind.prepped = true
			end
			if context.hand_drawn then
				if blind.prepped and G.jokers.cards[1] then
					local prev_chosen_set = {}
					local fallback_jokers = {}
					local jokers = {}
					for i = 1, #G.jokers.cards do
						if G.jokers.cards[i].ability.hazard_pin then
							prev_chosen_set[G.jokers.cards[i]] = true
							G.jokers.cards[i].ability.hazard_pin = nil
							if G.jokers.cards[i].debuff then
								SMODS.recalc_debuff(G.jokers.cards[i])
							end
						end
					end
					for i = 1, #G.jokers.cards do
						if not G.jokers.cards[i].debuff then
							if not prev_chosen_set[G.jokers.cards[i]] then
								jokers[#jokers + 1] = G.jokers.cards[i]
							end
							table.insert(fallback_jokers, G.jokers.cards[i])
						end
					end
					if #jokers == 0 then
						jokers = fallback_jokers
					end
					local _card = G.jokers.cards[#G.jokers.cards]
					if _card then
						_card.ability.hazard_pin = true
						SMODS.recalc_debuff(_card)
						_card:juice_up()
						blind:wiggle()
					end
				end
			end
		end
		if context.hand_drawn then
			blind.prepped = nil
		end
	end,
})

SMODS.Blind({
	key = "hazard_cherry",
	boss = {
		showdown = true,
    hazard_blind = true
	},
  debuff = {
		h_size_ge = 5,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 17 },
	boss_colour = HEX("ce54cc"),
	debuff_hand = function(self, cards, hand, handname, check)
		local no = true
		for k, v in pairs(cards) do
			if SMODS.has_enhancement(v, "m_wild") then
				no = false
			end
		end
		return no
	end,
})

SMODS.Blind({
	key = "hazard_shield",
	debuff = {
		h_size_le = 3,
		h_size_ge = 3,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 19 },
	boss = { showdown = true,    hazard_blind = true },
	boss_colour = HEX("4bdbcb"),
  recalc_debuff = function(self, card, from_blind)
		if G.GAME.blind.disabled then
			return false
		end
		if card:is_suit("Clubs") or card:is_suit("Spades") and not card.debuff then --- <- add hre for more debuffs
			return true
		end
	end,
  calculate = function(self,blind,context)
    if context.after and not self.triggered and not G.GAME.blind.disabled then
      self.triggered = true
      for k, v in pairs(G.jokers.cards) do
        SMODS.debuff_card(v, true, "hazard_tear_debuff")
      end
    end
  end,
  disable = function(self)
    self.triggered = false
    for k, v in pairs(G.jokers.cards) do
        SMODS.debuff_card(v, false, "hazard_tear_debuff")
      end
  end,
  defeat = function(self)
    self.triggered = false
    for k, v in pairs(G.jokers.cards) do
        SMODS.debuff_card(v, false, "hazard_tear_debuff")
      end
  end
})

SMODS.Blind({
	key = "hazard_tear",
	debuff = {
		h_size_le = 3,
		h_size_ge = 3,
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 18 },
	boss = { showdown = true,    hazard_blind = true },
	boss_colour = HEX("9facc4"),
  calculate = function(self,blind,context)
    if context.after and not self.triggered and not G.GAME.blind.disabled then
      self.triggered = true
      for k, v in pairs(G.jokers.cards) do
        SMODS.debuff_card(v, true, "hazard_shield")
      end
    end
  end,
  disable = function(self)
    self.triggered = false
    for k, v in pairs(G.jokers.cards) do
        SMODS.debuff_card(v, false, "hazard_shield")
      end
  end,
  defeat = function(self)
    self.triggered = false
    for k, v in pairs(G.jokers.cards) do
        SMODS.debuff_card(v, false, "hazard_shield")
      end
  end
})

SMODS.Blind({
	key = "hazard_crown",
	boss = {
		showdown = true,
    hazard_blind = true
	},
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 20},
	boss_colour = HEX("db6e3b"),
	debuff_hand = function(self, cards, hand, handname, check)
		local no = true
		for k, v in pairs(cards) do
			if v:get_id() == 12 or v:get_id() == 13 then
				no = false
			end
		end
		return no
	end,
})

SMODS.Blind({
	key = "hazard_heart",
	dollars = 8,
	mult = 2,
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 0 },
	boss = { showdown = true, hazard_blind = true },
	boss_colour = HEX("ac3232"),

	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.debuff_card and context.debuff_card.area == G.jokers then
				if context.debuff_card.ability.hazard_heart_chosen then
					return {
						debuff = true,
					}
				end
			end

			if context.debuff_card and context.debuff_card.area == G.hand then
				if context.debuff_card.ability.hazard_heart_chosen then
					return {
						debuff = true,
					}
				end
			end

			if context.hand_drawn then
				if not blind.hazard_heart_prepped then
					blind.hazard_heart_prepped = true

					for _, joker in ipairs(G.jokers.cards) do
						if joker.ability.hazard_heart_chosen then
							joker.ability.hazard_heart_chosen = nil
							if joker.debuff then
								SMODS.recalc_debuff(joker)
							end
						end
					end

					for _, card in ipairs(G.hand.cards) do
						if card.ability.hazard_heart_chosen then
							card.ability.hazard_heart_chosen = nil
							if card.debuff then
								SMODS.recalc_debuff(card)
							end
						end
					end

					local joker_pool = {}
					for _, joker in ipairs(G.jokers.cards) do
						if not joker.debuff then
							joker_pool[#joker_pool + 1] = joker
						end
					end

					for i = 1, math.min(2, #joker_pool) do
						local chosen, pos = pseudorandom_element(joker_pool, "hazard_heart_joker_" .. i)
						if chosen then
							chosen.ability.hazard_heart_chosen = true
							SMODS.recalc_debuff(chosen)
							chosen:juice_up()
							table.remove(joker_pool, pos)
						end
					end

					if #G.hand.cards > 0 then
						local chosen_card = pseudorandom_element(G.hand.cards, "hazard_heart_hand")
						if chosen_card then
							chosen_card.ability.hazard_heart_chosen = true
							SMODS.recalc_debuff(chosen_card)
							chosen_card:juice_up()
						end
					end

					blind:wiggle()
				end
			end
		end

		if context.setting_blind then
			blind.hazard_heart_prepped = nil
		end
		if context.press_play then
			blind.hazard_heart_prepped = nil
		end
	end,

	disable = function(self)
		for _, joker in ipairs(G.jokers.cards) do
			joker.ability.hazard_heart_chosen = nil
			if joker.debuff then
				SMODS.recalc_debuff(joker)
			end
		end
		for _, card in ipairs(G.playing_cards) do
			card.ability.hazard_heart_chosen = nil
			if card.debuff then
				SMODS.recalc_debuff(card)
			end
		end
	end,

	defeat = function(self)
		for _, joker in ipairs(G.jokers.cards) do
			joker.ability.hazard_heart_chosen = nil
			if joker.debuff then
				SMODS.recalc_debuff(joker)
			end
		end
		for _, card in ipairs(G.playing_cards) do
			card.ability.hazard_heart_chosen = nil
			if card.debuff then
				SMODS.recalc_debuff(card)
			end
		end
	end,
})

-- Hazard Bell
SMODS.Blind({
	key = "hazard_bell",
	dollars = 8,
	mult = 2,
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 1 },
	boss = { showdown = true, hazard_blind = true },
	boss_colour = HEX("009cfd"),

	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.hand_drawn then
				for _, playing_card in ipairs(G.playing_cards) do
					playing_card.ability.forced_selection = nil
				end

				if #G.hand.cards > 0 then
					G.hand:unhighlight_all()

					local pool = {}
					for _, card in ipairs(G.hand.cards) do
						pool[#pool + 1] = card
					end

					local first, pos = pseudorandom_element(pool, "hazard_bell_1")
					if first then
						first.ability.forced_selection = true
						G.hand:add_to_highlighted(first)
						table.remove(pool, pos)
					end

					if #pool > 0 then
						local second = pseudorandom_element(pool, "hazard_bell_2")
						if second then
							second.ability.forced_selection = true
							G.hand:add_to_highlighted(second)
						end
					end

					blind:wiggle()
				end
			end
		end
	end,

	recalc_debuff = function(self, card, from_blind)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp or not G.jokers then
			return false
		end
		if card.area == G.jokers and #G.jokers.cards > 0 and card == G.jokers.cards[1] and not temp then
			return true
		end
		return false
	end,

	update = function(self, blind, dt)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if not temp and G.jokers then
			for _, v in ipairs(G.jokers.cards) do
				G.GAME.blind:debuff_card(v, true)
			end
		end
	end,

	disable = function(self)
		for _, playing_card in ipairs(G.playing_cards) do
			playing_card.ability.forced_selection = nil
		end
	end,

	defeat = function(self)
		for _, playing_card in ipairs(G.playing_cards) do
			playing_card.ability.forced_selection = nil
		end
	end,
})

-- Hazard Acorn
SMODS.Blind({
	key = "hazard_acorn",
	dollars = 8,
	mult = 2,
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 2 },
	boss = { showdown = true, hazard_blind = true },
	boss_colour = HEX("fda200"),
	recalc_debuff = function(self, card, from_blind)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp or not G.jokers then
			return false
		end
		if card.area == G.jokers and #G.jokers.cards > 0 and card == G.jokers.cards[#G.jokers.cards] and not temp then
			return true
		end
		return false
	end,

	update = function(self, blind, dt)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if not temp and G.jokers then
			for _, v in ipairs(G.jokers.cards) do
				G.GAME.blind:debuff_card(v, true)
			end
		end
	end,
	set_blind = function(self)
		for _, joker in ipairs(G.jokers.cards) do
			if joker.facing == "front" then
				joker:flip()
			end
		end
	end,
	press_play = function(self)
		if #G.jokers.cards > 0 then
			G.jokers:unhighlight_all()

			if #G.jokers.cards > 1 then
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						G.E_MANAGER:add_event(Event({
							func = function()
								G.jokers:shuffle("aajk")
								play_sound("cardSlide1", 0.85)
								return true
							end,
						}))
						delay(0.15)
						G.E_MANAGER:add_event(Event({
							func = function()
								G.jokers:shuffle("aajk")
								play_sound("cardSlide1", 1.15)
								return true
							end,
						}))
						delay(0.15)
						G.E_MANAGER:add_event(Event({
							func = function()
								G.jokers:shuffle("aajk")
								play_sound("cardSlide1", 1)
								return true
							end,
						}))
						delay(0.3)
						return true
					end,
				}))
			end
		end
	end,
})

-- Hazard Leaf
SMODS.Blind({
	key = "hazard_leaf",
	dollars = 8,
	mult = 2,
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 3 },
	boss = { showdown = true, hazard_blind = true },
	boss_colour = HEX("56a786"),

	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.setting_blind then
				blind.hazard_leaf_sold = 0
			end

			if context.debuff_card and context.debuff_card.area ~= G.jokers then
				if (blind.hazard_leaf_sold or 0) < 2 then
					return {
						debuff = true,
					}
				end
			end

			if context.selling_card and context.card.ability.set == "Joker" then
				blind.hazard_leaf_sold = (blind.hazard_leaf_sold or 0) + 1

				if blind.hazard_leaf_sold >= 2 then
					G.E_MANAGER:add_event(Event({
						trigger = "immediate",
						func = function()
							blind:disable()
							return true
						end,
					}))
				else
					blind:wiggle()
				end
			end
		end
	end,
})

-- Hazard Vessel
SMODS.Blind({
	key = "hazard_vessel",
	dollars = 8,
	mult = 8,
	atlas = "AbandoniaBlinds",
	pos = { x = 0, y = 4 },
	boss = { showdown = true, hazard_blind = true },
	boss_colour = HEX("8a71e1"),

	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.hand_drawn then
				for _, card in ipairs(G.hand.cards) do
					if card.ability.hazard_vessel_chosen then
						card.ability.hazard_vessel_chosen = nil
						if card.debuff then
							SMODS.recalc_debuff(card)
						end
					end
				end

				if G.hand.cards[1] then
					G.hand.cards[1].ability.hazard_vessel_chosen = true
					SMODS.recalc_debuff(G.hand.cards[1])
					G.hand.cards[1]:juice_up()
					blind:wiggle()
				end
			end

			if context.debuff_card and context.debuff_card.area == G.hand then
				if context.debuff_card.ability.hazard_vessel_chosen then
					return {
						debuff = true,
					}
				end
			end
		end
	end,

	disable = function(self)
		for _, card in ipairs(G.playing_cards) do
			card.ability.hazard_vessel_chosen = nil
			if card.debuff then
				SMODS.recalc_debuff(card)
			end
		end
	end,

	defeat = function(self)
		for _, card in ipairs(G.playing_cards) do
			card.ability.hazard_vessel_chosen = nil
			if card.debuff then
				SMODS.recalc_debuff(card)
			end
		end
	end,
})
