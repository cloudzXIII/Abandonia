SMODS.Joker({
	key = "big_otis",
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return {
			vars = {
				cae.chips,
				cae.mult,
                cae.card_count
			},
		}
	end,

	rarity = 2,
	atlas = "ABNJokerSheet26",
	pos = { x = 0, y = 0 },
	cost = 8,
	discovered = false,
	blueprint_compat = true,

	config = {
		extra = {
			chips = 200,
            mult = 100,
            card_count = 1
		},
	},
	calculate = function(self, card, context)
        local cae = card.ability.extra
		if context.joker_main and #context.scoring_hand>1 then
            local trig = true
            for k, v in pairs(context.scoring_hand) do
                if (v.base.value and SMODS.Ranks[v.base.value] and not SMODS.Ranks[v.base.value].mod) or v.config.center.no_rank then
                    trig = false
                end
            end
            if trig then
                return{
                    chips = cae.chips,
                    mult = cae.mult
                }
            end
        end
	end,

	abn_artist_credits = {
		artist = "La Ginger",
	},
})
