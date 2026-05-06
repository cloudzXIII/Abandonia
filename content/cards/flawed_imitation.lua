
local smods_showman_ref = SMODS.showman
function SMODS.showman(card_key)
    if next(SMODS.find_card('j_abn_flawed_imitation')) then
        return true
    end
    return smods_showman_ref(card_key)
end


SMODS.Joker {
  key = 'flawed_imitation',
  rarity = 2,
  atlas = 'ABNJokerSheet9',
  pos = { x = 2, y = 1 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      xmult = 1.5,
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult
      },
    }
  end,

  calculate = function(self, card, context)

    if context.other_joker and context.other_joker ~= card then
      local count = 0
      
	  
      for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == context.other_joker.config.center.key then
          count = count + 1
        end
      end


      if count > 1 then
        return {
          xmult = card.ability.extra.xmult * (count - 1),
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Yahooyowza",
  },
}
