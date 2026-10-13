-- Ultimogeniture Joker (code by Noodlemire)

SMODS.Joker{
	key = "ultimogeniture_joker",
	atlas = "ABNJokerSheet16",
	rarity = 3,
	cost = 8,
	pos = {x = 7, y = 5},
	blueprint_compat = true,
	config = {extra = {cost = 1}},
	loc_vars = function(self, info_queue, joker)
		return {vars = {joker.ability.extra.cost}}
	end,
	calculate = function(self, joker, context)
		if context.modify_shop_card and not context.blueprint and context.card:is_rarity("Common") then
			context.card.ability.abn_ultimogeniture = true
			context.card:set_cost()
		elseif context.other_joker and context.other_joker:is_rarity("Common") then
			if context.other_joker.config.center.original_mod then
				return {amp = context.other_joker.sell_cost}
			else
				return {modulate = context.other_joker.sell_cost}
			end
		end
	end,
	abn_artist_credits = {
		artist = "Da Gorbage Rat"
	},
	in_pool = function(self, args)
		local vanilla, modded = false, false
		for _, area in ipairs(SMODS.get_card_areas("jokers")) do
			for __, other in ipairs(area.cards) do
				if other.ability and other.ability.set == "Joker" and other.config.center.rarity == 1 then
					if other.config.center.original_mod then
						modded = true
					else
						vanilla = true
					end
					if vanilla and modded then return true end
				end
			end
		end
		return false
	end
}

local set_cost_ref = Card.set_cost_value
function Card:set_cost_value()
	if self.ability.abn_ultimogeniture then
		self.cost = 1
	else
		return set_cost_ref(self)
	end
end
