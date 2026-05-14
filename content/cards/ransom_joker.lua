
SMODS.Joker {
  key = 'ransom_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet8',
  pos = { x = 2, y = 5 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { odds = 10, dollars = 1 } },
  
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
    return { vars = { numerator, denominator, card.ability.extra.dollars } }
  end,
  
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
	  card.ability.extra_value = card.ability.extra_value + (#G.jokers.cards * card.ability.extra.dollars)
	  card:set_cost()
      return {
		message = localize('k_val_up'),
		dollars = #G.jokers.cards*-card.ability.extra.dollars,
		card = card,
      }
    end
	
	if context.selling_card and context.card.ability.set == 'Joker' or context.destroy_card and context.card.ability.set == 'Joker' then
		local rarity = context.card.config.center.rarity
		if SMODS.pseudorandom_probability(card, 'ransom', 1, card.ability.extra.odds) then
			if rarity == 1 then
				SMODS.add_card {
				set = "Joker",
				rarity = "Uncommon",
				key_append = "abn_ransom"
				}
			elseif rarity == 2 then
				SMODS.add_card {
				set = "Joker",
				rarity = "Rare",
				key_append = "abn_ransom"
				}
			elseif rarity == 3 then
				SMODS.add_card {
				set = "Joker",
				rarity = "Legendary",
				key_append = "abn_ransom"
				}
			elseif rarity == 4 then
				SMODS.add_card {
				set = "Joker",
				rarity = "abn_SuperRare",
				key_append = "abn_ransom"
				}
			elseif rarity == "abn_SuperRare" then
				SMODS.add_card {
				set = "Joker",
				rarity = "abn_ParallelRare",
				key_append = "abn_ransom"
				}
			elseif rarity == "abn_ParallelRare" then
				SMODS.add_card {
				set = "Joker",
				rarity = "abn_ParallelRare",
				key_append = "abn_ransom"
				}
			end
		else
			card_eval_status_text(card, 'extra', nil, nil, nil, {
				message = localize('k_nope_ex'),
				colour = G.C.SECONDARY_SET.Tarot,
			})
		end
	end
  end,
  
  abn_artist_credits = {
    artist = "Da Gorbage Rat",
  },
}