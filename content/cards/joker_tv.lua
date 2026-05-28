-- Joker TV (coded by cloudzXIII)
SMODS.Joker {
  key = 'joker_tv',

  rarity = 3,
  atlas = 'ABNJokerSheet9',
  pos = { x = 9, y = 2 },
  cost = 10,
  discovered = false,
  blueprint_compat = false,
  config = { extra = { mult = 1, sell_value = 1 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
	info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    return { vars = { card.ability.extra.sell_value, card.ability.extra.mult }, }
  end,


  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == "program_pack" then
      for _, playing_card in ipairs(G.playing_cards) do
        if ABN.is_light(playing_card) then
          playing_card.ability.perma_mult = (playing_card.ability.perma_mult or 0) + card.ability.extra.mult
        end
      end
      for _, other_card in ipairs(G.jokers.cards) do
        if other_card.set_cost then
          other_card.ability.extra_value = (other_card.ability.extra_value or 0) +
              card.ability.extra.sell_value
          other_card:set_cost()
        end
      end
      return {
        message = localize('k_val_up'),
        colour = G.C.MONEY
      }
    end
	
	if context.using_consumeable then
      local center = context.consumeable.config.center
      local is_rank_planet = false
      
      -- Safe check if the consumable object features your targeted attribute array
      if center and center.attributes then
        for _, attr in ipairs(center.attributes) do
          if attr == "rank_planet" then
            is_rank_planet = true
            break
          end
        end
      end

      if is_rank_planet then
        for _, playing_card in ipairs(G.playing_cards) do
          if ABN.is_dark(playing_card) then
            playing_card.ability.perma_mult = (playing_card.ability.perma_mult or 0) + card.ability.extra.mult
          end
        end
      end
    end
	
  end,
  abn_artist_credits = {
    artist = "Gud",
  },
}
