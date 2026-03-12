SMODS.Joker {
  key = 'communist_bear',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 1, y = 7 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, mult_gain = 1 } },

  calculate = function(self, card, context)
    if context.final_scoring_step then
      local faces = 0
      for _, scored_card in ipairs(context.scoring_hand) do
        if scored_card:is_face() then
          faces = faces + 1
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = "mult",
            scalar_value = "mult_gain",
            operation = '+',
            no_message = true
          })
          SMODS.debuff_card(scored_card, true, "communist_bear")
          G.E_MANAGER:add_event(Event({
            func = function()
              scored_card:juice_up()
              return true
            end
          }))
        end
      end
      if faces > 0 then
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.FILTER
        }
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Creator.png",
  },
}
