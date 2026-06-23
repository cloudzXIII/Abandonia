SMODS.Joker {
  key = 'till_joker',

  rarity = 2,
  atlas = 'ABNJokerSheet8',
  pos = { x = 6, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra={
    chance=3,
    }
  },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_SEALS["abn_grey"]
    info_queue[#info_queue+1] = G.P_SEALS["Gold"]
  end,


  calculate = function(self, card, context)
    if context.before and context.main_eval and not context.blueprint and G.GAME.current_round.hands_played == 0 then
        local this_card = nil
        for i = #context.full_hand do
            local v = context.full_hand[i]
            if not v:is_face() and v:get_id() ~= 14 then
                this_card=v
                break
            end
        end
        if this_card then
            this_card:set_seal("abn_grey")
        end
    end
    if context.before and context.main_eval and not context.blueprint and G.GAME.current_round.hands_left == 0 then
        local this_card = nil
        for i,v in ipairs(context.scoring_hand) do
            if not v:is_face() and v:get_id() ~= 14 then
                this_card=v
                break
            end
        end
        if this_card then
            this_card:set_seal("Gold")
        end
    end
  end,
  abn_artist_credits = {
    artist = "Null",
  },
}
