SMODS.Joker {
    key = 'mephistopheles',
    atlas = 'ABNJokerSheet25', 
    pos = { x = 4, y = 5 }, 
    rarity = 3,
    cost = 10,
    blueprint_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,

    calculate = function(self, card, context)
        if context.modify_hand then
            local total = hand_chips + mult
            local is_chips = pseudorandom('mephistopheles') < 0.5

            if is_chips then
                hand_chips = mod_chips(hand_chips + total)
            else
                mult = mod_mult(mult + total)
            end

            update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})

            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = is_chips and ("+" .. total .. " Chips") or ("+" .. total .. " Mult"),
                colour = is_chips and G.C.CHIPS or G.C.MULT
            })
        end
    end,

    abn_artist_credits = {
        artist = "TanTinch" 
    },
}