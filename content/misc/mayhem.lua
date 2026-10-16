loc_colour()
G.C.ABN_MAYHEM = HEX("7fffd4")
G.ARGS.LOC_COLOURS["abn_mayhem"] = G.C.ABN_MAYHEM
G.C.ABN_MAYHEM_DARK = HEX("5bd7ad")
G.ARGS.LOC_COLOURS["abn_mayhem_dark"] = G.C.ABN_MAYHEM_DARK

function ABN.mayhem(num, delay)
	if not G.GAME then return 0 end
	G.GAME.abn_mayhem = G.GAME.abn_mayhem or 0
	if num and ((G.GAME.abn_mayhem == 0 and num < 0) or (G.GAME.abn_mayhem == G.GAME.abn_max_mayhem and num > 0)) then return G.GAME.abn_mayhem end
	if delay then
		G.E_MANAGER:add_event(Event({
			func = function()
				ABN.mayhem(num)
				return true
			end
		}))
		return
	end
	if num then
		G.GAME.abn_mayhem = G.GAME.abn_mayhem + num
		G.GAME.abn_mayhem = math.max(0, math.min(G.GAME.abn_mayhem, ABN.max_mayhem()))
		local mayhem_ui = G.HUD:get_UIE_by_ID("abn_mayhem_display_current")
		mayhem_ui.config.object:update()
		G.HUD:recalculate()
		attention_text({
			text = num > 0 and "+"..num or tostring(num),
			scale = 0.8,
			hold = 0.7,
			cover = mayhem_ui.parent,
			cover_colour = G.C.ABN_MAYHEM,
			align = 'cm',
		})
	end
	return G.GAME.abn_mayhem
end

function ABN.max_mayhem(num, delay)
	if not G.GAME then return 100 end
	G.GAME.abn_max_mayhem = G.GAME.abn_max_mayhem or 100
	if delay then
		G.E_MANAGER:add_event(Event({
			func = function()
				ABN.max_mayhem(num)
				return true
			end
		}))
		return
	end
	if num then
		G.GAME.abn_max_mayhem = G.GAME.abn_max_mayhem + num
		G.GAME.abn_max_mayhem = math.max(1, G.GAME.abn_max_mayhem)
		local mayhem_ui = G.HUD:get_UIE_by_ID("abn_mayhem_display_max")
		mayhem_ui.config.object:update()
		G.HUD:recalculate()
		attention_text({
			text = num > 0 and "+"..num or tostring(num),
			scale = 0.8,
			hold = 0.7,
			cover = mayhem_ui.parent,
			cover_colour = G.C.ABN_MAYHEM,
			align = 'cm',
		})
	end
	return G.GAME.abn_max_mayhem
end

function ABN.calculate_mayhem(self, context)
	if context.individual and context.cardarea == G.play and not context.other_card.debuff then
		if not SMODS.has_no_suit(context.other_card) then
			if context.other_card.base.suit == "abn_megido" then
				ABN.mayhem(0.2, true)
			elseif context.other_card.base.suit == "abn_musica" then
				ABN.mayhem(-0.1, true)
			elseif G.GAME.modifiers.Honor then
				if ABN.is_modded_suit(context.other_card) then
					ABN.mayhem(0.1, true)
				else
					ABN.mayhem(-0.05, true)
				end
			end
		end
	end
	if G.GAME.modifiers.Honor then
		if context.individual and context.cardarea == G.play and not context.other_card.debuff then
			if next(SMODS.get_enhancements(context.other_card)) then
				ABN.mayhem(0.5, true)
			end
			if context.other_card.edition then
				ABN.mayhem(1, true)
			end
			if context.other_card.seal then
				ABN.mayhem(0.25, true)
			end
		elseif context.playing_card_added or context.remove_playing_cards then
			local mayhem = 0.1 * #(context.cards or context.removed)
			local unique_suits = 0
			local unique_suit_dict = {}
			local context_cards = {}
			for _, card in ipairs(context.cards or context.removed) do
				context_cards[card] = true
				if not SMODS.has_no_suit(card) and not unique_suit_dict[card.base.suit] then
					unique_suit_dict[card.base.suit] = true
					unique_suits = unique_suits + 1
				end
			end
			if unique_suits > 0 then
				for _, card in ipairs(G.playing_cards) do
					if not context_cards[card] and not SMODS.has_no_suit(card) and unique_suit_dict[card.base.suit] then
						unique_suit_dict[card.base.suit] = false
						unique_suits = unique_suits - 1
						if unique_suits <= 0 then break end
					end
				end
			end
			mayhem = mayhem + 0.25 * unique_suits
			ABN.mayhem(context.playing_card_added and mayhem or -mayhem, true)
		end
	end
end

local create_UIBox_ref = create_UIBox_HUD
function create_UIBox_HUD()
	ABN.mayhem()
	ABN.max_mayhem()
	local scale = 0.4
	local t = create_UIBox_ref()
	ABN.iterate_edit_ui(t, function(node)
		if node.config and node.config.id == "button_area" then
			local minh = 1.75 * #node.nodes / (#node.nodes+1)
			for _, n in ipairs(node.nodes) do
				n.config.minh = minh
			end
			table.insert(node.nodes, {n=G.UIT.R, config={id = "abn_mayhem_display", align = "cm", minh = minh, minw = 1.5, padding = 0.05, r = 0.1, colour = G.C.ABN_MAYHEM}, nodes={
					{n=G.UIT.R, config={align = "cm", r = 0.1, minw = 1.4, minh = minh * 0.9, colour = G.C.DYN_UI.BOSS_DARK }, nodes = {
						{n=G.UIT.R, config={align = "cm", padding = 0, maxw = 1.4}, nodes={
							{n=G.UIT.T, config={text = "Mayhem", scale = scale, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
						}},
						{n=G.UIT.R, config={align = "cm", padding = 0, maxw = 1.4}, nodes={
							{n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'abn_mayhem'}}, font = G.LANGUAGES['en-us'].font, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, rotate = true, scale = scale}), id = 'abn_mayhem_display_current'}},
							{n=G.UIT.T, config={text = " / ", scale = scale, colour = G.C.UI.TEXT_LIGHT, shadow = true, focus_args = {orientation = 'bm'}}},
							{n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'abn_max_mayhem'}}, font = G.LANGUAGES['en-us'].font, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, rotate = true, scale = scale}), id = 'abn_mayhem_display_max'}},
						}}
					}}
				}
			})
			return true
		end
	end)
	return t
end
--[[
function G.FUNCS.abn_update_mayhem_display(e)
	e.config.text = ABN.mayhem().." / "..ABN.max_mayhem()
end--]]

local card_init_ref = Card.init
function Card:init(X, Y, W, H, card, center, params)
	card_init_ref(self, X, Y, W, H, card, center, params)
	local mayhem = ABN.mayhem() / ABN.max_mayhem()
	if mayhem >= 0.03 then
		Spectrallib.manipulate(self, {
			type = "X",
			min = 1 - mayhem/2,
			max = 1 + mayhem,
			seed = "abn_mayhem",
		})
	end
end
