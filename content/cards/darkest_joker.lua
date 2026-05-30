SMODS.Joker {
    key = 'darkest_joker',
    rarity = 3, 
    atlas = 'ABNJokerSheet4', 
    pos = { x = 1, y = 5 }, 
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 0,
            chips = 0,
            multadd = 10,
            chipsadd = 10
        }
    },

    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
        return { vars = { card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.multadd, card.ability.extra.chipsadd } }
    end,

    in_pool = function(self, args)
        if G.playing_cards then
            for _, v in ipairs(G.playing_cards) do
                if ABN.is_dark(v) then
                    if v.edition and v.config.center ~= G.P_CENTERS.c_base then
                        return true
                    end
                end
            end
        end
        return false
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local scoring_card = context.other_card
            
            if ABN.is_dark(scoring_card) then
                local gained = false

                -- Gain mult if edition
                if scoring_card.edition then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
                    gained = true
                end

                -- Gain chips if enhancement
                if scoring_card.config.center ~= G.P_CENTERS.c_base then
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
                    gained = true
                end

                if gained then
                    return {
						message = localize('k_upgrade_ex'),
						card = scoring_card
					}
                end
            end
        end

        -- Scoring
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
				chips = card.ability.extra.chips,
                card = card
            }
        end
    end,

    abn_artist_credits = {
        artist = "Vlambambo",
    },
}