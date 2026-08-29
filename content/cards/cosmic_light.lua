SMODS.Joker {
  key = 'cosmic_light',
  rarity = 2,
  atlas = 'ABNJokerSheet18',
  pos = { x = 6, y = 3 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      mult = 15
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    return {
      vars = {
        card.ability.extra.mult
      }
    }
  end,

  in_pool = function(self, args)
    if G.playing_cards then
      local base_suits = { Spades = true, Hearts = true, Clubs = true, Diamonds = true }
      for _, c in ipairs(G.playing_cards) do
        if ABN and ABN.is_light and ABN.is_light(c) then
          for suit_key, _ in pairs(SMODS.Suits) do
            if not base_suits[suit_key] and c:is_suit(suit_key) then
              return true
            end
          end
        end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local target = context.other_card
      local base_suits = { Spades = true, Hearts = true, Clubs = true, Diamonds = true }

      if ABN and ABN.is_light and ABN.is_light(target) then
        for suit_key, _ in pairs(SMODS.Suits) do
          if not base_suits[suit_key] and target:is_suit(suit_key) then
            return {
              mult = card.ability.extra.mult,
              card = card
            }
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Cosine Rave",
  },
}