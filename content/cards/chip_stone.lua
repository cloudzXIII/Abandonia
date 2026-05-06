SMODS.Joker {
  key = 'chip_stone',
  rarity = 2,
  atlas = 'ABNJokerSheet9',
  pos = { x = 4, y = 1 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chips = 20,
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips
      },
    }
  end,
  
  in_pool = function(self)
    if not G.playing_cards then return false end
    for _, v in ipairs(G.playing_cards) do
      if v.config.center == G.P_CENTERS.m_stone then
        return true
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local target = context.other_card
      
      -- Check if the scoring card is a Stone Card
      if target.config.center == G.P_CENTERS.m_stone then
        
        -- Permanently increase card's bonus chips
        target.ability.perma_bonus = (target.ability.perma_bonus or 0) + card.ability.extra.chips
        
        -- Give the card the Foil Edition
        target:set_edition({foil = true}, true)

        return {
            message = localize('k_upgrade_ex'),
            colour = G.C.BLUE,
			card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "technotoad64",
  },
}
