SMODS.Joker {
  key = 'jester_vs_jester',
  rarity = 3, 
  atlas = 'ABNJokerSheet14',
  pos = { x = 8, y = 3 }, 
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      common_even_chips = 30,
      common_odd_chips = 35,
      uncommon_even_xmult = 1.16,
      uncommon_odd_xmult = 1.15,
      rare_even_xchips = 2.0,
      rare_odd_xchips = 2.3
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.common_even_chips,
        card.ability.extra.common_odd_chips,
        card.ability.extra.uncommon_even_xmult,
        card.ability.extra.uncommon_odd_xmult,
        card.ability.extra.rare_even_xchips,
        card.ability.extra.rare_odd_xchips
      },
    }
  end,
  
  in_pool = function(self, args)
    if G.jokers and G.jokers.cards then
      for _, j in ipairs(G.jokers.cards) do
        if j.config.center.rarity == 1 then
          return true
        end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local other = context.other_card
      local rank = other:get_id()
      
      if not rank then return end

      -- Even: 2, 4, 6, 8, 10
      local is_even = (rank == 2 or rank == 4 or rank == 6 or rank == 8 or rank == 10)
      -- Odd: 3, 5, 7, 9, 14 (Ace)
      local is_odd = (rank == 3 or rank == 5 or rank == 7 or rank == 9 or rank == 14)

      if not is_even and not is_odd then return end

      -- Count Joker Rarities
      local common_count = 0
      local uncommon_count = 0
      local rare_count = 0

      if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
          if j.config.center.rarity == 1 then
            common_count = common_count + 1
          elseif j.config.center.rarity == 2 then
            uncommon_count = uncommon_count + 1
          elseif j.config.center.rarity == 3 then
            rare_count = rare_count + 1
          end
        end
      end

      local ret_chips = 0
      local ret_xmult = 1
      local ret_xchips = 1
      local triggered = false

      -- Common Joker
      if is_even and (common_count % 2 == 0) then
        ret_chips = ret_chips + card.ability.extra.common_even_chips
        triggered = true
      elseif is_odd and (common_count % 2 ~= 0) then
        ret_chips = ret_chips + card.ability.extra.common_odd_chips
        triggered = true
      end

      -- Uncommon Joker
      if is_even and (uncommon_count % 2 == 0) then
        ret_xmult = ret_xmult * card.ability.extra.uncommon_even_xmult
        triggered = true
      elseif is_odd and (uncommon_count % 2 ~= 0) then
        ret_xmult = ret_xmult * card.ability.extra.uncommon_odd_xmult
        triggered = true
      end

      -- Rare Joker
      if is_even and (rare_count % 2 == 0) then
        ret_xchips = ret_xchips * card.ability.extra.rare_even_xchips
        triggered = true
      elseif is_odd and (rare_count % 2 ~= 0) then
        ret_xchips = ret_xchips * card.ability.extra.rare_odd_xchips
        triggered = true
      end

      -- Scoring
      if triggered then
        local ret = {
          card = card
        }
        if ret_chips > 0 then ret.chips = ret_chips end
        if ret_xmult ~= 1 then ret.x_mult = ret_xmult end
        if ret_xchips ~= 1 then ret.x_chips = ret_xchips end 
        
        return ret
      end
    end
  end,
  abn_artist_credits = {
    artist = "Comykel",
  },
}