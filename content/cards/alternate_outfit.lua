-- Alternate Outfit (coded by cloudzXIII)
SMODS.Joker {
  key = 'alternate_outfit',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_infra
    return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain, card.ability.extra.dollars, localize(card.ability.extra.type, 'poker_hands') } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet11',
  pos = { x = 3, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, mult_gain = 6, dollars = 2, type = "abn_6oak" } },
  calculate = function(self, card, context)
    if context.before and next(context.poker_hands[card.ability.extra.type]) then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = '+',
      })
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_abn_infra") then
        context.other_card.ability.perma_p_dollars = (context.other_card.ability.perma_p_dollars or 0) +
            card.ability.extra.dollars
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
      end
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    SMODS.change_play_limit(1)
    SMODS.change_discard_limit(1)
  end,
  remove_from_deck = function(self, card, from_debuff)
    SMODS.change_play_limit(-1)
    SMODS.change_discard_limit(-1)
  end,
  abn_artist_credits = {
    artist = "Dogg-Fly",
  },
}
