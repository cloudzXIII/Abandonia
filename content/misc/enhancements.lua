SMODS.Enhancement({
  key = "petroleum",
  pos = { x = 7, y = 0 },
  atlas = "AbandoniaEnhancements",
  replace_base_card = true,
  no_rank = true,
  no_suit = true,
  always_scores = true,
  weight = 0,
  config = { extra = { chips = 100, dollars = 2 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips, cae.dollars } }
  end,
  calculate = function(self, card, context, effect)
    local cae = card.ability.extra
    if context.main_scoring and context.cardarea == G.play then
      return {
        chips = cae.chips,
        dollars = cae.dollars
      }
    end
    if
    context.final_scoring_step
    and SMODS.calculate_round_score() > G.GAME.blind.chips
    then
      card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_abn_onfire") })
      G.E_MANAGER:add_event(Event({
        func = function()
          card:juice_up(0.3, 0.4)
          card:set_ability("m_abn_oilfire")
          card.ability.abn_just = true
          return true
        end
      }))
    end
  end,
})

SMODS.Enhancement({
  key = "oilfire",
  pos = { x = 2, y = 0 },
  atlas = "AbandoniaEnhancements",
  replace_base_card = true,
  no_rank = true,
  no_suit = true,
  always_scores = true,
  weight = 0,
  config = { extra = { mult = 10, dollars = 3, odds = 2 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local num, den = SMODS.get_probability_vars(card, 1, cae.odds, "oilfire_abn")
    return { vars = { cae.mult, cae.dollars, num, den } }
  end,
  calculate = function(self, card, context, effect)
    local cae = card.ability.extra
    if context.before and card.ability.abn_just then
      card.ability.abn_just = nil
    end
    if context.main_scoring and context.cardarea == G.play then
      return {
        mult = cae.mult,
        dollars = -cae.dollars
      }
    end
    if
    context.destroying_card
    and SMODS.pseudorandom_probability(card, "oilfire_abn", 1, card.ability.extra.odds)
    and not card.getting_sliced
    and context.destroying_card == card
    and not card.ability.abn_just
    then
      return {
        remove = true
      }
    end
  end,
  in_pool = function(self)
    return false
  end
})

SMODS.Enhancement({
  key = "fossil",
  pos = { x = 1, y = 0 },
  atlas = "AbandoniaEnhancements",
  config = { extra = { xmult = 3, dollars = 10, odds = 2 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local num, den = SMODS.get_probability_vars(card, 1, cae.odds, "oilfire_abn")
    return { vars = { cae.xmult, cae.dollars, num, den } }
  end,
  calculate = function(self, card, context, effect)
    local cae = card.ability.extra
    if context.main_scoring and context.cardarea == G.play then
      return {
        xmult = cae.xmult,
        dollars = cae.dollars
      }
    end
    if
    context.destroying_card
    and SMODS.pseudorandom_probability(card, "oilfire_abn", 1, card.ability.extra.odds)
    and not card.getting_sliced
    and context.destroying_card == card
    then
      return {
        remove = true
      }
    end
  end,
})

SMODS.Enhancement({
  key = "mercurial",
  pos = { x = 0, y = 0 },
  atlas = "AbandoniaEnhancements",
  config = { extra = { chips = 0, chip_gain = 10 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips, cae.chip_gain } }
  end,
  calculate = function(self, card, context, effect)
    local cae = card.ability.extra
    if context.main_scoring and context.cardarea == G.play then
      return {
        chips = cae.chips
      }
    end
    if context.before then
      local suits, num = {}, 0
      for k, v in pairs(context.scoring_hand) do
        if not suits[v.base.suit] then
          suits[v.base.suit] = true
          num = num + 1
        end
      end
      for i = 1, num do
        SMODS.scale_card(card, {
          ref_table = cae,
          ref_value = "chips",
          scalar_value = "chip_gain"
        })
      end
    end
  end,
})

SMODS.Enhancement({
  key = "polkadot",
  pos = { x = 3, y = 0 },
  atlas = "AbandoniaEnhancements",
  replace_base_card = true,
  no_rank = true,
  no_suit = true,
  always_scores = true,
  config = { extra = { chips = 10, chips_gain = 5 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips, cae.chips_gain } }
  end,
  calculate = function(self, card, context, effect)
    local cae = card.ability.extra
    if context.main_scoring and context.cardarea == G.play then
      return {
        chips = cae.chips,
      }
    end

    if context.final_scoring_step and context.cardarea == G.play then
      SMODS.scale_card(card, {
        ref_table = cae,
        ref_value = "chips",
        scalar_value = "chips_gain"
      })
    end
  end,
})

SMODS.Enhancement({
  key = "hot_iron",
  pos = { x = 4, y = 0 },
  atlas = "AbandoniaEnhancements",
  replace_base_card = false,
  no_rank = false,
  no_suit = false,
  always_scores = false,
  config = {
    extra = {
      chips = 200,
      xmult = 2,
      xmultadd = 1,
      oddsc = 7,
      oddsx = 20,
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local chips_num, chips_den = SMODS.get_probability_vars(card, 1, cae.oddsc, 'iron_abn')
    local upgrade_num, upgrade_den = SMODS.get_probability_vars(card, 1, cae.oddsx, 'hot_abn')

    return { vars = { cae.chips, cae.xmult, cae.xmultadd, chips_num, chips_den, upgrade_num, upgrade_den } }
  end,
  calculate = function(self, card, context)
    local cae = card.ability.extra

    if context.modify_scoring_hand and context.other_card.config.center == G.P_CENTERS.m_abn_hot_iron and context.in_scoring and not next(SMODS.find_card('j_abn_forgemaster_joker')) then
      return {
        remove_from_hand = true
      }
    end

    -- Scoring while in hand
    if context.main_scoring and context.cardarea == G.hand then
      local ret = {}
      local triggered = false

      -- 1 in 7 chance for Chips
      if SMODS.pseudorandom_probability(card, "iron_abn", 1, cae.oddsc) then
        ret.chips = cae.chips
        triggered = true
      end

      -- 1 in 20 chance to permanently upgrade XMult
      if SMODS.pseudorandom_probability(card, "hot_abn", 1, cae.oddsx) then
        cae.xmult = cae.xmult + cae.xmultadd
        ret.message = localize('k_upgrade_ex')
        ret.colour = G.C.RED
        triggered = true
      end

      -- Always provide the current XMult value (or logic can be adjusted if XMult is also a chance)
      ret.xmult = cae.xmult

      -- Only return the table if something happened or we are passing the XMult
      if triggered or ret.xmult then
        ret.card = card
        return ret
      end
    end
  end,
  abn_artist_credits = {
    artist = "Lime Squeezed",
  },
})

SMODS.Enhancement({
  key = "infra",
  pos = { x = 5, y = 0 },
  atlas = "AbandoniaEnhancements",
  replace_base_card = false,
  no_rank = false,
  no_suit = false,
  always_scores = false,
  config = {
    extra = {
      mult = 0,
      multadd = 2,
      chips = 0,
      chipsadd = 3,
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra

    return { vars = { cae.mult, cae.multadd, cae.chips, cae.chipsadd } }
  end,
  calculate = function(self, card, context)
    local cae = card.ability.extra

    if context.main_scoring and context.cardarea == G.play then
      cae.mult = cae.mult + (#context.scoring_hand * cae.multadd)
      cae.chips = cae.chips + (#context.scoring_hand * cae.chipsadd)

      return {
        mult = cae.mult,
        chips = cae.chips,
      }
    end

    if context.destroy_card and (context.cardarea == G.play or context.cardarea == 'unscored') and (#context.scoring_hand or 0) <= 3 and context.destroy_card == card then
      return { remove = true }
    end
  end,
  abn_artist_credits = {
    artist = "Smolicon",
  },
})

SMODS.Enhancement({
  key = "hazard",
  pos = { x = 6, y = 0 },
  atlas = "AbandoniaEnhancements",
  replace_base_card = false,
  no_rank = false,
  no_suit = false,
  always_scores = false,
  config = {
    extra = {
      xmult = 2,
      xmultadd = 0.25,
      odds = 10,
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local odds_num, odds_den = SMODS.get_probability_vars(card, 1, cae.odds, 'hazard_retrig')

    return { vars = { cae.xmult, cae.xmultadd, odds_num, odds_den } }
  end,
  calculate = function(self, card, context)
    local cae = card.ability.extra

    -- xmult and blind scaling
    if context.main_scoring and context.cardarea == G.play then
      local hazard_count = 0
      for i, v in ipairs(context.scoring_hand) do
        -- check if the card in the scoring hand is hazard
        if v.config.center == G.P_CENTERS.m_abn_hazard then
          hazard_count = hazard_count + 1
        end
      end

      local final_xmult = cae.xmult
      if hazard_count >= 2 then
        final_xmult = cae.xmult + ((hazard_count - 1) * cae.xmultadd)
      end

      -- raise blind requirement
      G.GAME.blind.chips = G.GAME.blind.chips * 1.10
      G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

      return {
        xmult = final_xmult,
        card = card
      }
    end

    -- retriggers
    if context.repetition and context.cardarea == G.play then
      if SMODS.pseudorandom_probability(card, "hazard_retrig", 1, cae.odds) then
        return {
          message = localize('k_again_ex'),
          repetitions = 1,
          card = card
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Bunnet",
  },
})

SMODS.Enhancement({
  key = "contagion_seal",
  pos = { x = 7, y = 1 },
  atlas = "AbandoniaEnhancements",
  replace_base_card = false,
  no_rank = false,
  no_suit = false,
  always_scores = false,
  config = {
    extra = {
      emult = 1,       
      emultadd = 0.03,
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    
    return { vars = { cae.emult, cae.emultadd } }
  end,
  
  in_pool = function(self)
    return false
  end,

  calculate = function(self, card, context)
    local cae = card.ability.extra

    -- ^mult (triggers when the enhanced card is scored)
    if context.main_scoring and context.cardarea == G.play then
      if cae.emult > 0 then
        return {
          e_mult = cae.emult, 
          card = card,       
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Bunnet",
  },
}) 

local scie = SMODS.calculate_individual_effect
function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
    local ret = scie(effect, scored_card, key, amount, from_edition)
    
    -- Check if an Xmult modification just fired
    if (
        key == "x_mult"
        or key == "xmult"
        or key == "Xmult"
        or key == "x_mult_mod"
        or key == "xmult_mod"
        or key == "Xmult_mod"
    )
    and amount ~= 1
    and mult then
        -- Iterate through all cards in the game to find ones with your enhancement
        if G.playing_cards then
            local scaled_count = 0
            for _, v in ipairs(G.playing_cards) do
                if v.config.center == G.P_CENTERS.m_abn_contagion_seal then 
                    scaled_count = scaled_count + 1
                    
                    SMODS.scale_card(v, {
                        ref_table = v.ability.extra,
                        ref_value = "emult",
                        scalar_value = "emultadd",
                        message_colour = G.C.DARK_EDITION,
                    })
                end
            end
        end
    end

    return ret
end

SMODS.Enhancement({
  key = "contagion_bonus",
  pos = { x = 1, y = 2 },
  atlas = "AbandoniaEnhancements",
  replace_base_card = false,
  no_rank = false,
  no_suit = false,
  always_scores = false,
  
  in_pool = function(self)
	return false
  end,

  calculate = function(self, card, context)

    -- ^chips
    if context.main_scoring and context.cardarea == G.play then
      return {
        e_chips = #context.scoring_hand,
        card = self,
      }
    end
  end,
  abn_artist_credits = {
    artist = "Bunnet",
  },
})

SMODS.Enhancement({
  key = "contagion_mult",
  pos = { x = 0, y = 2 },
  atlas = "AbandoniaEnhancements",
  replace_base_card = false,
  no_rank = false,
  no_suit = false,
  always_scores = false,
  config = {
    extra = {
      emult = 1,
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
	
    return { vars = { cae.emult, } }
  end,
  
  in_pool = function(self)
	return false
  end,

  calculate = function(self, card, context)
    local cae = card.ability.extra

    -- ^mult
    if context.main_scoring and context.cardarea == G.play then
      return {
        e_mult = cae.emult,
        card = self,
      }
    end
  end,
  abn_artist_credits = {
    artist = "Bunnet",
  },
})