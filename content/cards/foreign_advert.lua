-- Foreign Advertisement (coded by cloudzXIII)
SMODS.Joker {
  key = 'foreign_advert',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.x_mult, cae.x_mult_gain, cae.x_chips, cae.x_chips_gain } }
  end,

  abn_coder = "cloudzXIII",
  rarity = 3,
  atlas = 'ABNJokerSheet3',
  pos = { x = 3, y = 4 },
  pixel_size = { h = 70 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult = 1, x_chips = 1, x_chips_gain = 0.4, x_mult_gain = 0.4 } },

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local vanilla = 0
      local modded = 0

      for _, playing_card in ipairs(context.scoring_hand) do
        if next(SMODS.get_enhancements(playing_card)) then
          if ABN.is_vanilla_enh(playing_card.config.center.key) then
            vanilla = vanilla + 1
          else
            modded = modded + 1
          end
        end
      end

      if modded > 0 and vanilla > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
          scalar_factor = vanilla,
          operation = '+',
          no_message = true,
        })
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_chips",
          scalar_value = "x_chips_gain",
          scalar_factor = modded,
          operation = '+',
        })
      elseif vanilla > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
          scalar_factor = vanilla,
          operation = '+',
          message_colour = G.C.MULT
        })
      elseif modded > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_chips",
          scalar_value = "x_chips_gain",
          scalar_factor = modded,
          operation = '+',
          message_colour = G.C.CHIPS
        })
      end
    end

    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult,
        x_chips = card.ability.extra.x_chips,
      }
    end
  end,
  abn_artist_credits = {
    artist = "Tevi",
  },
  in_pool = function(self, args)
    local vanilla = 0
    local modded = 0
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if next(SMODS.get_enhancements(playing_card)) then
        if ABN.is_vanilla_enh(playing_card.config.center.key) then
          vanilla = vanilla + 1
        else
          modded = modded + 1
        end
      end
    end
    return vanilla > 0 and modded > 0
  end
}
