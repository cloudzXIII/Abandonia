SMODS.Joker {
  key = 'venom_comedian',
  rarity = "abn_SuperRare",
  atlas = 'ABNJokerSheet6',
  pos = { x = 7, y = 0 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { 
    extra = { 
      mult = 0, 
      chips = 0, 
      xmult = 1,
      xchips = 1,
      multadd = 18,
      xchipsadd = 0.3,
      xmultadd = 0.2,
      chipsadd = 50
    } 
  },
  pools = { ["Comedians"] = true, },

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.xmult,
        card.ability.extra.chips,
        card.ability.extra.xchips,
        card.ability.extra.multadd,
        card.ability.extra.xchipsadd,
        card.ability.extra.xmultadd,
        card.ability.extra.chipsadd
      }
    }
  end,

  calculate = function(self, card, context)
    local valid_hands = {
      ["abn_Spectrum"] = true,
      ["abn_Specflush"] = true,
      ["abn_Straight Specflush"] = true,
      ["abn_Spectrum House"] = true,
      ["abn_Specflush House"] = true,
      ["abn_Specflush Five"] = true,
      ["abn_Specflush Six"] = true
    }

    if context.cardarea == G.jokers and context.before and not context.blueprint then
      if valid_hands[context.scoring_name] then
        local any_triggered = false

        for i, scoring_card in ipairs(context.scoring_hand) do
          local card_triggered = false

          if scoring_card:is_suit("abn_Tie") or (scoring_card.ability and scoring_card.ability.abn_tie) then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
            card_triggered = true
          end

          if scoring_card:is_suit("abn_Bow") or (scoring_card.ability and scoring_card.ability.abn_bow) then
            card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchipsadd
            card_triggered = true
          end

          if scoring_card:is_suit("abn_Snow") then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
            card_triggered = true
          end

          if scoring_card:is_suit("abn_Penumbra") then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
            card_triggered = true
          end

          if card_triggered then
            any_triggered = true
          end
        end

        if any_triggered then
          card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex'), colour = G.C.ATTENTION })
          card:juice_up()
        end

        if card.edition then
			return {
				level_up = 2,
				message = localize('k_level_up_ex')
			}
        end
      end
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult > 0 and card.ability.extra.mult or nil,
        xmult = card.ability.extra.xmult > 1 and card.ability.extra.xmult or nil,
        chips = card.ability.extra.chips > 0 and card.ability.extra.chips or nil,
        xchips = card.ability.extra.xchips > 1 and card.ability.extra.xchips or nil,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "Ener and Maladaptive",
  },
}