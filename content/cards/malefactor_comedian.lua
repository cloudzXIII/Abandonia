SMODS.Joker {
  key = 'malefactor_comedian',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips,
      }
    }
  end,

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,

  rarity = "abn_SuperRare",
  atlas = 'AbandoniaJokers',
  pos = { x = 2, y = 17 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, chips = 0, } },

  update = function(self, card)
    if card.area == G.shop_jokers then
      card.cost = 30
    end
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local currentCard = context.other_card
      if currentCard and ABN.is_light(currentCard) then
        card.ability.extra.chips = card.ability.extra.chips + currentCard.base.nominal
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.BLUE,
          card = card
        }
      elseif currentCard and ABN.is_dark(currentCard) then
        card.ability.extra.mult = card.ability.extra.mult + currentCard.base.nominal
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.RED,
          card = card
        }
      end
    end


    -- Scoring logic
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "Tjinnea & Riley",
  },
}
