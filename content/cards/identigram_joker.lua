SMODS.Joker {
    key = 'identigram_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet9',
    pos = { x = 5, y = 2 },
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { xmult_mod = 0.01, xchips_mod = 0.1, xmult = 1, xchips= 1 }},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_mod, card.ability.extra.xchips_mod, card.ability.extra.xmult, card.ability.extra.xchips, } }
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local current = context.other_card
            
            local has_different_edition = false
            
            for _, other in ipairs(context.scoring_hand) do
                if other ~= current then

                    if other.edition and current.edition and (current.edition.key ~= other.edition.key) then
                        has_different_edition = true
                        break
                    end
                end
            end
            
            if has_different_edition then
                local rank = context.other_card.base.id
                if context.other_card.base.value == "abn_14" 
                or context.other_card.base.value == "abn_13"
                or context.other_card.base.value == "abn_12"
                or context.other_card.base.value == "abn_11" then 
                    rank = context.other_card.base.nominal 
                end
                
                if rank <= 10 and rank >= 0 and rank % 2 == 1 then
                    card.ability.extra.xchips =
                    card.ability.extra.xchips + card.ability.extra.xchips_mod
                    
                end
                if rank <= 10 and rank >= 0 and rank % 2 == 0 then
                    card.ability.extra.xmult =
                    card.ability.extra.xmult + card.ability.extra.xmult_mod
                end
            end
        end
        if context.joker_main then
            return{
                xchips = card.ability.extra.xchips,
                xmult = card.ability.extra.xmult,
            }
        end
        
    end,
    in_pool = function(self, args)
        local editions = {}

        for _, card in pairs(G.playing_cards or {}) do
            if card and card.edition and card.edition.key then
                editions[card.edition.key] = true
            end
        end

        local count = 0
        for _ in pairs(editions) do
            count = count + 1
            if count >= 2 then
                return true
            end
        end

        return false
    end,
    
    
    abn_artist_credits = {
        artist = "Technotoad64",
    },
}