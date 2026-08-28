-- Foreign ID (coded by cloudzXIII)
SMODS.Joker {
  key = 'foreign_id',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.mult } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet20',
  pos = { x = 6, y = 0 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0 } },

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local vanilla_suits = { "Hearts", "Clubs", "Spades", "Diamonds" }
      local ranks = 0
      for _, playing_card in ipairs(context.scoring_hand) do
        if not SMODS.has_no_rank(playing_card) and not SMODS.has_no_suit(playing_card) and not ABN.table_contains(vanilla_suits, playing_card.base.suit) then
          ranks = ranks + playing_card.base.nominal
        end
      end
      if ranks > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + ranks * change
          end,
          message_colour = G.C.MULT
        })
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,

  abn_artist_credits = {
    artist = "Hehey",
  },
  in_pool = function(self, args)
    local has_modded_suit = false
    local vanilla_suits = { "Hearts", "Clubs", "Spades", "Diamonds" }

    for _, playing_card in ipairs(G.playing_cards or {}) do
      if not SMODS.has_no_suit(playing_card) and ABN.table_contains(vanilla_suits, playing_card.base.suit) then
        has_modded_suit = true
      end
    end
    return has_modded_suit
  end
}
