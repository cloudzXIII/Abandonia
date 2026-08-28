SMODS.Joker {
    key = "foreign_thunk",
    rarity = 3, 
    cost = 10,
    atlas = "ABNJokerSheet20",
    abn_coder = "LasagnaFelidae",
    pos = { x = 1, y = 4 },
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    config = {
        extra = {
            score = 100,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.score
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and context.scoring_hand and not context.blueprint then
            local vanilla = nil

            for _, v in ipairs(context.scoring_hand) do
                local enh_key = v.config.center and v.config.center.key
                local data = enh_key and ABN.get_enh_sticker(enh_key)
                if data and data.mod == "Vanilla" then
                    vanilla = data
                    break
                end
            end
            
            if vanilla then
                local rightmost = G.jokers and G.jokers.cards and G.jokers.cards[#G.jokers.cards]
                if rightmost and not(ABN.has_sticker(rightmost, vanilla.sticker))then
                    rightmost:add_sticker(vanilla.sticker, true)
                    rightmost:juice_up()
                end
            end
        end
        
        if context.individual and context.cardarea == G.play and context.other_card and G.jokers and G.jokers.cards and #G.jokers.cards >= 1 then
            local vanilla = nil
            local v = context.other_card
            local enh_key = v.config.center and v.config.center.key
            local data = enh_key and ABN.get_enh_sticker(enh_key)

            if data and data.mod == "Vanilla" then
                vanilla = data
            end
                  
            if vanilla then
                for _, j in ipairs(G.jokers.cards) do
                    local stk_key = ABN.get_joker_enh(j)
                    local j_data = stk_key and ABN.get_enh_sticker(stk_key)
                    if j_data and j_data.enhancement == vanilla.enhancement then
                        j.ability.abn_perma_score = (j.ability.abn_perma_score or 0)
                        SMODS.scale_card(j, {
                            ref_table = j.ability,
                            ref_value = "abn_perma_score",
                            scalar_table = card.ability.extra,
                            scalar_value = "score",
                        })
                    end
                end
            end
        end
    end,
    
    abn_artist_credits = {
        artist = "Dogg-Fly",
    },
}