-- Moe Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'moe_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_polkadot
    return {
      vars = {
        card.ability.extra.mult
      }
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet5',
  pos = { x = 5, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      mult = 2
    },
  },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_abn_polkadot") then
        context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + card.ability.extra.mult
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, card)
      end
    end
  end,
  abn_artist_credits = {
    artist = "Camostar34",
  },
  enhancement_gate = "m_abn_polkadot"
}

local oldsmodsscorecard = SMODS.score_card
function SMODS.score_card(card, context)
  local conditions = false
  if G.jokers and G.jokers.cards then
    for _, j in ipairs(G.jokers.cards) do
      if j.config and j.config.center and j.config.center.key == "j_abn_moe_joker" then
        conditions = true
        break
      end
    end
  end

  if not G.scorehand and conditions and context.cardarea == G.hand then
    G.scorehand = true
    context.cardarea = G.play

    if SMODS.has_enhancement(card, "m_abn_polkadot") then
      SMODS.score_card(card, context)
    end

    context.cardarea = G.hand
    G.scorehand = nil
  end
  return oldsmodsscorecard(card, context)
end
