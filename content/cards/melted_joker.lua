SMODS.Joker {
  key = 'melted_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars, card.ability.extra.x_mult } }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 7, y = 5 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult = 1.25, dollars = 1 } },

  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      local target = G.jokers.cards[1]
      if card ~= target and not target.ability.rental then
        SMODS.Stickers["rental"]:apply(target, true)
        SMODS.calculate_effect({ message = localize('k_abn_rental'), colour = G.C.FILTER }, card)
      end
    end
    if context.other_joker and context.other_joker.ability.rental and card ~= context.other_joker
    then
      G.E_MANAGER:add_event(Event({
        func = function()
          context.other_joker:juice_up(0.5, 0.5)
          return true
        end,
      }))
      return {
        x_mult = card.ability.extra.x_mult,
        dollars = card.ability.extra.dollars
      }
    end
  end,
  set_ability = function(self, card, initial, delay_sprites)
    SMODS.Stickers["rental"]:apply(card, true)
  end,
  abn_artist_credits = {
    artist = "Thingie",
  },
}
