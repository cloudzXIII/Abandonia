-- Gachapon (coded by cloudzXIII)
SMODS.Joker {
  key = 'gachapon',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local numerator, denominator = SMODS.get_probability_vars(card, cae.base, cae.odds,
      'abn_gachapon_uncommon')
    local numerator1, denominator2 = SMODS.get_probability_vars(card, cae.base1, cae.odds2,
      'abn_gachapon_rare')
    return { vars = { card.ability.extra.dollars, numerator, denominator, numerator1, denominator2 } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet6',
  pos = { x = 4, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { dollars = 5, base = 1, odds = 2, base1 = 1, odds2 = 6 } },
  calculate = function(self, card, context)
    if context.setting_blind then
      SMODS.calculate_effect({ dollars = -card.ability.extra.dollars, colour = G.C.RED }, card)

      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and SMODS.pseudorandom_probability(card, 'gachauncommon', card.ability.extra.base, card.ability.extra.odds, "abn_gachapon_uncommon") then
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
        G.E_MANAGER:add_event(Event({
          func = function()
            SMODS.add_card {
              set = 'Joker',
              rarity = 'Uncommon',
              key_append = 'abn_gachapon'
            }
            G.GAME.joker_buffer = 0
            return true
          end
        }))
        SMODS.calculate_effect({ message = localize("k_plus_joker"), colour = G.C.GREEN }, card)
      end
      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and SMODS.pseudorandom_probability(card, 'gacharare', card.ability.extra.base1, card.ability.extra.odds2, "abn_gachapon_rare") then
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
        G.E_MANAGER:add_event(Event({
          func = function()
            SMODS.add_card {
              set = 'Joker',
              rarity = 'Rare',
              key_append = 'abn_gachapon'
            }
            G.GAME.joker_buffer = 0
            return true
          end
        }))
        SMODS.calculate_effect({ message = localize("k_plus_joker"), colour = G.C.RED }, card)
      end
    end
    if G.GAME.dollars <= 0 and not card.ability.extra.destroyed then
      card.ability.extra.destroyed = true
      SMODS.destroy_cards(card)
      SMODS.calculate_effect({ message = localize('k_abn_destroyed'), colour = G.C.RED }, card)
    end
  end,
  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}
