-- Crimson Neko (coded by cloudzXIII)
SMODS.Joker {
  key = 'crimson_neko',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.x_chips, card.ability.extra.x_chips_gain } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet10',
  pos = { x = 4, y = 4 },
  cost = 7,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_chips = 1, x_chips_gain = 0.25 } },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card.lucky_trigger and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "x_chips",
        scalar_value = "x_chips_gain",
        operation = '+',
      })
    end
    if context.joker_main and card.ability.extra.x_chips > 1 then
      return {
        x_chips = card.ability.extra.x_chips
      }
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}

local set_debuff_ref = Card.set_debuff
function Card:set_debuff(should_debuff)
  set_debuff_ref(self, should_debuff)

  if next(SMODS.find_card("j_abn_crimson_neko")) and SMODS.has_enhancement(self, "m_lucky") then
    self.debuff = false
    self.perma_debuff = false
  end
end
