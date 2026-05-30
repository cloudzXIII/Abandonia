SMODS.Joker {
    key = 'symbol_of_peace',
    rarity = "abn_SuperRare",
    atlas = 'ABNJokerSheet5',
    pos = { x = 4, y = 0 },
    cost = 25,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = {area_mod = 1,}},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.area_mod}}
    end,
    
    add_to_deck = function(self, card, from_debuff)
        ease_discard(card.ability.extra.area_mod)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.area_mod
        ease_hands_played(card.ability.extra.area_mod)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.area_mod
        SMODS.change_play_limit(card.ability.extra.area_mod)
        SMODS.change_discard_limit(card.ability.extra.area_mod)
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + card.ability.extra.area_mod
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.area_mod
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.area_mod
        
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        ease_discard(-card.ability.extra.area_mod)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.area_mod
        ease_hands_played(-card.ability.extra.area_mod)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.area_mod
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - card.ability.extra.area_mod
        SMODS.change_play_limit(-card.ability.extra.area_mod)
        SMODS.change_discard_limit(-card.ability.extra.area_mod)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.area_mod
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.area_mod
    end,
    
    
    calculate = function(self, card, context)
        if context.setting_blind then
            if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.boss then
                return {
                    message = localize('ph_boss_disabled'),
                     func = function() -- This is for timing purposes, it runs after the message
                         G.GAME.blind:disable()
                     end
                }
            end
        end
        if context.starting_shop then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    local extra_voucher_key = get_next_voucher_key(true)
                    G.shop_vouchers.config.card_limit = G.shop_vouchers.config.card_limit + 1
                    local extra_card = Card(G.shop_vouchers.T.x + G.shop_vouchers.T.w/2,
                    G.shop_vouchers.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[extra_voucher_key],{bypass_discovery_center = true, bypass_discovery_ui = true})
                    create_shop_card_ui(extra_card, 'Voucher', G.shop_vouchers)
                    extra_card:start_materialize()
                    G.shop_vouchers:emplace(extra_card)
                    return true
                end    
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    local booster_pool = get_current_pool('Booster')
                    local selected_booster = pseudorandom_element(booster_pool, 'j_abn_symbol_of_peace')
                    local it = 1
                    while selected_booster == 'UNAVAILABLE' do
                        it = it + 1
                        selected_booster = pseudorandom_element(booster_pool, 'j_abn_symbol_of_peace' .. it)
                    end
                    G.shop_booster.config.card_limit = G.shop_booster.config.card_limit + 1
                    local extra_card = SMODS.add_card({key=selected_booster, area = G.shop_booster})
                    create_shop_card_ui(extra_card, 'Booster', G.shop_booster)
                    return true
                end    
            }))
        end
    end,
    
    
    abn_artist_credits = {
        artist = "Sirtime",
    },
    
    
}
