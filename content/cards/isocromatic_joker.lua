SMODS.Joker {
  key = 'isocromatic_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet9',
  pos = { x = 8, y = 0 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips_gain = 100, retrigger_gain = 1, rank_levels = 2 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips_gain, card.ability.extra.retrigger_gain, card.ability.extra.rank_levels } }
  end,
  
  in_pool = function(self)
    if not G.playing_cards then return false end
    for _, v in ipairs(G.playing_cards) do
      if v.edition and (v.edition.key == 'e_foil' or v.edition.key == 'e_holo' or v.edition.key == 'e_polychrome') then
        return true
      end
    end
    return false
  end,
  
  remove_from_deck = function(self, card)
	for _, c in ipairs(G.playing_cards) do
		c.ability.foil_upgraded_this_hand = false
    end
  end,

  calculate = function(self, card, context)
    -- Reset the flag before scoring
    if context.before and not context.blueprint or context.end_of_round or context.hand_drawn then
      for _, c in ipairs(G.playing_cards) do
        c.ability.foil_upgraded_this_hand = false
      end
    end

    if context.individual and context.cardarea == G.play then
      local target_card = context.other_card
      
      if target_card.edition then
        target_card.ability.perma_repetitions = target_card.ability.perma_repetitions or 0
        target_card.ability.perma_bonus = target_card.ability.perma_bonus or 0

        -- Foil: +1 retrigger (Only applies ONCE per card per hand)
        if target_card.edition.key == 'e_foil' then
          if not target_card.ability.foil_upgraded_this_hand then
            target_card.ability.foil_upgraded_this_hand = true -- Flag it so it can't loop
            target_card.ability.perma_repetitions = target_card.ability.perma_repetitions + card.ability.extra.retrigger_gain
            return {
              message = localize('k_upgrade_ex'),
              colour = G.C.ATTENTION,
              card = target_card
            }
          end
        end

        -- Holographic +2 planet rank
        if target_card.edition.key == 'e_holo' then
          local rank_key = target_card.base.value 
          if G.GAME.abn_rank_upgrades[rank_key] then
            ABN.level_up_rank(card, rank_key, card.ability.extra.rank_levels)
            return {
              message = localize('k_level_up_ex'),
              colour = G.C.ATTENTION,
              card = target_card
            }
          end
        end

        -- Polychrome +100 chips 
        if target_card.edition.key == 'e_polychrome' then
          target_card.ability.perma_bonus = target_card.ability.perma_bonus + card.ability.extra.chips_gain
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS,
            card = target_card
          }
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Null",
  },
}