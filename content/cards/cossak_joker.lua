if ((SMODS.Mods["allinjest"] or {}).can_load) then

SMODS.Joker {
  key = 'cossak_joker',
  rarity = 2, 
  atlas = 'ABNJokerSheet17',
  pos = { x = 0, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chips = 0,
      chipsadd = 10
    }
  },
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_aij_ice
    return { vars = { card.ability.extra.chips, card.ability.extra.chipsadd } }
  end,
  
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before and not context.blueprint then
      if context.scoring_hand and #context.scoring_hand > 0 then
        local gained_chips = 0
        
        for i = 1, #context.scoring_hand do
          local scoring_card = context.scoring_hand[i]
          
          if scoring_card:is_suit("abn_Snow") then 
            scoring_card:set_ability(G.P_CENTERS.m_aij_ice)
            gained_chips = gained_chips + card.ability.extra.chipsadd
          end
        end
        
        if gained_chips > 0 then
          card.ability.extra.chips = card.ability.extra.chips + gained_chips
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS
          }
        end
      end
    end

    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,

  abn_artist_credits = {
    artist = "0kronix",
  },
}

end