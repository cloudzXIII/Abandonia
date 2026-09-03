-- Khonsu Joker (code by Noodlemire)
SMODS.Joker{
	key = "khonsu_joker",
	atlas = "ABNJokerSheet16",
	rarity = 3,
	cost = 8,
	pos = {x = 4, y = 5},
	blueprint_compat = false,
	config = {extra = {hand = "Pair",}},
	loc_vars = function(self, info_queue, joker)
		info_queue[#info_queue + 1] = {key = "abn_light_suit", set = "Other"}
		if not joker.edition or joker.edition.key ~= "e_abn_bright" then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_bright
		end
		info_queue[#info_queue + 1] = {key = "abn_dark_suit", set = "Other"}
		if not joker.edition or joker.edition.key ~= "e_abn_opaque" then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_opaque
		end
	end,
	calculate = function(self, joker, context)
		if context.blueprint then return end
        if context.first_hand_drawn then
            juice_card_until(joker, function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end, true)
        elseif context.before and G.GAME.current_round.hands_played == 0 and context.scoring_name == "Pair" then
			local any, light, dark, wilds = false, 0, 0, 0
			for k, card in ipairs(context.scoring_hand) do
				if not card.debuff then
					if SMODS.has_any_suit(card) then
						wilds = wilds + 1
					elseif light == 0 and ABN.is_light(card) then
						light = 1
					elseif dark == 0 and ABN.is_dark(card) then
						dark = 1
					end
					if light + dark + wilds >= 2 then break end
				end
			end
			if light + dark + wilds >= 2 then
				for k, card in ipairs(context.scoring_hand) do
					if not card.debuff and not card.edition then
						any = true
						if (not SMODS.has_any_suit(card) and ABN.is_light(card)) or (SMODS.has_any_suit(card) and pseudorandom("j_abn_khonsu_joker")) then
							card:set_edition("e_abn_bright", true)
						else
							card:set_edition("e_abn_opaque", true)
						end
						G.E_MANAGER:add_event(Event({
							func = function()
								card:juice_up()
								return true
							end
						}))
					end
				end
			end
			if any then
				return {
					message = localize('k_upgrade_ex')
				}
			end
		elseif context.individual and context.cardarea == G.play and joker.edition then
			local mult = nil
			if (joker.edition.key == "e_abn_bright" and ABN.is_light(context.other_card)) or (joker.edition.key == "e_abn_opaque" and ABN.is_dark(context.other_card)) then
				mult = context.other_card.base.nominal
			end
			if mult then
				return {mult = 2 * mult}
			end
		end
	end,
	abn_artist_credits = {
		artist = "Nice Cream"
	},
}
