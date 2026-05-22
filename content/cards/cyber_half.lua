-- Cyber Half (coded by cloudzXIII)
SMODS.Joker {
  key = 'cyber_half',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
    return {
      vars = {
      }
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet1',
  pos = { x = 7, y = 0 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
    },
  },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round and SMODS.has_enhancement(context.other_card, "m_steel") then
      if context.other_card.debuff then
        return {
          message = localize('k_debuffed'),
          colour = G.C.RED
        }
      else
        return {
          chips = context.other_card.base.nominal * 2
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "DOS",
  },
  enhancement_gate = "m_steel"
}
