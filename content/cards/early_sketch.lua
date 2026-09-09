-- Early Sketch (code by Noodlemire)

SMODS.Joker{
	key = "early_sketch",
	atlas = "ABNJokerSheet22",
	rarity = 2,
	cost = 6,
	pos = {x = 5, y = 3},
	blueprint_compat = true,
	config = {extra = {level_boost = 5}},
	loc_vars = function(self, info_queue, joker)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_vintage
		info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_kinship
		return {vars = {joker.ability.extra.level_boost}}
	end,
	calculate = function(self, joker, context)
		if context.first_hand_drawn and not context.blueprint then
			local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
			juice_card_until(joker, eval, true)
		elseif context.initial_scoring_step and G.GAME.current_round.hands_played == 0 and context.scoring_name ~= "High Card" then
			for _, card in ipairs(context.scoring_hand) do
				if not SMODS.has_enhancement(card, "m_abn_kinship") or not card.edition or card.edition.key ~= "e_abn_vintage" then
					return
				end
			end
			return {
				chips = G.GAME.hands[context.scoring_name].l_chips * joker.ability.extra.level_boost,
				mult = G.GAME.hands[context.scoring_name].l_mult * joker.ability.extra.level_boost
			}
		end
	end,
	abn_artist_credits = {
		artist = "GM36"
	},
	in_pool = function(self, args)
		for _, card in ipairs(G.playing_cards or {}) do
			if SMODS.has_enhancement(card, "m_abn_kinship") and card.edition and card.edition.key == "e_abn_vintage" then
				return true
			end
		end
		return false
	end
}

local old_upgrade_poker_hands = SMODS.upgrade_poker_hands
function SMODS.upgrade_poker_hands(args)
	if #SMODS.find_card("j_abn_early_sketch") > 0 and (args.level_up or 1) < 0 then
		for _, card in ipairs(#G.play.cards > 0 and G.play.cards or G.hand.highlighted) do
			if SMODS.has_enhancement(card, "m_abn_kinship") and card.edition and card.edition.key == "e_abn_vintage" then
				return
			end
		end
	end
	old_upgrade_poker_hands(args)
end
