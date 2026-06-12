
SMODS.Joker {
    key = "cataract_joker",
    blueprint_compat = true,
    rarity = 2,
    cost = 8,
    atlas = 'ABNJokerSheet16',
    pos = { x = 0, y = 1 },
    abn_coder = "LasagnaFelidae",
    config = { extra = { xchips = 3, xmult = 3, poker_hand = "Flush" } },
    
    loc_vars = function(self, info_queue, card)
        return { vars = { localize(card.ability.extra.poker_hand, 'poker_hands'), card.ability.extra.xchips, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_name == card.ability.extra.poker_hand then
            local suit = context.scoring_hand.base.suit

            if suit == "abn_Snow" then
                return { xchips = card.ability.extra.xchips}
            elseif suit == "abn_Penumbra" then
                return { xmult = card.ability.extra.xmult}
            elseif suit == "abn_Tie" then
                return {balance = true}
            elseif suit == "abn_Bow" then
                local old_m = mult
                mult = mod_mult(hand_chips)
                hand_chips = mod_chips(old_m)
                update_hand_text({delay=0}, {chips = hand_chips, mult = mult})
            end
        end
    end,
    abn_artist_credits = {
        artist = "The Majin00",
    },
}