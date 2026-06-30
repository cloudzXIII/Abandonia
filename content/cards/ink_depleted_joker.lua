SMODS.Joker {
    key = 'ink_depleted_joker',
    rarity = 3,
    atlas = 'ABNJokerSheet8',
    pos = { x = 5, y = 4 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    config = {},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS["abn_orange"]
        info_queue[#info_queue + 1] = G.P_SEALS["abn_pink"]
        info_queue[#info_queue + 1] = G.P_CENTERS.e_foil

        info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
        info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
        return {
            vars = {},
        }
    end,

    calculate = function(self, card, context)
        -- Triggers during the scoring sequence for a Full House
        if context.before and context.scoring_name == "Full House" then
            local is_dark = true
            local is_light = true

            -- Check if every card in the scoring hand meets the requirement
            for i, v in ipairs(context.scoring_hand) do
                if not ABN.is_light(v) then
                    is_light = false
                end
                if not ABN.is_dark(v) then
                    is_dark = false
                end
            end

            -- Apply effects only to the first card [1]
            if is_dark or is_light then
                local target_card = context.scoring_hand[1]
                local seal_to_apply = is_dark and "abn_pink" or "abn_orange"

                target_card:set_edition("e_foil", true)
                target_card:set_seal(seal_to_apply, true)
            end
        end
    end,

    abn_artist_credits = {
        artist = "Weasel.922",
    },
}
