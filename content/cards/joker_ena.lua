-- Joker ENA (coded by cloudzXIII)
SMODS.Joker {
  key = 'joker_ena',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.xmult, cae.mult, cae.mult_gain } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet20',
  pos = { x = 1, y = 1 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 1.5, mult = 0, mult_gain = 20 } },

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local vanilla_suits = { "Hearts", "Clubs", "Spades", "Diamonds" }
      local count = 0
      for _, v in ipairs(context.scoring_hand) do
        if not SMODS.has_no_suit(v) and ABN.table_contains(vanilla_suits, v.base.suit) then
          local modded = nil
          local enh_key = v.config.center and v.config.center.key
          local data = enh_key and ABN.get_enh_sticker(enh_key)

          if data and data.mod ~= "Vanilla" then
            modded = data
          end
          if modded then
            count = count + 1
          end
        end
      end
      if count > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_value = "mult_gain",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + count * change
          end,
          message_colour = G.C.MULT
        })
      end
    end
    if context.individual and context.cardarea == G.play then
      local vanilla_suits = { "Hearts", "Clubs", "Spades", "Diamonds" }
      if not SMODS.has_no_suit(context.other_card) and ABN.table_contains(vanilla_suits, context.other_card.base.suit) then
        local modded = false
        local v = context.other_card
        local enh_key = v.config.center and v.config.center.key
        local data = enh_key and ABN.get_enh_sticker(enh_key)

        if (data and data.mod ~= "Vanilla") or data == nil then
          modded = true
        end
        if modded then
          return {
            xmult = card.ability.extra.xmult
          }
        end
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,

  abn_artist_credits = {
    artist = "Flote",
  },
  in_pool = function(self, args)
    local vanilla_suits = { "Hearts", "Clubs", "Spades", "Diamonds" }
    for _, v in ipairs(G.playing_cards or {}) do
      if not SMODS.has_no_suit(v) and ABN.table_contains(vanilla_suits, v.base.suit) then
        local vanilla = nil
        local enh_key = v.config.center and v.config.center.key
        local data = enh_key and ABN.get_enh_sticker(enh_key)

        if data and data.mod == "Vanilla" then
          vanilla = data
        end
        if vanilla then
          return true
        end
      end
    end
  end
}
