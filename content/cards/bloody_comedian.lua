SMODS.Joker {
  key = 'bloody_comedian',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult, card.ability.extra.chips } }
  end,

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,

  rarity = "abn_SuperRare",
  atlas = 'ABNJokerSheet4',
  pos = { x = 6, y = 1 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 1.5 } },
  pools = { ["Comedians"] = true, },


  update = function(self, card)
    if card.area == G.shop_jokers then
      card.cost = 30
    end
  end,

  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      local my_pos = ABN.get_pos(card, G.jokers.cards)
      if my_pos and G.jokers.cards[my_pos - 1] and not SMODS.is_eternal(G.jokers.cards[my_pos - 1], card) and not G.jokers.cards[my_pos - 1].getting_sliced then
        local sliced_card = G.jokers.cards[my_pos - 1]
        sliced_card.getting_sliced = true
        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
        G.E_MANAGER:add_event(Event({
          func = function()
            G.GAME.joker_buffer = 0
            card:juice_up(0.8, 0.8)
            sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
            play_sound('slice1', 0.96 + math.random() * 0.08)
            return true
          end
        }))
        G.E_MANAGER:add_event(Event({
          func = function()
            SMODS.add_card { set = "Comedians", key_append = "brat" }
            return true
          end
        }))
        return {
          message = localize('k_plus_joker'),
          colour = G.C.BLUE,
        }
      end
    end
    if context.other_joker and context.other_joker.config.center.rarity == "abn_SuperRare" then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Rome and Simcalirr",
  },
}
