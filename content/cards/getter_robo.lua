SMODS.Sound({
    key = 'music_shin',
    path = 'music_shin.ogg',
	pitch = 1,
	speed = 1,
    select_music_track = function(self)
        -- If it's anime time play music
        if G.jokers then 
			for i = 1, #G.jokers.cards do
				local j = G.jokers.cards[i]
				if j.config.center.key and j.config.center.key == 'j_abn_getter_robo' then
					return 1e10
				end
			end
		end
    end
})

-- Getter Robo Joker
SMODS.Joker {
    key = 'getter_robo',
    rarity = 2,
    atlas = 'AbandoniaJokers',
    pos = { x = 4, y = 14 },
    cost = 2,
    blueprint_compat = true,
    config = { extra = { Xmult = 5, Xchips = 1, Boss = 2, } }, -- Changed config to reflect money focus

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult,
				card.ability.extra.Xchips,
				card.ability.extra.Boss,
            }
        }
    end,
	
	abn_artist_credits = {
		artist = "Nicecream",
	},

    calculate = function(self, card, context)
		
		if context.setting_blind and G.GAME.blind.boss then
			G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.Boss
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        end
		
		if context.end_of_round and context.main_eval and not context.blueprint and G.GAME.blind.boss then
			card.ability.extra.Xmult = card.ability.extra.Xmult * 2
			card.ability.extra.Xchips = card.ability.extra.Xchips * 2
			card.ability.extra.Boss = card.ability.extra.Boss * 2
			return {
                message = localize('k_upgrade_ex'),
                colour = G.C.Mult,
				card = card
            }
		end
		
		--give mult
		if context.joker_main then
            return {
                x_chips = card.ability.extra.Xchips,
				x_mult = card.ability.extra.Xmult
            }
        end
		
    end
}