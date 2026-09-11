local hook_hot_mult = Card.calculate_joker
function Card:calculate_joker(context)
  if context.joker_main and not self.debuff then
    if self.area == G.consumeables
    and self.config
    and self.config.center
    and self.config.center.original_mod then
      local jokers = SMODS.find_card('j_abn_hot_mult_in_your_area')
      if jokers and #jokers > 0 then
        local total_xmult = 0
        for _, joker in ipairs(jokers) do
          if joker.ability and joker.ability.extra and joker.ability.extra.xmult then
            total_xmult = total_xmult + joker.ability.extra.xmult
          end
        end
        if total_xmult > 0 then
          return {
            message = localize {
              type = 'variable',
              key = 'a_xmult',
              vars = { total_xmult }
            },
            Xmult_mod = total_xmult
          }
        end
      end
    end
  end
  return hook_hot_mult(self, context)
end

SMODS.Joker {
  key = 'hot_mult_in_your_area',
  rarity = 1,
  atlas = 'ABNJokerPopup',
  pixel_size = { w = 144, h = 86 },
  display_size = { w = 144, h = 86 },
  pos = { x = 0, y = 0 },
  cost = 4,
  config = { extra = { xmult = 2, odds = 5 } },
  discovered = false,
  blueprint_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.xmult, G.GAME.probabilities.normal, card.ability.extra.odds }
    }
  end,

  calculate = function(self, card, context)
    if context.before then
      if G.consumeables and G.consumeables.cards then
        for _, consumable in ipairs(G.consumeables.cards) do
          if consumable.config and consumable.config.center and consumable.config.center.original_mod then
            if pseudorandom('popup') < G.GAME.probabilities.normal / card.ability.extra.odds then
              consumable:start_dissolve(nil, true)
              card:juice_up(0.3, 0.3)
            end
          end
        end
      end
    end

    if context.joker_main then
      local modded_count = 0
      local has_vanilla = false

      if G.consumeables and G.consumeables.cards then
        for _, consumable in ipairs(G.consumeables.cards) do
          if consumable.config and consumable.config.center then
            if consumable.config.center.original_mod then
              modded_count = modded_count + 1
            else
              has_vanilla = true
            end
          end
        end
      end

      if modded_count == 1 then
        card_eval_status_text(card, 'extra', nil, nil, nil, {
          message = "mult just one phone call away",
          colour = G.C.ATTENTION
        })
      elseif modded_count >= 3 then
        card_eval_status_text(card, 'extra', nil, nil, nil, {
          message = "I share my mult with you",
          colour = G.C.ATTENTION
        })
      elseif modded_count == 0 and has_vanilla then
        card_eval_status_text(card, 'extra', nil, nil, nil, {
          message = "you got pop up blocker on honey",
          colour = G.C.ATTENTION
        })
      end
    end

    if context.selling_self then
      return {
        message = "No!",
        colour = G.C.ATTENTION
      }
    end
  end,

  abn_artist_credits = {
    artist = "Matheo000",
  },
}
