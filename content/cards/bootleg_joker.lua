-- Coded by Okronix
SMODS.Joker {
    key = 'bootleg_joker',
    rarity = 1,
    atlas = 'ABNJokerSheet26',
    pos = { x = 9, y = 4 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = { type = "abn_Royal Flush", xchips = 4 }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                localize(card.ability.extra.type, 'poker_hands'),
                card.ability.extra.xchips
            }
        }
    end,

    calculate = function(self, card, context)        
        if context.joker_main and context.scoring_name == card.ability.extra.type then
            local only_mod_suits = true
            local vanilla_suits = { "Hearts", "Clubs", "Spades", "Diamonds" }

            for _, c in ipairs(context.scoring_hand) do                
                if ABN.table_contains(vanilla_suits, c.base.suit) then
                    only_mod_suits = false
                end
            end

            if only_mod_suits then
                return {
                    xchips = card.ability.extra.xchips
                }
            end
        end
    end,

    in_pool = function(self, args)
        local has_modded_suit = false
        local vanilla_suits = { "Hearts", "Clubs", "Spades", "Diamonds" }

        for _, playing_card in ipairs(G.playing_cards or {}) do
            if not SMODS.has_no_suit(playing_card) and not ABN.table_contains(vanilla_suits, playing_card.base.suit) then
                has_modded_suit = true
            end
        end

        return has_modded_suit
    end,

    abn_artist_credits = {
        artist = "Inky",
    },
}