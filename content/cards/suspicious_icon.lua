SMODS.Joker {
  key = 'suspicious_icon',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.GREEN, G.C.WHITE, 1.0)
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet12',
  pos = { x = 4, y = 1 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { cards = 1 } },
  pools = { ["Plagued"] = true, },
  
  loc_vars = function(self, info_queue, card)
    return { 
      vars = { 
        card.ability.extra.cards,
      } 
    }
  end, -- <-- Added the missing comma right here!
  
  -- only available on jimbo stakes
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)
    if context.setting_blind and not context.repetition then
      local card_target = context.blueprint_card or card
      local cards_to_process = card_target.ability.extra.cards or 1

      local valid_jokers = {}
      local owned_jokers = {}

      if G.jokers and G.jokers.cards then
        for _, v in ipairs(G.jokers.cards) do
          if v.config.center and v.config.center.key then
            owned_jokers[v.config.center.key] = true
          end

          -- dont destroy plagued jokers
          if v ~= card_target and not (v.config.center.pools and v.config.center.pools["Plagued"]) then
            table.insert(valid_jokers, v)
          end
        end
      end

      -- rarity pools
      local commons = { "j_abn_suspicious_icon" }
      local uncommons = { "j_abn_fit_to_shape", "j_abn_handbook_of_a_conman", "j_abn_asylum_joker", "j_abn_degraded_data_joker" }
      local rares = { "j_abn_blood_money", "j_abn_manga_panel_joker", "j_abn_monitor_joker", "j_abn_fractured_identity_joker", "j_abn_scantron_joker", "j_abn_ransomware_joker", "j_badformat_joker" }

      -- track how many we actually manage to destroy
      local successfully_destroyed = 0

      for i = 1, cards_to_process do
        if #valid_jokers > 0 then
          -- pick a random valid target
          local destroyed_joker, key = pseudorandom_element(valid_jokers, 'suspicious_icon_destroy')
          local target_rarity = destroyed_joker.config.center.rarity or 1
          
          -- determine pool rarity
          local base_pool = {}
          if target_rarity == 1 then
            -- common & uncommon
            for _, j in ipairs(commons) do table.insert(base_pool, j) end
            for _, j in ipairs(uncommons) do table.insert(base_pool, j) end
          elseif target_rarity == 2 then
            -- uncommon & rare
            for _, j in ipairs(uncommons) do table.insert(base_pool, j) end
            for _, j in ipairs(rares) do table.insert(base_pool, j) end
          else
            -- rare 
            for _, j in ipairs(rares) do table.insert(base_pool, j) end
          end

          -- remove already owned jokers from pool
          local available_pool = {}
          for _, joker_key in ipairs(base_pool) do
            if not owned_jokers[joker_key] then
              table.insert(available_pool, joker_key)
            end
          end

          -- fall back
          if #available_pool == 0 then
            available_pool = base_pool
          end

          -- select spawn
          local chosen_joker = pseudorandom_element(available_pool, 'plague_spawn')

          -- kill it
          destroyed_joker:start_dissolve()
          successfully_destroyed = successfully_destroyed + 1
          
          -- remove from list
          table.remove(valid_jokers, key)

          -- spawn new plagued joker
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
              local spawned_card = create_card('Joker', G.jokers, nil, nil, nil, nil, chosen_joker, 'plague')
              spawned_card:add_to_deck()
              G.jokers:emplace(spawned_card)
              spawned_card:start_materialize()
              return true
            end
          }))
        else
          break
        end
      end

      if successfully_destroyed > 0 then
        return {
          message = successfully_destroyed > 1 and ("+" .. successfully_destroyed .. " Jokers") or localize('k_plus_joker'),
          colour = G.C.GREEN,
          card = card_target
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Pepix",
  },
}