SMODS.Joker {
  key = 'envy',
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult,
        card.ability.extra.x_mult_gain,
      }
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet14',
  pos = { x = 1, y = 0 },
  cost = 1,
  discovered = false,
  blueprint_compat = false,

  config = {
    extra = {
      x_mult=0,
      x_mult_gain=0.25,
    },

  },

  calculate = function(self, card, context)
    if context.buying_card and context.buying_self then
        card:add_sticker("s_eternal")
        for i,v in ipairs(G.jokers.cards) do
            v:add_sticker("s_eternal")
        end
    end
    if context.joker_main then
        local hand=ABN.highest_level_hand()
        if context.scoring_name ~= hand then
          SMODS.scale_card(card,{
              ref_table=card.ability.extra,
              ref_value="x_mult",
              scalar_value="x_mult_gain",
              message_key="a_xmult",
              message_colour=G.C.RED,
          })
        end
        print("hands played is:",G.GAME.current_round.hands_played)
        if G.GAME.current_round.hands_played == 1 then
          return {
            x_mult=card.ability.extra.x_mult,
          }
        end
    end
  end,


  abn_artist_credits = {
    artist = "Comkyel",
  },
}