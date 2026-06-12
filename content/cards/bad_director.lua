



SMODS.Joker {
    key = "bad_director",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    atlas = 'ABNJokerSheet15',
    pos = { x = 4, y = 0 },
    abn_coder = "LasagnaFelidae",
    config = { extra = { init = 5, inc = 0} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.init + card.ability.extra.inc } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.abn_boss_reroll_cost = card.ability.extra.init + card.ability.extra.inc
    end,
    remove_from_deck = function(self, card, from_debuff)
        
        G.GAME.abn_boss_reroll_cost = G.GAME.abn_boss_reroll_cost - (card.ability.extra.init + card.ability.extra.inc)
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.game_over and context.beat_boss then
            card.ability.extra.inc = 0
            G.GAME.abn_boss_reroll_cost = card.ability.extra.init + card.ability.extra.inc
        end

        if context.abn_reroll_boss then
            card.ability.extra.inc = card.ability.extra.inc + 1
            G.GAME.abn_boss_reroll_cost = card.ability.extra.init + card.ability.extra.inc
        end
    end,
    abn_artist_credits = {
        artist = "Sustato",
    },
}