SMODS.Joker {
    key = "stereogram",
    name = "Stereogram Joker",
    config = { extra = { balance = 5 } },
    pos = { x = 8, y = 3 },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    atlas = "ABNJokerSheet4",
    attributes = { "balance", "rank" },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.balance } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local id = context.other_card:get_id()
            local rank_key = nil
            for _, key in ipairs(SMODS.Rank.obj_buffer) do
                local rank = SMODS.Ranks[key]
                if rank and rank.id == id then
                    rank_key = key
                    break
                end
            end
            if rank_key then
                local rank = SMODS.Ranks[rank_key]
                if rank_key ~= 'Ace' and not rank.face then
                    return {
                        abn_balance_percent = card.ability.extra.balance
                    }
                end
            end
        end
    end,
	
	abn_artist_credits = {
		artist = "Yahooyowza",
	},
	
    in_pool = function(self, args)
        if G.GAME then
            if G.GAME.selected_back.effect.center.key ~= "b_plasma" then
                return true
            end
        end
        return false
    end
}