loc_colour()
G.C.MATHS = HEX("273f45")
G.C.MATHS_SECONDARY = HEX("273f45")
G.ARGS.LOC_COLOURS["abn_Maths"] = G.C.MATHS

SMODS.ConsumableType {
  key = "maths",
  collection_rows = { 5, 5 },
  shop_rate = 0.0,
  primary_colour = G.C.MATHS,
  secondary_colour = G.C.MATHS_SECONDARY,
  text_colour = HEX("f1ba5b"),
}

local function abn_activate_math(self, card)
  set_consumeable_usage(card)
  SMODS.calculate_effect({ message = localize('k_abn_activated_ex'), colour = G.C.GREEN, sound = 'tarot1', }, card)
  SMODS.destroy_cards(card)
  SMODS.calculate_context({ abn_math_activated = true })
  G.GAME.abn_maths_activated = (G.GAME.abn_maths_activated or 0) + 1
end

SMODS.Consumable {
  key = "euler",
  set = 'maths',
  cost = 4,
  atlas = "abn_AbandoniaMath",
  pos = { x = 1, y = 3 },
  config = { extra = { xchips = 3 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xchips } }
  end,
  calculate = function(self, card, context)
    if context.final_scoring_step then
      if context.scoring_name == "Straight" then
        
        local valid_ranks = true
        for _, scoring_card in ipairs(context.scoring_hand) do
          if scoring_card:get_id() > 6 then
            valid_ranks = false
            break
          end
        end

        if valid_ranks then
          abn_activate_math(self, card)
          return {
            xchips = card.ability.extra.xchips
          }
        end

      end
    end
  end,
  abn_artist_credits = {
    artist = "La Ginger"
  },
}

SMODS.Consumable {
  key = "golden",
  set = 'maths',
  cost = 4,
  atlas = "abn_AbandoniaMath",
  pos = { x = 2, y = 3 },
  config = { extra = { xmult = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,
  calculate = function(self, card, context)
    if context.final_scoring_step then
      if context.scoring_name == "Straight" then
        
        local valid_ranks = true
        for _, scoring_card in ipairs(context.scoring_hand) do
          if scoring_card:get_id() > 10 then
            valid_ranks = false
            break
          end
        end

        if valid_ranks then
          abn_activate_math(self, card)
          return {
            xmult = card.ability.extra.xmult
          }
        end

      end
    end
  end,
  abn_artist_credits = {
    artist = "La Ginger"
  },
}

SMODS.Consumable {
  key = "pi",
  set = 'maths',
  cost = 4,
  atlas = "abn_AbandoniaMath",
  pos = { x = 3, y = 3 },
  config = { extra = { mult = 0, chips = 0 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
  end,
  calculate = function(self, card, context)
    if context.final_scoring_step then
	  if context.scoring_name == "Flush" then
          card.ability.extra.mult = G.GAME.hands["Flush"].mult
		  card.ability.extra.chips = G.GAME.hands["Flush"].chips
		  return {
			message = localize('k_upgrade_ex'),
			card = card,
		  }
      end
	  
      if context.scoring_name == "High Card" and card.ability.extra.mult > 0 then
        abn_activate_math(self, card)
        return {
          mult = card.ability.extra.mult,
		  chips = card.ability.extra.chips,
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "La Ginger"
  },
}

SMODS.Consumable {
  key = "number",
  set = 'maths',
  cost = 4,
  atlas = "abn_AbandoniaMath",
  pos = { x = 4, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.before then
      local only_numbers = true
      for _, scoring_card in ipairs(context.scoring_hand) do
        if not ABN.is_number(scoring_card) then
          only_numbers = false
          break
        end
      end

      if only_numbers and #context.scoring_hand > 0 then
        local unique_ranks = {}
        local count = 0
        for _, scoring_card in ipairs(context.scoring_hand) do
          local id = scoring_card:get_id()
          if not unique_ranks[id] then
            unique_ranks[id] = true
            count = count + 1
          end
        end

        if count > 0 then
          abn_activate_math(self, card)
          return {
			level_up = count,
			message = localize('k_level_up_ex')
		  }
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "La Ginger"
  },
}