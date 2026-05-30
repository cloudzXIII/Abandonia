SMODS.Joker {
  key = 'lucky_socks',
  loc_vars = function(self, info_queue, card)
    return {
        vars={
            card.ability.extra.mult_gain,
            card.ability.extra.mult,
        }
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet11',
  pos = { x = 4, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra={
        mult=0,
        mult_gain=2,
    },

  },

  calculate = function(self, card, context)
    if context.before then
        local guaranteed_lucky_cards = {}
        for i,v in ipairs(context.scoring_hand) do
            if guaranteed_lucky_cards[v] == nil and SMODS.has_enhancement(v,"m_lucky") then
            for i = i+1,#context.scoring_hand do
                local l = context.scoring_hand[i]
                if l ~= nil then
                if v:get_id() == l:get_id() and SMODS.has_enhancement(l,"m_lucky") then table.insert(guaranteed_lucky_cards,v) if guaranteed_lucky_cards[l] == nil then table.insert(guaranteed_lucky_cards,l) end end    
                
                end
            end
            end
        end
        card.guaranteed_lucky_cards = guaranteed_lucky_cards
    end
    if context.joker_main and next(context.poker_hands["Pair"]) then
        SMODS.scale_card(card,{
            ref_table=card.ability.extra,
            ref_value="mult",
            scalar_value="mult_gain",
            message_key="a_mult",
            message_colour=G.C.RED,
        })
        return {
            mult=card.ability.extra.mult
        }
    end
    if context.joker_main then
        return {
            mult=card.ability.extra.mult
        }
    end
    if context.fix_probability then
        local lucky_cards = card.guaranteed_lucky_cards
        local is_lucky = false
        if lucky_cards then
        for i,v in ipairs(lucky_cards) do
            if v == context.trigger_obj then is_lucky=true break end
        end
        if is_lucky == true then
            print('yes it is lucky card?')
            return {
                numerator=1,
                denominator=1,
            }
        end
        end
    end
    if context.final_scoring_step then
        card.guaranteed_lucky_cards = nil
    end
  end,

  abn_artist_credits = {
    artist = "Rome",
  },
}
