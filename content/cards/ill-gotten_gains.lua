SMODS.Joker {
  key = 'ill_gotten_gains',
  rarity = 1,
  atlas = 'ABNJokerSheet2',
  pos = { x = 2, y = 4 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { dollars = 4, bdollars = 8, } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars, card.ability.extra.bdollars } }
  end,

  calculate = function(self, card, context)
    if not next(SMODS.find_card("j_glass")) then
      -- if glass card breaks
      if context.remove_playing_cards and not context.blueprint then
        local glass_cards = 0
        for _, removed_card in ipairs(context.removed) do
          if removed_card.shattered then glass_cards = glass_cards + 1 end
        end
        if glass_cards > 0 then
          return {
            dollars = card.ability.extra.bdollars * glass_cards,
            colour = G.C.MONEY,
            card = card
          }
        end
      end

      -- trigger for every card in the scoring hand individually
      if context.individual and context.cardarea == G.play then
        -- check if card is glass
        if context.other_card.config.center == G.P_CENTERS.m_glass then
          return {
            dollars = card.ability.extra.dollars,
            colour = G.C.MONEY,
            card = card
          }
        end
      end
    else
      -- trigger for every card in the scoring hand individually
      if context.individual and context.cardarea == G.play then
        -- check if card is glass
        if context.other_card.config.center == G.P_CENTERS.m_glass then
          context.other_card:set_edition(poll_edition('ill', nil, false, true))
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Conium Maculatum",
  },
}
