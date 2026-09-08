SMODS.Consumable {
    key = "curse_mark",
    set = "ruinous_power",
    config = { extra = {} },
    pos = { x = 4, y = 0 },
    soul_pos = { x = 4, y = 1 },
    atlas = "AbandoniaRuin",
    cost = 4,
    discovered = false,
    hidden = true,
    soul_set = "calamity_cards",
    soul_rate = 0.035,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
        return { vars = {} }
    end,

    can_use = function(self, card)
        if card.area == G.consumeables or card.area == G.pack_cards then
            if G.ruinous_powers and #G.ruinous_powers.cards < G.ruinous_powers.config.card_limit then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            func = function()
                local copy = copy_card(card)
                G.ruinous_powers:emplace(copy)
                return true
            end
        }))
    end,

    calculate = function(self, card, context)
        if card.area ~= G.ruinous_powers then return end

        if context.individual and context.cardarea == G.play then
            if SMODS.has_no_rank(context.other_card) then
                G.E_MANAGER:add_event(Event({
                    func = function()
					
                        card:start_dissolve()
						
                        local destroyed_cards = {}
                        for i = #G.playing_cards, 1, -1 do
                            local target_card = G.playing_cards[i]
                            if SMODS.has_no_rank(target_card) then
                                destroyed_cards[#destroyed_cards + 1] = target_card
                                target_card:start_dissolve()
                            end
                        end

                        return true
                    end
                }))

                return {
                    message = localize('k_destroyed'),
                    colour = G.C.RED,
                    card = card
                }
            end

            local nominal_val = context.other_card.base.nominal or 0
            
            -- Turn played card into a Stone Card after reading nominal value
            context.other_card:set_ability(G.P_CENTERS.m_stone, nil, true)

            return {
                asc = nominal_val,
                card = card
            }
        end
    end,

    abn_artist_credits = {
        artist = "0kronix",
    },
}