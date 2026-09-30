-- Coded by Okronix
SMODS.Joker {
    key = 'highlander_joker',
    rarity = 3,
    atlas = 'ABNJokerSheet16',
    pos = { x = 6, y = 0 },
    cost = 8,
    discovered = false,
    blueprint_compat = false,

    config = {
        extra = { mult = 0, type1 = "Straight", type2 = "Flush", suit = "abn_Sword" }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                localize(card.ability.extra.type1, "poker_hands"),
                localize(card.ability.extra.type2, "poker_hands"),
                localize(card.ability.extra.suit, 'suits_singular')
            }
        }
    end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            if context.scoring_name == card.ability.extra.type1 or context.scoring_name == card.ability.extra.type2 then
                local h_card = nil
                local chips = 0
                local cards_to_destroy = {}

                for _, v in ipairs(context.full_hand) do
                    if not h_card or v.base.nominal  > h_card.base.nominal then
                        h_card = v
                    end
                end

                if not h_card then return end

                for _, playing_card in ipairs(context.full_hand) do
                    if playing_card ~= h_card then
                        table.insert(cards_to_destroy, playing_card)
                        chips = chips + playing_card:get_chip_bonus()
                    end
                end

                h_card.ability.perma_bonus = (h_card.ability.perma_bonus or 0) + chips
                SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.CHIPS }, h_card)
                SMODS.destroy_cards(cards_to_destroy)

                if h_card:is_suit(card.ability.extra.suit) and not G.GAME.highlander_sword then
                    G.GAME.highlander_sword = true
                    card.ability.extra.mult = card.ability.extra.mult + h_card.base.nominal * 2

                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.5,
                        func = function()
                            draw_card(G.play, G.deck, 1, 'up', nil, h_card, 0.005, false, nil, 0.7)
                            G.deck:shuffle('nr' .. G.GAME.round_resets.ante)
                            return true
                        end
                    }))

                    return {
                        message = localize("k_upgrade_ex"),
                        colour = G.C.MULT
                    }
                end
            end
        end

        if context.setting_blind and not context.blueprint then
            G.GAME.highlander_sword = false
        end
    end,

    abn_artist_credits = {
        artist = "Toyrapple",
    },
}