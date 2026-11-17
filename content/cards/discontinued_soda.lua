SMODS.Joker {
    key = "discontinued_soda",
    atlas = "ABNJokerSheet25",
    pos = { x = 8, y = 1 },
    rarity = 3,
    cost = 6,
    discovered = false,
    blueprint_compat = false,

    abn_artist_credits = {
        artist = "Yahooyowza",
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_discontinued
    end,

    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_abn_discontinued') then
                return true
            end
        end
        return false
    end,

    calculate = function(self, card, context)
        if context.blueprint then return end

        if context.end_of_round and context.main_eval and not context.game_over and G.GAME.blind then
            local blind_type = G.GAME.blind:get_type()
            if blind_type == 'Boss' or (blind_type == 'Big' and next(SMODS.find_card('j_diet_cola'))) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local random_tag = Tag(get_next_tag_key('abn_discontinued_soda'))

                        if random_tag.name == 'Orbital Tag' then
                            local visible_hands = {}
                            for hand_key, hand_data in pairs(G.GAME.hands) do
                                if hand_data.visible then
                                    visible_hands[#visible_hands + 1] = hand_key
                                end
                            end
                            random_tag.ability.orbital_hand = pseudorandom_element(visible_hands,
                                pseudoseed('abn_discontinued_soda_orbital'))
                        end

                        add_tag(random_tag)
                        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
            end
        end
    end,
}
