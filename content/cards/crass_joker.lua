SMODS.Joker {
    key = 'crass_joker',
    rarity = 2,
    --atlas = 'ABNJokerSheet16',
    --pos = { x = 2, y = 1 },
    atlas = "placeholder",
    pos = {x=0,y=0},
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { chips = 0, chips_mod = 1 } },
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.chips_mod, card.ability.extra.chips, 
            } 
        }
    end,
  
    calculate = function(self, card, context)
        if context.buying_card and context.card.edition and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.chips_mod * (context.card.cost > 0 and context.card.cost or context.card.base_cost))
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
		end

    end,

    in_pool = function(self, args)
        for i, joker in ipairs(G.jokers.cards) do
            if joker.edition then
                return true
            end
        end
        return false
    end,

    
    
    abn_artist_credits = {
        artist = "DOS",
    },
}
