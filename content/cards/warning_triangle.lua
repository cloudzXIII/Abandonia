local abn_set_cost_ref = Card.set_cost
function Card:set_cost()
    if self.ability and self.ability.abn_base_price and self.edition then
        local stored_edition = self.edition
        self.edition = nil
        abn_set_cost_ref(self)
        self.edition = stored_edition
    else
        abn_set_cost_ref(self)
    end
end

local abn_create_card_for_shop_ref = create_card_for_shop
function create_card_for_shop(area)
    if G.GAME and area and area == G.shop_jokers then
        local forced_data = G.GAME.abn_warning_triangle_forced
        if not forced_data or forced_data.round ~= G.GAME.round then
            forced_data = { round = G.GAME.round, count = 0 }
            G.GAME.abn_warning_triangle_forced = forced_data
        end

        if forced_data.count < #SMODS.find_card('j_abn_warning_triangle') then
            forced_data.count = forced_data.count + 1

            local forced_joker = SMODS.create_card({
                set = 'Joker',
                area = area,
                edition = pseudorandom_element({ 'e_foil', 'e_holo', 'e_polychrome' },
                    pseudoseed('abn_warning_triangle_shop')),
                key_append = 'abn_warning_triangle',
            })
            forced_joker.ability.abn_base_price = true
            forced_joker:set_cost()
            create_shop_card_ui(forced_joker, 'Joker', area)
            return forced_joker
        end
    end
    return abn_create_card_for_shop_ref(area)
end

SMODS.Joker {
    key = "warning_triangle",
    atlas = "ABNJokerSheet25",
    pos = { x = 6, y = 1 },
    rarity = 1,
    cost = 5,
    discovered = false,
    blueprint_compat = false,

    config = {
        extra = {
            blind_edition_keys = { "ble_abn_gloss", "ble_abn_pearlescent", "ble_abn_iridescent" },
        },
    },

    abn_artist_credits = {
        artist = "Yahooyowza",
    },

    loc_vars = function(self, info_queue, card)
        for _, blind_edition_key in ipairs(card.ability.extra.blind_edition_keys) do
            local blind_edition = ABN.BlindEditions[blind_edition_key]
            if blind_edition then
                info_queue[#info_queue + 1] = {
                    set = "abn_BlindEdition",
                    key = blind_edition_key,
                    vars = blind_edition:loc_vars(blind_edition).vars
                }
            end
        end
        info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
        info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
        info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
    end,

    add_to_deck = function(self, card, from_debuff)
        for _, blind_edition_key in ipairs(card.ability.extra.blind_edition_keys) do
            ABN.force_blind_edition(blind_edition_key, true)
        end
        if G.GAME and G.GAME.round_resets and G.GAME.round_resets.blind_states then
            for _, blind_type in ipairs(G.GAME.round_resets.blind_order or {}) do
                local state = G.GAME.round_resets.blind_states[blind_type]
                if state == "Select" or state == "Upcoming" then
                    ABN.add_edition_to_blind(blind_type)
                end
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        for _, blind_edition_key in ipairs(card.ability.extra.blind_edition_keys) do
            ABN.force_blind_edition(blind_edition_key, false)
        end
    end,
}