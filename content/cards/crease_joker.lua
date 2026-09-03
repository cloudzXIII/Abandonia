SMODS.Joker {
    key = 'crease_joker',
    rarity = 2,
    abn_coder = "ImaginaryNeon",
    atlas = 'ABNJokerSheet24',
    pos = { x = 6, y = 5 },
    --atlas = 'jonklers',
    --pos = { x = 1, y = 0 },
    cost = 6,
    discovered = false,
    blueprint_compat = false,
    demicoloncompat = false,
    config = { extra = { x_size = 2, discard_limit = 1, is_real = false }, immutable = { discard_limit_store = 0, size_store = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_size, card.ability.extra.discard_limit } }
    end,
    add_to_deck = function(self, card, from_debuff)
        -- store values for safekeeping
        card.ability.immutable.size_store = G.hand.config.card_limit
        if G.GAME.starting_params.discard_limit <= 0 then
            card.ability.immutable.discard_limit_store = 5 - card.ability.extra.discard_limit
        else
            card.ability.immutable.discard_limit_store = G.GAME.starting_params.discard_limit -
                card.ability.extra.discard_limit
        end
        -- change values
        G.hand:change_size(((card.ability.extra.x_size) - 1) * card.ability.immutable.size_store) -- hand size increase
        SMODS.change_discard_limit(-1 * card.ability.immutable.discard_limit_store)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-((card.ability.extra.x_size) - 1) * card.ability.immutable.size_store)
        --if card.ability.extra.is_real == true then
        SMODS.change_discard_limit(card.ability.immutable.discard_limit_store)
        --end
    end,
    --[[calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint and not card.getting_sliced then
            if G.GAME.starting_params.discard_limit <= 0 then
                card.ability.immutable.discard_limit_store = 5 - card.ability.extra.discard_limit
            else
                card.ability.immutable.discard_limit_store = G.GAME.starting_params.discard_limit -
                    card.ability.extra.discard_limit
            end
            card.ability.extra.is_real = true
            SMODS.change_discard_limit(-card.ability.immutable.discard_limit_store)
        end
        if context.end_of_round and context.game_over == false and card.ability.extra.is_real == true and context.main_eval and not context.blueprint then
            SMODS.change_discard_limit(card.ability.immutable.discard_limit_store)
            card.ability.extra.is_real = false
        end
    end,--]]
    abn_artist_credits = {
        artist = "CebeeDrawz",
    },
}
