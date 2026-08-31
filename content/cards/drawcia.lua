SMODS.Joker {
    key = 'drawcia',
    rarity = 3,
    atlas = 'ABNJokerSheet22',
    pos = { x = 9, y = 4 },
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1,
            xmultadd = 0.1
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmultadd
            }
        }
    end,

    in_pool = function(self, args)
        if G.playing_cards then
            local base_suits = { Spades = true, Hearts = true, Clubs = true, Diamonds = true }
            for _, c in ipairs(G.playing_cards) do
                if ABN and ABN.is_light and ABN.is_light(c) then
                    for suit_key, _ in pairs(SMODS.Suits) do
                        if not base_suits[suit_key] and c:is_suit(suit_key) then
                            return true
                        end
                    end
                end
            end
        end
        return false
    end,

    calculate = function(self, card, context)
        local base_suits = { Spades = true, Hearts = true, Clubs = true, Diamonds = true }

        if context.modify_scoring_hand then
            local other = context.other_card
            if other and other.base and not base_suits[other.base.suit] then
                return {
                    add_to_hand = true
                }
            end
        end

        if context.before and not context.blueprint then
            local has_vanilla = false
            local unique_suits = {}

            for _, scoring_card in ipairs(context.scoring_hand) do
                for base_suit, _ in pairs(base_suits) do
                    if scoring_card:is_suit(base_suit) then
                        has_vanilla = true
                        break
                    end
                end
                if has_vanilla then break end
            end

            if not has_vanilla then
                for _, scoring_card in ipairs(context.scoring_hand) do
                    if scoring_card.base and scoring_card.base.suit then
                        unique_suits[scoring_card.base.suit] = true
                    end
                end

                local suit_count = 0
                for _ in pairs(unique_suits) do
                    suit_count = suit_count + 1
                end

                if suit_count > 0 then
                    local total_gain = card.ability.extra.xmultadd * suit_count
                    card.ability.extra.xmult = card.ability.extra.xmult + total_gain

                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT,
                        card = card
                    }
                end
            end
        end

        if context.joker_main then
            return {
                x_mult = card.ability.extra.xmult
            }
        end
    end,

    abn_artist_credits = {
        artist = "Nice Cream",
    },
}