SMODS.Joker {
  key = 'joker_totebag',
  rarity = 1,
  atlas = 'ABNJokerSheet13',
  pos = { x = 2, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chipsadd = 4,
      multadd = 4,
      chips = 0,
      mult = 0,
    },
  },
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chipsadd,
        card.ability.extra.multadd,
        card.ability.extra.chips,
        card.ability.extra.mult,
      }
    }
  end,
  
  in_pool = function(self, args)
    if G.consumeables and #G.consumeables.cards > 1 then
      local key_counts = {}
      for _, c in ipairs(G.consumeables.cards) do
        if c.config and c.config.center and c.config.center.key then
          local key = c.config.center.key
          key_counts[key] = (key_counts[key] or 0) + 1
          if key_counts[key] >= 2 then
            return true
          end
        end
      end
    end
    return false
  end,
  
  calculate = function(self, card, context)
    -- scoring
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult,
        card = card
      }
    end

    if context.setting_blind and not context.blueprint then
      if G.consumeables and #G.consumeables.cards > 0 then
        
        -- Count how many of each card
        local key_counts = {}
        for _, c in ipairs(G.consumeables.cards) do
          if c.config and c.config.center and c.config.center.key then
            local key = c.config.center.key
            key_counts[key] = (key_counts[key] or 0) + 1
          end
        end

        -- Track which cards are actually part of a duplicate group
        local sharing_consumables_count = 0
        for _, c in ipairs(G.consumeables.cards) do
          if c.config and c.config.center and c.config.center.key then
            local key = c.config.center.key
            if (key_counts[key] or 0) > 1 then
              sharing_consumables_count = sharing_consumables_count + 1
            end
          end
        end

        -- If duplicate keys are found, process scaling
        if sharing_consumables_count > 0 then
          local total_chipsadd = card.ability.extra.chipsadd * sharing_consumables_count
          local total_multadd = card.ability.extra.multadd * sharing_consumables_count

          card.ability.extra.chips = card.ability.extra.chips + total_chipsadd
          card.ability.extra.mult = card.ability.extra.mult + total_multadd

          -- Check editions strictly among the duplicate key cards
          local unique_editions = {}
          local actual_editions_count = 0
          local missing_edition = false

          for _, c in ipairs(G.consumeables.cards) do
            if c.config and c.config.center and c.config.center.key then
              local key = c.config.center.key
              if (key_counts[key] or 0) > 1 then
                local ed_key = (c.edition and c.edition.key) or 'none' 
                
                if not unique_editions[ed_key] then
                  unique_editions[ed_key] = true
                  actual_editions_count = actual_editions_count + 1
                else
                  missing_edition = true
                end
              end
            end
          end

          -- Double if every duplicate card has a unique edition
          if not missing_edition and actual_editions_count == sharing_consumables_count then
            card.ability.extra.chips = card.ability.extra.chips * 2
            card.ability.extra.mult = card.ability.extra.mult * 2
          end

          card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') })
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}