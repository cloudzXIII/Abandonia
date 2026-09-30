-- Coded by Okronix
SMODS.ConsumableType {
  key = "cassette",
  primary_colour = HEX("5e7073"),
  secondary_colour = HEX("5e7073"),
  text_colour = HEX("ffffff"),
  collection_rows = { 3, 3 },
  shop_rate = 0,
}

local function abn_end_cassette(self, card)
  if #SMODS.find_card("j_abn_retro_aficionado") == 0 then
    set_consumeable_usage(card)
    SMODS.calculate_effect({ message = localize('k_extinct_ex'), colour = G.C.MULT, sound = 'tarot1', }, card)
    SMODS.destroy_cards(card)
    SMODS.calculate_context({ abn_cassette_end = true })
    G.GAME.abn_cassettes_ended = (G.GAME.abn_cassettes_ended or 0) + 1
  elseif not card.ability.extra.retro_aficionado_trigger then
    SMODS.calculate_effect({ message = localize('k_abn_repeat_ex'), colour = G.C.GREEN, sound = 'tarot1', }, card)
    card.ability.extra.count = 8
    card.ability.extra.retro_aficionado_trigger = true
  end
end

ABN.Cassette = SMODS.Consumable:extend({
  set = 'cassette',
  cost = 4,
  atlas = "abn_AbandoniaCassettes",
  pos = { x = 0, y = 0 },

  config = {
    extra = {
      suit1 = "Hearts",
      suit2 = "Spades",
      count = 8,
      chips = 10,
      mult = 10
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.count,
        localize(card.ability.extra.suit1, 'suits_plural'),
        localize(card.ability.extra.suit2, 'suits_plural'),
        card.ability.extra.chips,
        card.ability.extra.mult,
        colours = { G.C.SUITS[card.ability.extra.suit1], G.C.SUITS[card.ability.extra.suit2] },
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and not context.blueprint then
      local scoring_card = context.other_card
      if scoring_card:is_suit(card.ability.extra.suit1) or scoring_card:is_suit(card.ability.extra.suit2) then
        if card.ability.extra.count ~= 0 then
          card.ability.extra.count = card.ability.extra.count - 1

          return {
            chips = card.ability.extra.chips,
            mult = card.ability.extra.mult
          }
        end
      end
    end

    if context.after and context.main_eval and not context.blueprint and card.ability.extra.count <= 0 then
      abn_end_cassette(self, card)
    end
  end,

  abn_artist_credits = {
    artist = "Muddz",
  },
})

ABN.Cassette {
  key = "vex",
  pos = { x = 8, y = 1 },

  config = {
    extra = {
      suit1 = "Diamonds",
      suit2 = "Clubs",
      count = 8,
      chips = 10,
      mult = 10
    }
  },
}

ABN.Cassette {
  key = "lament",
  pos = { x = 9, y = 1 },

  config = {
    extra = {
      suit1 = "Hearts",
      suit2 = "Spades",
      count = 8,
      chips = 10,
      mult = 10
    }
  },
}

ABN.Cassette {
  key = "sanguine",
  pos = { x = 0, y = 2 },

  config = {
    extra = {
      suit1 = "Hearts",
      suit2 = "Diamonds",
      count = 8,
      chips = 10,
      mult = 10
    }
  },
}

ABN.Cassette {
  key = "mastery",
  pos = { x = 1, y = 2 },

  config = {
    extra = {
      suit1 = "Clubs",
      suit2 = "Spades",
      count = 8,
      chips = 10,
      mult = 10
    }
  },
}

ABN.Cassette {
  key = "stargazing",
  pos = { x = 2, y = 2 },

  config = {
    extra = {
      suit1 = "Hearts",
      suit2 = "Clubs",
      count = 8,
      chips = 10,
      mult = 10
    }
  },
}

ABN.Cassette {
  key = "kickstart",
  pos = { x = 3, y = 2 },

  config = {
    extra = {
      suit1 = "Diamonds",
      suit2 = "Spades",
      count = 8,
      chips = 10,
      mult = 10
    }
  },
}
