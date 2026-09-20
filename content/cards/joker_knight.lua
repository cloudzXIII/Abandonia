local function get_natural_sf_cards(parts)
    if not parts._straight or not parts._flush then return nil end

    local flush_cards = {}
    for _, f_group in ipairs(parts._flush) do
        for _, card in ipairs(f_group) do
            flush_cards[card] = true
        end
    end

    for _, s_group in ipairs(parts._straight) do
        local matching_cards = {}
        for _, card in ipairs(s_group) do
            if flush_cards[card] then
                table.insert(matching_cards, card)
            end
        end

        if #matching_cards >= 5 then
            return matching_cards
        end
    end

    return nil
end

local function hook_emperium_flush()
    local emp_key = SMODS.PokerHands['abn_Emperium Flush'] and 'abn_Emperium Flush' or 'Emperium Flush'
    local emp_hand = SMODS.PokerHands[emp_key]

    if emp_hand and not emp_hand._knight_hooked then
        emp_hand._knight_hooked = true
        local orig_emp_eval = emp_hand.evaluate
        emp_hand.evaluate = function(parts, hand)
            local native_res = orig_emp_eval(parts, hand)
            if native_res and #native_res > 0 then
                return native_res
            end

            if next(SMODS.find_card("j_abn_jokers_knight")) then
                local natural_sf = get_natural_sf_cards(parts)
                if natural_sf then
                    return { natural_sf }
                end
            end

            return {}
        end
    end
end

local sf_hand = SMODS.PokerHands['Straight Flush']
local orig_sf_eval = sf_hand.evaluate

sf_hand.evaluate = function(parts, hand)
    hook_emperium_flush()

    if next(SMODS.find_card("j_abn_jokers_knight")) then
        if parts._straight and #parts._straight > 0 then
            return parts._straight
        end
    end

    return orig_sf_eval(parts, hand)
end

SMODS.Joker {
    key = 'jokers_knight',
    rarity = 3,
    atlas = 'ABNJokerSheet26',
    pos = { x = 4, y = 4 },
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            chips = 0,
            mult = 0,
            xchips = 1,
            xmult = 1,
            chips_per_suit = 10,
            mult_per_suit = 10,
            xchips_gain = 0.025,
            xmult_gain = 0.025
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.xchips,
                card.ability.extra.xmult,
                card.ability.extra.chips_per_suit,
                card.ability.extra.mult_per_suit,
                card.ability.extra.xchips_gain,
                card.ability.extra.xmult_gain
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local is_blueprint = context.blueprint or (card ~= self)

            if card.ability.abn_stk_wild then
                local suit_count = 0
                for _ in pairs(SMODS.Suits) do
                    suit_count = suit_count + 1
                end

                card.ability.extra.chips = card.ability.extra.chips + (suit_count * card.ability.extra.chips_per_suit)
                card.ability.extra.mult = card.ability.extra.mult + (suit_count * card.ability.extra.mult_per_suit)

                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize('k_upgrade_ex')
                })
            end

            if card.ability.abn_stk_kinship and context.scoring_hand then
                local combo_counts = {}
                for _, scoring_card in ipairs(context.scoring_hand) do
                    local suit = scoring_card:get_id() and scoring_card.base.suit or 'None'
                    local edition = scoring_card.edition and scoring_card.edition.key or 'no_edition'
                    local key = suit .. '_' .. edition

                    combo_counts[key] = (combo_counts[key] or 0) + 1
                end

                local sharing_cards_count = 0
                for _, scoring_card in ipairs(context.scoring_hand) do
                    local suit = scoring_card:get_id() and scoring_card.base.suit or 'None'
                    local edition = scoring_card.edition and scoring_card.edition.key or 'no_edition'
                    local key = suit .. '_' .. edition

                    if combo_counts[key] > 1 then
                        sharing_cards_count = sharing_cards_count + 1
                    end
                end

                if sharing_cards_count > 0 and not is_blueprint then
                    card.ability.extra.xchips = card.ability.extra.xchips + (sharing_cards_count * card.ability.extra.xchips_gain)
                    card.ability.extra.xmult = card.ability.extra.xmult + (sharing_cards_count * card.ability.extra.xmult_gain)

                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = localize('k_upgrade_ex')
                    })
                end
            end

            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
                xchips = card.ability.extra.xchips,
                xmult = card.ability.extra.xmult,
                card = card
            }
        end
    end,
    abn_artist_credits = {
        artist = "Comykel"
    }
}