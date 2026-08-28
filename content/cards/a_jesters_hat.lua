-- A Jester's Hat (coded by cloudzXIII)
SMODS.Joker {
  key = 'a_jesters_hat',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_vintage
    local cae = card.ability.extra
    return { vars = { cae.mult } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet24',
  pos = { x = 4, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, repetitions = 1 } },

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local vanilla_suits = { "Hearts", "Clubs", "Spades", "Diamonds" }
      local vanilla = 0
      local modded = 0
      for _, playing_card in ipairs(context.scoring_hand) do
        if not SMODS.has_no_suit(playing_card) then
          if ABN.table_contains(vanilla_suits, playing_card.base.suit) then
            vanilla = vanilla + 1
          else
            modded = modded + 1
          end
        end
      end
      local ranks = 0
      if modded == 2 and vanilla == 2 then
        for _, playing_card in ipairs(context.scoring_hand) do
          if not SMODS.has_no_rank(card) then
            ranks = ranks + (playing_card.base.nominal * 2)
          end
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
    if context.repetition and context.cardarea == G.play and card.edition and card.edition.key == "e_abn_vintage" then
      return {
        repetitions = card.ability.extra.repetitions
      }
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
      if not SMODS.has_no_suit(playing_card) and not ABN.table_contains(vanilla_suits, playing_card.base.suit) then
        has_modded_suit = true
      end
    end
    return has_modded_suit
  end
}
