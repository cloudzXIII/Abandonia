SMODS.Joker {
    key = 'stiff_drink',
    rarity = 2,
    atlas = 'ABNJokerSheet4',
    pos = { x = 6, y = 2 },
    cost = 8,
    discovered = false,
    blueprint_compat = false,

    calculate = function(self, card, context)
        if not context.blueprint and context.end_of_round and context.main_eval
        and not G.GAME.abn.stiff_drink_trigger
        and G.GAME.abn.last_blind_type_defeated_this_ante ~= G.GAME.blind:get_type() then
            G.GAME.abn.stiff_drink_trigger = true
        end
    end,

    abn_artist_credits = {
        artist = "Grass",
    },
}

function ABN.reset_abn_stiff_drink(run_start)
    if not run_start and G.GAME.blind then
        G.GAME.abn.last_blind_type_defeated_this_ante = G.GAME.blind:get_type()
        if G.GAME.round_resets.blind_states.Boss == 'Defeated' then
            G.GAME.abn.last_blind_type_defeated_this_ante = nil
        end
    end
end


local ref_end_round = end_round
function end_round()
    if G.GAME.abn and G.GAME.abn.stiff_drink_trigger then
        G.GAME.abn.stiff_drink_trigger = false
        ABN.reset_abn_stiff_drink(false)
    end
    ref_end_round()
end