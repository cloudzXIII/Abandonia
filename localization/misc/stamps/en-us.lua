return {
    descriptions = {
        Other = {
            --#region Stamps
            abn_empty_stamp = {
                name = "Empty Stamp",
                text = {
                    "If this Card has a unique {C:dark_edition}Edition,{} {C:attention}Seal,{} and {C:dark_edition}Enhancement{}",
                    "gain {C:attention}+1{} handsize",
                }
            },
            abn_jester_stamp = {
                name = "Jester Stamp",
                text = {
                    "If this Card has a unique {C:dark_edition}Edition,{} {C:attention}Seal,{} and {C:dark_edition}Enhancement{}",
                    "gain {C:attention}+1{} Joker slot when it is {C:mult}Destroyed{} {C:inactive}(max:5){}",
                }
            },
            abn_icon_stamp = {
                name = "Icon Stamp",
                text = {
                    "If this Card has a unique {C:dark_edition}Edition,{} {C:attention}Seal,{} and {C:dark_edition}Enhancement{}",
                    "Gains {X:chips,C:white}X1{} Chips for each {C:attention}Seal{}/{C:dark_edition}Edition{}/{C:dark_edition}Enhancement{}",
                    "If the round is won in {C:attention}1{} hand {C:mult}Destroy{} this card",
                    "{C:inactive}(Currently {X:chips,C:white}X#1#{} {C:inactive}Chips)",
                }
            },
            abn_psychomancy_stamp = {
                name = "Psychomancy Stamp",
                text = {
                    "Upon {C:mult}destroying{} this card {C:attention}Level up{} the {C:attention}most played hand{}",
                    "for each {C:dark_edition}Edition,{} {C:dark_edition}Enhancement,{} and {C:attention}Seal{} on this card",
                }
            },
            abn_membership_stamp = {
                name = "Membership Stamp",
                text = {
                    "If this Card has a unique {C:dark_edition}Edition, {C:attention}Seal,{} and {C:dark_edition}Enhancement{}",
                    "it gains {C:gold}+#1#{} Ascension Power when scoring",
                    "{C:inactive}(Currently{} {C:gold}#2#{} {C:inactive}Ascension Power)",
                }
            },
            abn_prehensile_stamp = {
                name = "Prehensile Stamp",
                text = {
                    "If this card has unique {C:dark_edition}Edition,{} {C:attention}Seal, and {C:dark_edition}Enhancement{}",
                    "It {C:attention}always scores{} and {C:attention}ignores card selection limit{}",
                }
            },
            --#endregion
        }
    },
    misc = {
        labels = {
            -- Stamps
            abn_empty_stamp = "Empty Stamp",
            abn_jester_stamp = "Jester Stamp",
            abn_icon_stamp = "Icon Stamp",
            abn_psychomancy_stamp = "Psychomancy Stamp",
            abn_membership_stamp = "Membership Stamp",
            abn_prehensile_stamp = "Prehensile Stamp",
        }
    }
}