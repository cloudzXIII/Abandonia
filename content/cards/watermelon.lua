SMODS.Joker {
  key = 'watermelon',
  rarity = 1,
  atlas = 'ABNJokerSheet6',
  pos = { x = 4, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  pools = { ["Food"] = true, },

  config = { extra = { mult = 1, odds = 6 } },


  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
    return { vars = { numerator, denominator, card.ability.extra.mult } }
  end,


  calculate = function(self, card, context)
    -- check for post_trigger and ensure other_card is a valid object
    if context.post_trigger and context.other_card and not context.blueprint then
      local target = context.other_card

      -- Ensure the target is actually a Joker
      if target ~= card and type(target) == 'table' and target.ability and target.ability.set == 'Joker' and target.config.center.key and target.config.center.key ~= 'j_abn_voracity_joker' and target.config.center.key ~= 'j_abn_busybee' and target.config.center.key ~= 'j_abn_joker_midnight' then
        -- Apply the permanent mult
        target.ability.abn_perma_mult = (target.ability.abn_perma_mult or 0) + card.ability.extra.mult

        card:juice_up()

        -- Visual Feedback
        return {
          message = ("Yummy!"),
          colour = G.C.GREEN
        }
      end
    end

    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      if SMODS.pseudorandom_probability(card, 'abn_watermelon', 1, card.ability.extra.odds) then
        SMODS.destroy_cards(card, nil, nil, true)
        return {
          message = ("Yummy!"),
          colour = G.C.GREEN
        }
      else
        return {
          message = localize('k_safe_ex')
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Mallory",
  },
}
