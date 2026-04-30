SMODS.Joker {
  key = 'fraud_soul',
  rarity = 1,
  atlas = 'ABNJokerSheet4',
  pos = { x = 4, y = 1 },
  soul_pos = { x = 5, y = 1 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 5, mult = 1, xmult = 0.01, xchips = 0.01, dollars = 1, retriggers = 1 } },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.mult,
        card.ability.extra.xmult,
        card.ability.extra.xchips,
        card.ability.extra.dollars,
        card.ability.extra.retriggers,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      -- Identify the target: the rightmost Joker
      local target = G.jokers.cards[#G.jokers.cards]

      -- Validation check similar to Gabagool logic
      if target and type(target) == 'table' then
        if target.ability and target.ability.set == 'Joker' then
          local triggered = false

          -- Loop through consumables to determine what bonus to give
          for _, v in pairs(G.consumeables.cards) do
            if v.config.center.set == 'Tarot' then
              target.ability.abn_perma_bonus = (target.ability.abn_perma_bonus or 0) + card.ability.extra.chips
              triggered = true
            elseif v.config.center.set == 'Planet' then
              target.ability.abn_perma_mult = (target.ability.abn_perma_mult or 0) + card.ability.extra.mult
              triggered = true
            elseif v.config.center.set == 'Spectral' then
              target.ability.abn_perma_xmult = (target.ability.abn_perma_xmult or 1) + card.ability.extra.xmult
              triggered = true
            elseif v.config.center.set == 'sigils' then
              target.ability.abn_perma_xchips = (target.ability.abn_perma_xchips or 1) + card.ability.extra.xchips
              triggered = true
            elseif v.config.center.set == 'astro_cards' then
              target.ability.abn_perma_dollars = (target.ability.abn_perma_dollars or 0) + card.ability.extra.dollars
              triggered = true
            elseif v.config.center.set == 'calamity_cards' then
              -- Double the values stored in this card's config
              for k, val in pairs(card.ability.extra) do
                card.ability.extra[k] = val * 2
              end
              triggered = true
              --elseif v.config.center.set == 'nightshift_cards' then
              --target.ability.abn_perma_rep = (target.ability.abn_perma_rep or 0) + card.ability.extra.retriggers
              --triggered = true
            end
          end

          if triggered then
            card:juice_up()
            target:juice_up()
            return {
              message = localize('k_upgrade_ex'),
              colour = G.C.Mult,
            }
          end
        end
      end
    end

    if context.first_hand_drawn then
      for _, v in pairs(G.consumeables.cards) do
        if v.config.center.set == 'nightshift_cards' then
          triggered_hand_card = pseudorandom_element(G.hand.cards, pseudoseed('fraud_soul'))
          triggered_hand_card.ability.perma_repetitions = (triggered_hand_card.ability.perma_repetitions or 0) +
          card.ability.extra.retriggers
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}
