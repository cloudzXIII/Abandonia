-- Caesar Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'caesar',

  rarity = 3,
  atlas = 'ABNJokerSheet12',
  pos = { x = 5, y = 4 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 0, x_mult = 1, crown_chips = 5, crown_mult = 2, x_mult_gain = 0.1, chips_gain = 40 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips_gain, cae.x_mult_gain, cae.chips, cae.x_mult, cae.crown_chips, cae.crown_mult } }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("abn_Crown") then
      local continent_count = 0
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability.set == "continent" then
          continent_count = continent_count + 1
        end
      end
      if continent_count > 0 then
        context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
            (card.ability.extra.crown_chips * continent_count)
        context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
            (card.ability.extra.crown_mult * continent_count)
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
      end
    end

    if context.after and SMODS.last_hand_oneshot and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips_gain",
        operation = '+',
        no_message = true,
      })
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "x_mult",
        scalar_value = "x_mult_gain",
        operation = '+',
      })
    end

    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        x_mult = card.ability.extra.x_mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "hehey",
  },
  
  in_pool = function(self)
    local has_used_continent = G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.continent and G.GAME.consumeable_usage_total.continent > 0
  
    local has_crown_card = false
    if G.playing_cards then
      for _, v in ipairs(G.playing_cards) do
        if v:is_suit("abn_Crown") then
          has_crown_card = true
          break
        end
      end
    end

    return has_used_continent and has_crown_card
  end
}
