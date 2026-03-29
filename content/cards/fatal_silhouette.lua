SMODS.Joker {
  key = 'fatal_silhouette',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.repetitions,
      }
    }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 7, y = 21 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      repetitions = 1,
    },
  },
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play and context.other_card:is_face() then
      return {
        repetitions = card.ability.extra.repetitions
      }
    end
    if context.final_scoring_step then
      for _, v in ipairs(context.scoring_hand) do
        if v:is_face() then
          SMODS.destroy_cards(v)
          G.E_MANAGER:add_event(Event({
            func = function()
              card:juice_up()
              return true
            end
          }))
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "Sustato"
  },
}
