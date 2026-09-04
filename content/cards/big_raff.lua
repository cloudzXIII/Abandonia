-- Messing with add_to_deck and remove_from_deck stuff is very easy and not at all prone to mishap with multiple copies
SMODS.Joker {
    key = 'big_raff',
    rarity = 3,
    abn_coder = "ImaginaryNeon",
    atlas = 'ABNJokerSheet24',
    pos = { x = 9, y = 5 },
    --atlas = 'jonklers',
    --pos = { x = 1, y = 0 },
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    demicoloncompat = true,
    config = { immutable = { common_rate = 0, uncommon_rate = 0, joker_rate = 0 } },
    add_to_deck = function(self, card, from_debuff)
        card.ability.immutable.joker_rate = (G.GAME.joker_rate or 1)
        card.ability.immutable.common_rate = (G.GAME.common_mod or 0.7)
        card.ability.immutable.uncommon_rate = (G.GAME.uncommon_mod or 0.25)
        G.GAME.common_mod = 0
        G.GAME.uncommon_mod = 0
        G.GAME.joker_rate = G.GAME.joker_rate * (2 * G.GAME.rare_mod)
    end,
    remove_from_deck = function(self, card, from_debuff) -- probably janky as hell with multiple copies but fuck you
        G.GAME.common_mod = (card.ability.immutable.common_rate or 0.7)
        G.GAME.uncommon_mod = (card.ability.immutable.common_rate or 0.25)
        G.GAME.joker_rate = (card.ability.immutable.joker_rate or 10)
    end,
    calculate = function(self, card, context)
        if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card {
                        set = 'Joker',
                        rarity = 'Rare',
                        key_append = 'abn_mega_raff'
                    }
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            return {
                message = localize('k_plus_joker'),
                colour = G.C.BLUE,
            }
        end
    end,
    abn_artist_credits = {
        artist = "CebeeDrawz",
    },
}
