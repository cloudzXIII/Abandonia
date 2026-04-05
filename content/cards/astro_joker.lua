SMODS.Joker {
    key = 'astro_joker',

    rarity = 1,
    atlas = 'AbandoniaJokers',
    pos = { x = 0, y = 31 },
    cost = 3,
    discovered = false,
    blueprint_compat = true,
    config = {extra={
        odds=4,
    }},
    loc_vars = function(self, info_queue, card)
        return {
            vars={
                SMODS.get_probability_vars(card,1,card.ability.extra.odds,"abn_astro_joker")
            },
        }
    end,


    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint and not context.retrigger_joker then
            if context.trigger_obj.config.center.set == "astro_cards" then
                return {
                    numerator=context.denominator
                }
            end
        end
        if context.end_of_round and context.cardarea == G.jokers then
            if SMODS.pseudorandom_probability(card,"abn_astro_joker",1,card.ability.extra.odds) then
                card:start_dissolve()
            end
        end
    end,
    abn_artist_credits = {
        artist = "Maw",
    },
}
