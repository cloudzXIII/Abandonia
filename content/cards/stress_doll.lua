-- idk what i did here 

local function suitchecksomething(suit)
	for k, v in pairs(G.playing_cards) do
		if v.base.suit == suit then
			return true
		end
	end
end

local function tablecount(table)
	local a = 0
	for k, v in pairs(table) do
		a = a + 1
	end
	return a
end

local function gettotalranks(br)
  local a = 0
  for k, v in pairs(br) do
    a = a + v:get_id()
  end
  return a
end

SMODS.Joker({
	key = "stress_doll",
	config = { extra = {
		mult = 0,
		chips = 0,
	} },
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.mult,  cae.chips } }
	end,

	rarity = 2,
	atlas = "ABNJokerSheet22",
	pos = { x = 9, y = 3 },
	cost = 6,
	discovered = false,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.before and context.poker_hands["abn_Abyss"] and not context.blueprint then
      local scalar_table = {
        scale = gettotalranks(context.scoring_hand)
      }
			local all_suits = {}
			for k, v in pairs(context.scoring_hand) do
				all_suits[v.base.suit] = true
			end

			if tablecount(all_suits) == 1 then
				if all_suits["abn_suitless"] then
					SMODS.scale_card(card, {
						ref_table = card.ability.extra,
						ref_value = "chips",
            scalar_table = scalar_table,
						scalar_value = "scale",
						message_colour = G.C.CHIPS,
					})
				elseif all_suits["abn_Vortex"] then
					SMODS.scale_card(card, {
						ref_table = card.ability.extra,
						ref_value = "mult",
            scalar_table = scalar_table,
						scalar_value = "scale",
						message_colour = G.C.MULT,
					})
				end
			elseif tablecount(all_suits) > 1 then
        SMODS.smart_level_up_hand(card, "abn_Abyss", nil, 1)
			end
		end

    if context.joker_main then
      return{
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult
      }
    end
	end,
	abn_artist_credits = {
		artist = "TanTinch",
	},
	in_pool = function(self)
		return G.GAME.hands.abn_Abyss.visible
			and (suitchecksomething("abn_Vortex") or suitchecksomething("abn_suitless"))
	end,
})
