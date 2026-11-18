SMODS.Joker {
    key = "extra_support",
    atlas = "ABNJokerSheet25",
    pos = { x = 9, y = 1 },
    rarity = 3,
    cost = 8,
    discovered = false,
    blueprint_compat = false,

    config = {
        extra = {
            jokers_per_bonus = 2,
            bonus_applied = 0,
        },
    },

    abn_artist_credits = {
        artist = "Matheo000",
    },

    loc_vars = function(self, info_queue, card)
        local joker_count = G.jokers and #G.jokers.cards or 0
        return {
            vars = {
                card.ability.extra.jokers_per_bonus,
                math.floor(joker_count / card.ability.extra.jokers_per_bonus),
            }
        }
    end,

    update = function(self, card, dt)
        if not card.added_to_deck or not G.jokers or not G.hand then return end

        local bonus_target = math.floor(#G.jokers.cards / card.ability.extra.jokers_per_bonus)
        local bonus_difference = bonus_target - card.ability.extra.bonus_applied
        if bonus_difference ~= 0 then
            card.ability.extra.bonus_applied = bonus_target
            G.hand:change_size(bonus_difference)
            SMODS.change_play_limit(bonus_difference)
            SMODS.change_discard_limit(bonus_difference)
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.bonus_applied ~= 0 and G.hand then
            G.hand:change_size(-card.ability.extra.bonus_applied)
            SMODS.change_play_limit(-card.ability.extra.bonus_applied)
            SMODS.change_discard_limit(-card.ability.extra.bonus_applied)
        end
        card.ability.extra.bonus_applied = 0
    end,
}