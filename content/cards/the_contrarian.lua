SMODS.Joker {
  key = 'the_contrarian',
  rarity = 3,
  atlas = 'ABNJokerSheet25',
  pos = { x = 2, y = 4 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      x_mult=1,
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult,
      },
    }
  end,


  calculate = function(self, card, context)
    if context.joker_main then
        local scoring_cards = 0
        for i,v in ipairs(context.scoring_hand) do
            if v.debuff then
                scoring_cards=scoring_cards+1
            end
        end
        return {
            x_mult=math.max(card.ability.extra.x_mult*scoring_cards,1),
        }
    end
  end,
  in_pool = function (self)
    -- Needs to implement so it only appears when a debuffed face card is played
    return true
  end,
  abn_artist_credits = {
    artist = "IPreferCheedar",
  },
}