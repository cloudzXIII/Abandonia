-- Amateur Artist (code by Noodlemire)

SMODS.Joker{
	key = "amateur_artist",
	atlas = "ABNJokerSheet22",
	rarity = 2,
	cost = 6,
	pos = {x = 3, y = 2},
	blueprint_compat = true,
	loc_vars = function(self, info_queue, joker)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_kinship
	end,
	calculate = function(self, joker, context)
		if context.before then
			local one_kinship = false
			local all_kinship = true
			for _, card in ipairs(context.scoring_hand) do
				if SMODS.has_enhancement(card, "m_abn_kinship") then
					if not one_kinship then
						local card_copied = SMODS.copy_card(card, {area = G.hand})
						card_copied.states.visible = nil
						G.E_MANAGER:add_event(Event({
							func = function()
								card_copied:start_materialize()
								return true
							end
						}))
						SMODS.calculate_effect({
							message = localize("k_copied_ex"),
							colour = G.C.CHIPS,
							func = function() -- This is for timing purposes, it runs after the message
								G.E_MANAGER:add_event(Event({
									func = function()
										SMODS.calculate_context({playing_card_added = true, cards = {card_copied}})
										return true
									end
								}))
							end
						}, joker)
						one_kinship = true
					end
				else
					all_kinship = false
				end
			end
			if all_kinship and context.scoring_name ~= "High Card" and #G.deck.cards > 0 then
				for _, card in ipairs(context.scoring_hand) do
					SMODS.copy_card(card, {new_card = G.deck.cards[pseudorandom("j_abn_amateur_artist", 1, #G.deck.cards)]})
				end
				SMODS.calculate_effect({message = localize({type = "variable", key = "k_abn_more_copies", vars = {#context.scoring_hand}})}, joker)
			end
		end
	end,
	abn_artist_credits = {
		artist = "Tisisrealnow"
	},
	in_pool = function(self, args)
		for _, card in ipairs(G.playing_cards or {}) do
			if SMODS.has_enhancement(card, "m_abn_kinship") then
				return true
			end
		end
		return false
	end
}
