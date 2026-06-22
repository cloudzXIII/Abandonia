SMODS.Joker {
  key = 'fanfiction_comedian',
  rarity = "abn_SuperRare",
  atlas = 'ABNJokerSheet7',
  pos = { x = 5, y = 4 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { 
    extra = { 
      xmult = 1,
      xmultadd = 0.2,
      chips = 10,
      mult = 4,
    } 
  },
  pools = { ["Comedians"] = true, },

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.xmultadd,
        card.ability.extra.chips,
        card.ability.extra.mult
      }
    }
  end,

  calculate = function(self, card, context)
    local function get_suitless_type(scoring_card)
      if not scoring_card then return nil end
      
      if scoring_card.base and scoring_card.base.suit == "abn_suitless" then
        return "Null"
      end

      if scoring_card.config and scoring_card.config.center then
        local center_key = scoring_card.config.center.key
        if center_key == "m_stone" then return "Stone" end
        if center_key == "m_abn_petroleum" then return "Petroleum" end
        if center_key == "m_abn_oilfire" then return "Oilfire" end
        if center_key == "m_abn_polkadot" then return "Pelkadot" end
      end
      
      return nil
    end

    if context.cardarea == G.jokers and context.before then
      local unique_suitless = {}
      local unique_count = 0

      for _, scoring_card in ipairs(context.scoring_hand) do
        local s_type = get_suitless_type(scoring_card)
        if s_type then
          if not unique_suitless[s_type] then
            unique_suitless[s_type] = true
            unique_count = unique_count + 1
          end
        end
      end

      if unique_count > 0 then
        if not context.blueprint then
          card.ability.extra.xmult = card.ability.extra.xmult + (card.ability.extra.xmultadd * unique_count)
        end

        local added_mult = card.ability.extra.mult * unique_count
        local added_chips = card.ability.extra.chips * unique_count

        for _, scoring_card in ipairs(context.scoring_hand) do
          local s_type = get_suitless_type(scoring_card)
          if s_type then
            scoring_card.ability.perma_bonus = (scoring_card.ability.perma_bonus or 0) + added_chips
            scoring_card.ability.perma_mult = (scoring_card.ability.perma_mult or 0) + added_mult
            
            card_eval_status_text(scoring_card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex'), colour = G.C.ATTENTION })
          end
        end

        card_eval_status_text(context.blueprint and context.blueprint or card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex'), colour = G.C.ATTENTION })
        card:juice_up()
      end
    end

    if context.cardarea == G.play and context.repetition and context.other_card then
      local this_type = get_suitless_type(context.other_card)
      
      if this_type then
        local retrigger_count = 0
        local counted_types = {}

        for _, scoring_card in ipairs(context.scoring_hand) do
          local other_type = get_suitless_type(scoring_card)
          if other_type and other_type ~= this_type and not counted_types[other_type] then
            counted_types[other_type] = true
            retrigger_count = retrigger_count + 1
          end
        end

        if retrigger_count > 0 then
          return {
            repetitions = retrigger_count,
            card = context.other_card
          }
        end
      end
    end

    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "Camostar34 & Gud",
  },
}