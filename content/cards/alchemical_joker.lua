SMODS.Joker {
    key = 'alchemical_joker',
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult } }
    end,

    rarity = 3,
    atlas = 'AbandoniaJokers',
    pos = { x = 0, y = 9 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,

    config = { extra = { x_mult=0.5 } },

    calculate = function(self, card, context)
        if context.joker_main then
            local non_unique = {}
            local count=0
            for i,v in pairs(context.scoring_hand) do
                for key, _ in pairs(SMODS.Sticker.obj_table) do
                if v.ability[key] and not non_unique[key] then
                    non_unique[key] = true
                    count=count+1
                end
                end
                local enhancements = SMODS.get_enhancements(v) or {}
                for i,v in pairs(enhancements) do
                    if not non_unique[i] and v then
                    count=count+1
                    non_unique[i] = true
                    end
                end
                if v.edition then
                    count=count+1
                end
                if v.seal then
                    count=count+1
                end
            end
            return {
                x_mult=1+card.ability.extra.x_mult*count
            }
        end
    end,
    in_pool = function ()
        local requirement = 0
        local meet = {
            en=false,
            e=false,
            se=false,
            s=false,
        }
        local function check_requirement(arg1)
        for i,v in pairs(arg1) do
            if v.edition and meet.e == false then meet.e = true requirement=requirement+1 end
            if meet.en == false then
            for x,l in pairs(SMODS.get_enhancements(v)) do
                if l then
                    meet.en = true
                    requirement=requirement+1
                    break
                end
            end
            end
            if meet.s == false then
            for key, _ in pairs(SMODS.Sticker.obj_table) do
                if v.ability[key] then
                    meet.s = true
                    requirement=requirement+1
                    break
                end
            end
            end
            if meet.se == false then
                if v.seal then
                    meet.se = true
                    requirement=requirement+1
                end
            end
        end
        end
        check_requirement(G.jokers.cards)
        check_requirement(G.deck.cards)
        if requirement >=4 then print("requirement meet") return true end
        return false
    end,

    abn_artist_credits = {
        artist = "Riley",
    },
}