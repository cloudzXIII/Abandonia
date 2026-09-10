SMODS.Joker {
  key = 'dungeon_crawler',
  rarity = "abn_SuperRare",
  atlas = 'ABNJokerSheet22',
  pos = { x = 7, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = false,
  config = {
    extra = {
      cost = 20,
      slots_added = 0,
      asc_joker = 1,
      asc_card = 1,
      asc_match = 1,
      ascension_power = 0
    }
  },

  abn_use_config = { colour = G.C.GOLD, text = "BUY SLOT" },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.cost,
        card.ability.extra.asc_joker,
        card.ability.extra.asc_card,
        card.ability.extra.asc_match,
        card.ability.extra.ascension_power
      }
    }
  end,

  can_use = function(self, card)
    return G.GAME and G.GAME.dollars >= card.ability.extra.cost
  end,

  use = function(self, card)
    ease_dollars(-card.ability.extra.cost)
    G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    card.ability.extra.slots_added = card.ability.extra.slots_added + 1
    card:juice_up(0.5, 0.5)
  end,

  is_vanilla_edition = function(self, edition)
    if not edition then return false end
    return edition.foil or edition.holo or edition.polychrome or edition.negative
  end,

  get_edition_key = function(self, edition)
    if not edition then return nil end
    if edition.foil then return 'foil' end
    if edition.holo then return 'holo' end
    if edition.polychrome then return 'polychrome' end
    if edition.negative then return 'negative' end
    return nil
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local sc = context.other_card
      if self:is_vanilla_edition(sc.edition) then
		if sc:is_suit("Hearts") or sc:is_suit("Spades") or sc:is_suit("Clubs") or sc:is_suit("Diamonds") then
			local card_edition = self:get_edition_key(sc.edition)
			local matches = 0
			if G.jokers and G.jokers.cards then
			for _, j in ipairs(G.jokers.cards) do
				if self:is_vanilla_edition(j.edition) then
				if self:get_edition_key(j.edition) == card_edition then
					matches = matches + 1
				end
				end
			end
			end

			if matches > 0 then
			local gain = matches * card.ability.extra.asc_match
			card.ability.extra.ascension_power = card.ability.extra.ascension_power + gain
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.GOLD,
				card = card
			}
			end
		end
      end
    end

    if context.joker_main then
      local total_ascension = card.ability.extra.ascension_power

      if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
          if self:is_vanilla_edition(j.edition) then
            total_ascension = total_ascension + card.ability.extra.asc_joker
          end
        end
      end

      if context.scoring_hand then
        for _, sc in ipairs(context.scoring_hand) do
          if self:is_vanilla_edition(sc.edition) then
            total_ascension = total_ascension + card.ability.extra.asc_card
          end
        end
      end

      if total_ascension > 0 then
        return {
          asc = total_ascension,
          card = card
        }
      end
    end
  end,

  update = function(self, card)
    if not G.GAME or not G.jokers or not G.jokers.cards then return end

    local held_jokers = #G.jokers.cards
    local extra_ante_needed = math.max(0, held_jokers - 5)

    G.GAME.abn_dungeon_extra_ante = G.GAME.abn_dungeon_extra_ante or 0

    if G.GAME.abn_dungeon_extra_ante ~= extra_ante_needed then
      local diff = extra_ante_needed - G.GAME.abn_dungeon_extra_ante
      G.GAME.win_ante = math.max(1, G.GAME.win_ante + diff)
      G.GAME.abn_dungeon_extra_ante = extra_ante_needed
    end
  end,

  remove_from_deck = function(self, card, from_debuff)
    if card.ability.extra.slots_added > 0 then
      G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - card.ability.extra.slots_added)
      card.ability.extra.slots_added = 0
    end

    if G.GAME and G.GAME.abn_dungeon_extra_ante and G.GAME.abn_dungeon_extra_ante > 0 then
      G.GAME.win_ante = math.max(1, G.GAME.win_ante - G.GAME.abn_dungeon_extra_ante)
      G.GAME.abn_dungeon_extra_ante = 0
    end
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}