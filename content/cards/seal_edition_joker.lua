SMODS.Joker {
  key = 'seal_edition_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet4',
  pos = { x = 9, y = 0 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = { mult = 10 }
  },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,

  in_pool = function(self)
    if not G.playing_cards then return false end
    local seal_count = 0
    for _, card in ipairs(G.playing_cards) do
      if card.seal then
        seal_count = seal_count + 1
      end
      if seal_count >= 2 then return true end
    end
    return false
  end,

  calculate = function(self, card, context)
    -- Store seen seals
    if context.before and not context.blueprint then
      card.ability.seals_seen = {}
    end

    -- Trigger for every card in the scoring hand individually
    if context.individual and context.cardarea == G.play then
      local target_card = context.other_card

      -- Check if the card has a seal AND if we haven't had this specific seal yet
      if target_card.seal and not card.ability.seals_seen[target_card.seal] then
        -- Mark this seal type as "seen"
        card.ability.seals_seen[target_card.seal] = true

        -- Loop through all Jokers to apply the permanent mult
        for i = 1, #G.jokers.cards do
          local j = G.jokers.cards[i]
          j.ability.abn_perma_mult = (j.ability.abn_perma_mult or 0) + card.ability.extra.mult
        end

        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}
