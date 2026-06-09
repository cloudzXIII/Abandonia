SMODS.Joker {
  key = 'joker_scroll',
  rarity = 3,
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  atlas = 'ABNJokerSheet14', 
  pos = { x = 3, y = 2 },
  config = { extra = { xmult = 1, xmultadd = 0.1 } },

  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_vintage
    return { vars = { card.ability.extra.xmult, card.ability.extra.xmultadd } }
  end,
  
  in_pool = function(self)
    return G.jokers and #G.jokers.cards > 0
  end,

  calculate = function(self, card, context)
    if context.before then
      if not context.blueprint then
        local vintage_scoring_count = 0
        if context.scoring_hand then
          for _, v in ipairs(context.scoring_hand) do
            if v.edition and v.edition.key == 'e_abn_vintage' then
              vintage_scoring_count = vintage_scoring_count + 1
            end
          end
        end

        -- Scaling
        if vintage_scoring_count > 0 and card.edition and card.edition.key == 'e_abn_abandond' then
          card.ability.extra.xmult = card.ability.extra.xmult + (vintage_scoring_count * card.ability.extra.xmultadd)
          card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.MULT})
        end

        if context.scoring_name == "Full House" then
          local cost_counts = {}
          if G.jokers and G.jokers.cards then
            for _, jkr in ipairs(G.jokers.cards) do
              local cost = jkr.sell_cost
              cost_counts[cost] = (cost_counts[cost] or 0) + 1
            end
          end

          local matching_sell_value_count = 0
          for cost, count in pairs(cost_counts) do
            if count > 1 then
              matching_sell_value_count = matching_sell_value_count + count
            end
          end

          local is_even_jokers = (matching_sell_value_count % 2 == 0) and (matching_sell_value_count > 0)
          local is_odd_jokers = (matching_sell_value_count % 2 ~= 0)

          for _, v in ipairs(context.scoring_hand) do
            local rank_id = v.base.id
            local is_even_card = (rank_id % 2 == 0)
            local is_odd_card = (rank_id % 2 ~= 0)

            if (is_even_jokers and is_even_card) or (is_odd_jokers and is_odd_card) then
              v:set_edition({abn_vintage = true}, true)
            end
          end
        end
      end
    end

    -- Scoring
    if context.joker_main and card.ability.extra.xmult > 1 then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat",
  },
}