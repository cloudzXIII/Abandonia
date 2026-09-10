SMODS.Joker {
    key = 'bubbly_joker',
    rarity = 2,
    cost = 8,
    atlas = 'ABNJokerSheet3',
    pos = { x = 8, y = 3 },
    discovered = false,
    blueprint_compat = true,
    
    config = { 
        extra = { 
            xmultadd = 0.1, 
            xchipsadd = 0.1, 
            xmult = 1, 
            xchips = 1 
        } 
    },

    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.xmultadd, 
                card.ability.extra.xchipsadd, 
                card.ability.extra.xmult, 
                card.ability.extra.xchips 
            } 
        }
    end,
    
    in_pool = function(self, args)
        if G.playing_cards then
            for _, c in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(c, 'm_abn_bubble') then
                    return true
                end
            end
        end
        return false
    end,

    calculate = function(self, card, context)
        -- Triggers when new playing cards are added to the deck
        if context.playing_card_added and not context.blueprint then
            local added_cards = context.cards or (context.card and { context.card }) or {}
            local added_bubbles = 0

            for _, c in ipairs(added_cards) do
                if c and SMODS.has_enhancement(c, 'm_abn_bubble') then
                    added_bubbles = added_bubbles + 1
                end
            end

            if added_bubbles > 0 then
                card.ability.extra.xmult = card.ability.extra.xmult + (card.ability.extra.xmultadd * added_bubbles)
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            end
        end

        -- Triggers when playing cards are removed/destroyed
        if context.remove_playing_cards and not context.blueprint then
            local destroyed_bubbles = 0

            if context.removed then
                for _, c in ipairs(context.removed) do
                    if c and SMODS.has_enhancement(c, 'm_abn_bubble') then
                        destroyed_bubbles = destroyed_bubbles + 1
                    end
                end
            end

            if destroyed_bubbles > 0 then
                card.ability.extra.xchips = card.ability.extra.xchips + (card.ability.extra.xchipsadd * destroyed_bubbles)
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS,
                    card = card
                }
            end
        end

        -- Scoring
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
                xchips = card.ability.extra.xchips
            }
        end
    end,

    abn_artist_credits = {
        artist = "Omicra",
    },
}