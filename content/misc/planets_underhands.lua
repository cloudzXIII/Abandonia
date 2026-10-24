ABN.underhand_planets = {
	tira = {underhand = "instefication", pos = {x = 3, y = 7}, artist = "La Ginger"},
	darwin = {underhand = "circumnavigation", pos = {x = 4, y = 7}, artist = "La Ginger"},
	serina = {underhand = "augmentation", pos = {x = 5, y = 7}, artist = "La Ginger"},
}

function ABN.level_up_underhand(underhand, card, amount, instant)
	amount = amount or 1
	instant = instant or false
	local uh = G.GAME.abn_underhands[underhand]
	local uh_def = Abandonia.Underhands[underhand]
	if not uh then return end

	local old_level = uh.level
	uh.level = math.max(0, uh.level + amount)
	if not instant then
		update_hand_text(
			{sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3},
			{handname = uh_def.name, chips = uh_def.x_chips + old_level * uh_def.l_chips, mult = uh_def.x_mult + old_level * uh_def.l_mult, level = old_level}
		)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.2,
			func = function()
				play_sound("tarot1")
				if card then card:juice_up(0.8, 0.5) end
				G.TAROT_INTERRUPT_PULSE = true
				return true
			end
		}))
		update_hand_text({delay = 0}, {mult = uh_def.x_mult + uh.level * uh_def.l_mult, StatusText = true})
		G.E_MANAGER:add_event(Event({
		trigger = "after",
			delay = 0.9,
				func = function()
				play_sound("tarot1")
				if card then card:juice_up(0.8, 0.5) end
				return true
			end
		}))
		update_hand_text({delay = 0}, {chips = uh_def.x_chips + uh.level * uh_def.l_chips, StatusText = true})
		G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0.9,
			func = function()
				play_sound("tarot1")
				if card then card:juice_up(0.8, 0.5) end
				G.TAROT_INTERRUPT_PULSE = nil
				return true
			end
		}))
		update_hand_text({sound = "button", volume = 0.7, pitch = 0.9, delay = 0}, {level = uh.level})
		delay(1.3)
		update_hand_text(
			{sound = "button", volume = 0.7, pitch = 1.1, delay = 0},
			{mult = 0, chips = 0, handname = "", level = ""}
		)
	end
end

for key, def in pairs(ABN.underhand_planets) do
	def.underhand = "abn_uh_"..def.underhand
	SMODS.Consumable {
		attributes = {"underhand_planet"},
		key = key,
		set = "Planet",
		cost = 4,
		atlas = "AbandoniaPlanets",
		pos = def.pos,
		config = {underhand = def.underhand},
		loc_vars = function(self, info_queue, card)
			return {
				vars = {
					G.GAME.abn_underhands[def.underhand] and G.GAME.abn_underhands[def.underhand].level or 1,
					Abandonia.Underhands[def.underhand].name,
					Abandonia.Underhands[def.underhand].l_mult,
					Abandonia.Underhands[def.underhand].l_chips,
					colours = {((G.GAME.abn_underhands[key] or {level = 1}).level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.abn_underhands[key].level)])}
				}
			}
		end,
		can_use = function(self, card)
			return true
		end,
		use = function(self, card, area, copier)
			ABN.level_up_underhand(def.underhand, card)
		end,
		in_pool = function(self, args)
			return G.GAME.abn_underhands_unlocked
		end,
		set_card_type_badge = function(self, card, badges)
			badges[#badges + 1] = create_badge(localize("k_abn_underhand_planet"),
				get_type_colour(card.config.center or card.config, card),
				SMODS.ConsumableTypes.Planet.text_colour, 1.2)
		end,
		abn_artist_credits = {
			artist = def.artist
		},
	}
end

local function create_uh_row(underhand)
	local uh_def = Abandonia.Underhands[underhand]
	local level = G.GAME.abn_underhands[underhand].level-- and G.GAME.abn_underhands[underhand].level or 1
	local level_col = level == 1 and G.C.UI.TEXT_LIGHT or G.C.HAND_LEVELS[math.min(7, level)]

	return {
		n = G.UIT.R,
		config = {align = "cm", padding = 0.05, r = 0.1, colour = darken(G.C.JOKER_GREY, 0.1), emboss = 0.05, hover = true, force_focus = true},
		nodes = {
			{
				n = G.UIT.C,
				config = {align = "cl", padding = 0, minw = 5},
				nodes = {
					{
						n = G.UIT.C,
						config = {align = "cm", padding = 0.01, r = 0.1, colour = level_col, minw = 1.5, outline = 0.8, outline_colour = G.C.WHITE},
						nodes = {
							{n = G.UIT.T, config = {text = localize('k_level_prefix') .. level, scale = 0.5, colour = G.C.UI.TEXT_DARK}}
						}
					},
					{
						n = G.UIT.C,
						config = {align = "cm", minw = 4.5, maxw = 4.5},
						nodes = {
							{n = G.UIT.T, config = {text = uh_def.name, scale = 0.45, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
						}
					},
				}
			},
			{
				n = G.UIT.C,
				config = {align = "cm", padding = 0.05, colour = G.C.BLACK, r = 0.1},
				nodes = {
					{
						n = G.UIT.C,
						config = {align = "cr", padding = 0.01, r = 0.1, colour = G.C.CHIPS, minw = 1.1},
						nodes = {
							{n = G.UIT.T, config = {text = number_format(uh_def.x_chips + uh_def.l_chips * level, 1000000), scale = 0.45, colour = G.C.UI.TEXT_LIGHT}},
							{n = G.UIT.B, config = {w = 0.08, h = 0.01}},
						}
					},
					{n = G.UIT.T, config = {text = "X", scale = 0.45, colour = G.C.MULT}},
					{
						n = G.UIT.C,
						config = {align = "cl", padding = 0.01, r = 0.1, colour = G.C.MULT, minw = 1.1},
						nodes = {
							{n = G.UIT.B, config = {w = 0.08, h = 0.01}},
							{n = G.UIT.T, config = {text = number_format(uh_def.x_mult + uh_def.l_mult * level, 1000000), scale = 0.45, colour = G.C.UI.TEXT_LIGHT}},
						}
					},
				}
			},
			--[[{
				n = G.UIT.C,
				config = {align = "cm"},
				nodes = {
					{n = G.UIT.T, config = {text = '	#', scale = 0.45, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
				}
			},
			{
				n = G.UIT.C,
				config = {align = "cm", padding = 0.05, colour = G.C.L_BLACK, r = 0.1, minw = 0.9},
				nodes = {
					{
						n = G.UIT.O,
						config = {
							object = DynaText({
								string = {tostring(count)},
								maxw = 0.9,
								scale = 0.45,
								colours = {G.C.FILTER},
								shadow = true,
							})
						}
					}
				}
			},]]
		}
	}
end

function create_UIBox_current_underhand_levels()
	local rows = {}

	for uh in pairs(Abandonia.Underhands) do
		local row = create_uh_row(uh)
		if row then
			rows[#rows + 1] = row
		end
	end

	return {
		n = G.UIT.ROOT,
		config = {align = "cm", minw = 3, padding = 0.1, r = 0.1, colour = G.C.CLEAR},
		nodes = {
			{n = G.UIT.R, config = {align = "cm", padding = 0.04}, nodes = rows}
		}
	}
end

local ref_tabs = create_tabs
function create_tabs(args)
	if args and args.tabs then
		for i = 1, #args.tabs do
			if not args.tabs[i] == "abn_underhands_locked" then
				table.remove(args.tabs, i)
				break
			end
		end
	end

	return ref_tabs(args)
end
