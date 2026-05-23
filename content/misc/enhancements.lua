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
    artist = "Ricottakitten",
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
    artist = "Ricottakitten",
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
    artist = "Ricottakitten",
  },
})


SMODS.Enhancement({
  key = "monitor",
  pos = { x = 2, y = 1 },
  atlas = "AbandoniaEnhancements",
  replace_base_card = true,
  no_rank = true,
  no_suit = true,
  always_scores = true,
  config = {
    extra = {
      suit = "none",
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local suit_text = cae.suit ~= "none" and (cae.suit:sub(1,1):upper() .. cae.suit:sub(2)) or "None"
    
    return { vars = { suit_text } }
  end,
  
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,
  
  update = function(self, card)
    local cae = card.ability.extra
    
    -- Default coordinates if no suit is chosen yet
    local target_x = 2
    local target_y = 1

    -- Map each suit to its respective X/Y coordinate
    if cae.suit == "Spades" then
      target_x = 5
      target_y = 1
    elseif cae.suit == "Hearts" then
      target_x = 7
      target_y = 1
    elseif cae.suit == "Diamonds" then
      target_x = 4
      target_y = 1
    elseif cae.suit == "Clubs" then
      target_x = 6
    elseif cae.suit ~= "none" then
      target_x = 3
      target_y = 1
    end

    if card.children and card.children.center then
      if not card.children.center.sprite_pos_is_unique then
        card.children.center.sprite_pos = { x = target_x, y = target_y }
        card.children.center.sprite_pos_is_unique = true
      else
        card.children.center.sprite_pos.x = target_x
        card.children.center.sprite_pos.y = target_y
      end
    end
  end,

  calculate = function(self, card, context)
    local cae = card.ability.extra
  
    -- Pick a random suit present in the deck at the start of the blind
    if context.setting_blind and not context.blueprint then
      local all_cards = G.deck.cards
      if all_cards and #all_cards > 0 then
        local available_suits = {}
        local seen = {}
        for _, c in ipairs(all_cards) do
          local s = c.base.suit
          if not seen[s] then
            table.insert(available_suits, s)
            seen[s] = true
          end
        end

        if #available_suits > 0 then
          cae.suit = pseudorandom_element(available_suits, pseudoseed('monitor_suit' .. G.GAME.round_resets.ante))
        end
      end
    end
  
    -- Scoring logic
    if context.main_scoring and context.cardarea == G.play then
      -- Count matching cards of the chosen suit in the scored hand
      local match_count = 0
      if context.scoring_hand and cae.suit ~= "none" then
        for _, sc in ipairs(context.scoring_hand) do
          if sc:is_suit(cae.suit) then
            match_count = match_count + 1
          end
        end
      end

      -- If there are matching cards give ^mult 
      if match_count > 0 then
        return {
          e_mult = match_count,
          card = card,
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Ricottakitten",
  },
})

SMODS.Enhancement({
  key = "cotton",
  pos = { x = 0, y = 1 },
  atlas = "AbandoniaEnhancements",
  replace_base_card = false,
  no_rank = false,
  no_suit = false,
  always_scores = false,
  
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)
    local cae = card.ability.extra

    if context.main_scoring and context.cardarea == G.play then
      for i = 1, #G.hand.cards do
        local hand_card = G.hand.cards[i]
        
        if not hand_card.debuff and hand_card.config.center ~= G.P_CENTERS.m_abn_cotton then
          local rank_key = hand_card.base.value 
          
          if G.GAME.abn_rank_upgrades and G.GAME.abn_rank_upgrades[rank_key] then
            local current_level = G.GAME.abn_rank_upgrades[rank_key].level
            
            -- if current level is > 1 double it
            local level_increase = 1
            if current_level > 1 then
              level_increase = current_level
            end
            
            G.E_MANAGER:add_event(Event({
              trigger = 'before',
              delay = 0.1,
              func = function()
                hand_card:juice_up(0.6, 0.4)
                return true
              end
            }))
            
            -- upgrade the rank
            ABN.level_up_rank(hand_card, rank_key, level_increase, false)
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Ricottakitten",
  },
})

SMODS.Enhancement({
  key = "sew",
  pos = { x = 1, y = 1 },
  atlas = "AbandoniaEnhancements",
  replace_base_card = false,
  no_rank = false,
  no_suit = false,
  always_scores = false,
  config = {
    extra = {
      mult = 0,       
      chips = 0,
      multadd = 3,
      chipsadd = 5,
    }
  },
  
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.chips, cae.multadd, cae.chipsadd } }
  end,
  
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)
    local cae = card.ability.extra
    
    -- Main scoring 
    if context.main_scoring and context.cardarea == G.play then
      cae.mult = cae.mult + cae.multadd
      cae.chips = cae.chips + cae.chipsadd
      return {
        mult = cae.mult,
        chips = cae.chips,
        card = card
      }
    end
    
    -- Repetitions 
    if context.repetition and context.cardarea == G.play then
      local sew_count = 0
      
      -- Count sew cards
      if context.scoring_hand then
        for _, scoring_card in ipairs(context.scoring_hand) do
          if scoring_card.config.center == G.P_CENTERS.m_abn_sew then
            sew_count = sew_count + 1
          end
        end
      end

      -- If there's more than one Sew card, grant repetitions equal to total Sew cards 
      if sew_count > 1 then
        return {
          message = localize('k_again_ex'),
          repetitions = sew_count,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Ricottakitten",
  },
})