SMODS.Joker {
  key = 'awakening_oopart',
  rarity = 2,
  atlas = 'ABNJokerSheet10',
  pos = { x = 6, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  unlocked = true,
  config = { extra = { mult = 1, chips = 5 } },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
    return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
  end,

  in_pool = function(self)
    if not G.playing_cards then return false end

    -- steel card check
    local has_steel = false
    for _, card in ipairs(G.playing_cards) do
      if card.config.center == G.P_CENTERS.m_steel then
        has_steel = true
        break
      end
    end

    -- has a program card been used
    local program_card_used = G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.program_pack and
        G.GAME.consumeable_usage_total.program_pack > 0

    -- if both yes spawn
    return has_steel and program_card_used
  end,

  calculate = function(self, card, context)
    if context.buying_card and not context.blueprint then
      local bought_card = context.card

      -- Check if the bought card is a Planet OR part of the program_pack set
      if bought_card and (bought_card.config.center.set == 'Planet' or bought_card.config.center.set == 'program_pack') then
        -- Apply the negative edition
        bought_card:set_edition({ negative = true }, true)
      end
    end

    -- If using a planet or program card
    if context.using_consumeable and context.consumeable.ability.set == "Planet" or context.using_consumeable and context.consumeable.ability.set == "program_pack" then
      if G.hand.cards then
        for _, c in ipairs(G.hand.cards) do
          -- Give held steel cards mult and chips
          if c.config.center == G.P_CENTERS.m_steel then
            c.ability.perma_bonus = (c.ability.perma_bonus or 0) + card.ability.extra.chips
            c.ability.perma_mult = (c.ability.perma_mult or 0) + card.ability.extra.mult
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "La Ginger",
  },
}
