-- Heart of Glass (coded by cloudzXIII) (undertale reference, so peak)
SMODS.Joker {
  key = 'heart_of_glass',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS["m_glass"]
    local cae = card.ability.extra
    return { vars = { cae.xchips, cae.chips_gain, cae.chips } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet3',
  pos = { x = 7, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xchips = 2, chips = 0, chips_gain = 20 } },

  calculate = function(self, card, context)
    if context.fix_probability and context.trigger_obj and context.trigger_obj.config and context.trigger_obj.config.center and SMODS.has_enhancement(context.trigger_obj, "m_glass") then
      return { numerator = context.denominator }
    end
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_glass") then
        return {
          xchips = card.ability.extra.xchips
        }
      end
    end
    if context.remove_playing_cards and not context.blueprint then
      local glass_cards = 0
      for _, removed_card in ipairs(context.removed) do
        if removed_card.shattered and removed_card:is_suit("Hearts") then
          glass_cards = glass_cards + 1
        end
      end
      if glass_cards > 0 then
        G.E_MANAGER:add_event(Event({
          func = function()
            G.E_MANAGER:add_event(Event({
              func = function()
                SMODS.scale_card(card, {
                  ref_table = card.ability.extra,
                  ref_value = "chips",
                  scalar_value = "chips_gain",
                  operation = function(ref_table, ref_value, initial, change)
                    ref_table[ref_value] = initial + glass_cards * change
                  end,
                  no_message = true
                })
                return true
              end
            }))
            SMODS.calculate_effect(
              {
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips +
                card.ability.extra.chips_gain * glass_cards } }
              }, card)
            return true
          end
        }))
        return nil, true
      end
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,

  abn_artist_credits = {
    artist = "DrSmey",
  },
  enhancement_gate = "m_glass",
}
