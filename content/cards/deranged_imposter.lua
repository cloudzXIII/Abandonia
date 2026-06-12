SMODS.Joker {
    key = 'deranged_imposter',
    rarity = 2,
    atlas = 'ABNJokerSheet14',
    pos = { x = 1, y = 5 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { mult_mod = 4, chips_mod = 10, mult = 0, chips= 0 }},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_mod, card.ability.extra.chips_mod, card.ability.extra.mult, card.ability.extra.chips, } }
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local ret = {}
            local current = context.other_card

            local mult_gain = 0
            local chips_gain = 0

            for _, other in ipairs(context.scoring_hand) do
                if other ~= current then
                    local same_enhancement =
                        current.config.center.key == other.config.center.key

                    if same_enhancement and current.config.center.key ~= "c_base" then
                        if current.base.value == other.base.value
                        and current.base.suit ~= other.base.suit then
                            mult_gain = card.ability.extra.mult_mod
                        end

                        if current.base.suit == other.base.suit
                        and current.base.value ~= other.base.value then
                            chips_gain = card.ability.extra.chips_mod
                        end
                    end
                end
            end
            if mult_gain > 0 then
                card.ability.extra.mult = card.ability.extra.mult + mult_gain
                ret.message = "+" .. mult_gain .. " Mult"
                ret.colour = G.C.MULT
                ret.card = card
            elseif chips_gain > 0 then
                card.ability.extra.chips = card.ability.extra.chips + chips_gain
                ret.message = "+" .. chips_gain .. " Chips"
                ret.colour = G.C.CHIPS
                ret.card = card
            end
            return ret
        end


    end,


    
    abn_artist_credits = {
        artist = "Sustato",
    },
}