SMODS.Joker {
    key = 'proxy_joker',
    rarity = 3,
    atlas = 'ABNJokerSheet21', 
    pos = { x = 5, y = 5 }, 
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    
    config = { 
        extra = { 
            ascension_gain = 0.50,
            ascension_power = 0
        } 
    },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.ascension_gain,
                card.ability.extra.ascension_power,
            }
        }
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and not context.blueprint then
            local all_jokers_modded = true
            if G.jokers and G.jokers.cards then
                for _, j in ipairs(G.jokers.cards) do
                    if not j.config or not j.config.center or not j.config.center.mod or j.config.center.mod == "Default" then
                        all_jokers_modded = false
                        break
                    end
                end
            else
                all_jokers_modded = false
            end

            local vanilla_hands = {
                ["High Card"] = true,
                ["Pair"] = true,
                ["Two Pair"] = true,
                ["Three of a Kind"] = true,
                ["Straight"] = true,
                ["Flush"] = true,
                ["Full House"] = true,
                ["Four of a Kind"] = true,
                ["Straight Flush"] = true,
                ["Royal Flush"] = true,
                ["Five of a Kind"] = true,
                ["Flush House"] = true,
                ["Flush Five"] = true
            }
            local is_modded_hand = context.scoring_name and not vanilla_hands[context.scoring_name]

            local suit = context.other_card.base and context.other_card.base.suit
            local is_modded_card = suit and suit ~= 'Spades' and suit ~= 'Hearts' and suit ~= 'Clubs' and suit ~= 'Diamonds'

            if all_jokers_modded and is_modded_hand and is_modded_card then
                card.ability.extra.ascension_power = card.ability.extra.ascension_power + card.ability.extra.ascension_gain
				return { 
					message = localize('k_upgrade_ex'),
					colour = G.C.GOLD,
				}
            end
        end

        if context.joker_main then
            return {
                asc = card.ability.extra.ascension_power,
                card = card
            }
        end
    end,

    abn_artist_credits = {
        artist = "Inky",
    },
}