SMODS.Joker {
  key = "jesterofjokers",

  atlas = "ABNJokerSheet27",
  pos = { x = 8, y = 4 },
  cost = 10,
  rarity = 3,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      asc_gain = 0.25,
      amperage = 1,
      amperage_gain = 0.4
    }
  },

  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue+1] = G.P_CENTERS.j_joker
    return {
      vars = {
        card.ability.extra.asc_gain,
        G.GAME and (G.GAME.abn_vanilla_jokers_bought or 0) * card.ability.extra.asc_gain or 0,
        card.ability.extra.amperage,
        card.ability.extra.amperage_gain
      }
    }
  end,

  calculate = function(self, card, context)
    if context.buying_card and context.card.config.center.set == "Joker" and not context.card.config.center.original_mod and not context.blueprint then
	  -- See main.lua for how G.GAME.abn_vanilla_jokers_bought is actually scaled
	  return {message = localize("k_upgrade_ex"), colour = G.C.YELLOW}
    end

    if context.joker_main then
      local ret = {asc = (G.GAME.abn_vanilla_jokers_bought or 0) * card.ability.extra.asc_gain}

      if next(SMODS.find_card("j_joker")) then
        local suits = {}
		local suit_count = 0

        for _, playing_card in ipairs(context.scoring_hand) do
          if not SMODS.has_no_suit(playing_card) then
			if SMODS.has_any_suit(playing_card) then
			  suit_count = suit_count + 1
			elseif not suits[playing_card.base.suit] then
			  suits[playing_card.base.suit] = true
			  suit_count = suit_count + 1
			end
		  end
        end

        ret.xamp = card.ability.extra.amperage + card.ability.extra.amperage_gain * suit_count
      end

      return ret
    end
  end,

  abn_artist_credits = {
    artist = "Weasel.922"
  }
}
