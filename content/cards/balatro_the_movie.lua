-- Hook into end of round
local end_round_original = end_round
function end_round()
  G.GAME.BossesDefeated = G.GAME.BossesDefeated or 0

  -- Check if this round was a Boss Blind
  if G.GAME.blind and G.GAME.blind.boss then
    G.GAME.BossesDefeated = (G.GAME.BossesDefeated or 0) + 1
  end


  -- Call the original end_round
  end_round_original()
end

SMODS.Joker {
  key = 'balatro_the_movie',
  rarity = 3,
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  atlas = 'ABNJokerSheet8',
  pos = { x = 8, y = 0 },
  config = {
    extra = {
      xmult = 1,
      xchips = 1,
      mult = 0,
      chips = 0,
      blindsize = 1,
      xmultadd = 0.3,
      xchipsadd = 0.5,
      multadd = 4,
      chipsadd = 10,
      blindsizeadd = 0.3,
      played_hands = {},
      last_played = "none",
      current_hand_enhancements = {},
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.xchips,
        card.ability.extra.mult,
        card.ability.extra.chips,
        card.ability.extra.blindsize,
        card.ability.extra.xmultadd,
        card.ability.extra.xchipsadd,
        card.ability.extra.multadd,
        card.ability.extra.chipsadd,
        card.ability.extra.blindsizeadd,
      }
    }
  end,

  update = function(self, card)
    if G.GAME.BossesDefeated and G.GAME.BossesDefeated > 0 then
      card.ability.extra.blindsize = 1 + (G.GAME.BossesDefeated * card.ability.extra.blindsizeadd)
    end
  end,

  calculate = function(self, card, context)
    -- Blind Requirement
    if context.setting_blind and not context.blueprint then
      G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blindsize
      G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end

    if context.before and not context.blueprint then
      local extra = card.ability.extra
      local scoring_name = context.scoring_name

      extra.current_hand_enhancements = {}

      if scoring_name == "Royal Flush" then scoring_name = "Straight Flush" end

      -- Unique Hands
      extra.played_hands = extra.played_hands or {}
      if not extra.played_hands[scoring_name] then
        extra.played_hands[scoring_name] = true
        extra.xmult = extra.xmult + extra.xmultadd
        card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex'), colour = G.C.MULT })
      end

      -- Repeating Hands Tracker
      if extra.last_played ~= "none" and extra.last_played == scoring_name then
        extra.xchips = extra.xchips + extra.xchipsadd
        card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex'), colour = G.C.CHIPS })
      end
      extra.last_played = scoring_name

      -- Rainbow Flush
      local suits = { Diamonds = false, Clubs = false, Hearts = false, Spades = false }
      for i = 1, #context.scoring_hand do
        local scoring_card = context.scoring_hand[i]
        if scoring_card:is_suit("Diamonds") then suits.Diamonds = true end
        if scoring_card:is_suit("Clubs") then suits.Clubs = true end
        if scoring_card:is_suit("Hearts") then suits.Hearts = true end
        if scoring_card:is_suit("Spades") then suits.Spades = true end
      end

      if suits.Diamonds and suits.Clubs and suits.Hearts and suits.Spades then
        for i = 1, #context.scoring_hand do
          if not context.scoring_hand[i].debuff then
            local card_rank = context.scoring_hand[i].base.value
            if G.GAME.abn_rank_upgrades[card_rank] then
              ABN.level_up_rank(card, card_rank, 4)
            end
          end
        end
        card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_level_up_ex'), colour = G.C
        .ATTENTION })
      end
    end

    -- Different enhancements
    if context.individual and context.cardarea == G.play then
      if context.other_card.config.center ~= G.P_CENTERS.c_base then
        local center = context.other_card.config.center.key
        if not card.ability.extra.current_hand_enhancements[center] then
          card.ability.extra.current_hand_enhancements[center] = true
          card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
          card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd

          return {
            message = localize('k_upgrade_ex'),
            card = card
          }
        end
      end
    end

    -- Scoring
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
        xchips = card.ability.extra.xchips,
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
      }
    end
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}
