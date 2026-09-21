SMODS.Joker {
  key = 'gluttony',
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult,
        card.ability.extra.x_mult_gain,
      }
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet14',
  pos = { x = 5, y = 0 },
  cost = 1,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      x_mult=0,
      x_mult_gain=0.25,
      consumables_destroyed={},
    },

  },

  calculate = function(self, card, context)
    if context.joker_main and G.GAME.current_round.hands_played == 0 then
        return {
            x_mult=card.ability.extra.x_mult,
        }
    end 
	if context.blueprint then return end
    if context.buying_self then
        for i,v in ipairs(G.jokers.cards) do
            v:set_eternal(true)
        end
    end
    if context.after and G.GAME.current_round.hands_played == 0 then
        for i,v in ipairs(G.consumeables.cards) do
            local consumable_key = v.config.center.key
            if not v.getting_sliced then
            	v:start_dissolve()
            	v.getting_sliced = true
				if not card.ability.extra.consumables_destroyed[consumable_key] then
		            card.ability.extra.consumables_destroyed[consumable_key] = true
		            SMODS.scale_card(card,{
		                ref_table=card.ability.extra,
		                ref_value="x_mult",
		                scalar_value="x_mult_gain",
		                message_key="a_xmult",
		                message_colour=G.C.RED,
		            })
				end
            end
        end
    end
  end,


  abn_artist_credits = {
    artist = "Comkyel",
  },
}
