SMODS.Joker{
    key = "la_bete_noire",
    atlas = "ABNJokerSheet23",
    pos = { x = 5, y = 4 },               
    rarity = 3,                           
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    abn_coder = "LasagnaFelidae",
    config = {
        extra = {
            ante_mod = 1,
            asc_mod = 2,
            asc = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.ante_mod, card.ability.extra.asc_mod, card.ability.extra.asc } }
    end,

    calculate = function(self, card, context)

        if context.joker_main then
            if card.ability.extra.asc > 0 then
                return {
                    asc = card.ability.extra.asc
                }
            end
        end

        if context.before and context.cardarea == G.jokers then
            local has_calamity = false
            for _, c in ipairs(G.consumeables.cards) do
                if c.ability and c.ability.set == "calamity_cards" then
                    has_calamity = true
                    break
                end
            end
            if has_calamity then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "asc",
                    scalar_value = "asc_mod"
                })
            end
        end

        if context.selling_card and context.card.ability.set == "Spectral" then
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({
                        set = "calamity_cards", 
                        area = G.consumeables, 
                    })
                    return true
                end
            }))
            return {
                message = "+1 Calamity",
                colour = G.C.SECONDARY_SET.Spectral
            }
        end

        if context.using_consumeable and context.consumeable.ability.set == "calamity_cards" then
            G.GAME.win_ante = G.GAME.win_ante + 1
            return {
                message = "+1 Ante",
                colour = G.C.FILTER
            }
        end
    end,

    in_pool = function(self, args)
        return (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.calamity_cards and G.GAME.consumeable_usage_total.calamity_cards > 0)
    end,

    add_to_deck = function(self, card, from_debuff)
        local ante_bonus = (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.calamity_cards or 0)
        G.GAME.chips_text = localize("manifold_unknown_total")
        G.GAME.current_round.current_hand.mult_text = localize("manifold_unknown")
        G.GAME.current_round.current_hand.chip_text = localize("manifold_unknown")
        if not from_debuff then
            G.GAME.win_ante = G.GAME.win_ante +ante_bonus
        end
    end,
    abn_artist_credits = {
        artist = "Inky",
    },

}
