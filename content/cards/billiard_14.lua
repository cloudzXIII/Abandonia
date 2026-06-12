SMODS.Joker {
    key = "billiard_14",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    atlas = 'ABNJokerSheet15',
    pos = { x = 2, y = 4 },
    abn_coder = "LasagnaFelidae",
    config = { extra = {  odds = 2 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'abn_billiard_14')
        return { vars = { numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and
        #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            local value = context.other_card.base.value
            if (value == "abn_14") and  SMODS.pseudorandom_probability(card, 'abn_billiard_14', 1, card.ability.extra.odds) then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                return {
                    extra = {
                        message = "+1 Solid State",
                        message_card = card,
                        func = function() 
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    SMODS.add_card {
                                        set = 'solid_state',
                                        key_append = 'abn_billiard_14' 
                                    }
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end)
                            }))
                        end
                    },
                }
            end
        end
    end,
    in_pool = function(self, args)
        for _, card in pairs(G.playing_cards or {}) do
            if card and card.base.value == "abn_14" then
                return true
            end
        end
        return false
    end,
    abn_artist_credits = {
        artist = "EricTheToon",
    },
}