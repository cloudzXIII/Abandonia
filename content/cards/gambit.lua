-- Gambit (code by Noodlemire)

--[[
Swaps current Chips with
current Score and
multiplies both by X3

Each scoring card has a
1 in 4 chance to be destroyed

Each destroyed card will
increase this joker's multiplier
by 0.2X and draw a copy
of the destroyed card to hand
--]]

local function face_down_hand(hand)
	for _, card in ipairs(hand) do
		if card.facing == "back" then
			return true
		end
	end
	return false
end

SMODS.Joker{
	key = "gambit",
	atlas = "AbandoniaLegendary",
	rarity = 4,
	cost = 20,
	pos = {x = 6, y = 1},
	soul_pos = {x = 7, y = 1},
	blueprint_compat = true,
	config = {extra = {multiplier = 3, increase = 0.2, odds = 4}},
	loc_vars = function(self, info_queue, joker)
		local num, den = SMODS.get_probability_vars(joker, 1, joker.ability.extra.odds)
		return {vars = {joker.ability.extra.multiplier, num, den, joker.ability.extra.increase}}
	end,
	calculate = function(self, joker, context)
		if context.pre_discard and not context.blueprint and not joker.abn_discard_quipped then
			joker.abn_discard_quipped = self:abn_say_stuff(joker, "abn_gambit_discard", 11)
		elseif context.press_play and not context.blueprint and (G.GAME.current_round.hands_played > 0 or joker.abn_greeting_quipped) and face_down_hand(G.hand.highlighted) then
			G.E_MANAGER:add_event(Event({
				func = function()
					self:abn_say_stuff(joker, "abn_gambit_facedown", 18)
					return true
				end
			}))
		elseif context.before and not context.blueprint then
			if G.GAME.current_round.hands_played == 0 and not joker.abn_greeting_quipped then
				joker.abn_greeting_quipped = self:abn_say_stuff(joker, "abn_gambit_greeting", 19)
			elseif ABN.is_modded_hand(context.scoring_name) then
				self:abn_say_stuff(joker, "abn_gambit_moddedhand", 12)
			elseif #context.scoring_hand == 5 then
				self:abn_say_stuff(joker, "abn_gambit_fivecards", 18)
			end
		elseif context.final_scoring_step then
			local diff = hand_chips - G.GAME.chips
			SMODS.calculate_effect({
				chips = -diff,
				score = diff
			}, joker)
			SMODS.calculate_effect({
				x_chips = joker.ability.extra.multiplier,
				x_score = joker.ability.extra.multiplier
			}, joker)
		elseif context.destroy_card and context.cardarea == G.play and not context.blueprint and SMODS.pseudorandom_probability(joker, "j_abn_gambit", 1, joker.ability.extra.odds) then
			return {remove = true}
		elseif context.remove_playing_cards then
			if not context.blueprint then
				G.E_MANAGER:add_event(Event({
					func = function()
						self:abn_say_stuff(joker, "abn_gambit_destroy", 13)
						return true
					end
				}))
				SMODS.scale_card(joker, {
					ref_table = joker.ability.extra,
					ref_value = "multiplier",
					scalar_value = "increase",
					operation = function(ref_table, ref_value, initial, change)
						ref_table[ref_value] = initial + change * #context.removed
					end
				})
			end
			local to_hand = G.GAME.blind.in_blind or #G.hand.cards > 0
			for _, removed in ipairs(context.removed) do
				local copy = SMODS.copy_card(removed, {area = to_hand and G.hand or G.deck})
				if to_hand then
					copy.states.visible = nil
					G.E_MANAGER:add_event(Event({
						func = function()
							copy:start_materialize()
							return true
						end
					}))
				end
			end
		end
	end,
	abn_artist_credits = {
		artist = "Comkyel"
	},
	abn_say_stuff = function(self, joker, key, n)
		if joker.abn_talking then return false end
		joker.abn_talking = true
		if not joker.children.abn_speech_bubble then
			joker.children.abn_speech_bubble = UIBox{
				definition = G.UIDEF.speech_bubble(key, {quip = true}),
				config = {align = "bm", offset = {x = 0, y = 0}, parent = joker}
			}
			joker.children.abn_speech_bubble:set_role{
				role_type = 'Minor',
				xy_bond = 'Weak',
				r_bond = 'Strong',
				major = joker,
			}
			joker.children.abn_speech_bubble.states.visible = false
		end
		local i = 0
		joker.abn_event = function()
			return Event({
				trigger = 'after',
				delay = 0.13 * G.SETTINGS.GAMESPEED,
				blockable = false,
				blocking = false,
				func = function()
					if joker.children.abn_speech_bubble then joker.children.abn_speech_bubble.states.visible = true end
					i = i + 1
					--For timing purposes, allow an extra silent iteration before speech bubble disappears
					if i > n then
						if joker.children.abn_speech_bubble then
							joker.children.abn_speech_bubble:remove()
							joker.children.abn_speech_bubble = nil
						end
						joker.abn_talking = false
					else
						if i <= math.floor(n/3 + 0.5) and i % 2 == 0 then joker:juice_up() end
						play_sound("voice"..math.random(1, 11), (math.random()*0.2+1), 0.5)
						G.E_MANAGER:add_event(joker.abn_event())
					end
					return true
				end
			})
		end
		G.E_MANAGER:add_event(joker.abn_event())
		return true
	end
}
