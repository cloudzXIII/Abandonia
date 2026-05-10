SMODS.Joker {
    key = 'ink_depleted_joker',

    rarity = 3,
    atlas = 'ABNJokerSheet8',
    pos = { x = 5, y = 4 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    config = {

    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS["abn_orange"]
        info_queue[#info_queue + 1] = G.P_SEALS["abn_pink"]
        return {
            vars = {
            },
        }
    end,


    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint and context.scoring_name == "Full House" then
            local is_dark = true
            local is_light = true
            for i, v in ipairs(context.scoring_hand) do
                if not ABN.is_light(v) then
                    is_light = false
                    break
                end
                if not ABN.is_dark(v) then
                    is_dark = false
                    break
                end
            end
            if is_dark then
                for i, v in ipairs(context.scoring_hand) do
                    v:set_edition("e_foil")
                    v:set_seal("abn_pink")
                end
            elseif is_light then
                for i, v in ipairs(context.scoring_hand) do
                    v:set_edition("e_foil")
                    v:set_seal("abn_orange")
                end
            end
        end
    end,
    abn_artist_credits = {
        artist = "Weasel.922",
    },
}
