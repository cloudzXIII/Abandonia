SMODS.Joker({
	key = "tiny_waldo",
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return {
			vars = {
				cae.chips,
				cae.mult,
                cae.modded_ranks,
                cae.vanilla_ranks
			},
		}
	end,

	rarity = 2,
	atlas = "ABNJokerSheet26",
	pos = { x = 3, y = 0 },
	cost = 6,
	discovered = false,
	blueprint_compat = true,

	config = {
		extra = {
			chips = 200,
            mult = 15,
            modded_ranks = 2,
            vanilla_ranks = 2
		},
	},
	calculate = function(self, card, context)
        local cae = card.ability.extra
		if context.joker_main then
            local trig, mod, vanilla = false, 0, 0
             for k, v in pairs(context.scoring_hand) do
                if v.base.value and SMODS.Ranks[v.base.value] and not v.config.center.no_rank then 
                    if SMODS.Ranks[v.base.value].mod then
                        mod = mod + 1
                    else
                        vanilla = vanilla + 1
                    end
                end
            end
            if mod == cae.modded_ranks and vanilla == cae.vanilla_ranks then
                trig = true
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
