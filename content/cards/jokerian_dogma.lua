SMODS.Joker {
  key = 'jokerian_dogma',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return {
      vars = {
        cae.asc,
      },
    }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet24',
  pos = { x = 5, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      asc = 0.25,
    }
  },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local editions = { "e_foil", "e_polychrome", "e_holo", "e_negative" }
      if context.other_card.ability.set == "Enhanced" and context.other_card.edition and not ABN.table_contains(editions, context.other_card.edition.key) then
        return {
          asc = card.ability.extra.asc
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Lucithecreature",
  },

  in_pool = function(self, args)
    local has_modded_suit = false
    local has_vanilla_suit = false
    local vanilla_suits = { "Hearts", "Clubs", "Spades", "Diamonds" }

    for _, playing_card in ipairs(G.playing_cards or {}) do
      if not SMODS.has_no_suit(playing_card) then
        if ABN.table_contains(vanilla_suits, playing_card.base.suit) then
          has_vanilla_suit = true
        else
          has_modded_suit = true
        end
      end
    end
    return has_modded_suit and has_vanilla_suit
  end
}
