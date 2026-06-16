-- Rip enhancement tracking from Fortlatro
local add_to_deckref = Card.add_to_deck
function Card.add_to_deck(self, from_debuff)
    if not self.added_to_deck then
        if not from_debuff then
            if self.config and self.config.center and self.config.center.set == "Enhanced" then
                G.GAME.purchased_enhancements = G.GAME.purchased_enhancements or {}
                local enh_key = self.config.center.key or "UnknownEnhancement"
                G.GAME.last_enhancement = enh_key
                local already_added = false
                for _, stored_key in ipairs(G.GAME.purchased_enhancements) do
                    if stored_key == enh_key then
                        already_added = true
                        break
                    end
                end
                if not already_added then
                    table.insert(G.GAME.purchased_enhancements, enh_key)
                end
            end 
        end
    end

    return add_to_deckref(self, from_debuff)
end

local old_set_ability = Card.set_ability
function Card:set_ability(ability, silent)
    local ret = old_set_ability(self, ability, silent)

    if ability and self.area == G.hand and self.config and self.config.center then
        if self.config.center.set == "Enhanced" then
            G.GAME.purchased_enhancements = G.GAME.purchased_enhancements or {}
            local enh_key = self.config.center.key or "UnknownEnhancement"
            G.GAME.last_enhancement = enh_key

            local already_added = false
            for _, stored_key in ipairs(G.GAME.purchased_enhancements) do
                if stored_key == enh_key then
                    already_added = true
                    break
                end
            end

            if not already_added then
                table.insert(G.GAME.purchased_enhancements, enh_key)
            end
        end
    end

    return ret
end


SMODS.Joker {
    key = 'aesthetic_joker',
    abn_coder = "LasagnaFelidae",
    
    config = { extra = { chipsadd = 20 } },
    rarity = 2,
    cost = 6,
    atlas = 'ABNJokerSheet4',
    pos = { x = 5, y = 4 },
    discovered = false,
    blueprint_compat = true,   
    
    loc_vars = function(self, info_queue, card)
        local count = (G and G.GAME and type(G.GAME.purchased_enhancements) == "table") and #G.GAME.purchased_enhancements or 0
        local total_chips = count * card.ability.extra.chipsadd
        
        return { 
            vars = { card.ability.extra.chipsadd, total_chips } 
        }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            local count = (G and G.GAME and type(G.GAME.purchased_enhancements) == "table") and #G.GAME.purchased_enhancements or 0
            local total_chips = count * card.ability.extra.chipsadd
            
            if total_chips > 0 then
                return {
                    chips = total_chips
                }
            end
        end
		
		if card.edition and context.individual and context.cardarea == G.play then
            if context.other_card.config.center ~= G.P_CENTERS.c_base then
				return {
					mult = context.other_card.base.nominal
				}
            end
		end
		
    end,

    abn_artist_credits = {
        artist = "inky",
    },

    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if next(SMODS.get_enhancements(playing_card)) then
                return true
            end
        end
        return false
    end
}