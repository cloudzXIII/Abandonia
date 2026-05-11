if ((SMODS.Mods["ortalab"] or {}).can_load) then

SMODS.Joker {
  key = 'joker_jester',
  rarity = 3,
  atlas = 'AbandoniaCrossmod',
  pos = { x = 1, y = 4 },
  soul_pos = { x = 2, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      
	  chips = 100,
	  mult = 20,
	  xmult = 2,
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
		card.ability.extra.chips,
		card.ability.extra.mult,
        card.ability.extra.xmult,
      },
    }
  end,


  calculate = function(self, card, context)
	
	if context.other_joker and context.other_joker ~= card and context.other_joker:is_rarity("Common") then
        return {
			chips = card.ability.extra.chips
        }
    elseif context.other_joker and context.other_joker ~= card and context.other_joker:is_rarity("Uncommon") then
        return {
			mult = card.ability.extra.mult
        }
	elseif context.other_joker and context.other_joker ~= card and context.other_joker:is_rarity("Rare") then
        return {
			xmult = card.ability.extra.xmult
        }
    end
  end,

  abn_artist_credits = {
    artist = "Bunnet",
  },
}

end