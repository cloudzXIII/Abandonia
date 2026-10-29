SMODS.Joker {
  key = 'dreamcore_invader',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.ABN_PLAGUED, G.C.WHITE, 1.0)
  end,

  rarity = 'abn_VirusRare',
  atlas = 'ABNJokerSheet12',
  pos = { x = 0, y = 3 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  pools = { ["Plagued"] = true, },

  in_pool = function(self)
    return G.STATE ~= G.STATES.SHOP
  end,

  update = function(self, card, dt)
	if card.area == G.jokers then
		G.GAME.abn_mayhem = 0
	end
  end,

  calculate = function(self, card, context)
	if context.joker_main then
		return {
			asc = G.GAME.hands[context.scoring_name].chips,
		}
	end
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}