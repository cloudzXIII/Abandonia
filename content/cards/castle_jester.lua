-- Castle Jester (coded by cloudzXIII)
SMODS.Joker {
  key = 'castle_jester',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet7',
  pos = { x = 9, y = 2 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, chips = 0 } },
  calculate = function(self, card, context)
    if context.after and context.main_eval and not context.blueprint then
      local has_continent = false
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability.set == "continent" then
          has_continent = true
        end
      end
      if has_continent then
        local upgraded = false
        for i = 1, #G.hand.cards do
          if ABN.is_number(G.hand.cards[i]) and not SMODS.has_no_rank(G.hand.cards[i]) then
            SMODS.scale_card(card, {
              ref_table = card.ability.extra,
              ref_value = "chips",
              scalar_table = G.hand.cards[i].base,
              scalar_value = "nominal",
              no_message = true,
            })
            upgraded = true
          end
          if G.hand.cards[i]:is_face() and not SMODS.has_no_rank(G.hand.cards[i]) then
            SMODS.scale_card(card, {
              ref_table = card.ability.extra,
              ref_value = "mult",
              scalar_table = G.hand.cards[i].base,
              scalar_value = "nominal",
              no_message = true,
            })
            upgraded = true
          end
        end
        if upgraded then
          SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, card)
        end
      end
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Littleroot",
  },
  in_pool = function(self)
    return G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.continent and
        G.GAME.consumeable_usage_total.continent > 0
  end
}
