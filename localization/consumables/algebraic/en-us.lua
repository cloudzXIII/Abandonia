return {
	descriptions = {
		algebraic = {
			c_abn_euler = {
				name = "Euler",
				text = {
					"The next scoring {C:attention}Straight{}",
					"with no {C:attention}Ranks{} above {C:attention}6{}",
					"gives {C:white,X:chips}X#1#{} Chips",
				},
			},
			c_abn_golden = {
				name = "Golden",
				text = {
					"The next scoring {C:attention}Straight{}",
					"with no {C:attention}Ranks{} above {C:attention}10{}",
					"gives {C:white,X:mult}X#1#{} Mult",
				},
			},
			c_abn_pi = {
				name = "Pi",
				text = {
					"The next scoring {C:attention}High Card{}",
					"gives the {C:chips}Chips{} and {C:mult}Mult{}",
					"of your last scoring {C:attention}Flush{}",
					"{C:inactive}(Currently {C:white,X:mult}#1#{} {C:red}X{} {C:white,X:chips}#2#{} {C:inactive})",
				},
			},
			c_abn_number = {
				name = "Number",
				text = {
					"The next {C:attention}poker hand{} containing",
					"only {C:attention}numbered{} cards has",
					"its level upgraded once per",
					"{C:attention}unique{} number in scoring hand",
				},
			},
			c_abn_square_root = {
				name = "Square Root",
				text = {
					"The next scoring {C:attention}Four of a Kind{}",
					"with only {C:attention}numbered{} cards",
					"gives {C:white,X:chips}X#2#{} Chips",
					"and {C:white,X:mult}X#1#{} Mult",
				},
			},
			c_abn_limit_of_function = {
				name = "Limit of Function",
				text = {
					"The next scoring {C:attention}Flush{}",
					"with only {C:attention}numbered{} cards",
					"gives {C:white,X:mult}X#1#{} Mult",
					"per {C:attention}even{} card in scoring",
				},
			},
			c_abn_limit_of_sequence = {
				name = "Limit of Sequence",
				text = {
					"All cards in",
					"the next scoring {C:attention}{}Straight Flush",
					"with only {C:attention}numbered{} cards",
					"are retriggered {C:attention}#1#{} times",
				},
			},
			c_abn_divide_by_zero = {
				name = "Divide by Zero",
				text = {
					"The next scoring {C:attention}{}Full House",
					"with only {C:attention}numbered{} cards",
					"gives {C:mult}Mult{} and {C:chips}Chips{}",
					"equal to the sum of the",
					"{C:mult}Mult{} and {C:chips}Chips{} of the poker hands",
					"that are found within {C:attention}Full House",
					"{C:inactive}(ex: High Card, Pair, Three of a Kind)"
				}
			},
			c_abn_mathematical_fallacy = {
				name = "Mathematical Fallacy",
				text = {
					"The next scoring {C:dark_edition}secret{} hand",
					"with only {C:attention}numbered{} cards",
					"gives {C:gold}+#1#{} Ascension Power{}",
					"per each poker hand found within it"
				}
			},
			["c_abn_drölf"] = {
				name = "Drölf",
				text = {
					"The next scoring hand",
					"with only {C:attention}numbered{} cards",
					"and atleast {C:attention}1 {C:dark_edition}modded{} rank",
					"{C:{C:attention}}levels up{} all played cards",
					"{C:planet}planet {C:attention}ranks{} before scoring and",
					"gives {X:mult,C:white}X#1#{} Mult and",
					"{X:chips,C:white}X#2#{} Chips"
				}
			},
			c_abn_plus = {
				name = "Plus",
				text = {
					"The next scoring {C:attention}Pair{}",
					"with only {C:attention}numbered{} cards",
					"gives the sum of",
					"scored cards' ranks as {C:mult}Mult",
				},
			},
			c_abn_equal = {
				name = "Equal",
				text = {
					"The next scoring {C:attention}Three of a Kind{}",
					"rounds up mult to the next",
					"power of {C:mult}#1#{}",
					"and chips to the next",
					"power of {C:chips}#2#{}"
				},
			},
			c_abn_multiplication = {
				name = "Multiplication",
				text = {
					"The next scoring {C:attention}Double Triple{}",
					"with only {C:attention}numbered{} cards",
					"gives {X:mult,C:white}XMult{} where",
					"X is equal to the highest rank"
				},
			},
			c_abn_division = {
				name = "Division",
				text = {
					"The next scoring {C:attention}Spectrum House{}",
					"with only {C:attention}numbered{} cards",
					"gives {X:mult,C:white}XMult{} where",
					"X is equal to the highest rank"
				},
			},
			c_abn_less_than = {
				name = "Less Than",
				text = {
					"The next scoring {C:attention}Six of a Kind{}",
					"with only {C:attention}numbered{} cards",
					"gives {C:abn_amperage}Amperage{} equal",
					"to the sum of the chips",
					"of scored cards"
				},
			},
			c_abn_greater_than = {
				name = "Greater Than",
				text = {
					"The next scoring {C:attention}Flush Six{}",
					"with only {C:attention}numbered{} cards",
					"gives {C:abn_modulate}Modulate{} equal",
					"to the sum of the cards'",
					"planet ranks"
				},
			},
		},
	},
}
