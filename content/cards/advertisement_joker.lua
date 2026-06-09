SMODS.Joker {
  key = 'advertisement_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet2',
  pos = { x = 7, y = 5 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  unlocked = true,
  config = { extra = { xmult = 1, chips = 0, xmultadd = 0.25, chipsadd = 10 } },


  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult, card.ability.extra.chips, card.ability.extra.xmultadd, card.ability.extra.chipsadd } }
  end,
  
  in_pool = function(self)
    if not (G.GAME and G.GAME.hands) then return false end

    local solid_state_card_used = false
    if G.GAME.consumeable_usage then
        for _, v in pairs(G.GAME.consumeable_usage) do
            if v.set == 'solid_state' then
                solid_state_card_used = true
                break 
            end
        end
    end
	
	local program_card_used = false
    if G.GAME.consumeable_usage then
        for _, v in pairs(G.GAME.consumeable_usage) do
            if v.set == 'program_pack' then
                program_card_used = true
                break 
            end
        end
    end

    return solid_state_card_used or program_card_used

  end,

  calculate = function(self, card, context) 
    -- If using a solid state card
    if context.using_consumeable and context.consumeable.ability.set == "solid_state" and not context.blueprint then
		card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
		return {
			message = localize('k_upgrade_ex'),
            colour = G.C.MULT,
            card = card
        }
    end
	
	if context.using_consumeable and context.consumeable.ability.set == "program_pack" and not context.blueprint then
		card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
		return {
			message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS,
            card = card
        }
    end
	
	if context.joker_main then
		return {
			xmult = card.ability.extra.xmult,
			chips = card.ability.extra.chips
		}
	end
	
  end,

  abn_artist_credits = {
    artist = "Vlambambo",
  },
}