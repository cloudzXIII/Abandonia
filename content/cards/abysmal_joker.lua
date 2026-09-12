-- Abysmal Joker (code by Noodlemire)

--[[
Chthonian cards have X4
values while being scored

If the score catches fire from
a hand of only Chthonian cards,
create a number of Negative modded
consumable cards equal to the
number of scoring cards

If this joker is Chthonian,
6s increase their level of
Planet Rank when scored by 1
--]]

SMODS.Joker{
	key = "abysmal_joker",
	atlas = "ABNJokerSheet24",
	rarity = 3,
	cost = 8,
	pos = {x = 7, y = 4},
	blueprint_compat = true,
	config = {extra = {boost = 4, levelup = 1}},
	loc_vars = function(self, info_queue, joker)
		if not joker.edition or joker.edition.key ~= "e_abn_chthonian" then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chthonian
		end
		info_queue[#info_queue + 1] = G.P_CENTERS.e_negative_consumable
		return {vars = {joker.ability.extra.boost, joker.ability.extra.levelup}}
	end,
	calculate = function(self, joker, context)
		if context.before then
			for _, card in ipairs(context.scoring_hand) do
				if card.edition and card.edition.key == "e_abn_chthonian" then
					Spectrallib.manipulate(card, {type = "X", value = joker.ability.extra.boost})
				end
			end
		elseif context.after then
			for _, card in ipairs(context.scoring_hand) do
				if card.edition and card.edition.key == "e_abn_chthonian" then
					Spectrallib.manipulate(card, {type = "X", value = 1 / joker.ability.extra.boost})
				end
			end
			if SMODS.last_hand_oneshot and #context.scoring_hand > 0 then
				for _, card in ipairs(context.scoring_hand) do
					if not card.edition or card.edition.key ~= "e_abn_chthonian" then
						return
					end
				end
				for i = 1, #context.scoring_hand do
					G.E_MANAGER:add_event(Event({
				        func = function()
							local card = SMODS.add_card({key = SMODS.poll_object({
								set = "Consumeables",
								seed = "j_abn_abysmal_joker",
								filter = function(pool)
									local filtered = {}
									for _, obj in ipairs(pool) do
										if G.P_CENTERS[obj.key] and G.P_CENTERS[obj.key].original_mod then
											table.insert(filtered, obj)
										end
									end
									return filtered
								end
							})})
							card:set_edition("e_negative")
							return true
						end
					}))
				end
			end
		elseif context.individual and context.cardarea == G.play and joker.edition and joker.edition.key == "e_abn_chthonian" and context.other_card:get_id() == 6 then
			ABN.level_up_rank(joker, "6", joker.ability.extra.levelup, true)
			return {message = localize("k_upgrade_ex")}
		end
	end,
	abn_artist_credits = {
		artist = "Cubegetsreal"
	},
	in_pool = function(self, args)
		for _, card in ipairs(G.playing_cards or {}) do
			if card.edition and card.edition.key == "e_abn_chthonian" then
				return true
			end
		end
		return false
	end
}

--[[local old_calculate_individual_effect = SMODS.calculate_individual_effect
function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
	if scored_card.area == G.play and scored_card.edition and scored_card.edition.key == "e_abn_chthonian" and type(amount) == "number" then
		for _, joker in ipairs(SMODS.find_card("j_abn_abysmal_joker")) do
			amount = amount * joker.ability.extra.boost
			G.E_MANAGER:add_event(Event({
				func = function()
					joker:juice_up()
					return true
				end
			}))
		end
	end
	return old_calculate_individual_effect(effect, scored_card, key, amount, from_edition)
end--]]
