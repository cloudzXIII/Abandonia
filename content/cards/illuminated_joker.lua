SMODS.Joker {
  key = 'illuminated_joker',
  atlas = 'ABNJokerSheet28',
  pos = { x = 9, y = 4 },
  rarity = 3,
  cost = 10,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  config = {
    extra = {
      blind_reduction = 0.10,
      chips = 20,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_sparkling
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_gloss
    return {
      vars = {
        card.ability.extra.blind_reduction * 100,
        card.ability.extra.chips,
      }
    }
  end,

  in_pool = function(self, args)
    return G.GAME.abn_any_spectrum_played --See main.lua
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      if next(context.poker_hands["abn_Spectrum"]) then
        for _, scored_card in ipairs(context.scoring_hand) do
          if not scored_card.debuff and not SMODS.has_no_suit(scored_card) and ABN.is_light(scored_card) then
            local suit_object = SMODS.Suits[scored_card.base.suit]
            local new_edition = (suit_object and suit_object.mod) and 'e_abn_gloss' or 'e_abn_sparkling'
            if not (scored_card.edition and scored_card.edition.key == new_edition) then
              scored_card:set_edition(new_edition, true)
            end
          end
        end
      end

      if context.scoring_name == 'abn_Straight Specflush' and G.GAME.blind and not G.GAME.blind.disabled then
        local modded_suit_count = 0
        for _, scored_card in ipairs(context.scoring_hand) do
          if not SMODS.has_no_suit(scored_card) then
            local suit_object = SMODS.Suits[scored_card.base.suit]
            if suit_object and suit_object.mod then
              modded_suit_count = modded_suit_count + 1
            end
          end
        end

        if modded_suit_count > 0 then
          local reduction_factor = math.max(0, 1 - (card.ability.extra.blind_reduction * modded_suit_count))
          G.GAME.blind.chips = math.floor(G.GAME.blind.chips * reduction_factor)
          G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        end
      end
    end

    if context.individual and context.cardarea == G.play and card.edition and context.other_card
        and context.other_card.edition and context.other_card.edition.key == 'e_abn_sparkling' then
      local different_hand_count = 0
      local _, _, contained_hands = G.FUNCS.get_poker_hand_info(#G.play.cards > 0 and G.play.cards or G.hand.highlighted)
      for _, contained_hand in pairs(contained_hands) do
        if next(contained_hand) then
          different_hand_count = different_hand_count + 1
        end
      end
      if different_hand_count > 0 then
        return {
          chips = card.ability.extra.chips * different_hand_count,
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Vlambambo",
  },
}
