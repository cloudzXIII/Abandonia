-- Helper function to validate the combo and count unique rarities
local function get_joker_family_data()
  if not G.jokers or not G.jokers.cards then return false, 0 end
  
  local has_common = false
  local has_uncommon = false
  local has_rare = false
  local has_comedian = false
  
  -- Track unique rarities using a set
  local unique_rarities = {}

  for i = 1, #G.jokers.cards do
    local j = G.jokers.cards[i]
    if j.config.center then
      local rarity = j.config.center.rarity
      
      -- Flag required base family members
      if rarity == 1 then has_common = true
      elseif rarity == 2 then has_uncommon = true
      elseif rarity == 3 then has_rare = true
      end
      
      -- Add standard rarity tracking
      if rarity then
        unique_rarities[rarity] = true
      end
      
      -- Check and track custom pool for Comedians
      if j.config.center.pools and j.config.center.pools.Comedians then
        has_comedian = true
        unique_rarities['Comedians'] = true
      end
    end
  end

  -- Count the total number of unique keys in our set
  local unique_count = 0
  for _ in pairs(unique_rarities) do
    unique_count = unique_count + 1
  end

  local has_combo = has_common and has_uncommon and has_rare and has_comedian
  return has_combo, unique_count
end

SMODS.Joker {
  key = 'joker_family',
  rarity = 3,
  atlas = 'ABNJokerSheet12',
  pos = { x = 6, y = 3 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { xmult = 1, xmultadd = 1 } },
  
  loc_vars = function(self, info_queue, card)
    return { 
      vars = { 
        card.ability.extra.xmult,
        card.ability.extra.xmultadd,
      } 
    }
  end,
  
  -- Only available if we already have the full family in our jokers
  in_pool = function(self)
    local has_combo, _ = get_joker_family_data()
    return has_combo
  end,
  
  update = function(self, card)
    -- Only run during a game run and after G.jokers is initialized
    if G.STAGE ~= G.STAGES.RUN or not G.jokers or not G.jokers.cards then return end
    
    local has_combo, unique_count = get_joker_family_data()
    
    if has_combo then
      card.ability.extra.xmult = unique_count * card.ability.extra.xmultadd
    else
      card.ability.extra.xmult = 1
    end
  end,
  
  calculate = function(self, card, context)
    local has_combo, _ = get_joker_family_data()
    
    -- reduce blind requirement
    if context.setting_blind and not context.blueprint then
      if has_combo then
        G.GAME.blind.chips = G.GAME.blind.chips * 0.5
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
      end
    end
  
    -- scoring
    if context.joker_main then
      if has_combo and card.ability.extra.xmult > 1 then
        return {
          xmult = card.ability.extra.xmult,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}