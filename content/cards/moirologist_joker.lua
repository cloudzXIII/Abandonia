local ability_table = {
    [1] = {
        ref_value = "chips",
        scalar_value = "chips_mod",
    },
    [2] = {
        ref_value = "mult",
        scalar_value = "mult_mod",
    },
    [3] = {
        ref_value = "xchips",
        scalar_value = "xchips_mod",
        
    },
    ["abn_SuperRare"] = {
        ref_value = "xmult",
        scalar_value = "xmult_mod",
    },
    [4] = {
        ref_value = "asc",
        scalar_value = "asc_mod",
    },
    
    ["abn_ParallelRare"] = {
        ref_value = "retriggers",
        scalar_value = "retriggers_mod",
    },
}

SMODS.Joker {
    key = 'moirologist_joker',
    
    atlas = 'ABNJokerSheet21',
    pos = { x = 4, y = 5 },
    
    cost = 10,
    rarity = 3,
    
    abn_coder = "LasagnaFelidae",
    
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    
    config = {
        extra = {
            dollars = 2,
            dollars_mod = 2,
            chips = 0,
            chips_mod = 10,
            mult = 0,
            mult_mod = 4,
            xchips = 1,
            xchips_mod = 0.04,
            xmult = 1,
            xmult_mod = 0.06,
            asc = 0,
            asc_mod = 0.25,
            retriggers = 0,
            retriggers_mod = 1,
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "abn_fragile", set = "Other", vars = { 1, 4 } }
        return { 
            vars = { 
                
                card.ability.extra.dollars,
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.xchips,
                card.ability.extra.xmult,
                card.ability.extra.asc,
                card.ability.extra.retriggers,
                
                card.ability.extra.dollars_mod,
                card.ability.extra.chips_mod,
                card.ability.extra.mult_mod,
                card.ability.extra.xchips_mod,
                card.ability.extra.xmult_mod,
                card.ability.extra.asc_mod,
                card.ability.extra.retriggers_mod,
            } 
        }
    end,
    
    calculate = function(self, card, context)
        if context.joker_type_destroyed then
            if context.card ~= card
            and context.card.config
            and context.card.config.center
            and context.card.config.center.rarity 
            and not context.retrigger_joker and not context.blueprint then
                print(context.card.config.center.rarity)
                if ability_table[context.card.config.center.rarity] then
                    local r = ability_table[context.card.config.center.rarity]
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = r.ref_value,
                        scalar_value = r.scalar_value,
                    })
                end
                
                return {dollars = card.ability.extra.dollars}
            end
        end
        if context.setting_blind and #G.jokers.cards > 1 and not context.retrigger_joker and not context.blueprint then
            local rj = {}
            for _, j in ipairs(G.jokers.cards) do
                if j ~= card and not j.ability.abn_fragile then
                    rj[#rj + 1] = j
                end
            end
            
            local cj = pseudorandom_element(rj, pseudoseed('abn_moirologist_joker'))
            
            cj:add_sticker("abn_fragile", true)
            cj:juice_up()
        end
        if context.retrigger_joker_check and card.ability.extra.retriggers >= 1 and not context.retrigger_joker and not context.blueprint then
            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.extra.retriggers,
            }
        end
        if context.joker_main then
            local ret = {}
            
            ret.chips = card.ability.extra.chips
            ret.mult = card.ability.extra.mult
            if card.ability.extra.xchips > 1 then
                ret.xchips = card.ability.extra.xchips
            end
            ret.xmult = card.ability.extra.xmult
            ret.asc = card.ability.extra.asc

            return ret
        end
        if context.ante_change and context.ante_end and not context.retrigger_joker and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "dollars",
                scalar_value = "dollars_mod",
            })
        end
    end,
    
    in_pool = function(self, args)
        if not G.playing_cards then return false end
        for _, playing_card in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(playing_card, "m_abn_teastain") or SMODS.has_enhancement(playing_card, "m_abn_teatag") then
                return true
            end
        end
        return false
    end,
    abn_artist_credits = { artist = "Mini Bit" },
}

