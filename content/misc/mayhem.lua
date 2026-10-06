function ABN.mayhem(num)
	if not G.GAME then return 0 end
	G.GAME.abn_mayhem = G.GAME.abn_mayhem or 0
	if num then
		G.GAME.abn_mayhem = G.GAME.abn_mayhem + num
		G.GAME.abn_mayhem = math.max(0, math.min(G.GAME.abn_mayhem, ABN.max_mayhem()))
	end
	return G.GAME.abn_mayhem
end

function ABN.max_mayhem(num)
	if not G.GAME then return 100 end
	G.GAME.abn_max_mayhem = G.GAME.abn_max_mayhem or 100
	if num then
		G.GAME.abn_max_mayhem = G.GAME.abn_max_mayhem + num
		G.GAME.abn_max_mayhem = math.max(0, G.GAME.abn_max_mayhem)
	end
	return G.GAME.abn_max_mayhem
end

function ABN.calculate_mayhem(self, context)
	if context.individual and context.cardarea == G.play then
		if not SMODS.has_no_suit(context.other_card) then
			-- If imported, 'Void' suit gives +0.2 and 'Lantern' gives -0.1
			if ABN.is_modded_suit(context.other_card) then
				ABN.mayhem(0.1)
			else
				ABN.mayhem(-0.05)
			end
		end
		if next(SMODS.get_enhancements(context.other_card)) then
			ABN.mayhem(0.5)
		end
		if context.other_card.edition then
			ABN.mayhem(1)
		end
		if context.other_card.seal then
			ABN.mayhem(0.25)
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
		ABN.mayhem(context.playing_card_added and mayhem or -mayhem)
	end
end

local create_UIBox_ref = create_UIBox_HUD
function create_UIBox_HUD()
	local scale = 0.4
	local t = create_UIBox_ref()
	ABN.iterate_edit_ui(t, function(node)
		if node.config and node.config.id == "button_area" then
			local minh = 1.75 * #node.nodes / (#node.nodes+1)
			for _, n in ipairs(node.nodes) do
				n.config.minh = minh
			end
			table.insert(node.nodes, {n=G.UIT.R, config={id = "abn_madness_display", align = "cm", minh = minh, minw = 1.5,padding = 0.05, r = 0.1, colour = G.C.BLACK, shadow = true}, nodes={
					{n=G.UIT.R, config={align = "cm", padding = 0, maxw = 1.4}, nodes={
						{n=G.UIT.T, config={text = "Madness", scale = 1.2*scale, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
					}},
					{n=G.UIT.R, config={align = "cm", padding = 0, maxw = 1.4}, nodes={
						{n=G.UIT.T, config={text = ABN.mayhem().." / "..ABN.max_mayhem(), scale = 1*scale, colour = G.C.UI.TEXT_LIGHT, shadow = true, focus_args = {orientation = 'bm'}, func = "abn_update_madness_display"}}
					}}
				}
			})
			return true
		end
	end)
	return t
end

function G.FUNCS.abn_update_madness_display(e)
	e.config.text = ABN.mayhem().." / "..ABN.max_mayhem()
end
