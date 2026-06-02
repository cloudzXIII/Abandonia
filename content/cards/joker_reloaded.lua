SMODS.Joker {
  key = 'joker_reloaded',
  rarity = 3,
  atlas = 'ABNJokerSheet13',
  pos = { x = 1, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      mult = 2,
      chips = 1,
    },
  },
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult, 
        card.ability.extra.chips,
      }
    }
  end,
  
  in_pool = function(self, args)
    if G.consumeables and G.consumeables.cards then
      for _, c in ipairs(G.consumeables.cards) do
        if c.edition then
          return true
        end
      end
    end
    return false
  end,
  
  calculate = function(self, card, context)
    if context.end_of_round and context.main_eval and not context.blueprint then
      if G.consumeables and #G.consumeables.cards > 0 then
        local editions_found = {}
        local unique_edition_count = 0

        for _, c in ipairs(G.consumeables.cards) do
          if c.edition and c.edition.key then
            if not editions_found[c.edition.key] then
              editions_found[c.edition.key] = true
              unique_edition_count = unique_edition_count + 1
            end
          end
        end

        if unique_edition_count > 0 and G.jokers and #G.jokers.cards > 0 then
          local total_chips = card.ability.extra.chips * unique_edition_count
          local total_mult = card.ability.extra.mult * unique_edition_count

          for i = 1, #G.jokers.cards do
            local j = G.jokers.cards[i]

            -- Apply mult and chips
            j.ability.abn_perma_bonus = (j.ability.abn_perma_bonus or 0) + total_chips
            j.ability.abn_perma_mult = (j.ability.abn_perma_mult or 0) + total_mult
            
          end

          return {
            message = localize('k_upgrade_ex'),
          }
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}