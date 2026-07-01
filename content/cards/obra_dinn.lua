local start_dissolve_original = Card.start_dissolve

function Card:start_dissolve(...)
    if G and G.STATE and G.STATE ~= G.STATES.BLIND_SELECT then
        if ABN.is_dark(self) then
            G.GAME.dark_cards_destroyed_count = (G.GAME.dark_cards_destroyed_count or 0) + 1
            -- print("Dark card destroyed. Total:", G.GAME.dark_cards_destroyed_count)
        elseif ABN.is_light(self) then
            G.GAME.light_cards_destroyed_count = (G.GAME.light_cards_destroyed_count or 0) + 1
            -- print("Light card destroyed. Total:", G.GAME.light_cards_destroyed_count)
        end
    end

    return start_dissolve_original(self, ...)
end

SMODS.Joker {
    key = 'obra_dinn',
    rarity = 3,
    atlas = 'ABNJokerSheet6',
    pos = { x = 2, y = 5 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    config = { extra = { dark_mult = 0, light_mult = 0 } },

    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
		info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
        local dark_destroyed = G.GAME.dark_cards_destroyed_count or 0
        local light_destroyed = G.GAME.light_cards_destroyed_count or 0
        return {
            vars = { dark_destroyed, light_destroyed }
        }
    end,

    calculate = function(self, card, context)
        -- Triggers when an individual playing card is scored in a hand
        if context.individual and context.cardarea == G.play then
            local scored_card = context.other_card
            local mult_gain = 0

            -- Light suits gain mult from destroyed Dark cards
            if ABN.is_light(scored_card) then
                mult_gain = G.GAME.dark_cards_destroyed_count or 0
				return {
					mult = mult_gain
				}
            elseif ABN.is_dark(scored_card) then
				mult_gain = G.GAME.light_cards_destroyed_count or 0
                return {
					mult = mult_gain
				}
            end

        end
    end,
    
    abn_artist_credits = {
        artist = "Drsmey"
    },
}