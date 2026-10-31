-- Virtual Boy Joker (code by Noodlemire)

SMODS.Joker{
	key = "virtual_boy_joker",
	atlas = "ABNJokerSheet8",
	rarity = 2,
	cost = 6,
	pos = {x = 7, y = 3},
	blueprint_compat = true,
	config = {extra = {uses = 1, use_gain = 1, active = false}},
	loc_vars = function(self, info_queue, joker)
		info_queue[#info_queue + 1] = {set = "abn_BlindEdition", key = "ble_abn_chthonian", vars = ABN.BlindEditions.ble_abn_chthonian:loc_vars(ABN.BlindEditions.ble_abn_chthonian).vars}
		return {vars = {joker.ability.extra.use_gain, joker.ability.extra.uses}}
	end,
	add_to_deck = function(self, joker, from_debuff)
		ABN.force_blind_edition("ble_abn_chthonian", true)
	end,
	remove_from_deck = function(self, joker, from_debuff)
		ABN.force_blind_edition("ble_abn_chthonian", false)
	end,
	abn_use_config = {colour = G.C.ORANGE, text = "USE"},
	can_use = function(self, joker)
		return G.GAME.blind and G.GAME.blind.in_blind and joker.ability.extra.uses > 0 and not joker.ability.extra.active
	end,
	use = function(self, joker)
		joker.ability.extra.uses = joker.ability.extra.uses - 1
		joker.ability.extra.active = true
		joker:juice_up()
		card_eval_status_text(joker, 'extra', nil, nil, nil, {message = localize('k_active_ex')})
	end,
	calculate = function(self, joker, context)
		if context.modify_hand and joker.ability.extra.active and context.scoring_name ~= "High Card" then
			local gain = 0
			for _, card in ipairs(context.scoring_hand) do
				if not SMODS.has_no_rank(card) then
					gain = gain + card.base.nominal
				end
			end
			if gain > 0 then
				update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {chips = G.GAME.hands[context.scoring_name].chips, mult = G.GAME.hands[context.scoring_name].mult})
				mult = mult + gain
				hand_chips = hand_chips + gain
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.2,
					func = function()
						play_sound('tarot1')
						joker:juice_up(0.8, 0.5)
						G.TAROT_INTERRUPT_PULSE = true
						return true
					end
				}))
				update_hand_text({delay = 0}, {mult = G.GAME.hands[context.scoring_name].mult + gain, StatusText = true})
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.9,
					func = function()
						play_sound('tarot1')
						joker:juice_up(0.8, 0.5)
						return true
					end
				}))
				update_hand_text({delay = 0}, {chips = G.GAME.hands[context.scoring_name].chips + gain, StatusText = true})
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.9,
					func = function()
						play_sound('tarot1')
						joker:juice_up(0.8, 0.5)
						G.TAROT_INTERRUPT_PULSE = nil
						return true
					end
				}))
				delay(1.3)
				G.E_MANAGER:add_event(Event({
					func = function()
						G.GAME.hands[context.scoring_name].mult = G.GAME.hands[context.scoring_name].mult + gain
						G.GAME.hands[context.scoring_name].chips = G.GAME.hands[context.scoring_name].chips + gain
						return true
					end
				}))
			end
		elseif context.after and joker.ability.extra.active and not context.blueprint then
			joker.ability.extra.active = false
		elseif context.end_of_round and context.main_eval and context.beat_boss and not context.blueprint then
			joker.ability.extra.uses = joker.ability.extra.uses + joker.ability.extra.use_gain
		end
	end,
	abn_artist_credits = {
		artist = "Technotoad64"
	}
}
