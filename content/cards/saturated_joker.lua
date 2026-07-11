local function includes_suit(card)
    local suits = {
        "abn_Sword",
        "abn_Chalice",
        "abn_Coin",
        "abn_Baton",
    }
    local multiplier = 0
    for i,v in ipairs(suits) do
        if card:is_suit(v) then multiplier=multiplier+1 end
    end
    return multiplier
end
SMODS.Joker {
  key = 'saturated_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS["abn_abn_vintage"]
    return {
        vars={
            card.ability.extra.mult_gain,
            card.ability.extra.chips_gain,
            card.ability.extra.chips,
        }
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet15',
  pos = { x = 4, y = 1 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = {chips=0, mult_gain = 1, chips_gain = 5 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
        local multi = includes_suit(context.other_card)
        if multi >0 then
            context.other_card.perma_mult=context.other_card.perma_mult or 0
            context.other_card.perma_mult=context.other_card.perma_mult+(card.ability.extra.mult_gain*multi)
        end
        if card.edition and card.edition.key == "abn_abn_vintage" then
            SMODS.scale_card(card,{
                ref_table=card.ability.extra,
                ref_value="chips",
                scalar_value="chips_gain",
                message_key="a_chips",
                message_colour=G.C.CHIPS,
            })
        end
    end
    if context.joker_main then
        return {
            chips=card.ability.extra.chips,
        }
    end
  end,
  abn_artist_credits = {
    artist = "Gud"
  },
}
