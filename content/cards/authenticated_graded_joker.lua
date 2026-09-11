-- Authenticated Graded Joker (code by Noodlemire)

--[[
Scoring Vintage Cards give +Chips and +Mult
equal to your highest value poker hand

If this joker is Vintage, all Vintage playing
cards are moved to the top of your deck
--]]

local function get_highest_level_hand(joker)
	joker.ability.extra.best_hand = ABN.highest_level_hand()
	joker.ability.extra.best_chips = G.GAME.hands[joker.ability.extra.best_hand].chips
	joker.ability.extra.best_mult = G.GAME.hands[joker.ability.extra.best_hand].mult
end

SMODS.Joker{
	key = "authenticated_graded_joker",
	atlas = "ABNJokerSheet25",
	rarity = 3,
	cost = 20,
	pos = {x = 2, y = 0},
	blueprint_compat = true,
	config = {extra = {best_chips = 100, best_mult = 8, best_hand = "Straight Flush"}},
	loc_vars = function(self, info_queue, joker)
		get_highest_level_hand(joker)
		if not joker.edition or joker.edition.key ~= "e_abn_vintage" then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_vintage
		end
		return {vars = {joker.ability.extra.best_hand, joker.ability.extra.best_chips, joker.ability.extra.best_mult}}
	end,
	calculate = function(self, joker, context)
		if context.before and not context.blueprint then
			get_highest_level_hand(joker)
		elseif context.individual and context.cardarea == G.play and context.other_card.edition and context.other_card.edition.key == "e_abn_vintage" then
			return {chips = joker.ability.extra.best_chips, mult = joker.ability.extra.best_mult}
		end
	end,
	abn_artist_credits = {
		artist = "Creechie"
	}
}

local shuffle_ref = CardArea.shuffle
function CardArea:shuffle(_seed)
	local g = shuffle_ref(self, _seed)
	local agj = false
	for _, joker in ipairs(SMODS.find_card("j_abn_authenticated_graded_joker")) do
		if joker.edition and joker.edition.key == "e_abn_vintage" then
			agj = true
			break
		end
	end
	if agj and self == G.deck then
		local priorities = {}
		local others = {}
		for k, v in pairs(self.cards) do
			if v.edition and v.edition.key == "e_abn_vintage" then
				table.insert(priorities, v)
			else
				table.insert(others, v)
			end
		end
		for _, card in ipairs(priorities) do
			table.insert(others, card)
		end
		self.cards = others
		self:set_ranks()
	end
	return g
end
