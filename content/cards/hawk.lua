SMODS.Joker {
  key = 'hawk',

  loc_txt = {
    ['en-us'] = {
      name = "Hawk",
      unlock = {
        "?????",
      },
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.xmult, cae.xchips, cae.xmultadd, cae.xchipsadd, cae.mult, cae.chips, } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 8, y = 5 },
  soul_pos = { x = 9, y = 5 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { xmult = 1, xchips = 1, xmultadd = 1.16, xchipsadd = 1.13, mult = 4, chips = 11, } },

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local first_card = context.scoring_hand[1]
      
      if first_card then
        if ABN.is_even(first_card) then
          card.ability.extra.xmult = card.ability.extra.xmult * card.ability.extra.xmultadd
          card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex'), })
        elseif ABN.is_odd(first_card) then
          card.ability.extra.xchips = card.ability.extra.xchips * card.ability.extra.xchipsadd
          card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex'), })
        end

        for i = 1, #context.scoring_hand do
          local scoring_card = context.scoring_hand[i]
          if ABN.is_even(first_card) then
            scoring_card.ability.perma_mult = (scoring_card.ability.perma_mult or 0) + card.ability.extra.mult
          elseif ABN.is_odd(first_card) then
            scoring_card.ability.perma_bonus = (scoring_card.ability.perma_bonus or 0) + card.ability.extra.chips
          end
        end
      end
    end
    
    if context.destroy_card and context.scoring_hand and context.scoring_hand[1] then
      if context.destroy_card == context.scoring_hand[1] then
        return { remove = true }
      end
    end

    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
        xchips = card.ability.extra.xchips,
      }
    end

    if context.final_scoring_step and not context.blueprint and context.scoring_hand then
      if SMODS.calculate_round_score() + G.GAME.chips >= G.GAME.blind.chips then
        local has_odd = false
        local has_even = false
        
        for i = 1, #context.scoring_hand do
          if ABN.is_odd(context.scoring_hand[i]) then has_odd = true end
          if ABN.is_even(context.scoring_hand[i]) then has_even = true end
        end

        if has_odd and has_even then
          for i = 1, #context.scoring_hand do
            local r_val = context.scoring_hand[i].base.value
            if r_val then
              ABN.level_up_rank(card, r_val, 1)
            end
          end
        end
      end
    end
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}