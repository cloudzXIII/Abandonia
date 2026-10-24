local VANILLA_SUITS = { Hearts = true, Diamonds = true, Clubs = true, Spades = true }

local function all_modded_suits(cards)
    if not cards or #cards == 0 then return false end
    for _, c in ipairs(cards) do
        local suit = c.base and c.base.suit
        if not suit or VANILLA_SUITS[suit] then return false end
    end
    return true
end

SMODS.Joker {
    key = 'full_circle',
    atlas = 'ABNJokerSheet27',
    pos = { x = 5, y = 2 },
    rarity = 3,
    cost = 10,
    blueprint_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,

    config = {
        extra = {
            xmult = 5,
            asc = 0.25,
            level_bonus = 2,
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.level_bonus,
                card.ability.extra.xmult,
                card.ability.extra.asc,
            }
        }
    end,

    calculate = function(self, card, context)
        local hand = G.GAME and G.GAME.current_round and G.GAME.current_round.current_hand
        local underhand = hand and hand.abn_underhand

        -- +0.25 Ascension Power per scored card when an Underhand is made with only modded suits
        if context.individual and context.cardarea == G.play and underhand then
            if all_modded_suits(context.full_hand) then
                return {
                    asc = card.ability.extra.asc,
                    colour = G.C.GOLD,
                    card = card
                }
            end
        end

        -- x5 Mult whenever an Underhand is played
        if context.joker_main and underhand then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,

    abn_artist_credits = {
        artist = "Browniebread",
    },
}