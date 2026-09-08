SMODS.Joker {
    key = 'the_great_gig_in_the_sky',
    rarity = 2,
    atlas = 'ABNJokerSheet19',
    pos = { x = 1, y = 4 },
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { asc = 0, asc_mod = 1, asc_j = 0.10, poker_hand = "abn_Spectrum" } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.asc, card.ability.extra.asc_mod, card.ability.extra.asc_j } }
    end,

    calculate = function(self, card, context)
        if context.before and context.scoring_name == card.ability.extra.poker_hand then
            local has_vanilla = false
            for i, v in ipairs(context.scoring_hand) do
                if ABN.is_vanilla_suit(v) then has_vanilla = true end
            end
            if has_vanilla == false then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "asc",
                    scalar_value = "asc_mod",
                })
            end
        end

        if context.joker_main then
            local ret = {}
            ret.asc = card.ability.extra.asc
            return ret
        end

        if context.individual and context.cardarea == G.play then
            if card.edition then
                SMODS.scale_card(context.other_card, {
                    ref_table = context.other_card.ability,
                    ref_value = "slib_perma_plus_asc",
                    scalar_table = card.ability.extra,
                    scalar_value = "asc_j",
                })
            end
            return ret
        end
    end,


    abn_artist_credits = {
        artist = "Weasel.922",
    },
}
