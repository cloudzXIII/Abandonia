SMODS.Joker {
    key = 'frenemy_joker',
    rarity = "abn_SuperRare",
    atlas = 'ABNJokerSheet17', 
    pos = { x = 0, y = 0 }, 
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    
    config = { 
        extra = { 
            mult_common = 1.5,
            mult_uncommon = 3,
            mult_rare = 4,
            mult_super_rare = 6,
            mult_legendary = 8,
            mult_parallel_rare = 10,
            chips_common = 1.5,
            chips_uncommon = 3,
            chips_rare = 4,
            chips_super_rare = 6,
            chips_legendary = 8,
            chips_parallel_rare = 10,
        } 
    },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_common,
                card.ability.extra.mult_uncommon,
                card.ability.extra.mult_rare,
                card.ability.extra.mult_super_rare,
                card.ability.extra.mult_legendary,
                card.ability.extra.mult_parallel_rare,
                card.ability.extra.chips_common,
                card.ability.extra.chips_uncommon,
                card.ability.extra.chips_rare,
                card.ability.extra.chips_super_rare,
                card.ability.extra.chips_legendary,
                card.ability.extra.chips_parallel_rare,
            }
        }
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            local is_even = ABN.is_even(context.other_card)
            local is_odd = ABN.is_odd(context.other_card)

            if is_even or is_odd then
                local counts = {
                    Common = 0,
                    Uncommon = 0,
                    Rare = 0,
                    SuperRare = 0,
                    Legendary = 0,
                    ParallelRare = 0
                }

                if G.jokers and G.jokers.cards then
                    for _, j in ipairs(G.jokers.cards) do
                        if j.config and j.config.center and j.config.center.rarity then
                            local r = j.config.center.rarity
                            if r == 1 or r == 'Common' then counts.Common = counts.Common + 1
                            elseif r == 2 or r == 'Uncommon' then counts.Uncommon = counts.Uncommon + 1
                            elseif r == 3 or r == 'Rare' then counts.Rare = counts.Rare + 1
                            elseif r == 'abn_SuperRare' or r == 'SuperRare' then counts.SuperRare = counts.SuperRare + 1
                            elseif r == 4 or r == 'Legendary' then counts.Legendary = counts.Legendary + 1
                            elseif r == 'ParallelRare' then counts.ParallelRare = counts.ParallelRare + 1
                            end
                        end
                    end
                end

                if is_even then
                    local total_xmult = 1
                    total_xmult = total_xmult + (card.ability.extra.mult_common * counts.Common)
                    total_xmult = total_xmult + (card.ability.extra.mult_uncommon * counts.Uncommon)
                    total_xmult = total_xmult + (card.ability.extra.mult_rare * counts.Rare)
                    total_xmult = total_xmult + (card.ability.extra.mult_super_rare * counts.SuperRare)
                    total_xmult = total_xmult + (card.ability.extra.mult_legendary * counts.Legendary)
                    total_xmult = total_xmult + (card.ability.extra.mult_parallel_rare * counts.ParallelRare)

                    if total_xmult > 1 then
                        return {
                            x_mult = total_xmult,
                            card = card
                        }
                    end
                elseif is_odd then
                    local total_xchips = 1
                    total_xchips = total_xchips + (card.ability.extra.chips_common * counts.Common)
                    total_xchips = total_xchips + (card.ability.extra.chips_uncommon * counts.Uncommon) 
                    total_xchips = total_xchips + (card.ability.extra.chips_rare * counts.Rare)
                    total_xchips = total_xchips + (card.ability.extra.chips_super_rare * counts.SuperRare)
                    total_xchips = total_xchips + (card.ability.extra.chips_legendary * counts.Legendary)
                    total_xchips = total_xchips + (card.ability.extra.chips_parallel_rare * counts.ParallelRare)

                    if total_xchips > 1 then
                        return {
                            x_chips = total_xchips,
                            card = card
                        }
                    end
                end
            end
        end

        if context.setting_blind and not context.blueprint then
            local unique_rarity_count = 0
            local found_rarities = {}

            if G.jokers and G.jokers.cards then
                for _, j in ipairs(G.jokers.cards) do
                    if j.config and j.config.center and j.config.center.rarity then
                        local r = j.config.center.rarity
                        if not found_rarities[r] then
                            found_rarities[r] = true
                            unique_rarity_count = unique_rarity_count + 1
                        end
                    end
                end
            end

            if unique_rarity_count >= 6 and G.GAME.blind and G.GAME.blind.chips then
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.02)
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                card:juice_up(0.8, 0.8)
            end
        end
    end,

    abn_artist_credits = {
        artist = "Comykel",
    },
}