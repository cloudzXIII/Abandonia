SMODS.Joker {
  key = 'barb_wire_joker',

  rarity = 3,
  atlas = 'ABNJokerSheet8',
  pos = { x = 9, y = 0 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra={
    chance=3,
    }
  },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_SEALS["abn_black"]
    local numerator,denominator = SMODS.get_probability_vars(card,1,card.ability.extra.chance,"abn_barb_wire_joker")
    return {
        vars={
            numerator,denominator
        },
    }
  end,


  calculate = function(self, card, context)
    if context.before and context.main_eval and not context.blueprint then
        local first_scoring_4 = nil
        for i,v in ipairs(context.scoring_hand) do
            if v:get_id() == 4 then
                first_scoring_4=v
                break
            end
        end
        if first_scoring_4 then
            first_scoring_4:set_seal("abn_black")
        end
    end
    if context.discard and not context.hook then
        if SMODS.pseudorandom_probability(card,"abn_barb_wire_joker",1,card.ability.extra.chance,"abn_barb_wire_joker") then
            SMODS.destroy_cards({context.other_card})
        end
    end
  end,
  abn_artist_credits = {
    artist = "Weasel.922",
  },
}
