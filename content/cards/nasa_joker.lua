local debuff_hand_ref = Blind.debuff_hand
function Blind:debuff_hand(cards, hand, handname, check)
    if G.GAME and next(SMODS.find_card('j_abn_nasa_joker')) then
        local ante = G.GAME.round_resets.ante
        if not G.GAME.abn_nasa or G.GAME.abn_nasa.ante ~= ante then
            G.GAME.abn_nasa = { ante = ante, hands = {} }
        end
        if G.GAME.abn_nasa.hands[handname] then
            self.triggered = true
            return true
        end
        if not check then
            G.GAME.abn_nasa.hands[handname] = true
        end
    end
    return debuff_hand_ref(self, cards, hand, handname, check)
end

SMODS.Joker {
    key = 'nasa_joker',
    atlas = 'ABNJokerSheet25',
    pos = { x = 1, y = 1 },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,

    config = { extra = { asc = 0.35, amp = 0.35 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.asc, card.ability.extra.amp } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local level = G.GAME.hands[context.scoring_name].level
            return {
                asc = card.ability.extra.asc * level,
                amp = card.ability.extra.amp * level,
            }
        end
    end,

    abn_artist_credits = { artist = "Squaredot" },
}