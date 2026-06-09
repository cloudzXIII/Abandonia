SMODS.Joker {
    key = 'symbol_of_peace',
    rarity = "abn_SuperRare",
    atlas = 'ABNJokerSheet5',
    pos = { x = 4, y = 0 },
    cost = 25,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { area_mod = 1, } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.area_mod } }
    end,

    add_to_deck = function(self, card, from_debuff)
        ease_discard(card.ability.extra.area_mod)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.area_mod
        ease_hands_played(card.ability.extra.area_mod)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.area_mod
        SMODS.change_play_limit(card.ability.extra.area_mod)
        SMODS.change_discard_limit(card.ability.extra.area_mod)
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + card.ability.extra.area_mod
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.area_mod
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.area_mod
    end,

    remove_from_deck = function(self, card, from_debuff)
        ease_discard(-card.ability.extra.area_mod)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.area_mod
        ease_hands_played(-card.ability.extra.area_mod)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.area_mod
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - card.ability.extra.area_mod
        SMODS.change_play_limit(-card.ability.extra.area_mod)
        SMODS.change_discard_limit(-card.ability.extra.area_mod)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.area_mod
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.area_mod
    end,


    calculate = function(self, card, context)
        if context.setting_blind then
            if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.boss then
                return {
                    message = localize('ph_boss_disabled'),
                    func = function() -- This is for timing purposes, it runs after the message
                        G.GAME.blind:disable()
                    end
                }
            end
        end
        if context.starting_shop then
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:juice_up(0.3, 0.5)
                    SMODS.add_voucher_to_shop()
                    SMODS.add_booster_to_shop()
                    return true
                end
            }))
        end
    end,


    abn_artist_credits = {
        artist = "Sirtime",
    },
}
