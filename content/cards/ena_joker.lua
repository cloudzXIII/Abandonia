-- ENA Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'ena_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.xchips, cae.chips, cae.chips_gain } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet22',
  pos = { x = 7, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xchips = 1.5, chips = 0, chips_gain = 50 } },

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local vanilla_suits = { "Hearts", "Clubs", "Spades", "Diamonds" }
      local count = 0
      for _, v in ipairs(context.scoring_hand) do
        if not SMODS.has_no_suit(v) and ABN.table_contains(vanilla_suits, v.base.suit) then
          local modded = nil
          local enh_key = v.config.center and v.config.center.key
          local data = enh_key and ABN.get_enh_sticker(enh_key)

          if (data and data.mod ~= "Vanilla") or data == nil then
            modded = true
          end
          if modded then
            count = count + 1
          end
        end
      end
      if count > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          scalar_value = "chips_gain",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + count * change
          end,
          message_colour = G.C.CHIPS
        })
      end
    end
    if context.individual and context.cardarea == G.play then
      local vanilla_suits = { "Hearts", "Clubs", "Spades", "Diamonds" }
      if not SMODS.has_no_suit(context.other_card) and ABN.table_contains(vanilla_suits, context.other_card.base.suit) then
        local modded = nil
        local v = context.other_card
        local enh_key = v.config.center and v.config.center.key
        local data = enh_key and ABN.get_enh_sticker(enh_key)

        if (data and data.mod ~= "Vanilla") or data == nil then
          modded = data
        end
        if modded then
          return {
            xchips = card.ability.extra.xchips
          }
        end
      end
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,

  abn_artist_credits = {
    artist = "Nice Cream",
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
