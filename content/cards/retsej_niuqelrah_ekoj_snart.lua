-- Four very similar jokers (code by Noodlemire)
-- See utilities/hooks.lua for how custom contexts are defined

local joker_info = {
	retsej = {
		pos = {x = 5, y = 4},
		check = function(card) return card.edition and SMODS.Centers[card.edition.key].original_mod end,
		change = function(card)
			card:set_edition(SMODS.poll_edition({guaranteed = true, options = {"e_foil", "e_holo", "e_polychrome", "e_negative"}}))
		end,
		custom_context_check = function(context)
			return context.abn_changing_edition and SMODS.Centers[context.old_edition].original_mod and not SMODS.Centers[context.new_edition].original_mod
		end
	},
	niuqelrah = {
		pos = {x = 6, y = 4},
		check = function(card) return card.seal and SMODS.Seals[card.seal].original_mod end,
		change = function(card)
			card:set_seal(SMODS.poll_seal({guaranteed = true, options = {"Red", "Gold", "Blue", "Purple"}}), false, true)
		end,
		custom_context_check = function(context)
			return context.abn_changing_seal and SMODS.Seals[context.old_seal].original_mod and not SMODS.Seals[context.new_seal].original_mod
		end
	},
	ekoj = {
		pos = {x = 7, y = 4},
		check = function(card) return next(SMODS.get_enhancements(card)) and G.P_CENTERS[card.config.center.key].original_mod end,
		change = function(card)
			card:set_ability(SMODS.poll_enhancement({guaranteed = true, options = {"m_mult", "m_bonus", "m_wild", "m_glass", "m_stone", "m_steel", "m_lucky", "m_gold"}}), false, true)
		end,
		custom_context_check = function(context)
			return context.abn_changing_enhancement and G.P_CENTERS[context.old_enhancement].original_mod and not G.P_CENTERS[context.new_enhancement].original_mod
		end
	},
	snart = {
		pos = {x = 8, y = 4},
		check = ABN.is_modded_suit,
		change = function(card)
			local suit = pseudorandom_element({"Spades", "Clubs", "Hearts", "Diamonds"}, "j_abn_snart_suit")
			SMODS.change_base(card, suit)
		end,
		custom_context_check = function(context)
			return context.abn_changing_suit and SMODS.Suits[context.old_suit].original_mod and not SMODS.Suits[context.new_suit].original_mod
		end
	},
}

for k, v in pairs(joker_info) do
	SMODS.Joker{
		key = k.."_joker",
		atlas = "ABNJokerSheet16",
		rarity = 2,
		cost = 8,
		pos = v.pos,
		blueprint_compat = true,
		config = {extra = {asc = k == "niuqelrah" and 0.45 or 0.25, amp_gain = 0.3, amp = 0}},
		loc_vars = function(self, info_queue, joker)
			return {vars = {joker.ability.extra.asc, joker.ability.extra.amp_gain, joker.ability.extra.amp}}
		end,
		calculate = function(self, joker, context)
			if context.individual and context.cardarea == G.play and v.check(context.other_card) and not context.blueprint then
				local card = context.other_card
				SMODS.scale_card(card, {
					ref_table = card.ability,
					ref_value = "slib_perma_plus_asc",
					scalar_table = joker.ability.extra,
					scalar_value = "asc",
					message_colour = G.C.YELLOW,
					operation = function(ref_table, ref_value, initial, change)
						ref_table[ref_value] = initial + change
						v.change(card)
					end
				})
			elseif v.custom_context_check(context) and not context.blueprint then
				SMODS.scale_card(joker, {
					ref_table = joker.ability.extra,
					ref_value = "amp",
					scalar_value = "amp_gain",
					message_colour = G.C.ABN_AMPERAGE
				})
			elseif context.joker_main and joker.ability.extra.amp ~= 0 then
				return {amp = joker.ability.extra.amp}
			end
		end,
		abn_artist_credits = {
			artist = "Da Gorbage Rat"
		},
		in_pool = function(self, args)
			for _, card in ipairs(G.playing_cards or {}) do
				if v.check(card) then
					return true
				end
			end
			return false
		end
	}
end
