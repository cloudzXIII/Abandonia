-- Final Mix (coded by cloudzXIII)

SMODS.Joker {
  key = 'finalmix',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_cardmodifier_info", set = "Other" }
    local cae = card.ability.extra
    return { vars = { cae.x_mult, cae.x_mult_gain, } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet23',
  pos = { x = 4, y = 6 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { x_mult = 1, x_mult_gain = 0.2 } },

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local modifiers = {}
      for _, v in ipairs(context.scoring_hand) do
        if v:is_suit("Hearts") then
          if v.config.center.key ~= "c_base" then
            modifiers[v.config.center.key] = true
          end
          if v.edition then
            modifiers[v.edition.key] = true
          end
          if v.seal then
            modifiers[v.seal] = true
          end
        end
      end

      local unique = 0
      for _ in pairs(modifiers) do
        unique = unique + 1
      end

      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "x_mult",
        scalar_value = "x_mult_gain",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + unique * change
        end,
      })
    end
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}
