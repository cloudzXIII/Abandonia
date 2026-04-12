
SMODS.Joker {
    key = 'streetart_joker',
    rarity = 1,
    atlas = 'AbandoniaJokers',
    pos = { x = 1, y = 13 },
    cost = 4,
    discovered = false,
    blueprint_compat = true, 
	
	loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
		return {vars = {}}
    end,
	
	calculate = function(self, card, context)
		if context.check_enhancement and context.other_card.config.center_key == "m_stone" or context.check_enhancement and context.other_card.config.center_key == "m_abn_polkadot" then
			return {
				m_wild = true --make cards function as wild cards
			}
		end
	end,

    abn_artist_credits = {
        artist = "EverSoNitro",
    },
}