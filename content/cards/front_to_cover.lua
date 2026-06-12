SMODS.Joker {
    key = "front_to_cover",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    atlas = 'ABNJokerSheet14',
    pos = { x = 7, y = 4 },
    abn_coder = "LasagnaFelidae",
    config = { extra = {chips = 0} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.before then
            for i, _card in ipairs(context.full_hand) do
                if SMODS.in_scoring(_card, context.scoring_hand) then
                    if _card.facing == "back" then
                        local rank = _card.base.id
                        if _card.base.value == "abn_14" 
                        or _card.base.value == "abn_13"
                        or _card.base.value == "abn_12"
                        or _card.base.value == "abn_11" then 
                            rank = _card.base.nominal 
                        end
                        card.ability.extra.chips = card.ability.extra.chips + rank
                        return {
                            message = "+" .. rank .. " Chips",
                            colour = G.C.CHIPS,
                            card = card,
                        }
                    end
                elseif not SMODS.in_scoring(_card, context.scoring_hand) then
                    if _card.facing == "back" then 
                        G.E_MANAGER:add_event(Event({
                            trigger = 'immediate',
                            
                            func = function()
                                draw_card(G.play, G.deck, 1, 'up', nil, _card, 0.005, false, nil, 0.7)
                                G.deck:shuffle('nr' .. G.GAME.round_resets.ante)
                                return true
                            end
                        }))
                    end
                end
            end
        end
    end,
    in_pool = function(self, args)
        for _, card in pairs(G.playing_cards or {}) do
            if card and card.facing == "back" then
                return true
            end
        end
        return false
    end,
    abn_artist_credits = {
        artist = "Sustato",
    },
}