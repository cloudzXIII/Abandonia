SMODS.Joker {
  key = 'arkham',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 0, y = 7 },
  soul_pos = { x = 1, y = 7 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,
  config = { extra = { dollars = 5 } },

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local evens_count = 0
      local odds_count = 0
      local upgraded_ranks = {} 

      -- Count evens and odds
      for i = 1, #context.scoring_hand do
        local sc = context.scoring_hand[i]
        if ABN.is_even(sc) then evens_count = evens_count + 1 end
        if ABN.is_odd(sc) then odds_count = odds_count + 1 end
      end

      -- level up
      for i = 1, #context.scoring_hand do
        local sc = context.scoring_hand[i]
        local rank = sc.base.value

        if not upgraded_ranks[rank] then
          if ABN.is_even(sc) and odds_count > 0 then
            if G.GAME.abn_rank_upgrades[rank] then
              ABN.level_up_rank(card, rank, odds_count)
              upgraded_ranks[rank] = true
            end
          elseif ABN.is_odd(sc) and evens_count > 0 then
            if G.GAME.abn_rank_upgrades[rank] then
              ABN.level_up_rank(card, rank, evens_count)
              upgraded_ranks[rank] = true
            end
          end
        end
      end
    end
	
	if context.joker_main then
		return {
			message = "muahahaha",
		}
	end
  end,

  abn_artist_credits = {
    artist = "Camostar34",
  },
}