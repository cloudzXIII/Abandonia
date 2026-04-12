SMODS.Joker {
    key = 'bowie',
    rarity = 4,
    atlas = 'AbandoniaJokers',
    pos = { x = 3, y = 27 },
	soul_pos = { x = 4, y = 27 },
    cost = 20,
    discovered = false,
    blueprint_compat = true, 
    
    config = { extra = { xmult = 2 } },

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.xmult }}
    end,

    calculate = function(self, card, context)
        -- Ensure the card has an edition
        if context.other_joker and context.other_joker ~= card and context.other_joker.edition and context.other_joker.edition.type then
            return {
                xmult = card.ability.extra.xmult,  -- Apply multiplier to the current card
                card = card
            }
        end

        return nil  -- No multiplier if no edition
    end,

    abn_artist_credits = {
        artist = "Comykel",
    },
}