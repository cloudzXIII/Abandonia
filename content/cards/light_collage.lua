SMODS.Joker {
  key = 'light_collage',

  rarity = 2,
  atlas = 'ABNJokerSheet3',
  pos = { x = 5, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chips_gain = 20,
      mult_gain = 10,
      foil_chance = 5,
      gloss_chance = 15,
      chips = 0,
      mult = 0,
    }
  },
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.foil_chance,
      "j_abn_light_collage_foil_chance")
    local numerator_2, denominator_2 = SMODS.get_probability_vars(card, 1, card.ability.extra.gloss_chance,
      "j_abn_light_collage_gloss_chance")
    return {
      vars = {
        card.ability.extra.chips_gain, card.ability.extra.mult_gain, numerator, denominator, numerator_2, denominator_2,
        card.ability.extra.chips, card.ability.extra.mult, localize({ type = 'name_text', key = "e_foil", set = "Edition" }),
        localize({ type = 'name_text', key = "e_abn_gloss", set = "Edition" })
      },
    }
  end,


  calculate = function(self, card, context)
    if context.using_consumeable then
      if context.consumeable.config.center.set == "sigils" then
        local non_editioned_cards = ABN:get_non_editioned_cards_in_deck()
        if #non_editioned_cards > 0 then
          if SMODS.pseudorandom_probability(card, "j_abn_light_collage_foil_chance", 1, card.ability.extra.foil_chance, "j_abn_light_collage_foil_chance") then
            local new_editioned_card = pseudorandom_element(non_editioned_cards, "j_abn_light_collage_foil_chance")
            new_editioned_card:set_edition("e_foil")
            ABN:update_non_editioned_cards_table(non_editioned_cards, { new_editioned_card })
          end
          if SMODS.pseudorandom_probability(card, "j_abn_light_collage_gloss_chance", 1, card.ability.extra.gloss_chance, "j_abn_light_collage_gloss_chance") then
            local new_editioned_card = pseudorandom_element(non_editioned_cards, "j_abn_light_collage_gloss_chance")
            new_editioned_card:set_edition("e_abn_gloss")
          end
        end
      end
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card.edition and context.other_card.edition.key == "e_foil" then
        SMODS.scale_card(card, {
          ref_value = "chips",
          scalar_value = "chips_gain",
        })
      end
      if context.other_card.edition and context.other_card.edition.key == "e_abn_gloss" then
        SMODS.scale_card(card, {
          ref_value = "mult",
          scalar_value = "mult_gain",
        })
      end
    end
  end,
  abn_artist_credits = {
    artist = "Null",
  },
}
