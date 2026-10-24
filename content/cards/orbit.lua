local level_up_hand_ref = level_up_hand
function level_up_hand(card, hand, instant, amount)
    if amount and amount < 0 then
        local orbits = SMODS.find_card('j_abn_orbit')
        if next(orbits) then
            local leveled
            for _, j in ipairs(orbits) do
                if not j.ability.extra.used[hand] then leveled = j break end
            end
            if leveled then
                leveled.ability.extra.used[hand] = true
                amount = -amount
                card_eval_status_text(leveled, 'extra', nil, nil, nil, { message = localize('k_level_up_ex'), colour = G.C.ATTENTION })
            else
                return
            end
        end
    end
    return level_up_hand_ref(card, hand, instant, amount)
end

SMODS.Joker {
    key = 'orbit',
    atlas = 'ABNJokerSheet23',
    pos = { x = 5, y = 0 },
    rarity = 2,
    cost = 6,
    blueprint_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,

    config = { extra = { used = {} } },

    abn_artist_credits = {
		artist = "GM36" 
	},
}