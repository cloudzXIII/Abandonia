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
  calculate = function(self, card, context)
    local cae = card.ability.extra
    if context.main_scoring and context.cardarea == G.play then
      return {
        chips = cae.chips,
        dollars = cae.dollars
      }
    end
    if context.final_scoring_step and SMODS.calculate_round_score() > G.GAME.blind.chips then
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
  abn_artist_credits = {
    artist = "Criyo",
  },
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
  calculate = function(self, card, context)
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
        and not next(SMODS.find_card("j_abn_immolation_joker"))
    then
      return {
        remove = true
      }
    end
  end,
  in_pool = function(self)
    return false
  end,
  abn_artist_credits = {
    artist = "Comykel",
  },
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
  calculate = function(self, card, context)
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
  abn_artist_credits = {
    artist = "Comykel",
  },
})

SMODS.Enhancement({
  key = "mercurial",
  pos = { x = 0, y = 0 },
  atlas = "AbandoniaEnhancements",
  config = { extra = { chips = 0, chipsadd = 5 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips, cae.chipsadd } }
  end,
  calculate = function(self, card, context)
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
          scalar_value = "chipsadd"
        })
      end
    end
  end,
  abn_artist_credits = {
    artist = "Smolicon",
  },
})

SMODS.Enhancement({
  key = "polkadot",
  pos = { x = 3, y = 0 },
  atlas = "AbandoniaEnhancements",
  replace_base_card = true,
  no_rank = true,
  no_suit = true,
  always_scores = true,
  config = { extra = { chips = 10, chipsadd = 5 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips, cae.chipsadd } }
  end,
  calculate = function(self, card, context)
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
        scalar_value = "chipsadd"
      })
    end
  end,
  abn_artist_credits = {
    artist = "Camostar34",
  },
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
    artist = "Comykel",
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
    artist = "Comykel",
  },
  set_sprites = function(self, card, front)
    card.children.center:set_sprite_pos({ x = 6, y = 0 })
    card.children.center.hazard_card = true
  end
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

  set_sprites = function(self, card, front)
    card.children.center:set_sprite_pos({ x = 2, y = 2 })
    card.children.center.contagion_seal = true
  end
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
      emult = 1.2,
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

function ABN.reset_monitor_card()
  G.GAME.current_round.abn_monitor_card = G.GAME.current_round.abn_monitor_card or { suit = 'Hearts' }
  local monitor_suits = {}
  local suits = {}
  for _, v in ipairs(G.playing_cards or {}) do
    suits[v.base.suit] = true
  end
  for k, v in pairs(suits) do
    if k ~= G.GAME.current_round.abn_monitor_card.suit then monitor_suits[#monitor_suits + 1] = k end
  end
  if #monitor_suits > 0 then
    local monitor_suit = pseudorandom_element(monitor_suits, 'm_abn_monitor' .. G.GAME.round_resets.ante)
    G.GAME.current_round.abn_monitor_card.suit = monitor_suit
  end
end

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
    }
  },

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local suit = (G.GAME.current_round.abn_monitor_card or {}).suit or "Hearts"
    return { vars = { localize(suit, 'suits_plural') or "Nones", colours = { G.C.SUITS[suit] or G.C.L_BLACK } } }
  end,

  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  update = function(self, card)
    local cae = card.ability.extra

    -- Default coordinates if no suit is chosen yet
    local target_x = 2
    local target_y = 1
    local suit = (G.GAME.current_round.abn_monitor_card or {}).suit or "Hearts"
    -- Map each suit to its respective X/Y coordinate
    if suit == "Spades" then
      target_x = 4
    elseif suit == "Hearts" then
      target_x = 6
    elseif suit == "Diamonds" then
      target_x = 3
    elseif suit == "Clubs" then
      target_x = 5
    else
      target_x = 2
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
    if context.main_scoring and context.cardarea == G.play then
      -- Count matching cards of the chosen suit in the scored hand
      local match_count = 0
      if context.scoring_hand then
        for _, sc in ipairs(context.scoring_hand) do
          if sc:is_suit(G.GAME.current_round.abn_monitor_card.suit) then
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

SMODS.Enhancement({
  key = "teabag",
  pos = { x = 3, y = 0 },
  atlas = "AbandoniaEnhancements",
  config = { extra = { hands_remaining = 5, chips = 20 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local cuppa = 0
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_abn_teabag') and playing_card ~= card then cuppa = cuppa + 1 end
    end
    return { vars = { cae.chips, cae.hands_remaining, cae.chips * cuppa } }
  end,
  calculate = function(self, card, context)
    local cae = card.ability.extra
    if context.main_scoring and context.cardarea == G.play then
      local cuppa = 0
      for _, playing_card in ipairs(G.playing_cards) do
        if SMODS.has_enhancement(playing_card, 'm_abn_teabag') and playing_card ~= card then cuppa = cuppa + 1 end
      end
      return {
        chips = cae.chips * cuppa,
      }
    end

    if context.final_scoring_step and context.cardarea == G.play then
      cae.hands_remaining = cae.hands_remaining - 1
      if cae.hands_remaining <= 0 then
        SMODS.calculate_effect({ message = localize("k_abn_brewed_ex") }, card)
        G.E_MANAGER:add_event(Event({
          func = function()
            card:juice_up(0.3, 0.4)
            card:set_ability("m_abn_teastain")
            card.children.center.teabag_card = false
            return true
          end
        }))
      end
    end
  end,
  abn_artist_credits = {
    artist = "Comykel",
  },
  set_sprites = function(self, card, front)
    card.children.center:set_sprite_pos({ x = 2, y = 2 })
    card.children.center.teabag_card = true
  end
})

SMODS.Enhancement({
  key = "teastain",
  pos = { x = 4, y = 2 },
  atlas = "AbandoniaEnhancements",
  config = { extra = { xmult = 1.2, xmultadd = 0.3 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local cuppa = 0
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_abn_teastain') and playing_card ~= card then cuppa = cuppa + 1 end
    end
    return { vars = { cae.xmult + (cae.xmultadd * cuppa), cae.xmultadd } }
  end,
  calculate = function(self, card, context)
    local cae = card.ability.extra
    if context.main_scoring and context.cardarea == G.play then
      local cuppa = 0
      for _, playing_card in ipairs(G.playing_cards) do
        if SMODS.has_enhancement(playing_card, 'm_abn_teastain') and playing_card ~= card then cuppa = cuppa + 1 end
      end
      return {
        x_mult = cae.xmult + (cae.xmultadd * cuppa),
      }
    end
  end,
  abn_artist_credits = {
    artist = "Comykel",
  },
  in_pool = function(self)
    return false
  end,
  set_sprites = function(self, card, front)
    card.children.center:set_sprite_pos({ x = 2, y = 2 })
    card.children.center.teastain_card = true
  end
})

-- credits to paperback for this, used so the enhancement is drawn on top of the card
SMODS.DrawStep {
  key = "teabag",
  order = 21,
  func = function(self, layer)
    if self.children.center.teabag_card then
      self.children.center:set_sprite_pos({ x = 3, y = 2 })
      self.children.center:draw_shader('dissolve')
      self.children.center:set_sprite_pos({ x = 2, y = 2 })
    end
    if self.children.center.teastain_card then
      self.children.center:set_sprite_pos({ x = 4, y = 2 })
      self.children.center:draw_shader('dissolve')
      self.children.center:set_sprite_pos({ x = 2, y = 2 })
    end
    if self.children.center.contagion_seal then
      self.children.center:set_sprite_pos({ x = 7, y = 1 })
      self.children.center:draw_shader('dissolve')
      self.children.center:set_sprite_pos({ x = 2, y = 2 })
    end
    if self.children.center.hazard_card then
      self.children.center:set_sprite_pos({ x = 4, y = 3 })
      self.children.center:draw_shader('dissolve')
      self.children.center:set_sprite_pos({ x = 6, y = 0 })
    end
  end,
  conditions = { vortex = false, facing = 'front' }
}

SMODS.Enhancement({
  key = "darkner",
  pos = { x = 1, y = 3 },
  atlas = "AbandoniaEnhancements",
  config = { extra = { chips = 5, mult = 2, light_threshold = 2 } },

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local dark_count = 0

    if G.playing_cards then
      if G.play and G.play.cards then
        for _, playing_card in ipairs(G.play.cards) do
          if ABN.is_dark(playing_card) then dark_count = dark_count + 1 end
        end
      end
      if G.hand and G.hand.cards then
        for _, playing_card in ipairs(G.hand.cards) do
          if ABN.is_dark(playing_card) and playing_card ~= card then
            dark_count = dark_count + 1
          end
        end
      end
    end

    return {
      vars = {
        cae.chips,
        cae.mult,
        cae.light_threshold
      }
    }
  end,

  calculate = function(self, card, context)
    local cae = card.ability.extra


    if context.main_scoring and context.cardarea == G.play then
      local dark_count = 0


      if context.scoring_hand then
        for _, playing_card in ipairs(context.scoring_hand) do
          if ABN.is_dark(playing_card) then dark_count = dark_count + 1 end
        end
      end


      if G.hand and G.hand.cards then
        for _, playing_card in ipairs(G.hand.cards) do
          if ABN.is_dark(playing_card) and playing_card ~= card then
            dark_count = dark_count + 1
          end
        end
      end

      if dark_count > 0 then
        return {
          chips = dark_count * cae.chips,
          mult = dark_count * cae.mult
        }
      end
    end


    if context.destroy_card and context.cardarea == G.play and context.destroy_card == card then
      local light_count = 0


      if context.scoring_hand then
        for _, playing_card in ipairs(context.scoring_hand) do
          if ABN.is_light(playing_card) then light_count = light_count + 1 end
        end
      end

      if light_count >= cae.light_threshold and not next(SMODS.find_card('j_abn_device_joker')) then
        return { remove = true }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Toyrapple",
  },
})

SMODS.Enhancement({
  key = "lightner",
  pos = { x = 2, y = 3 },
  atlas = "AbandoniaEnhancements",
  config = { extra = { chips = 5, mult = 2, dark_threshold = 2 } },

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local light_count = 0

    if G.playing_cards then
      if G.play and G.play.cards then
        for _, playing_card in ipairs(G.play.cards) do
          if ABN.is_light(playing_card) then light_count = light_count + 1 end
        end
      end
      if G.hand and G.hand.cards then
        for _, playing_card in ipairs(G.hand.cards) do
          if ABN.is_light(playing_card) and playing_card ~= card then
            light_count = light_count + 1
          end
        end
      end
    end

    return {
      vars = {
        cae.chips,
        cae.mult,
        cae.dark_threshold
      }
    }
  end,

  calculate = function(self, card, context)
    local cae = card.ability.extra


    if context.main_scoring and context.cardarea == G.play then
      local light_count = 0


      if context.scoring_hand then
        for _, playing_card in ipairs(context.scoring_hand) do
          if ABN.is_light(playing_card) then light_count = light_count + 1 end
        end
      end


      if G.hand and G.hand.cards then
        for _, playing_card in ipairs(G.hand.cards) do
          if ABN.is_light(playing_card) and playing_card ~= card then
            light_count = light_count + 1
          end
        end
      end

      if light_count > 0 then
        return {
          chips = light_count * cae.chips,
          mult = light_count * cae.mult
        }
      end
    end

    if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and not next(SMODS.find_card('j_abn_device_joker')) then
      local dark_count = 0


      if context.scoring_hand then
        for _, playing_card in ipairs(context.scoring_hand) do
          if ABN.is_dark(playing_card) then dark_count = dark_count + 1 end
        end
      end

      if dark_count >= cae.dark_threshold then
        return { remove = true }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Toyrapple",
  },
})

SMODS.Enhancement({
  key = "kintsugi",
  pos = { x = 0, y = 3 },
  atlas = "AbandoniaEnhancements",
  config = {
    extra = {
      chips = 1,
      mult = 1,
      dollars = 1,
      odds_dup = 7,
      odds_double = 9,
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local dup_num, dup_den = SMODS.get_probability_vars(card, 1, cae.odds_dup, 'kintsugi_dup_abn')
    local db_num, db_den = SMODS.get_probability_vars(card, 1, cae.odds_double, 'kintsugi_db_abn')

    return { vars = { cae.chips, cae.mult, cae.dollars, dup_num, dup_den, db_num, db_den } }
  end,
  calculate = function(self, card, context)
    local cae = card.ability.extra

    if context.remove_playing_cards and not context.blueprint and SMODS.pseudorandom_probability(card, "kintsugi_dup_abn", 1, cae.odds_dup) then
      G.E_MANAGER:add_event(Event({
        func = function()
          local copy = copy_card(card)
          if not copy then return true end

          G.deck:emplace(copy)
          copy:add_to_deck()
          G.deck.config.card_limit = G.deck.config.card_limit + 1
          table.insert(G.playing_cards, copy)
          copy:start_materialize(nil, nil)

          playing_card_joker_effects({ copy })
          card_eval_status_text(card, 'extra', nil, nil, nil,
            { message = localize('k_duplicated_ex'), colour = G.C.ATTENTION })
          return true
        end
      }))
    end

    if context.main_scoring and context.cardarea == G.play then
      if SMODS.pseudorandom_probability(card, "kintsugi_db_abn", 1, cae.odds_double) then
        cae.chips = cae.chips * 2
        cae.mult = cae.mult * 2
        cae.dollars = cae.dollars * 2

        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.ATTENTION,
          chips = cae.chips,
          mult = cae.mult,
          dollars = cae.dollars,
          card = card
        }
      else
        return {
          chips = cae.chips,
          mult = cae.mult,
          dollars = cae.dollars,
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Littleroot",
  },
})

SMODS.Enhancement({
  key = "first_aid",
  pos = { x = 7, y = 2 },
  atlas = "AbandoniaEnhancements",
  config = {
    extra = {
      chips = 0,
      mult = 0,
      chipsadd = 10,
      multadd = 10,
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips, cae.mult, cae.chipsadd, cae.multadd } }
  end,
  calculate = function(self, card, context)
    local cae = card.ability.extra

    if context.remove_playing_cards and not context.blueprint then
      local destroyed_count = 0

      for _, removed_card in ipairs(context.removed) do
        if removed_card ~= card then
          destroyed_count = destroyed_count + 1
        end
      end

      if destroyed_count > 0 then
        cae.chips = cae.chips + (cae.chipsadd * destroyed_count)

        G.E_MANAGER:add_event(Event({
          func = function()
            card_eval_status_text(card, 'extra', nil, nil, nil, {
              message = localize('k_upgrade_ex'),
              colour = G.C.CHIPS
            })
            return true
          end
        }))
      end
    end

    if context.main_scoring and context.cardarea == G.play then
      local has_debuffed = false

      if context.scoring_hand then
        for _, scoring_card in ipairs(context.scoring_hand) do
          if scoring_card.debuff then
            has_debuffed = true
            break
          end
        end
      end

      if has_debuffed then
        cae.mult = cae.mult + cae.multadd

        return {
          chips = cae.chips,
          mult = cae.mult,
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT,
          card = card
        }
      else
        return {
          chips = cae.chips,
          mult = cae.mult
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Gud",
  },
})

SMODS.Enhancement({
  key = "ocean",
  pos = { x = 6, y = 3 },
  atlas = "AbandoniaEnhancements",
  config = { extra = { chips = 0, chips_gain = 7 } },
  no_suit = true,
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips, cae.chips_gain } }
  end,

  calculate = function(self, card, context)
    if context.before and context.cardarea == G.play then
      local count = 0
      local pos = ABN.get_pos(card, context.scoring_hand)
      for _, v in ipairs(context.scoring_hand) do
        local card_pos = ABN.get_pos(v, context.scoring_hand)
        if card_pos < pos then
          count = count + 1
        end
      end
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips_gain",
        message_key = "a_chips",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + count * change
        end,
      })
    end
    if context.main_scoring and context.cardarea == G.play then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,
  abn_artist_credits = {
    artist = "Shrimpsnail",
  },
})

SMODS.Enhancement({
  key = "mountain",
  pos = { x = 7, y = 3 },
  atlas = "AbandoniaEnhancements",
  config = { extra = { mult = 0, mult_gain = 2 } },
  no_suit = true,
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.mult_gain } }
  end,

  calculate = function(self, card, context)
    if context.before and context.cardarea == G.play then
      local count = 0
      local pos = ABN.get_pos(card, context.scoring_hand)
      for _, v in ipairs(context.scoring_hand) do
        local card_pos = ABN.get_pos(v, context.scoring_hand)
        if card_pos > pos then
          count = count + 1
        end
      end
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        message_key = "a_mult",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + count * change
        end,
      })
    end
    if context.main_scoring and context.cardarea == G.play then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Shrimpsnail",
  },
})
