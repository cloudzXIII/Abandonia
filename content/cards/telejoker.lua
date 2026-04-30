-- TeleJoker
-- Coded by J8-Bit
-- Retrigger all played cards if hand is a Straight or Flush containing only numbered cards


SMODS.Joker {
  key = 'telejoker',

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  config = {
    extra = {
      repetitions = 1,
      hands = { "Straight", "Flush" }
    },
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.localization.misc.poker_hands[card.ability.extra.hands[1]],
        G.localization.misc.poker_hands[card.ability.extra.hands[2]],
        localize("k_abn_numbered")
      }
    }
  end,
  rarity = 2,
  cost = 6,
  atlas = 'ABNJokerSheet3',
  pos = { x = 2, y = 0 },
  discovered = false,
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      local scoring_name_works = false
      for index, hand_name in ipairs(card.ability.extra.hands) do
        if context.scoring_name == hand_name then
          scoring_name_works = true
          break
        end
      end
      local only_numbered_cards = true
      for _, playing_card in ipairs(G.play.cards) do
        if ABN.is_number(playing_card) then
          only_numbered_cards = false
          break
        end
      end
      if scoring_name_works and only_numbered_cards then
        return {
          repetitions = card.ability.extra.repetitions,
          colour = G.C.FILTER,
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Fridgecup"
  },
}
