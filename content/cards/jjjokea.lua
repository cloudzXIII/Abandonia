-- J.J.Jokea (code by Noodlemire)

SMODS.Joker{
	key = "jjjokea",
	atlas = "ABNJokerSheet8",
	rarity = 3,
	cost = 8,
	pos = {x = 6, y = 3},
	blueprint_compat = false,
	config = {extra = {hand1 = "Pair", hand2 = "Two Pair", hand3 = "Four of a Kind"}},
	loc_vars = function(self, info_queue, joker)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_plank
		if not joker.edition or joker.edition.key ~= "e_abn_chromatic" then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chromatic
		end
		info_queue[#info_queue + 1] = G.P_SEALS.Red
		local colours = {}
		for i = 0, 2 do
			table.insert(colours, G.GAME.current_round.hands_played == i and G.C.GREEN or G.C.UI.TEXT_DARK)
		end
		return {vars = {joker.ability.extra.hand1, joker.ability.extra.hand2, joker.ability.extra.hand3, colours = colours}}
	end,
	calculate = function(self, joker, context)
		if context.blueprint then return end
		if context.first_hand_drawn then
			juice_card_until(joker, function() return G.GAME.current_round.hands_played <= 2 and not G.RESET_JIGGLES end, true)
		elseif context.before and context.scoring_name == joker.ability.extra["hand"..(G.GAME.current_round.hands_played+1)] then
			if G.GAME.current_round.hands_played == 0 then
				local template = context.scoring_hand[#context.scoring_hand]
				local any = false
				for i = 1, #context.scoring_hand - 1 do
					local other = context.scoring_hand[i]
					if template.config.center then
						other:set_ability(template.config.center.key)
						any = true
					end
					if template.edition then
						other:set_edition(template.edition.key, true)
						any = true
					end
					if template.seal then
						other:set_seal(template.seal, nil, true)
						any = true
					end
				end
				if any then
					return {message = localize("k_duplicated_ex")}
				end
			elseif G.GAME.current_round.hands_played == 1 then
				for _, card in ipairs(context.scoring_hand) do
					abn_add_stamp(card)
				end
				return {message = localize("k_upgrade_ex")}
			else
				for _, card in ipairs(context.scoring_hand) do
					card:set_ability("m_abn_plank")
					card:set_edition("e_abn_chromatic", true)
					card:set_seal("Red", nil, true)
				end
				return {message = localize("k_upgrade_ex")}
			end
		end
	end,
	abn_artist_credits = {
		artist = "Gud"
	},
}
