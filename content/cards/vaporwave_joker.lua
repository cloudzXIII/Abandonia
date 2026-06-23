SMODS.Joker {
  key = 'vaporwave_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
    return { vars = { card.ability.extra.chips, localize({ type = 'name_text', key = "e_polychrome", set = "Edition" }), card.ability.extra.xchips } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet2',
  pos = { x = 8, y = 0 },
  soul_pos = { x = 9, y = 0 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 1, xchips = 3 } },

  calculate = function(self, card, context)
    if card.edition and card.edition.polychrome and context.other_joker and context.other_joker.edition and context.other_joker.edition.polychrome == true and card ~= context.other_joker
    then
      G.E_MANAGER:add_event(Event({
        func = function()
          context.other_joker:juice_up(0.5, 0.5)
          return true
        end,
      }))
      return {
        xchips = card.ability.extra.xchips
      }
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card.edition and context.other_card.edition.key == "e_polychrome" then
        context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus +
            card.ability.extra.chips * #context.scoring_hand
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
      end
    end
    if context.discard and context.other_card.edition and context.other_card.edition.key == "e_polychrome" then
      context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus +
          card.ability.extra.chips * #context.full_hand
      SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
    end
  end,
  in_pool = function(self, args)
    for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
      if joker.edition and joker.edition.key == "e_polychrome" then
        return true
      end
    end
    return false
  end,
  abn_artist_credits = {
    artist = "Skellington",
  },
}
