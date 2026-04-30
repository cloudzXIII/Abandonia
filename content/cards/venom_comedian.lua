SMODS.Joker {
  key = 'venom_comedian',
  rarity = "abn_SuperRare",
  atlas = 'ABNJokerSheet6',
  pos = { x = 7, y = 0 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 0, xmult = 1, chipsadd = 100, xmultadd = 0.1 } },
  pools = { ["Comedians"] = true, },

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.chips,
        card.ability.extra.xmultadd,
        card.ability.extra.chipsadd,
      }
    }
  end,

  update = function(self, card)
    if card.area == G.shop_jokers then
      card.cost = 30
    end
  end,

  calculate = function(self, card, context)
    -- SCALING LOGIC: Happens 'before' the hand scores
    if context.cardarea == G.jokers and context.before and not context.blueprint then
      -- List of valid hands that trigger scaling
      local valid_hands = {
        ["abn_Spectrum"] = true,
        ["abn_Specflush"] = true,
        ["abn_Straight Specflush"] = true,
        ["abn_Specflush House"] = true,
        ["abn_Specflush Five"] = true,
        ["abn_Specflush Six"] = true
      }

      if valid_hands[context.scoring_name] then
        -- check edition
        local level_up_res = nil
        if card.edition then
          level_up_res = {
            level_up = 2,
            message = localize('k_level_up_ex')
          }
        end

        -- suit scaling
        for _, scoring_card in ipairs(context.scoring_hand) do
          local triggered = false

          -- check for Snow cards
          if scoring_card:is_suit("abn_Snow") then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
            triggered = true
          end

          -- check for Penumbra cards
          if scoring_card:is_suit("abn_Penumbra") then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
            triggered = true
          end

          -- display upgrade
          if triggered then
            card_eval_status_text(scoring_card, 'extra', nil, nil, nil, { message = "Upgrade!", colour = G.C.ATTENTION })
            card:juice_up()
          end
        end

        -- level up if edition
        if level_up_res then
          return level_up_res
        end
      end
    end

    -- scoring
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
        chips = card.ability.extra.chips,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "Ener and Maladaptive",
  },
}
