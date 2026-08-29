SMODS.Joker {
  key = 'canvas_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet18',
  pos = { x = 4, y = 2 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chips = 25,
      mult = 5
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.mult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local target = context.other_card
      local base_suits = { 'Spades', 'Hearts', 'Clubs', 'Diamonds' }
      local is_modded_suit = false

      for suit_key, _ in pairs(SMODS.Suits) do
        local is_base = false
        for _, base_suit in ipairs(base_suits) do
          if suit_key == base_suit then
            is_base = true
            break
          end
        end

        if not is_base and target:is_suit(suit_key) then
          is_modded_suit = true
          break
        end
      end

      if is_modded_suit then
        return {
          chips = card.ability.extra.chips,
          mult = card.ability.extra.mult,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Cosine Rave",
  },
}