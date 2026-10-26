SMODS.Joker {
    key = 'photograph_canvas',
    atlas = 'ABNJokerSheet27',
    pos = { x = 4, y = 2 },
    rarity = 1,
    cost = 6,
    blueprint_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = false,

    config = { extra = { card_mult = 4, mult = 0, card_dollars = 1 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.card_mult, card.ability.extra.mult, card.ability.extra.card_dollars } }
    end,

    calculate = function(self, card, context)
        local vanilla_suits = { Hearts = true, Diamonds = true, Clubs = true, Spades = true }

        if context.after and not context.blueprint then

            local light_suits = {}
            for suit_key in pairs(SMODS.Suits) do
                if not vanilla_suits[suit_key] then
                    local stand_in = setmetatable({
                        base = { suit = suit_key, value = 'Ace', nominal = 11, id = 14 },
                        config = { center = G.P_CENTERS.c_base },
                        ability = {},
                        debuff = false,
                    }, Card)
                    local ok, is_light = pcall(ABN.is_light, stand_in)
                    if ok and is_light then
                        light_suits[#light_suits + 1] = suit_key
                    end
                end
            end

            if #light_suits > 0 then
                local converted = false
                for _, scored_card in ipairs(context.scoring_hand) do
                    if ABN.is_dark(scored_card) then
                        local new_suit = pseudorandom_element(light_suits, pseudoseed('abn_photograph_canvas'))
                        converted = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                scored_card:juice_up()
                                SMODS.change_base(scored_card, new_suit)
                                scored_card.ability.perma_mult = (scored_card.ability.perma_mult or 0) + card.ability.extra.card_mult
                                return true
                            end
                        }))
                    end
                end

                if converted then
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT,
                    }
                end
            end
        end

        if context.change_suit and not context.blueprint then
            local changed = context.other_card

            if card.edition and card.edition.key == 'e_abn_reversal' and not vanilla_suits[context.new_suit] then
                local old_suit_card = setmetatable({
                    base = { suit = context.old_suit, value = 'Ace', nominal = 11, id = 14 },
                    config = { center = G.P_CENTERS.c_base },
                    ability = {},
                    debuff = false,
                }, Card)
                local ok, was_dark = pcall(ABN.is_dark, old_suit_card)
                if ok and was_dark then
                    card.ability.extra.mult = card.ability.extra.mult + changed.base.nominal
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex'), colour = G.C.MULT })
                end
            end

            if next(SMODS.find_card('j_abn_reverse_canvas')) then
                changed.ability.perma_p_dollars = (changed.ability.perma_p_dollars or 0) + card.ability.extra.card_dollars
            end
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    abn_artist_credits = {
        artist = "Technotoad64 & Okronix"
    },
}