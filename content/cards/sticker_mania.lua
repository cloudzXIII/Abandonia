local function count_joker_stickers()
    local total = 0
    for _, owned_joker in ipairs(G.jokers and G.jokers.cards or {}) do
        for sticker_key in pairs(SMODS.Stickers) do
            if owned_joker.ability and owned_joker.ability[sticker_key] then
                total = total + 1
            end
        end
    end
    return total
end

SMODS.Joker {
    key = 'sticker_mania',
    rarity = 2,
    atlas = 'ABNJokerSheet12',
    pos = { x = 1, y = 5 },
    cost = 6,
    blueprint_compat = false,
    discovered = false,

    config = { extra = { charges = 3, chips = 10, active = false } },

    abn_artist_credits = {
        artist = "Nevermade"
    },

    abn_use_config = { colour = G.C.ORANGE, text = "USE" },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.charges,
                card.ability.extra.chips * count_joker_stickers(),
            }
        }
    end,

    can_use = function(self, card)
        return card.ability.extra.charges > 0 and not card.ability.extra.active
    end,

    use = function(self, card)
        card.ability.extra.charges = card.ability.extra.charges - 1
        card.ability.extra.active = true
        card:juice_up()
        card_eval_status_text(card, 'extra', nil, nil, nil, {
            message = localize('k_active_ex'),
        })
    end,

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.active then
            local vanilla_hands = {
                ['Pair'] = true, ['Two Pair'] = true, ['Three of a Kind'] = true, ['Straight'] = true,
                ['Flush'] = true, ['Full House'] = true, ['Four of a Kind'] = true, ['Straight Flush'] = true,
                ['Five of a Kind'] = true, ['Flush House'] = true, ['Flush Five'] = true,
            }

            if vanilla_hands[context.scoring_name] then
                card.ability.extra.active = false
                return {
                    chips = card.ability.extra.chips * count_joker_stickers(),
                    card = card,
                }
            end
        end
    end,
}