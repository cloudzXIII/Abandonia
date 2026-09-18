SMODS.Joker {
    key = 'tv_evangelist',
    rarity = 1,
    atlas = 'ABNJokerSheet26',
    pos = { x = 2, y = 3 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            chips = 25,
            mult = 15,
            dollars = 4
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.dollars
            }
        }
    end,

    in_pool = function(self, args)
        local played_5_card_hand = false
        if G.GAME and G.GAME.hand_usage then
            for hand_name, hand_data in pairs(G.GAME.hand_usage) do
                if hand_data.count and hand_data.count > 0 then
                    local base_hand = G.GAME.hands[hand_name]
                    if base_hand and base_hand.s_len and base_hand.s_len >= 5 then
                        played_5_card_hand = true
                        break
                    end
                end
            end
        end

        local can_play_6 = false
        if G.hand and G.hand.config and (G.hand.config.highlighted_limit or 5) >= 6 then
            can_play_6 = true
        elseif G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.config and card.config.center_key == 'm_abn_honey' then
                    can_play_6 = true
                    break
                end
            end
        end

        return played_5_card_hand and can_play_6
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.full_hand and #context.full_hand >= 6 then
            local vanilla_hands = {
                ['Flush'] = true,
                ['Straight'] = true,
                ['Full House'] = true,
                ['Straight Flush'] = true,
                ['Five of a Kind'] = true,
                ['Flush House'] = true,
                ['Flush Five'] = true
            }

            if vanilla_hands[context.scoring_name] then
                return {
                    dollars = card.ability.extra.dollars,
                    chips = card.ability.extra.chips,
                    mult = card.ability.extra.mult,
                    card = card
                }
            end
        end
    end,

    abn_artist_credits = {
        artist = "Vlambambo"
    }
}