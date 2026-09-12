local level_up_hand_ref = level_up_hand
function level_up_hand(card, hand, instant, amount)
    local upgrade_amount = amount or 1

    if hand and G.GAME.hands[hand] then
        local vanilla_hands = {
            ["High Card"] = true,
            ["Pair"] = true,
            ["Two Pair"] = true,
            ["Three of a Kind"] = true,
            ["Straight"] = true,
            ["Flush"] = true,
            ["Full House"] = true,
            ["Four of a Kind"] = true,
            ["Straight Flush"] = true,
            ["Five of a Kind"] = true,
            ["Flush House"] = true,
            ["Flush Five"] = true
        }

        local is_vanilla = vanilla_hands[hand] and true or false

        if next(SMODS.find_card("j_abn_forgotten_joker")) then
            if upgrade_amount > 0 then
                local available_centers = {}
                for key, center in pairs(G.P_CENTERS) do
                    if center.consumeable and not center.unsent then
                        local is_center_modded = center.mod ~= nil
                        if is_vanilla and not is_center_modded then
                            table.insert(available_centers, center)
                        elseif not is_vanilla and is_center_modded then
                            table.insert(available_centers, center)
                        end
                    end
                end

                if #available_centers > 0 then
                    local chosen_center = pseudorandom_element(available_centers, pseudoseed('forgotten_joker'))
                    if chosen_center then
                        local new_card = create_card(chosen_center.set, G.consumeables, nil, nil, nil, nil, chosen_center.key, 'forgotten_joker')
                        if new_card then
                            new_card:set_edition({ negative = true }, true)
                            new_card:add_to_deck()
                            G.consumeables:emplace(new_card)
                            new_card:juice_up(0.3, 0.3)
                        end
                    end
                end
            end
        end
    end

    level_up_hand_ref(card, hand, instant, amount)
end

local ease_ante_ref = ease_ante
function ease_ante(mod)
    mod = mod or 0

    if next(SMODS.find_card("j_abn_forgotten_joker")) then
        mod = mod * 2
    end

    return ease_ante_ref(mod)
end


SMODS.Joker {
    key = 'forgotten_joker',
    rarity = 2,
    atlas = 'buggy_joker',
    pos = { x = 0, y = 0 },
    cost = 8,
	config = { extra = { chips = 0, mult = 0 } },
    discovered = false,
    blueprint_compat = true,
	
	loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.chips, card.ability.extra.mult, }
        }
    end,
	
    calculate = function(self, card, context)
		if context.before and not context.blueprint then
			local hand_name = context.scoring_name
			if hand_name and G.GAME.hands[hand_name] and G.GAME.hands[hand_name].level >= 2 then
                card.ability.temp_old_chips = G.GAME.hands[hand_name].chips
                card.ability.temp_old_mult = G.GAME.hands[hand_name].mult

				return {
					level_up = -1
				}
			end
		end

        if context.after and not context.blueprint then
            local hand_name = context.scoring_name
            if hand_name and G.GAME.hands[hand_name] and card.ability.temp_old_chips and card.ability.temp_old_mult then
                local new_chips = G.GAME.hands[hand_name].chips
                local new_mult = G.GAME.hands[hand_name].mult
                
                local chips_lost = card.ability.temp_old_chips - new_chips
                local mult_lost = card.ability.temp_old_mult - new_mult

                local vanilla_hands = {
                    ["High Card"] = true,
                    ["Pair"] = true,
                    ["Two Pair"] = true,
                    ["Three of a Kind"] = true,
                    ["Straight"] = true,
                    ["Flush"] = true,
                    ["Full House"] = true,
                    ["Four of a Kind"] = true,
                    ["Straight Flush"] = true,
                    ["Five of a Kind"] = true,
                    ["Flush House"] = true,
                    ["Flush Five"] = true
                }

                if vanilla_hands[hand_name] then
                    if chips_lost > 0 then
                        card.ability.extra.chips = card.ability.extra.chips + (chips_lost * 3)
						return {
							message = localize('k_upgrade_ex'),
                            colour = G.C.CHIPS,
						}
                    end
                else
                    if mult_lost > 0 then
                        card.ability.extra.mult = card.ability.extra.mult + (mult_lost * 3)
						return {
							message = localize('k_upgrade_ex'),
                            colour = G.C.MULT,
						}
                    end
                end

                card:juice_up(0.3, 0.3)

                card.ability.temp_old_chips = nil
                card.ability.temp_old_mult = nil
            end
        end
		
        if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				chips = card.ability.extra.chips,
			}
		end
    end,
	
    abn_artist_credits = {
        artist = "Tarkandragonbird",
    },
}