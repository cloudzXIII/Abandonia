SMODS.Joker {
  key = 'jokers_against_dark_suit',
  rarity = 2,
  atlas = 'ABNJokerSheet27',
  pos = { x = 5, y = 3 },
  cost = 8,
  blueprint_compat = true,
  config = { extra = { chips = 0, mult = 0, dollars = 2, amp = 2 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.dollars, card.ability.extra.amp } }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult,
        card = card
      }
    end

    if context.individual and context.cardarea == G.play then
      if ABN.is_light(context.other_card) then
        local is_vanilla = context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds")

        if is_vanilla then
          card.ability.extra.chips = card.ability.extra.chips + context.other_card.base.nominal
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS,
            card = card
          }
        else
          card.ability.extra.mult = card.ability.extra.mult + context.other_card.base.nominal
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT,
            card = card
          }
        end
      end

      if ABN.is_dark(context.other_card) then
        if not next(SMODS.find_card('j_abn_jokers_against_light_suit')) then
          return {
            dollars = -card.ability.extra.dollars,
          }
        else
          return {
            amp = card.ability.extra.amp,
            dollars = -card.ability.extra.dollars,
          }
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Tevi",
  },
}