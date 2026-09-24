local start_run_old = Game.start_run
function Game:start_run(args)
  start_run_old(self, args)
  if G.jokers and G.jokers.config then
    G.jokers.config.highlighted_limit = G.jokers.config.highlighted_limit + 1
  end
end

local create_card_old = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
  if _type == "Joker" and G.GAME and G.GAME.abn_legendary_rate and G.GAME.abn_legendary_rate > 0 and not legendary then
    if pseudorandom("abn_legendary") < (G.GAME.abn_legendary_rate or 0) then
      legendary = true
      _rarity = 4
    end
  elseif _type == "Joker" and G.GAME and G.GAME.abn_superrare_rate and G.GAME.abn_superrare_rate > 0 then
    if pseudorandom("abn_superrare") < (G.GAME.abn_superrare_rate or 0) then
      legendary = false
      _rarity = "abn_SuperRare"
    end
  elseif _type == "Joker" and G.GAME and G.GAME.abn_parallelrare_rate and G.GAME.abn_parallelrare_rate > 0 then
    if pseudorandom("abn_parallelrare") < (G.GAME.abn_parallelrare_rate or 0) then
      legendary = false
      _rarity = "abn_ParallelRare"
    end
  elseif _type == "Joker" and G.GAME and G.GAME.abn_virusrare_rate and G.GAME.abn_virusrare_rate > 0 then
    if pseudorandom("abn_virusrare") < (G.GAME.abn_virusrare_rate or 0) and (G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor) then
      legendary = false
      _rarity = "abn_VirusRare"
    end
  end

  local ret = create_card_old(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)

  if not ret.edition and G.GAME.modifiers.abn_all_edition and ret.ability and ret.ability.set == "Joker" then
    ret:set_edition(poll_edition(nil, nil, nil, true))
  end

  G.E_MANAGER:add_event(Event({
    trigger = "after",
    delay = 0.1,
    func = function()
      if SMODS.OPENED_BOOSTER and SMODS.OPENED_BOOSTER.config.center.kind == "Arcana" and G.GAME.modifiers.abn_guarantee_spectral_in_tarot then
        local go, av = true, 0
        for k, v in pairs(G.pack_cards and G.pack_cards.cards or {}) do
          if v.ability.set == "Spectral" then
            go = false
          end
        end

        local to_replace = pseudorandom_element(G.pack_cards and G.pack_cards.cards or {}, pseudoseed("brr"))
        if go and to_replace then
          if #SMODS.get_clean_pool("Spectral") > 0 then
            to_replace:set_ability(
              pseudorandom_element(SMODS.get_clean_pool("Spectral"), pseudoseed("brr"))
            )
          end
        end
      end
      return true
    end,
  }))

  if G.GAME.abn_guarantee_double_modif and (ret.ability.set == "Default" or ret.ability.set == "Enhanced") then
    local a = pseudorandom_element({ 1, 2 }, pseudoseed("shuf"))
    if a == 1 then
      ret:set_seal(SMODS.poll_seal({ guaranteed = true }))
      ret:set_edition(poll_edition(nil, nil, nil, true))
    else
      ret:set_ability(SMODS.poll_enhancement({ guaranteed = true }))
      ret:set_edition(poll_edition(nil, nil, nil, true))
    end
  end

  return ret
end

local calc_reroll_cost_old = calculate_reroll_cost
function calculate_reroll_cost(skip_increment)
  if G.GAME.modifiers.abn_no_reroll_increase then
    calc_reroll_cost_old(true)
  else
    calc_reroll_cost_old(skip_increment)
  end
end

local get_chip_bonus_old = Card.get_chip_bonus
function Card:get_chip_bonus()
  if self.ability.extra_enhancement then return self.ability.bonus end

  if self.ability.effect == 'Stone Card' or self.config.center.replace_base_card then
    return self.ability.bonus + (self.ability.perma_bonus or 0)
  end
  if G.GAME.blind.config.blind.key == "bl_abn_azure_circle" then
    return (self.base.nominal + self.ability.bonus + (self.ability.perma_bonus or 0)) / 4
  elseif G.GAME.blind.config.blind.key == "bl_abn_hazard_crown" and self:is_face() then
    return (self.base.nominal + self.ability.bonus + (self.ability.perma_bonus or 0)) / 2
  elseif G.GAME.blind.config.blind.key == "bl_abn_hazard_circle" then
    return 0
  else
    return get_chip_bonus_old(self)
  end
end

local cardSetCostHook = Card.set_cost
function Card:set_cost()
  local ret = cardSetCostHook(self)
  if next(SMODS.find_card("j_abn_baba_joker")) and self.config.center.consumeable and self.config.center.set == "weather_report" then
    self.sell_cost = 5
  end
  return ret
end

local get_blind_amount_ref = get_blind_amount
function get_blind_amount(ante)
  local amount = get_blind_amount_ref(ante)
  return ABN:calculate_blind_size_modify(amount, ante)
end

local card_can_sell_card_ref = Card.can_sell_card
function Card:can_sell_card(context, ...)
  local ret = card_can_sell_card_ref(self, context, ...)

  if next(SMODS.find_card("j_abn_golden_apple")) and SMODS.is_eternal(self, { from_sell = true }) and self.area and self.area.config.type == 'joker' then
    return true
  end

  return ret
end

-- Remove use button from continent cards, weather cards or lexica cards where necessary
local use_and_sell_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
  local buttons = use_and_sell_ref(card)
  if card.ability and (card.ability.set == "ram" or card.ability.set == "continent" or card.ability.set == "weather_report" or card.ability.set == "lexica" or card.ability.set == "periodic") and not card.config.center.use and card.area == G.pack_cards and G.pack_cards then
    return {
      n = G.UIT.ROOT,
      config = { padding = 0, colour = G.C.CLEAR },
      nodes = {
        {
          n = G.UIT.R,
          config = { ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5 * card.T.w - 0.15, maxw = 0.9 * card.T.w - 0.15, minh = 0.3 * card.T.h, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'use_card', func = 'can_select_from_booster' },
          nodes = {
            { n = G.UIT.T, config = { text = localize('b_select'), colour = G.C.UI.TEXT_LIGHT, scale = 0.45, shadow = true } }
          }
        },
      }
    }
  end
  if card.ability and (card.ability.set == "continent" or card.ability.set == "weather_report" or card.ability.set == "lexica" or card.ability.set == "periodic") and not card.config.center.use then
    local sell = {
      n = G.UIT.ROOT,
      config = { padding = 0, colour = G.C.CLEAR },
      nodes = {
        {
          n = G.UIT.C,
          config = { padding = 0.15, align = 'cl' },
          nodes = {
            buttons.nodes[1].nodes[1]
          }
        },
      }
    }
    return sell
  end

  return buttons
end

-- Credits under card
local card_h_popup_ref = G.UIDEF.card_h_popup
function G.UIDEF.card_h_popup(card, ...)
  local ret = card_h_popup_ref(card, ...)
  if ABN.config.show_credits and card.config and card.config.center and card.config.center.abn_artist_credits then
    local credits = card.config.center.abn_artist_credits
    table.insert(ret.nodes[1].nodes[1].nodes, {
      n = G.UIT.R,
      config = { align = "cm", padding = 0.03 },
      nodes = {
        { n = G.UIT.T, config = { colour = G.C.UI.TEXT_DARK, scale = 0.3, text = "Art by " } },
        { n = G.UIT.T, config = { colour = credits.colour or G.C.UI.TEXT_DARK, scale = 0.3, text = credits.artist } }
      }
    })
  end
  return ret
end

-- Add info tooltip on Plagued Jokers
local generate_card_ui_ref = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
  local UI_table = generate_card_ui_ref(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start,
    main_end, card)

  if card and card.config and card.config.center and card.config.center.pools and card.config.center.pools["Plagued"] then
    generate_card_ui_ref({ key = "abn_plagued_joker_info", set = "Other" }, UI_table)
  end
  if card and card.ability and card.ability.set == "calligraphy" then
    generate_card_ui_ref({ key = "abn_calligraphy_info", set = "Other" }, UI_table)
  end
  if card and card.ability and card.ability.set == "crimson" then
    generate_card_ui_ref({ key = "abn_crimson_info", set = "Other" }, UI_table)
  end

  return UI_table
end

-- Save last used consumable for every set
local scu = set_consumeable_usage
function set_consumeable_usage(card)
  local ret = scu(card)
  if card.config.center.set then
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = function()
        G.E_MANAGER:add_event(Event({
          trigger = 'immediate',
          func = function()
            G.GAME.abn.last_consumable_used[card.config.center.set] = card.config.center.key
            return true
          end
        }))
        return true
      end
    }))
  end
  return ret
end

-- thx for Toga's Stuff
-- Allow cards to be saved from booster packs (for Sticky Fingers)
local cardselarearef = SMODS.card_select_area
function SMODS.card_select_area(card, pack)
  local sa, cau = cardselarearef(card, pack)
  if card and card.ability and card.ability.set and not sa then
    if (card.ability.set == 'Planet' or
          card.ability.set == 'Tarot' or
          card.ability.set == 'Spectral') and
        next(SMODS.find_card('j_abn_sticky_fingers')) then
      sa = "consumeables"; cau = true
    end
  end
  return sa, cau
end

-- Prevents dragging of jokers in a way that is guaranteed to persist
-- both between reloads, and when removing one source while another still exists
local original_game_update = Game.update
function Game:update(dt)
    original_game_update(self, dt)

    if G.STAGE ~= G.STAGES.RUN then return end
	
	if G.jokers and G.jokers.cards and (next(SMODS.find_card('j_abn_the_joker_dance')) or (not G.GAME.blind.disabled and G.GAME.blind.config.blind.key == "bl_abn_new_golden_nut")) then
		for _, j in ipairs(G.jokers.cards) do
			j.states.drag.can = false
		end
	end
end

--Custom context for dragging and releasing playing cards
local cardarea_order_cache = nil

local old_click_card = Controller.L_cursor_press
function Controller:L_cursor_press(x, y)
	old_click_card(self, x, y)
	if G.hand and G.hand.cards then
		cardarea_order_cache = {}
		for i, card in ipairs(G.hand.cards) do
			cardarea_order_cache[i] = card
		end
	end
end

local old_release_card = Controller.L_cursor_release
function Controller:L_cursor_release(x, y)
	old_release_card(self, x, y)
	if G.hand and G.hand.cards and cardarea_order_cache then
		for i, card in ipairs(G.hand.cards) do
			if cardarea_order_cache[i] ~= card then
				SMODS.calculate_context({
					abn_playing_cards_rearranged = true,
					old_order = cardarea_order_cache,
					new_order = G.hand.cards
				})
				break
			end
		end
	end
end

--Conditional boss replacements for Newestia Mode, Jimbo Stakes, or both at once.
local smods_get_old_blind = SMODS.get_new_blind
function SMODS.get_new_blind(blind_type)
	if blind_type == "boss" and ABN.is_hazard_ante() then
		return ABN.new_hazard_boss()
	else
		return smods_get_old_blind(blind_type)
	end
end

local old_reset_blind_choices = SMODS.reset_blind_choices
function SMODS.reset_blind_choices(choices)
	old_reset_blind_choices(choices)
	G.GAME.abn_newestia_original_blinds = G.GAME.abn_newestia_original_blinds or {}
	G.GAME.abn_newestia_current_blinds = G.GAME.abn_newestia_current_blinds or {}
	for _, k in ipairs(G.GAME.round_resets.blind_order) do
		if k == "Small" or k == "Big" then
			G.GAME.abn_newestia_original_blinds[k] = choices[k]
			G.GAME.abn_newestia_current_blinds[k] = "bl_abn_new_"..k:lower()
		elseif k == "Boss" then
			G.GAME.abn_newestia_original_blinds[k] = choices[k]
			G.GAME.abn_newestia_current_blinds[k] = ABN.new_newestia_boss()
		end
	end
	if G.GAME.abn_newestia then
		for _, k in ipairs(G.GAME.round_resets.blind_order) do
			choices[k] = G.GAME.abn_newestia_current_blinds[k] or choices[k]
		end
	end
end

local get_old_boss = get_new_boss
function get_new_boss()
	local boss = nil
	if G.GAME.abn_newestia then
		boss = ABN.new_newestia_boss()
		G.GAME.abn_newestia_current_blinds.Boss = boss
	else
		if ABN.is_hazard_ante() then
			boss = ABN.new_hazard_boss()
		else
			boss = get_old_boss()
		end
		G.GAME.abn_newestia_original_blinds.Boss = boss
	end
	return boss
end

--Prevent specific kinds of card modifications from scoring based on Newestia Hazard Blind
--Also see lovely/newestia_hazard_blinds.toml for some vanilla card modifiers that ignore these functions
local old_calculate_enhancement = Card.calculate_enhancement
function Card:calculate_enhancement(context)
	if G.GAME.blind.disabled or not G.GAME.blind.config.blind.abn_disable_enhancements then
		return old_calculate_enhancement(self, context)
	end
end

local old_calculate_edition = Card.calculate_edition
function Card:calculate_edition(context)
	if G.GAME.blind.disabled or not G.GAME.blind.config.blind.abn_disable_editions then
		return old_calculate_edition(self, context)
	end
end

local old_calculate_seal = Card.calculate_seal
function Card:calculate_seal(context)
	if G.GAME.blind.disabled or not G.GAME.blind.config.blind.abn_disable_seals then
		return old_calculate_seal(self, context)
	end
end

local old_calculate_sticker = Card.calculate_sticker
function Card:calculate_sticker(context, sticker)
	if G.GAME.blind.disabled or ((not G.GAME.blind.config.blind.abn_disable_stamps or not ABN_is_stamp(sticker)) and (not G.GAME.blind.config.blind.abn_disable_enhancements or not ABN.EnhStickers[sticker])) then
		return old_calculate_sticker(self, context, sticker)
	end
end

--Modify card bonuses depending on Newestia Boss
local old_card_chips = Card.get_chip_bonus
function Card:get_chip_bonus()
	local chips = old_card_chips(self)
	if not G.GAME.blind.disabled and G.GAME.blind.config.blind.abn_disable_enhancements then
		chips = chips - self.ability.bonus
	end
	local only_suit = G.GAME.blind.config.blind.abn_newestia_only_suit
	if only_suit and not G.GAME.blind.disabled then
		if self:is_suit(only_suit) then
			chips = chips * 2
		else 
			chips = 1
		end
	end
	return chips
end

local old_card_mult = Card.get_chip_mult
function Card:get_chip_mult()
	local mult = old_card_mult(self)
	if not G.GAME.blind.disabled and G.GAME.blind.config.blind.abn_disable_enhancements and self.ability.effect ~= "Lucky Card" then
		mult = mult - self.ability.mult
	end
	return mult
end

local other_bonuses = {
	chip_h_mult = "h_mult",
	chip_h_bonus = "h_chips",
	h_dollars = "h_dollars"
}

local other_bonuses_x = {
	chip_x_mult = "x_mult",
	chip_h_x_mult = "h_x_mult",
	chip_x_bonus = "x_chips",
	chip_h_x_bonus = "h_x_chips"
}

for f, v in pairs(other_bonuses) do
	local ref = Card["get_"..f]
	Card["get_"..f] = function(self)
		local r = ref(self)
		if not G.GAME.blind.disabled and G.GAME.blind.config.blind.abn_disable_enhancements then
			r = r - self.ability[v]
		end
		return r
	end
end

for f, v in pairs(other_bonuses_x) do
	local ref = Card["get_"..f]
	Card["get_"..f] = function(self)
		local r = ref(self)
		if not G.GAME.blind.disabled and G.GAME.blind.config.blind.abn_disable_enhancements then
			r = SMODS.multiplicative_stacking(r, -self.ability[v])
		end
		return r
	end
end

local old_generate_ui = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
	local only_suit = G.GAME and G.GAME.blind and G.GAME.blind.config and G.GAME.blind.config.blind and G.GAME.blind.config.blind.abn_newestia_only_suit
	if specific_vars and specific_vars.nominal_chips and only_suit and not G.GAME.blind.disabled then
		local new_vars = {}
		for k, var in pairs(specific_vars) do
			if k == "nominal_chips" then
				if card and card:is_suit(only_suit) then
					new_vars[k] = var * 2
				else
					new_vars[k] = 1
				end
			elseif k == "bonus_chips" then
				if card and card:is_suit(only_suit) then
					new_vars[k] = var * 2
				elseif _c.name == 'Stone Card' or _c.replace_base_card then
					new_vars[k] = 1
				else
					new_vars[k] = 0
				end
			else
				new_vars[k] = var
			end
		end
		specific_vars = new_vars
	end

	return old_generate_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
end
