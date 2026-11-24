SMODS.Joker {
  key = 'childhood_drawing_joker',
  atlas = 'ABNJokerSheet1',
  pos = { x = 4, y = 2 }, 
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  config = {
    extra = {
      chips = 100,
      mult = 10,
      winning_hand_flush = false,
      winning_hand_modded = false,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_polychrome
    info_queue[#info_queue + 1] = G.P_TAGS.tag_abn_hazard_polychrome
	info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_discontinued
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.mult,
      }
    }
  end,

  in_pool = function(self, args)
    return G.GAME.hands['Flush'] and G.GAME.hands['Flush'].played > 0 or false
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint and context.scoring_name == 'abn_Specflush House' then
      local first_scoring_card = context.scoring_hand[1]
      local last_scoring_card = context.scoring_hand[#context.scoring_hand]
      if first_scoring_card then
        first_scoring_card:set_ability('m_abn_discontinued', nil, true)
      end
      if last_scoring_card and last_scoring_card ~= first_scoring_card then
        last_scoring_card:set_ability('m_abn_discontinued', nil, true)
      end
    end

    if context.joker_main and card.edition and context.poker_hands and next(context.poker_hands['Flush']) then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult,
      }
    end

    if context.after and not context.blueprint then
      card.ability.extra.winning_hand_flush = context.poker_hands and next(context.poker_hands['Flush']) and true or false
      card.ability.extra.winning_hand_modded = false

      if card.ability.extra.winning_hand_flush then
        local suited_card_count = 0
        local modded_suit_card_count = 0
        for _, scored_card in ipairs(context.scoring_hand) do
          if not SMODS.has_no_suit(scored_card) then
            suited_card_count = suited_card_count + 1
            local suit_object = SMODS.Suits[scored_card.base.suit]
            if suit_object and suit_object.mod then
              modded_suit_card_count = modded_suit_card_count + 1
            end
          end
        end
        card.ability.extra.winning_hand_modded = suited_card_count > 0 and modded_suit_card_count == suited_card_count
      end
    end

    if context.end_of_round and context.main_eval and not context.game_over and card.ability.extra.winning_hand_flush then
      local tag_key = card.ability.extra.winning_hand_modded and 'tag_abn_hazard_polychrome' or 'tag_polychrome'
      G.E_MANAGER:add_event(Event({
        func = function()
          add_tag(Tag(tag_key))
          play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
          play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
          return true
        end
      }))
      card.ability.extra.winning_hand_flush = false
      card.ability.extra.winning_hand_modded = false
    end
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}