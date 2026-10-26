SMODS.Joker {
    key = 'reverse_canvas',
    atlas = 'ABNJokerSheet27',
    pos = { x = 0, y = 1 },
    rarity = 1,
    cost = 6,
    blueprint_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = false,

    config = { extra = { card_chips = 10, chips = 0, card_dollars = 1 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.card_chips, card.ability.extra.chips, card.ability.extra.card_dollars } }
    end,

    calculate = function(self, card, context)
        local vanilla_suits = { Hearts = true, Diamonds = true, Clubs = true, Spades = true }

        if context.after and not context.blueprint then
            local dark_suits = {}
            for suit_key in pairs(SMODS.Suits) do
                if not vanilla_suits[suit_key] then
                    local stand_in = setmetatable({
                        base = { suit = suit_key, value = 'Ace', nominal = 11, id = 14 },
                        config = { center = G.P_CENTERS.c_base },
                        ability = {},
                        debuff = false,
                    }, Card)
                    local ok, is_dark = pcall(ABN.is_dark, stand_in)
                    if ok and is_dark then
                        dark_suits[#dark_suits + 1] = suit_key
                    end
                end
            end

            if #dark_suits > 0 then
                local converted = false
                for _, scored_card in ipairs(context.scoring_hand) do
                    if ABN.is_light(scored_card) and ABN.is_vanilla_suit(scored_card) then
                        local new_suit = pseudorandom_element(dark_suits, pseudoseed('abn_reverse_canvas'))
                        converted = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                scored_card:juice_up()
                                SMODS.change_base(scored_card, new_suit)
                                scored_card.ability.perma_bonus = (scored_card.ability.perma_bonus or 0) + card.ability.extra.card_chips
                                return true
                            end
                        }))
                    end
                end

                if converted then
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.CHIPS,
                    }
                end
            end
        end

        if context.change_suit and not context.blueprint then
            local changed = context.other_card

            if card.edition and card.edition.key == 'e_abn_reversal'
                and vanilla_suits[context.old_suit] and not vanilla_suits[context.new_suit] then
                card.ability.extra.chips = card.ability.extra.chips + changed.base.nominal
                card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex'), colour = G.C.CHIPS })
            end

            if next(SMODS.find_card('j_abn_photograph_canvas')) then
                changed.ability.perma_p_dollars = (changed.ability.perma_p_dollars or 0) + card.ability.extra.card_dollars
            end
        end

        if context.joker_main then
            return {
				chips = card.ability.extra.chips 
			}
        end
    end,

    abn_artist_credits = {
		artist = "Technotoad64 & Okronix"
	},
}