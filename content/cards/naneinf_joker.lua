SMODS.Joker {
  key = 'naneinf_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.BLACK, G.C.WHITE, 1.0)
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet12',
  pos = { x = 4, y = 4 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  pools = { ["Plagued"] = true },
  
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  update = function(self, card)
    if G.STAGE ~= G.STAGES.RUN or not G.jokers or not G.jokers.cards then return end
    
    -- Specific terms that indicate how MUCH a variable scales up by per trigger
    local scaling_roots = { "add", "gain", "mod", "scale", "increase", "up" }
    
    local is_scaling_factor = function(k)
      local sk = string.lower(tostring(k))
      -- Exclude active values, IDs, and multiplicative configurations
      if string.find(sk, "x_") or k == 'id' or k == 'groups' or k == 'naneinf_doubled' then return false end
      for _, root in ipairs(scaling_roots) do
        if string.find(sk, root) then return true end
      end
      return false
    end

    -- === APPLY THE DOUBLE EFFECT TO SCALING RATE ===
    for i = 1, #G.jokers.cards do
      local j = G.jokers.cards[i]
      
      if j.config.center and j.config.center.key ~= 'j_abn_naneinf_joker' and not j.ability.naneinf_doubled then
        -- ONLY search inside tables where scaling speed keys exist (e.g., extra.mult_gain = 2)
        if type(j.ability.extra) == "table" then
          for k, v in pairs(j.ability.extra) do
            if type(v) == "number" and is_scaling_factor(k) then
              j.ability.extra[k] = v * 2
            end
          end
        end

        -- Check base card.ability table for internal scaling triggers
        for k, v in pairs(j.ability) do
          if type(v) == "number" and is_scaling_factor(k) then
            j.ability[k] = v * 2
          end
        end

        j.ability.naneinf_doubled = true
      end
    end
  end,

  -- === UNDOUBLE CLEANUP ON REMOVAL FROM DECK ===
  remove_from_deck = function(self, card, from_debuff)
    if not G.jokers or not G.jokers.cards then return end
    
    local scaling_roots = { "add", "gain", "mod", "scale", "inc", "up" }
    local is_scaling_factor = function(k)
      local sk = string.lower(tostring(k))
      if string.find(sk, "x_") or k == 'id' or k == 'groups' or k == 'naneinf_doubled' then return false end
      for _, root in ipairs(scaling_roots) do
        if string.find(sk, root) then return true end
      end
      return false
    end

    for i = 1, #G.jokers.cards do
      local j = G.jokers.cards[i]
      if j.ability and j.ability.naneinf_doubled then
        
        if type(j.ability.extra) == "table" then
          for k, v in pairs(j.ability.extra) do
            if type(v) == "number" and is_scaling_factor(k) then
              j.ability.extra[k] = v / 2
            end
          end
        end

        for k, v in pairs(j.ability) do
          if type(v) == "number" and is_scaling_factor(k) then
            j.ability[k] = v / 2
          end
        end

        j.ability.naneinf_doubled = nil
      end
    end
  end,
  
  calculate = function(self, card, context)
    local function is_scaling_joker(other_card)
      if other_card and other_card ~= card and other_card.ability and type(other_card.ability.extra) == 'table' then
        local scaling_roots = { "add", "gain", "mod", "scale", "inc", "up" }
        for k, v in pairs(other_card.ability.extra) do
          if type(k) == "string" then
            local lower_key = k:lower()
            for _, root in ipairs(scaling_roots) do
              if string.find(lower_key, root) and not string.find(lower_key, "x_") then
                return true
              end
            end
          end
        end
      end
      return false
    end

    -------------------------------------------------------------------------
    -- RETRIGGER EFFECT: First Scaling Joker triggers again
    -------------------------------------------------------------------------
    if context.retrigger_joker_check and not context.retrigger_joker then
      if is_scaling_joker(context.other_card) then
        local first_scaling_joker = nil
        for i = 1, #G.jokers.cards do
          if is_scaling_joker(G.jokers.cards[i]) then
            first_scaling_joker = G.jokers.cards[i]
            break
          end
        end

        if context.other_card == first_scaling_joker then
          return {
            message = localize('k_again_ex'),
            repetitions = 1,
            card = card
          }
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Swanky",
  },
}