SMODS.Joker {
  key = 'entropic_diamonds',
  rarity = 2,
  atlas = 'ABNJokerSheet12',
  pos = { x = 9, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = { 
    extra = { 
      chips = 0, 
    } 
  }, 

  loc_vars = function(self, info_queue, card)
    return { 
      vars = {  
        card.ability.extra.chips, 
      } 
    }
  end,

  calculate = function(self, card, context) 
    -- Destroy Diamonds
    if context.destroy_card and context.cardarea == G.play then
      if context.destroy_card:is_suit("Diamonds") then
        local destroyed_chips = context.destroy_card.base.nominal
        
        card.ability.extra.chips = card.ability.extra.chips + destroyed_chips
        
        return {
          remove = true,
          message = localize('k_upgrade_ex'),
          colour = G.C.CHIPS
        }
      end
    end

    -- Scoring
    if context.joker_main and card.ability.extra.chips > 0 then
      return {
        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
        chip_mod = card.ability.extra.chips,
        colour = G.C.CHIPS
      }
    end
  end, 

  abn_artist_credits = {
    artist = "Squaredot",
  },
}