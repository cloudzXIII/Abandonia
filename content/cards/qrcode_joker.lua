-- QR Code (coded by cloudzXIII)
SMODS.Joker {
  key = 'qrcode_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet2',
  pos = { x = 1, y = 3 },
  pixel_size = { h = 95 / 1.2 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = {} },
  calculate = function(self, card, context)
    if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
      G.E_MANAGER:add_event(Event({
        func = (function()
          G.E_MANAGER:add_event(Event({
            func = function()
              SMODS.add_card {
                set = 'program_pack',
                key_append = 'abn_qrcode'
              }
              G.GAME.consumeable_buffer = 0
              return true
            end
          }))
          SMODS.calculate_effect({ message = localize('k_abn_plus_program'), colour = G.C.SECONDARY_SET.program_pack },
            context.blueprint_card or card)
          return true
        end)
      }))
      return nil, true
    end
  end,
  abn_artist_credits = {
    artist = "CubeGetsReal",
  },
}
