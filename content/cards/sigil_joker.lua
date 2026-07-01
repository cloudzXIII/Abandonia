SMODS.Joker {
    key = 'sigil_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet6',
    pos = { x = 2, y = 2 },
    cost = 8,
    discovered = false,
    blueprint_compat = true,

    in_pool = function(self, args)
        return G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.sigils and G.GAME.consumeable_usage_total.sigils > 0
    end,

    calculate = function(self, card, context)

        if context.setting_blind and not context.blueprint then
            if G.GAME.blind and G.GAME.blind.boss and G.GAME.last_hand_played then
                local hand_to_sigil = {
                    ['High Card']       = 'c_abn_bael',
                    ['Pair']            = 'c_abn_botis',
                    ['Two Pair']        = 'c_abn_vinea',
                    ['Three of a Kind'] = 'c_abn_morax',
                    ['Four of a Kind']  = 'c_abn_bune',
                    ['Straight']        = 'c_abn_furfur',
                    ['Flush']           = 'c_abn_bifrons',
                    ['Full House']      = 'c_abn_crocell',
                    ['Straight Flush']  = 'c_abn_belial',
                    ['Five of a Kind']  = 'c_abn_astaroth',
                    ['Flush House']     = 'c_abn_asmodeus',
                    ['Flush Five']      = 'c_abn_camio',
                }

                local chosen_sigil = hand_to_sigil[G.GAME.last_hand_played]

                if not chosen_sigil then
                    local all_sigils = {}
                    for _, sigil in pairs(hand_to_sigil) do
                        table.insert(all_sigils, sigil)
                    end
                    chosen_sigil = pseudorandom_element(all_sigils, pseudorandom_seed('sigil_joker_fallback'))
                end

                if #G.consumeables.cards < G.consumeables.config.card_limit then
                    local _card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, chosen_sigil)
                    if _card then
                        _card:add_to_deck()
                        G.consumeables:emplace(_card)
                    end
                else
                    card_eval_status_text(card, 'extra', nil, nil, nil,
                        { message = "No Room!", colour = G.C.UI.TEXT_INACTIVE })
                end
            end
        end
    end,
    abn_artist_credits = {
        artist = "Robunny"
    },
}