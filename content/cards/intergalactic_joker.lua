-- Intergalactic Joker

SMODS.Joker {
  key = 'intergalactic_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.asc_power } }
  end,

  rarity = "abn_SuperRare",
  atlas = 'ABNJokerSheet20',
  pos = { x = 4, y = 1 },
  cost = 30,
  discovered = false,
  blueprint_compat = true,

  update = function(self, card)
    if card.area == G.shop_jokers then
      card.cost = 30
    end
  end,

  config = { extra = { asc_power = 2 } },
  calculate = function(self, card, context)
    if context.before and context.poker_hands then
      -- idk why i have to do this, the hand name just dissappears for some reason when using SMODS.upgrade_poker_hands?
      update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, {
        mult = G.GAME.hands[context.scoring_name].mult,
        chips = G.GAME.hands[context.scoring_name].chips,
        handname = localize(context.scoring_name, 'poker_hands'),
        level = G.GAME.hands[context.scoring_name].level
      })
      local cph = {}
      for k, v in pairs(context.poker_hands) do
        if next(v) then
          cph[k] = true
        end
      end

      local hands_to_upgrade = {}
      for k, v in ipairs((G.consumeables or {}).cards) do
        if v and v.ability.set == 'Planet' and tostring(v.ability.consumeable.hand_type) and cph[v.ability.consumeable.hand_type] and not ABN.table_contains(hands_to_upgrade, v.ability.consumeable.hand_type) then
          hands_to_upgrade[#hands_to_upgrade + 1] = v.ability.consumeable.hand_type
        end
      end

      if #hands_to_upgrade > 0 then
        SMODS.upgrade_poker_hands({
          hands = hands_to_upgrade,
          from = context.blueprint_card or card,
          ascension_power = card.ability.extra.asc_power,
        })
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, {
          mult = G.GAME.hands[context.scoring_name].mult,
          chips = G.GAME.hands[context.scoring_name].chips,
          handname = localize(context.scoring_name, 'poker_hands'),
          level = G.GAME.hands[context.scoring_name].level
        })
      end
    end
  end,
  abn_artist_credits = {
    artist = "Triangle Snack",
  },

}
