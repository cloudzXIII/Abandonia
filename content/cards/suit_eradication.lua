SMODS.Joker {
  key = 'suit_eradication',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
        colours={
          HEX("5dacdf"),
          HEX("8570c7"),
          HEX("8d9fa3"),
          HEX("82e888"),
        }
      }
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet14',
  pos = { x = 9, y = 2 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,

  config = { extra = {chips=0,} },

  calculate = function(self, card, context)
    if context.after then
        local possible_suits = {
            "abn_Penumbra",
            "abn_Tie",
            "abn_Bow",
            "abn_Snow",
        }
        for i,v in ipairs(context.scoring_hand) do
            local card_rank = v.base.value
            local rank_value = v:get_id()
            SMODS.destroy_cards({v})
            local new_card = SMODS.add_card({
                set="Base",
                area=G.deck,
            })
            local chosen_suit = pseudorandom_element(possible_suits,"abn_suit_eradication")
            local result,err = SMODS.change_base(new_card,chosen_suit,card_rank)
            if err then
                error(err)
            end
            SMODS.scale_card(card,{
                ref_table=card.ability.extra,
                scalar_table={rank=rank_value},
                ref_value="chips",
                scalar_value="rank",
            })
        end
    end
  end,
  abn_artist_credits = {
    artist = "Posalla",
  },
}
