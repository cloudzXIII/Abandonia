if ((SMODS.Mods["ortalab"] or {}).can_load) then

local smods_showman_ref = SMODS.showman
function SMODS.showman(card_key)
    if next(SMODS.find_card('j_abn_recursive_joker')) then
        return true
    end
    return smods_showman_ref(card_key)
end


SMODS.Joker {
  key = 'recursive_joker',
  rarity = 3,
  atlas = 'AbandoniaCrossmod',
  pos = { x = 3, y = 3 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      xchips = 1,
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xchips
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
          xchips = card.ability.extra.xchips * count,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Bunnet",
  },
}

end