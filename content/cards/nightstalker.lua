SMODS.Joker {
  key = 'nightstalker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
    local tally = 0
    if G.playing_cards then
      for _, c in ipairs(G.playing_cards) do
        if c.edition and c.edition.key == "e_holo" then tally = tally + 1 end
      end
    end
    return {
      vars = {
        card.ability.extra.xmult,
        1 + (card.ability.extra.xmult * tally),
        localize({ type = 'name_text', key = "e_holo", set = "Edition" })
      }
    }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet5',
  pos = { x = 0, y = 3 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      xmult = 0.2
    },
  },
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local faces = 0
      for _, scored_card in ipairs(context.scoring_hand) do
        if ABN.is_dark(scored_card) then
          faces = faces + 1
          scored_card:set_edition('e_holo', nil, true)
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
          message = localize('k_abn_holo'),
          colour = G.C.DARK_EDITION
        }
      end
    end
    if context.joker_main then
      local tally = 0
      for _, c in ipairs(G.playing_cards) do
        if c.edition and c.edition.key == "e_holo" then tally = tally + 1 end
      end
      return {
        x_mult = 1 + (card.ability.extra.xmult * tally)
      }
    end
  end,
  abn_artist_credits = {
    artist = "Scorionik"
  },
}
