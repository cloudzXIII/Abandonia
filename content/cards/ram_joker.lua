-- RAM Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'ram_joker',

  rarity = 3,
  atlas = 'ABNJokerSheet23',
  pos = { x = 0, y = 3 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { x_chips = 1, x_chips_gain = 0.3, x_mult = 1, x_mult_gain = 0.2, set = "ram" } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local last_used = G.GAME.abn.last_consumable_used and G.GAME.abn.last_consumable_used[cae.set]
    local consumable = last_used and G.P_CENTERS[last_used] or nil

    if consumable then
      info_queue[#info_queue + 1] = consumable
    end

    local last_used_name = consumable and localize({ type = 'name_text', key = consumable.key, set = consumable.set }) or
        localize('k_none')

    return { vars = { cae.x_chips, cae.x_chips_gain, cae.x_mult, cae.x_mult_gain, last_used_name }, }
  end,
  calculate = function(self, card, context)
    if context.selling_card and not context.blueprint then
      if context.card.config.center.mod and context.card.consumeable then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_chips",
          scalar_value = "x_chips_gain",
          message_key = "a_xchips",
          message_colour = G.C.x_chips
        })
      end
      if not context.card.config.center.mod and context.card.consumeable then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
          message_key = "a_xmult",
          message_colour = G.C.x_mult
        })
      end
    end
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult,
        x_chips = card.ability.extra.x_chips
      }
    end
    if context.setting_blind and G.GAME.blind.config.blind.key == "bl_big" and not context.blueprint and #G.consumeables.cards < G.consumeables.config.card_limit then
      if G.GAME.abn.last_consumable_used[card.ability.extra.set] then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
          func = (function()
            G.E_MANAGER:add_event(Event({
              func = function()
                SMODS.add_card {
                  set = card.ability.extra.set,
                  key = G.GAME.abn.last_consumable_used[card.ability.extra.set]
                }
                G.GAME.consumeable_buffer = 0
                return true
              end
            }))
            SMODS.calculate_effect(
              {
                message = localize('k_abn_plus_' .. card.ability.extra.set),
                colour = G.C.SECONDARY_SET
                    [card.ability.extra.set]
              },
              context.blueprint_card or card)
            return true
          end)
        }))
        return nil, true -- This is for Joker retrigger purposes
      end
    end
  end,
  abn_artist_credits = {
    artist = "GM36",
  },
}
