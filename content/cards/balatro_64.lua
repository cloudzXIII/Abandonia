local original_game_update = Game.update
function Game:update(dt)
    original_game_update(self, dt)
    
    if G.STAGE ~= G.STAGES.RUN or not G.shop_jokers or not G.shop_jokers.cards then return end

    if G.STATE == G.STATES.SHOP then
        if G.GAME.RunedeltaDied then 
            local balatro_64_in_shop = false
            for _, v in pairs(G.shop_jokers.cards) do
                if v.config.center.key == 'j_abn_balatro_64' then
                    balatro_64_in_shop = true
					G.GAME.RunedeltaDied = false
                    break
                end
            end

            if not balatro_64_in_shop and G.GAME.RunedeltaDied then
				G.GAME.RunedeltaDied = false
                local new_card = SMODS.create_card{
                    key = 'j_abn_balatro_64',
                    area = G.shop_jokers
                }
                new_card:add_to_deck()
                G.shop_jokers:emplace(new_card)
                create_shop_card_ui(new_card)
            end
        end
    end
end



SMODS.Joker {
  key = 'balatro_64',
  rarity = 3, 
  atlas = 'ABNJokerSheet18',
  pos = { x = 2, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { 
    extra = { 
      mult = 4, 
      chips = 10,
      xmult = 1,
      xchips = 1,
      xmultadd = 0.2, 
      xchipsadd = 0.5 
    } 
  },
  
  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
	info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    return { 
      vars = { 
        card.ability.extra.mult, 
        card.ability.extra.chips, 
        card.ability.extra.xmult,
        card.ability.extra.xchips,
        card.ability.extra.xmultadd, 
        card.ability.extra.xchipsadd 
      } 
    }
  end,
  
  in_pool = function(self)
    return false
  end,

  calculate = function(self, card, context)
    if context.joker_main then
        return {
			xmult = card.ability.extra.xmult,
			xchips = card.ability.extra.xchips,
		}
    end
    if context.final_scoring_step and not context.repetition then
      local blind_chips = G.GAME.blind and G.GAME.blind.chips or 0
      local result = SMODS.calculate_round_score() + G.GAME.chips

      if result >= blind_chips then
        local dark_count = 0
        local light_count = 0
        local total_scoring = #context.scoring_hand

        for i = 1, total_scoring do
          local scoring_card = context.scoring_hand[i]
          if ABN.is_dark(scoring_card) then
            dark_count = dark_count + 1
          end
          if ABN.is_light(scoring_card) then
            light_count = light_count + 1
          end
        end

        if dark_count == total_scoring and light_count == 0 and total_scoring > 0 then
          local gain = total_scoring * card.ability.extra.xmultadd
          card.ability.extra.xmult = card.ability.extra.xmult + gain
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT,
            card = card
          }

        elseif light_count == total_scoring and dark_count == 0 and total_scoring > 0 then
          local gain = total_scoring * card.ability.extra.xchipsadd
          card.ability.extra.xchips = card.ability.extra.xchips + gain
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS,
            card = card
          }
        elseif dark_count > 0 and light_count > 0 then
          for i = 1, #G.jokers.cards do
            local j = G.jokers.cards[i]
            if j.ability then
              j.ability.abn_perma_mult = (j.ability.abn_perma_mult or 0) + card.ability.extra.mult
              j.ability.abn_perma_bonus = (j.ability.abn_perma_bonus or 0) + card.ability.extra.chips
            end
          end
          
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.ATTENTION,
            card = card
          }
        end

      end
    end
  end,
  
  abn_artist_credits = {
    artist = "Comykel",
  },
}