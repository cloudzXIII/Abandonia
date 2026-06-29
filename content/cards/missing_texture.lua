SMODS.Joker {
  key = 'missing_texture',

  rarity = 3,
  atlas = 'ABNJokerSheet4',
  pos = { x = 6, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local crds = 0
      for _, scored_card in ipairs(context.scoring_hand) do
        crds = crds + 1
        assert(SMODS.change_base(scored_card, nil, 'Ace'))
        G.E_MANAGER:add_event(Event({
          func = function()
            scored_card:juice_up()
            return true
          end
        }))
      end

      if crds > 0 then
        return {
          message = "Ace!",
          colour = G.C.FILTER
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Lolhappy909_lol",
  },
}
