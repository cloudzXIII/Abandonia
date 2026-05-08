SMODS.Joker {
  key = 'glossy_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet9',
  pos = { x = 5, y = 0 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      xmult = 2,
	  mult = 0,
	  multadd = 10,
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.mult,
		card.ability.extra.multadd,
      },
    }
  end,

  calculate = function(self, card, context)
    -- Individual card triggers
    if context.individual and context.cardarea == G.play then
		local currentCard = context.other_card
        if currentCard and currentCard.edition and currentCard.edition.key == 'e_abn_gloss' and not card.edition or currentCard and currentCard.edition and currentCard.edition.key == 'e_abn_gloss' and card.edition and card.edition.key ~= 'e_abn_gloss' then
			return {
				xmult = card.ability.extra.xmult, 
			}
		elseif currentCard and currentCard.edition and currentCard.edition.key == 'e_abn_gloss' and card.edition and card.edition.key == 'e_abn_gloss' then
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
			return {
				xmult = card.ability.extra.xmult, 
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
			}
		end
    end
  

    -- Scoring Logic
    if context.joker_main then
      return {
        mult = card.ability.extra.mult, 
      }
    end
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}
