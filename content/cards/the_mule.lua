SMODS.Joker {
    key = 'the_mule',

    rarity = 1,
    atlas = 'AbandoniaJokers',
    pos = { x = 7, y = 11 },
    cost = 2,
    discovered = false,
    blueprint_compat = false,
    config = { extra = {chips = 80,chips_decrease=1, } },
    loc_vars = function(self, info_queue, card)
        local chips = card.ability.extra.chips-(card.ability.extra.chips_decrease*G.GAME.dollars)
        return {
            vars={
                card.ability.extra.chips,
                card.ability.extra.chips_decrease,
                chips,
            }
        }
    end,


    calculate = function(self, card, context)
        if context.joker_main then
            local chips = card.ability.extra.chips-(card.ability.extra.chips_decrease*G.GAME.dollars)
            return {
                chips=chips
            }
        end
    end,

    abn_artist_credits = {
        artist = "RadiationV2",
    },
}
