-- Alternate Outfit (coded by cloudzXIII)
SMODS.Joker {
  key = 'alternate_outfit',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.mult_gain, cae.p_gain, localize(cae.type, 'poker_hands'), cae.p_chips, cae.p_xmult } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet11',
  pos = { x = 3, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, mult_gain = 5, p_chips = 5, p_gain = 1, type = "Flush", p_xmult = 0.02 } },
  calculate = function(self, card, context)
    if context.before and next(context.poker_hands[card.ability.extra.type]) then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = '+',
      })


      local all_chalices = true
      for i, v in ipairs(context.scoring_hand) do
        if not v:is_suit("abn_Chalice") then
          all_chalices = false
          break
        end
      end

      local all_coins = true
      for i, v in ipairs(context.scoring_hand) do
        if not v:is_suit("abn_Coin") then
          all_coins = false
          break
        end
      end

      local all_batons = true
      for i, v in ipairs(context.scoring_hand) do
        if not v:is_suit("abn_Baton") then
          all_batons = false
          break
        end
      end

      local all_swords = true
      for i, v in ipairs(context.scoring_hand) do
        if not v:is_suit("abn_Sword") then
          all_swords = false
          break
        end
      end

      for _, scoring_card in ipairs(context.scoring_hand) do
        if all_chalices then
          scoring_card.ability.perma_mult = (scoring_card.ability.perma_mult or 0) + card.ability.extra.p_gain
          SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.MULT }, scoring_card)
        end
        if all_coins then
          scoring_card.ability.perma_p_dollars = (scoring_card.ability.perma_p_dollars or 0) + card.ability.extra.p_gain
          SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.MONEY }, scoring_card)
        end
        if all_batons then
          scoring_card.ability.perma_bonus = (scoring_card.ability.perma_x_mult or 1) + card.ability.extra.p_xmult
          SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.MULT }, scoring_card)
        end
        if all_swords then
          scoring_card.ability.perma_bonus = (scoring_card.ability.perma_bonus or 0) + card.ability.extra.p_chips
          SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.CHIPS }, scoring_card)
        end
      end
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Dogg-Fly",
  },
}
