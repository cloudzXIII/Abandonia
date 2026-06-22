SMODS.Joker {
  key = 'perfidious_comedian',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips,
      }
    }
  end,

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,

  rarity = "abn_SuperRare",
  atlas = 'ABNJokerSheet5',
  pos = { x = 2, y = 2 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { stop = false, mult = 0, chips = 0 } },
  pools = { ["Comedians"] = true },

  update = function(self, card)
    if card.area == G.shop_jokers then
      card.cost = 30
    end
  end,

  calculate = function(self, card, context)
    if context.individual and (context.cardarea == G.play or context.cardarea == G.hand) then
      if ABN.is_even(context.other_card) and context.other_card.seal then
        local rank_val = context.other_card.base.nominal
        card.ability.extra.mult = card.ability.extra.mult + rank_val
        
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'),})
      end

      if ABN.is_odd(context.other_card) and context.other_card.seal then
        local rank_val = context.other_card.base.nominal
        card.ability.extra.chips = card.ability.extra.chips + rank_val
        
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'),})
      end
    end

    if not card.ability.extra.stop and context.individual and context.cardarea == G.play then
      if context.other_card == context.scoring_hand[#context.scoring_hand] then
        card.ability.extra.stop = true
        for i = 1, #G.hand.cards do
          local hand_card = G.hand.cards[i]
          if (ABN.is_even(hand_card) or ABN.is_odd(hand_card)) and hand_card.seal then
            SMODS.calculate_effect(hand_card)
            SMODS.score_card(hand_card, context)
          end
        end
        card.ability.extra.stop = false
      end
    end

    if context.joker_main then
      if card.ability.extra.mult > 0 or card.ability.extra.chips > 0 then
        return {
          mult = card.ability.extra.mult,
          chips = card.ability.extra.chips,
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Maw and Gappie",
  },
}