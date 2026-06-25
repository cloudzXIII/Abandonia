SMODS.Joker {
    key = 'ghost_in_the_machine',
    rarity = 3,
    atlas = 'ABNJokerSheet2',
    pos = { x = 6, y = 5 },
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    unlocked = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
    end,
    in_pool = function(self)
        return G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.solid_state and
            G.GAME.consumeable_usage_total.solid_state > 0
    end,

    calculate = function(self, card, context)
        -- If using a solid state card
        if context.using_consumeable and context.consumeable.ability.set == "solid_state" and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.4,
                func = function()
                    -- Generate a random Spectral card
                    local spectral_card = SMODS.add_card({
                        set = 'Spectral',
                        area = G.consumeables,
                        key_append = 'ghost',
                        edition = { negative = true }
                    })
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "Vlambambo",
    },
}
