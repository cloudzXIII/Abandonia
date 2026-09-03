-- huge thanks to All in Jest for the function :D // this may need some kind of checking since it doesnt work with dynatext stuff

local function ABN_retrieve_joker_text(joker, descip, name)
	local function get_text(main)
		local text = ""
		if type(main) == "string" then
			text = text .. main
			return text
		end
		for i = 1, #main do
			if type(main[i]) == "string" then
				text = text .. main[i]
			elseif main[i].config and main[i].config.text and type(main[i].config.text) == "string" then
				text = text .. main[i].config.text

			-- Parses any Dynatext objects
			elseif
				main[i].config
				and main[i].config.object
				and main[i].config.object.config
				and type(main[i].config.object.config) == "table"
				and main[i].config.object.config.string
			then
				local options = main[i].config.object.config.string
				local random_element = main[i].config.object.config.random_element
				local chosen_option = nil
				if random_element then
					chosen_option = options[pseudorandom("aij_retrieve_joker_text", 1, #options)]
				else
					chosen_option = options[math.floor(
						(G.TIMERS.REAL or pseudorandom("aij_retrieve_joker_text", 1, 60))
							* love.timer.getFPS()
							% #options
					) + 1]
				end
				if type(chosen_option) == "table" then
					text = text .. chosen_option.string or get_text(chosen_option)
				else
					text = text .. chosen_option
				end
			elseif type(main[i]) == "table" then
				-- Parses any text in XMult/XChip/similar blocks
				if main[i].nodes and type(main[i].nodes) == "table" then
					text = text .. " "
					text = text .. get_text(main[i].nodes)
				else
					text = text .. " "
					text = text .. get_text(main[i])
				end
			end
		end
		return text
	end
	local text = ""
	if name and descip and G.localization.descriptions["Joker"][joker.key or joker] then
		local main = G.localization.descriptions["Joker"][joker.key or joker].name
		text = text .. get_text(main)
		if text and type(text) == "string" then
			text = string.gsub(text, "{.-}", "")
		end
	elseif descip and G.localization.descriptions["Joker"][joker.key or joker] then
		local main = G.localization.descriptions["Joker"][joker.key or joker].text
		text = text .. get_text(main)
		if text and type(text) == "string" then
			text = string.gsub(text, "{.-}", "")
		end
	else
		if joker.generate_UIBox_ability_table then
			if not joker.ability_UIBox_table then -- Removing this check causes memory leaks
				-- Safely resolve center object across standard and modified cards
				local center = (joker.config and joker.config.center) or joker.center
				if center then
					local other_vars, _, _ = joker:generate_UIBox_ability_table(true)
					joker.ability_UIBox_table = generate_card_ui(center, nil, other_vars)
					text = ABN_retrieve_joker_text(joker)
				end
			end
			if joker.ability_UIBox_table then
				local main = joker.ability_UIBox_table.main
				if main then
					text = text .. get_text(main)
				end
				local multi_box = joker.ability_UIBox_table.multi_box
				if multi_box then
					text = text .. " "
					text = text .. get_text(multi_box)
				end
			end
		end
	end
	return text
end

SMODS.Joker({
	key = "pearls_of_worlds",
	config = {
		extra = {
			chips = 0,
		},
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chips,
			},
		}
	end,

	rarity = 2,
	atlas = "ABNJokerSheet14",
	pos = { x = 6, y = 4 },
	cost = 6,
	discovered = false,
	blueprint_compat = true,

	calculate = function(self, card, context)
		if
			context.post_trigger
			and context.other_card
			and context.other_card ~= card
			and context.other_card.config
			and context.other_card.config.center
			and context.other_card.config.center.key ~= "j_abn_pearls_of_worlds"
			and not context.blueprint
		then
			local scale = {
				chip_gain = 0,
			}
			local text = ABN_retrieve_joker_text(context.other_card)
			local number_regex = "%d+"
			for num in string.gmatch(text, number_regex) do
				scale.chip_gain = scale.chip_gain + tonumber(num)
			end
			if scale.chip_gain > 0 then
				SMODS.scale_card(card, {
					ref_table = card.ability.extra,
					ref_value = "chips",
					scalar_table = scale,
					scalar_value = "chip_gain",
					message_colour = G.C.CHIPS,
				})
			end
		end
		if context.joker_main then
			return {
				chips = card.ability.extra.chips,
			}
		end
	end,
	abn_artist_credits = {
		artist = "Sustato",
	},
})