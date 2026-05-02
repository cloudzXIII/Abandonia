local parkateo_hook = Card.calculate_joker
function Card:calculate_joker(context)
    -- Check if the card being calculated is a Consumable and we are in the main scoring phase
    if context.joker_main 
    and self.ability.set ~= 'Joker' 
    and not self.debuff then

        local parkateos = SMODS.find_card('j_abn_parkateo')
        if parkateos and #parkateos > 0 then
            local total_xmult = 0

            for _, joker in ipairs(parkateos) do
                if joker.ability and joker.ability.extra and joker.ability.extra.xmult then
                    total_xmult = total_xmult + joker.ability.extra.xmult
                end
            end

            if total_xmult > 0 then
                return {
                    message = localize{
                        type = 'variable',
                        key = 'a_xmult',
                        vars = { total_xmult }
                    },
                    Xmult_mod = total_xmult
                }
            end
        end
    end

    return parkateo_hook(self, context)
end

SMODS.Joker {
    key = 'parkateo',
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,

    rarity = "abn_ParallelRare",
    atlas = 'AbandoniaParallel',
    pos = { x = 2, y = 1 },
    soul_pos = { x = 3, y = 1 },
    cost = 10,
    discovered = false,
    blueprint_compat = false,

    config = { extra = { xmult = 4 } },


    abn_artist_credits = {
        artist = "Bunnet and Monochrome",
    },
}