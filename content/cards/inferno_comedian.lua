SMODS.Joker {
  key = 'inferno_comedian',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult, card.ability.extra.chips } }
  end,

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,

  rarity = "abn_SuperRare",
  atlas = 'AbandoniaJokers',
  pos = { x = 1, y = 17 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 1.7, chips = 0, hand_chips = 0 } },
  
  -- cannot appear in shop
  in_pool = function(self, args)
    if G.STATE == G.STATES.SHOP and not next(SMODS.find_card("j_abn_carnival_comedian")) then
        return false
    end
  end,
  
  update = function(self, card)
    if card.area == G.shop_jokers then
		card.cost = 30
	end
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      return {
        xmult = card.ability.extra.xmult,
      }
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
    if context.after and context.main_eval and not context.blueprint and SMODS.last_hand_oneshot then
      card.ability.extra.hand_chips = hand_chips
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "hand_chips",
        operation = '+',
        scaling_message = {
          message = localize("k_abn_oneshot"),
          colour = G.C.FILTER
        }
      })
    end
  end,
  abn_artist_credits = {
    artist = "Toyrapple",
  },
}
