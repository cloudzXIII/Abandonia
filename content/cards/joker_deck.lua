 local function get_deck_card_amount_something(even)
    if not G.deck then
        return 0
    end
    local total = 0
    for k,v in pairs(G.deck.cards) do
        if even then
            if v:get_id()%2 == 0 then
                total = total + 1
            end
        else
            if v:get_id()%2 ~= 0 then
                total = total + 1
            end
        end
    end
    return total
end

SMODS.Joker({
	key = "joker_deck",
	rarity = 2,
	atlas = "ABNJokerSheet14",
	pos = { x = 3, y = 5 },
	cost = 6,
	discovered = false,
	blueprint_compat = true,
	config = {
		extra = {
			chips = 7,
			mult = 4,
		},
	},
	loc_vars = function(self, info_queue, card)
        local current_mult, current_chips = card.ability.extra.mult*get_deck_card_amount_something(true), card.ability.extra.chips*get_deck_card_amount_something()
		return {
			vars = {
				card.ability.extra.chips,
				card.ability.extra.mult,

                current_mult,
                current_chips
			},
		}
	end,

	calculate = function(self, card, context)
		if context.joker_main then
            return{
                mult = card.ability.extra.mult*get_deck_card_amount_something(true),
                chips = card.ability.extra.chips*get_deck_card_amount_something()
            }
        end
	end,
	abn_artist_credits = {
		artist = "Sustato",
	},
})
