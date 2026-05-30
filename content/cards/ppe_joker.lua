SMODS.Joker {
    key = 'ppe_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet11',
    pos = { x = 8, y = 0 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = {xmult = 1.5}},
    loc_vars = function(self, info_queue, card)
        local ct = 0
        for i, card in ipairs(G.jokers.cards) do
            if card.debuff then ct = ct + 1 end
        end
		return { vars = {card.ability.extra.xmult, (card.ability.extra.xmult*ct > 1 and card.ability.extra.xmult*ct or 1) }}
	end,
    
    
    
    calculate = function(self, card, context)
        if context.joker_main then
            local ct = 0
            for i, card in ipairs(G.jokers.cards) do
                if card.debuff then ct = ct + 1 end
            end
            return { xmult = card.ability.extra.xmult * ct}
        end
    end,
    
    
    abn_artist_credits = {
        artist = "Dogg-Fly & Vega",
    },
    
    in_pool = function(self, args) 
        for _, joker in ipairs(G.jokers.cards or {}) do
            if joker.debuff then
                return true
            end
        end
        return false
    end
    
}
