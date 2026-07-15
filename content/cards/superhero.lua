SMODS.Joker {
  key = 'superhero',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    return { vars = { localize(card.ability.extra.poker_hand, 'poker_hands') } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet1',
  pos = { x = 1, y = 2 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { poker_hand = "Full House" } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and ABN.is_number(context.other_card) and context.other_card.facing == "back" and context.other_card.ability.abn_perma_flipped then
      context.other_card.ability.abn_perma_flipped = nil
      context.other_card:flip()
      context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
          context.other_card.base.nominal
      SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.MULT }, context.other_card)
    end
    if context.before and next(context.poker_hands[card.ability.extra.poker_hand]) then
      local all_flipped = true
      for _, v in ipairs(context.scoring_hand) do
        if v.facing == "front" then
          all_flipped = false
        end
      end
      if all_flipped then
        G.E_MANAGER:add_event(Event({
          trigger = 'before',
          delay = 0.4,
          func = function()
            local copied_joker = SMODS.copy_card(card)
            copied_joker:set_edition("e_negative", true)
            copied_joker:start_materialize()
            return true
          end
        }))
      end
    end
  end,
  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if ABN.is_number(playing_card) and playing_card.facing == "back" and playing_card.ability.abn_perma_flipped then
        return true
      end
    end
    return false
  end
}
