
SMODS.Joker({
    key = "cracked_joker",
    name = "Cracked Joker",
    atlas = "ABNJokerSheet24",
    pos = { x = 4, y = 4 },
    cost = 6,
    rarity = 3,

    config = {
        extra = {
            odds = 4,
            chips = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual
        and context.cardarea == G.play
        and not context.blueprint
        and context.other_card then
            local scored_card = context.other_card

            if not (
                scored_card.config
                and scored_card.config.center
                and scored_card.config.center.key == "m_abn_kintsugi"
            ) then
                if pseudorandom("cracked_joker") < G.GAME.probabilities.normal / card.ability.extra.odds then
                    local rank = scored_card.base and scored_card.base.nominal or 0

                    card.ability.extra.chips = card.ability.extra.chips + rank

                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.3,
                        func = function()
                            if scored_card and not scored_card.destroyed then
                                scored_card:start_dissolve()
                            end
                            return true
                        end
                    }))
                end
            end
        end

        if context.joker_main and card.ability.extra.chips > 0 then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
})
