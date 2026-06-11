SMODS.Joker {
  key = 'hustler_joker',
  rarity = 1,
  atlas = 'ABNJokerSheet2',
  pos = { x = 0, y = 5 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { dollars = 3, mult = 5, chips = 50 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars, card.ability.extra.mult, card.ability.extra.chips } }
  end,
  
  in_pool = function(self, args)
    if not G.playing_cards then return false end
    
    local has_bow = false
    local has_tie = false

    for i = 1, #G.playing_cards do
      local c = G.playing_cards[i]
      if c:is_suit("abn_Bow") then
        has_bow = true
      elseif c:is_suit("abn_Tie") then
        has_tie = true
      end
      if has_bow and has_tie then
        return true
      end
    end

    return false
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local has_bow = false
      local has_tie = false

      for i = 1, #context.scoring_hand do
        local scoring_card = context.scoring_hand[i]
        if scoring_card:is_suit("abn_Bow") then
          has_bow = true
        elseif scoring_card:is_suit("abn_Tie") then
          has_tie = true
        end
      end

      if has_bow and has_tie then
        
        return {
          dollars = card.ability.extra.dollars,
          mult = card.ability.extra.mult,
          chips = card.ability.extra.chips,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Conium Maculatum",
  },
}