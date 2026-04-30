SMODS.Joker {
  key = 'camorrista',
  rarity = 3,
  atlas = 'ABNJokerSheet5',
  pos = { x = 8, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 1, xmultadd = 0.1, dollars = 1 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult, card.ability.extra.xmultadd, card.ability.extra.dollars } }
  end,


  calculate = function(self, card, context)
    -- Trigger this at blind selection
    if context.setting_blind then
      for _, v in ipairs(G.jokers.cards) do
        if v ~= card then
          v.sell_cost = v.sell_cost - card.ability.extra.dollars
          card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
        end
      end
    end

    if context.first_hand_drawn and #G.jokers.cards >= 2 then
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.RED,
        card = card
      }
    end

    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Milk-Milkshake",
  },
}
