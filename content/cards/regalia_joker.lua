-- Regalia Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'regalia_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.dollars, localize("Royal Flush", "poker_hands"), localize("abn_Emperium Flush", "poker_hands") } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet17',
  pos = { x = 0, y = 5 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { dollars = 10, IsRoyalFlush = false } },

  calculate = function(self, card, context)
    if context.evaluate_poker_hand then
      card.ability.extra.IsRoyalFlush = context.display_name == localize("Royal Flush", "poker_hands")
    end
    if context.before and (context.scoring_name == "abn_Emperium Flush" or card.ability.extra.IsRoyalFlush) then
      return {
        dollars = card.ability.extra.dollars,
        level_up = true,
        message = localize('k_level_up_ex')
      }
    end
    if context.after and context.scoring_name == "abn_Emperium Flush" then
      for _, scored_card in ipairs(context.scoring_hand) do
        card:juice_up(0.3, 0.5)
        ABN.level_up_rank(scored_card, scored_card.base.value)
      end
    end
  end,
  abn_artist_credits = {
    artist = "0kronix"
  },
  in_pool = function(self, args)
    return G.GAME.abn_has_played_royal_flush
  end
}
