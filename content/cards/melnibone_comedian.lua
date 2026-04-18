local start_dissolve_original = Card.start_dissolve

function Card:start_dissolve(...)
  -- Only track if it's a Joker
  if next(SMODS.find_card('j_abn_melnibone_comedian')) then
    if self.config and self.config.center and self.config.center.set == "Joker" then
      local card_key = self.config.center.key
      G.GAME.banned_keys[card_key] = true

      if not self.sold then
        G.GAME.MelniboneDestroyed = (G.GAME.MelniboneDestroyed or 0) + 1
      end
    end
  end

  -- Call original method
  return start_dissolve_original(self, ...)
end

SMODS.Joker {
  key = 'melnibone_comedian',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult, card.ability.extra.chips, card.ability.extra.xmultadd, card.ability.extra.chipsadd } }
  end,

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,

  rarity = "abn_SuperRare",
  atlas = 'AbandoniaJokers',
  pos = { x = 4, y = 25 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 1, xmultadd = 0.3, chips = 0, chipsadd = 100 } },

  in_pool = function(self)
    if G.STATE ~= G.STATES.SHOP then
      return true
    end
  end,

  update = function(self, card)
    if card.area == G.shop_jokers then
      card.cost = 30
    end
    if card.area == G.jokers then
      if card.ability.extra.chips < card.ability.extra.chipsadd * (G.GAME.MelniboneDestroyed or 0) then
        card.ability.extra.chips = card.ability.extra.chipsadd * (G.GAME.MelniboneDestroyed or 0)
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.BLUE,
          card = card
        }
      end
    end
  end,

  calculate = function(self, card, context)
    if context.selling_card and context.card ~= card and context.card.config.center.rarity and context.card.ability.set == 'Joker' then
      card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
      context.card.sold = true
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.RED,
        card = card
      }
    end

    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
        chips = card.ability.extra.chips,
      }
    end
  end,
  abn_artist_credits = {
    artist = "Ener & Gud",
  },
}
