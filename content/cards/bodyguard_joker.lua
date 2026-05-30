SMODS.Joker {
    key = 'bodyguard_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet3', 
    pos = { x = 9, y = 5 }, 
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 0,
            multadd = 10,
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
        return { vars = { card.ability.extra.mult, card.ability.extra.multadd } }
    end,

    in_pool = function(self, args)
        if G.playing_cards then
            for _, v in ipairs(G.playing_cards) do
                if v.ability and v.ability.abn_perma_flipped then
                    return true
                end
            end
        end
        return false
    end,

    calculate = function(self, card, context)
        if context.individual then
            -- Scoring cards
            if context.cardarea == G.play then
                local scoring_card = context.other_card
                
                if scoring_card.ability and scoring_card.ability.abn_perma_flipped and scoring_card.facing == 'back' then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
                    scoring_card.ability.abn_perma_flipped = nil
					scoring_card:flip()
                end
            end

            -- Unscoring cards
            if context.cardarea == "unscored" then
                local unscoring_card = context.other_card
                
                if unscoring_card.ability and not unscoring_card.ability.abn_perma_flipped and unscoring_card.facing == 'front' then
					unscoring_card:flip()
                    unscoring_card.ability.abn_perma_flipped = true
                end
            end
        end

        -- Scoring
        if context.joker_main then
            return {
				mult = card.ability.extra.mult,
                card = card
			}
        end
    end,

    abn_artist_credits = {
        artist = "Vlambambo",
    },
}