-- Tag Joker (coded by cloudzXIII)
local tag_ref = Tag.yep
function Tag:yep(message, _colour, func)
  local ret = tag_ref(self, message, _colour, func)
  SMODS.calculate_context({ abn_tag_triggered = true })
  return ret
end

SMODS.Joker {
  key = 'tag_joker',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult,
        card.ability.extra.x_mult_gain
      }
    }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet11',
  pos = { x = 8, y = 3 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      x_mult = 1,
      x_mult_gain = 0.2
    },
  },

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
    if context.abn_tag_triggered then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "x_mult",
        scalar_value = "x_mult_gain",
        operation = '+',
        message_key = "a_xmult"
      })
    end
  end,
  abn_artist_credits = {
    artist = "Patitofi8"
  },
}
