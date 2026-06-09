SMODS.Joker {
    key = 'jolly_voxel_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet15',
    pos = { x = 0, y = 4 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { xchips = 3, poker_hand = "Three of a Kind" } },
    loc_vars = function(self, info_queue, card)
        
        return { vars = { card.ability.extra.xchips, localize(card.ability.extra.poker_hand, 'poker_hands') } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.scoring_name == card.ability.extra.poker_hand then
			local ret = {}

			ret.xchips = card.ability.extra.xchips
			return ret
		end
    end,


    abn_artist_credits = {
        artist = "Firch",
    },
}
