if ((SMODS.Mods["Fortlatro"] or {}).can_load) then

SMODS.Joker {
  key = 'information_overload',
  rarity = 2,
  atlas = 'ABNJokerSheet10',
  pos = { x = 1, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  
  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = { key = "fn_Fire_Aura", set = "Other", vars = {} }
	info_queue[#info_queue + 1] = { key = "fn_Based_Aura", set = "Other", vars = {} }
	return {vars = {G.GAME.probabilities.normal }}
  end,

  calculate = function(self, card, context)
    if context.before and context.scoring_hand then
      for _, scoring_card in ipairs(context.scoring_hand) do
        if ABN.is_even(scoring_card) then
          scoring_card:add_sticker("fn_Fire_Aura", true)
        
        elseif ABN.is_odd(scoring_card) then
          scoring_card:add_sticker("fn_Based_Aura", true)
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Gamer9ts",
  },
}

end