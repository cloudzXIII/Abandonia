-- Drifter Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'drifter_joker',

  rarity = 2,
  atlas = 'ABNJokerSheet8',
  pos = { x = 2, y = 2 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,
  config = { extra = { mult = 1, sell_value = 1 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_fossil
    return { vars = {}, }
  end,


  calculate = function(self, card, context)
    if context.pre_discard and G.GAME.current_round.discards_used == 0 then
      for _, _card in ipairs(context.full_hand) do
        _card:set_ability("m_abn_fossil", nil, true)
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, _card)
      end
    end
    if context.stay_flipped and context.other_card and not context.other_card.ability.drifter_returned and SMODS.has_no_rank(context.other_card) and context.from_area == G.play and context.to_area == G.discard then
      context.other_card.ability.drifter_returned = true
      return {
        modify = { to_area = G.hand },
        message = "Returned!",
        message_card = context.other_card
      }
    end
    if context.end_of_round and context.main_eval and not context.blueprint then
      for _, playing_card in ipairs(G.playing_cards) do
        if playing_card.ability.drifter_returned then
          playing_card.ability.drifter_returned = nil
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "Creechie Doctrine",
  },
}
