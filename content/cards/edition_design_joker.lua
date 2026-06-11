SMODS.Joker {
    key = 'edition_design_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet16',
    pos = { x = 7, y = 2 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { mult = 0}, mult_rates = {common = 12, uncommon = 16, rare = 18, abn_SuperRare = 28, abn_ParallelRare = 35, legendary = 40, abn_VirusRare = 60} },
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.mult,
                card.ability.mult_rates.common, card.ability.mult_rates.uncommon, card.ability.mult_rates.rare, card.ability.mult_rates.abn_SuperRare, card.ability.mult_rates.abn_ParallelRare, card.ability.mult_rates.legendary, card.ability.mult_rates.abn_VirusRare   
            } 
        }
    end,
  
    calculate = function(self, card, context)
        if context.buying_card and context.card.edition and not context.blueprint then
            local r = context.card.config.center.rarity
            local mult_rate = card.ability.mult_rates
            local mult = 0
            if r == 1 or r == "Common" then mult = mult_rate.common end
            if r == 2 or r == "Uncommon" then mult = mult_rate.uncommon end
            if r == 3 or r == "Rare" then mult = mult_rate.rare end
            if r == 4 or r == "Legendary" then mult = mult_rate.legendary end
            if r == "abn_ParallelRare" then mult = mult_rate.abn_ParallelRare end
            if r == "abn_SuperRare" then mult = mult_rate.abn_SuperRare end
            if r == "abn_VirusRare" then mult = mult_rate.abn_VirusRare end
            card.ability.extra.mult = card.ability.extra.mult + mult
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
		end

    end,

    in_pool = function(self, args)
        for i, joker in ipairs(G.jokers.cards) do
            if joker.edition then
                return true
            end
        end
        return false
    end,

    
    
    abn_artist_credits = {
        artist = "NiceCream",
    },
}
