--count suits
local count_unique_suits = function(area)
  local suits = {}
  for _, v in ipairs(area) do
    if v.base and v.base.suit then
      suits[v.base.suit] = true
    end
  end

  local unique = 0
  for _ in pairs(suits) do
    unique = unique + 1
  end

  return unique
end

SMODS.Joker {
  key = 'ruination_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.ABN_PLAGUED, G.C.WHITE, 1.0)
  end,

  rarity = "abn_SuperRare",
  atlas = 'ABNJokerSheet12',
  pos = { x = 2, y = 0 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { echips = 1.8, emult = 1.8 } },
  pools = { ["Plagued"] = true, },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.echips,
        card.ability.extra.emult
      }
    }
  end,

  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local suit_count = count_unique_suits(context.scoring_hand)

      if suit_count > 0 then
        return {
          -- multiply by suit count
          emult = card.ability.extra.emult * suit_count,
          echips = card.ability.extra.echips * suit_count,
          colour = G.C.GREEN,
          card = card,
        }
      end
    end

    -- retrigger if edition
    if context.cardarea == G.play and context.repetition and context.other_card and context.other_card ~= self and card.edition then
      return {
        message = localize('k_again_ex'),
        repetitions = 1,
        card = context.other_card
      }
    end

    if context.cardarea == G.jokers and context.before and not context.blueprint then
      local valid_hands = {
        ["abn_Spectrum"] = true,
        ["abn_Specflush"] = true,
        ["abn_Straight Specflush"] = true,
        ["abn_Specflush House"] = true,
        ["abn_Specflush Five"] = true,
        ["abn_Specflush Six"] = true
      }

      if valid_hands[context.scoring_name] then
        for _, scored_card in ipairs(context.scoring_hand) do
          card:juice_up(0.3, 0.5)
          ABN.level_up_rank(scored_card, scored_card.base.value)
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "AbelSketch & Vega",
  },
}
