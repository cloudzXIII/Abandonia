-- Bio Blueprint (code by Noodlemire)

local function get_number_rank(card)
	local id = card.base and card.base.value
	if type(id) == "number" then
		return id >= 2 and id <= 10 and id or "outofrange"
	elseif type(id) == "string" then
		local subid = id
		local mod = SMODS.Ranks[id].original_mod
		if mod then
			subid = string.sub(id, string.len(mod.prefix)+2, string.len(id))
		end
		if string.match(subid, "^%d+$") then
			return tonumber(subid)
		else
			return "outofrange"
		end
	else
		return false
	end
end

SMODS.Joker{
	key = "bio_blueprint",
	atlas = "ABNJokerSheet18",
	rarity = 3,
	cost = 8,
	pos = {x = 8, y = 4},
	soul_pos = {x = 9, y = 4},
	blueprint_compat = true,
	config = {extra = {mult = 1, chips = 2, played_while_stored = {}}},
	loc_vars = function(self, info_queue, joker)
		for i = 1, #G.consumeables.cards do
			local card = G.consumeables.cards[i]
			local rank = get_number_rank(card)
			if card.playing_card then
				local stored = joker.ability.extra.played_while_stored[rank] or 0
				if SMODS.has_no_rank(card) or not rank then
					info_queue[#info_queue + 1] = {key = "abn_bio_blueprint_incompatible_norank", set = "Other"}
				elseif rank == "outofrange" then
					info_queue[#info_queue + 1] = {key = "abn_bio_blueprint_incompatible_rank", set = "Other", vars = {card.base.value}}
				else
					local info = nil
					if rank % 2 == 0 then
						info = {key = "abn_bio_blueprint_even", set = "Other", vars = {rank, localize(card.base.suit, "suits_plural"), joker.ability.extra.mult, stored}}
					else
						info = {key = "abn_bio_blueprint_odd", set = "Other", vars = {rank, localize(card.base.suit, "suits_plural"), joker.ability.extra.chips, stored}}
					end
					if card.edition then
						info.key = info.key.."_edi"
						info.vars[#info.vars+1] = localize({type = "name_text", set = "Edition", key = card.edition.key})
						info.vars[#info.vars+1] = joker.ability.extra.mult * 2
						info.vars[#info.vars+1] = joker.ability.extra.played_while_stored[card.edition.key..rank] or 0
					end
					if next(SMODS.get_enhancements(card)) then
						local enh_name = localize({type = "name_text", set = "Enhanced", key = card.config.center.key})
						if string.sub(enh_name, string.len(enh_name)-4, string.len(enh_name)) == " Card" then
							enh_name = string.sub(enh_name, 1, string.len(enh_name)-5)
						end
						info.key = info.key.."_enh"
						info.vars[#info.vars+1] = enh_name
						info.vars[#info.vars+1] = joker.ability.extra.chips * 2
						info.vars[#info.vars+1] = joker.ability.extra.played_while_stored[card.config.center.key..rank] or 0
					end
					info_queue[#info_queue + 1] = info
				end
			end
		end
		return {vars = {joker.ability.extra.mult, joker.ability.extra.chips}}
	end,
	calculate = function(self, joker, context)
		if context.individual and context.cardarea == G.play then
			local rank = get_number_rank(context.other_card)
			local edi = context.other_card.edition and context.other_card.edition.key
			local enh = next(SMODS.get_enhancements(context.other_card)) and context.other_card.config.center.key
			if SMODS.has_no_rank(context.other_card) or not rank or rank == "outofrange" then return end
			local already = {}
			for i = 1, #G.consumeables.cards do
				local card = G.consumeables.cards[i]
				local match_rank = not SMODS.has_no_rank(card) and rank == get_number_rank(card)
				local match_edi = edi and card.edition and edi == card.edition.key
				local match_enh = enh and SMODS.has_enhancement(card, enh)
				if match_rank then
					if not context.blueprint then
						if not already[rank] then
							joker.ability.extra.played_while_stored[rank] = (joker.ability.extra.played_while_stored[rank] or 0) + 1
							already[rank] = true
						end
						if match_edi and not already[edi..rank] then
							joker.ability.extra.played_while_stored[edi..rank] = (joker.ability.extra.played_while_stored[edi..rank] or 0) + 1
							already[edi..rank] = true
						end
						if match_enh and not already[enh..rank] then
							joker.ability.extra.played_while_stored[enh..rank] = (joker.ability.extra.played_while_stored[enh..rank] or 0) + 1
							already[enh..rank] = true
						end
					end
					if rank % 2 == 0 then
						SMODS.calculate_effect({mult = joker.ability.extra.mult}, context.other_card)
					else
						SMODS.calculate_effect({chips = joker.ability.extra.chips}, context.other_card)
					end
					G.E_MANAGER:add_event(Event({
						func = function()
							joker:juice_up()
							card:juice_up()
							return true
						end
					}))
					if match_edi then
						SMODS.calculate_effect({mult = joker.ability.extra.mult*2}, context.other_card)
						G.E_MANAGER:add_event(Event({
							func = function()
								joker:juice_up()
								card:juice_up()
								return true
							end
						}))
					end
					if match_enh then
						SMODS.calculate_effect({chips = joker.ability.extra.chips*2}, context.other_card)
						G.E_MANAGER:add_event(Event({
							func = function()
								joker:juice_up()
								card:juice_up()
								return true
							end
						}))
					end
				end
			end
		elseif context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			for i = 1, #G.consumeables.cards do
				local card = G.consumeables.cards[i]
				local rank = get_number_rank(card)
				local edi = card.edition and card.edition.key or "nil"
				local enh = next(SMODS.get_enhancements(card)) and card.config.center.key or "nil"
				if not SMODS.has_no_rank(card) and rank and rank ~= "outofrange" then
					local anything = false
					if (joker.ability.extra.played_while_stored[rank] or 0) >= rank then
						anything = true
						if rank % 2 == 0 then
							joker.ability.extra.mult = joker.ability.extra.mult * 2
						else
							joker.ability.extra.chips = joker.ability.extra.chips * 2
						end
					end
					if (joker.ability.extra.played_while_stored[edi..rank] or 0) >= rank then
						anything = true
						joker.ability.extra.mult = joker.ability.extra.mult * 2
					end
					if (joker.ability.extra.played_while_stored[enh..rank] or 0) >= rank then
						anything = true
						joker.ability.extra.chips = joker.ability.extra.chips * 2
					end
					if anything then
						SMODS.calculate_effect({message = localize("k_upgrade_ex")}, joker)
						G.E_MANAGER:add_event(Event({
							func = function()
								card:juice_up()
								return true
							end
						}))
					end
				end
			end
			for k, v in pairs(joker.ability.extra.played_while_stored) do
				joker.ability.extra.played_while_stored[k] = 0
			end
		end
	end,
	remove_from_deck = function(self, joker, from_debuff)
		if #SMODS.find_card("j_abn_bio_blueprint") <= 0 then
			for i = 1, #G.consumeables.cards do
				local card = G.consumeables.cards[i]
				if card.playing_card then
					G.E_MANAGER:add_event(Event({
						func = function()
							card.area:remove_card(card)
							if G.GAME.blind and G.GAME.blind.in_blind then
								G.hand:emplace(card)
							else
								G.deck:emplace(card)
							end
							return true
						end
					}))
				end
			end
			for i = 1, #G.hand.cards do
				local card = G.hand.cards[i]
				if card.children.abn_bio_blueprinter_store then
					card.children.abn_bio_blueprinter_store:remove()
					card.children.abn_bio_blueprinter_store = nil
				end
			end
		end
	end,
	abn_artist_credits = {
		artist = "Creechie"
	},
}

local function bio_store_button(card)
	return UIBox {
		definition = {
			n = G.UIT.ROOT,
			config = {
				colour = G.C.CLEAR
			},
			nodes = {
				{
					n = G.UIT.C,
					config = {
						align = 'cm',
						padding = 0.15,
						r = 0.08,
						hover = true,
						shadow = true,
						colour = G.C.GREEN,
						button = 'abn_bio_blueprinter_store',
						func = 'abn_bio_blueprinter_can_press',
						ref_table = card,
					},
					nodes = {
						{
							n = G.UIT.R,
							nodes = {
								{
									n = G.UIT.T,
										config = {
										text = card.area == G.hand and "Store" or "Retrieve",
										colour = G.C.UI.TEXT_LIGHT,
										scale = 0.4,
									}
								},
								{
									n = G.UIT.B,
									config = {
										w = 0.1,
										h = 0.4
									}
								}
							}
						}
					}
				}
			}
		},
		config = {
			align = 'cl', -- position relative to the card, meaning "center left". Follow the SMODS UI guide for more alignment options
			major = card,
			parent = card,
			offset = { x = 0.2, y = 0 } -- depends on the alignment you want, without an offset the button will look as if floating next to the card, instead of behind it
		}
	}
end

G.FUNCS.abn_bio_blueprinter_can_press = function(e)
	local card = e.config.ref_table

	if card.area == G.consumeables or #G.consumeables.cards < G.consumeables.config.card_limit then
		e.config.button = "abn_bio_blueprinter_store"
		e.config.colour = G.C.GREEN
	else
		e.config.button = nil
		e.config.colour = G.C.UI.BACKGROUND_INACTIVE
	end
end

G.FUNCS.abn_bio_blueprinter_store = function(e)
	local card = e.config.ref_table
	if card.area == G.hand then
		card.area:remove_card(card)
		G.consumeables:emplace(card)
	else
		card.area:remove_card(card)
		if G.GAME.blind and G.GAME.blind.in_blind then
			G.hand:emplace(card)
		else
			G.deck:emplace(card)
		end
	end
end

SMODS.DrawStep {
	key = 'my_button',
	order = -30, -- before the Card is drawn
	func = function(card, layer)
		if card.children.abn_bio_blueprinter_store then
			card.children.abn_bio_blueprinter_store:draw()
		end
	end
}
SMODS.draw_ignore_keys.abn_bio_blueprinter_store = true

local old_card_highlight = Card.highlight
function Card.highlight(self, is_highlighted)
	if is_highlighted and (self.area == G.hand or self.area == G.consumeables) and self.playing_card and #SMODS.find_card("j_abn_bio_blueprint") > 0 then
		self.children.abn_bio_blueprinter_store = bio_store_button(self)
	elseif self.children.abn_bio_blueprinter_store then
		self.children.abn_bio_blueprinter_store:remove()
		self.children.abn_bio_blueprinter_store = nil
	end

	return old_card_highlight(self, is_highlighted)
end
