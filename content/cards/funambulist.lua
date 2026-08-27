SMODS.Joker {
  key = 'funambulist',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local pos = G.jokers and ABN.get_pos(card, G.jokers.cards) or 0
    local jokers_left = (pos - 1)
    local total = G.jokers and #G.jokers.cards or 0
    local jokers_right = (total - pos)
    return {
      vars = {
        cae.chips,
        cae.mult,
        jokers_left > 0 and cae.mult * jokers_left or 0,
        jokers_right > 0 and cae.chips * jokers_right or 0
      }
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet3',
  pos = { x = 9, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 40, mult = 6 } },

  calculate = function(self, card, context)
    if context.joker_main then
      local my_pos = ABN.get_pos(card, G.jokers.cards)

      if my_pos then
        local left = 0
        local right = 0

        for i, joker in ipairs(G.jokers.cards) do
          if joker ~= card then
            if i < my_pos then
              left = left + 1
            elseif i > my_pos then
              right = right + 1
            end
          end
        end

        return {
          chips = card.ability.extra.chips * right,
          mult = card.ability.extra.mult * left,
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "rose_happy",
  },
}
