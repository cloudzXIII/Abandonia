SMODS.Joker {
    key = 'walking_jokerpedia',
    atlas = 'ABNJokerSheet23',
    pos = { x = 9, y = 3 },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,

    config = { extra = { chips = 5, mult = 2 } },

	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
	end,
	
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local vanilla_names = { "Common", "Uncommon", "Rare", "Legendary" }

            local owned = {}
            for _, joker in ipairs(G.jokers.cards) do
                local rarity = joker.config.center.rarity
                owned[vanilla_names[rarity] or rarity] = true
            end

            local all_rarities = {}
            for _, name in ipairs(vanilla_names) do all_rarities[name] = true end
            for key, rarity in pairs(SMODS.Rarities) do
                local rarity_key = rarity.key or key
                all_rarities[vanilla_names[rarity_key] or rarity_key] = true
            end

            local missing = 0
            for rarity_key in pairs(all_rarities) do
                if not owned[rarity_key] then missing = missing + 1 end
            end

            if missing > 0 then
				return {
					chips = card.ability.extra.chips * missing,
					mult = card.ability.extra.mult * missing,
				}
			end
        end
    end,

    abn_artist_credits = {
		artist = "Inky"
	},
}