SMODS.Joker {
  key = 'executioner',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.bonus } }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 7, y = 3 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { bonus = 2 } },

  calculate = function(self, card, context)
    if context.remove_playing_cards and not context.blueprint then
      if G.hand.cards and #G.hand.cards > 0 then
        for _, c in ipairs(G.hand.cards) do
          for _, removed_card in ipairs(context.removed) do
            if removed_card ~= c then
              c.ability.perma_bonus = c.ability.perma_bonus + card.ability.extra.bonus
              SMODS.calculate_effect({ message = localize('k_upgrade_ex'), colour = G.C.FILTER }, c)
            end
          end
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "Firch"
  },
}
