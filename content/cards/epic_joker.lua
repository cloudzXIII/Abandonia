SMODS.Joker {
  key = 'epic_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet13',
  pos = { x = 3, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      xmult = 1,
      xmultadd = 0.5,
    },
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.xmultadd,
      }
    }
  end,

  in_pool = function(self)
    if not G.playing_cards then return false end

    for _, card in ipairs(G.playing_cards) do
      if card and card.base and card.base.value then
        local rank_num = string.match(card.base.value, "^abn_(%d+)$")
        if rank_num and tonumber(rank_num) >= 11 then
          return true
        end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before and not context.blueprint then
      if next(context.poker_hands["Flush"]) then
        local custom_card_count = 0

        -- Loop through the scoring hand to count number cards above rank 10
        for _, scoring_card in ipairs(context.scoring_hand) do
          if scoring_card and scoring_card.base and scoring_card.base.value then
            local rank_num = string.match(scoring_card.base.value, "^abn_(%d+)$")
            if rank_num and tonumber(rank_num) >= 11 then
              custom_card_count = custom_card_count + 1
            end
          end
        end

        if custom_card_count > 0 then
          card.ability.extra.xmult = card.ability.extra.xmult + (custom_card_count * card.ability.extra.xmultadd)

          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT,
            card = card
          }
        end
      end
    end

    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
      }
    end
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}
