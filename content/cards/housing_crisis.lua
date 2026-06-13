
SMODS.Joker {
    key = "housing_crisis",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    atlas = 'ABNJokerSheet15',
    pos = { x = 8, y = 5 },
    abn_coder = "LasagnaFelidae",
    config = { 
        extra = { 
            chips = 0 , chips_gain_1 = 9 , chips_gain_2 = 6 ,
            mult = 0, mult_gain_1 = 6 , mult_gain_2 = 9 ,
            dollars_1 = 3, dollars_2 = 4,
            type = "Full House"} 
        },
    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                localize(card.ability.extra.type, 'poker_hands'),
                card.ability.extra.dollars_1, card.ability.extra.mult_gain_1, card.ability.extra.chips_gain_1, 
                card.ability.extra.dollars_2, card.ability.extra.mult_gain_2, card.ability.extra.chips_gain_2,
                card.ability.extra.mult, card.ability.extra.chips, 
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and #context.scoring_hand == 5 and context.scoring_name == card.ability.extra.type then
            local evens = {}
            local odds = {}
            local darks = {}
            local lights = {}
            local total = 0
            local ret = {}
            for _, c in ipairs(context.scoring_hand) do

                local rank = c.base.id
                if c.base.value == "abn_14" 
                or c.base.value == "abn_13"
                or c.base.value == "abn_12"
                or c.base.value == "abn_11" then 
                    rank = c.base.nominal 
                end

                if rank <= 10 and rank >= 0 and rank % 2 == 0 then
                    evens[#evens+1] = c
                end
                if rank <= 10 and rank >= 0 and rank % 2 == 1 then
                    odds[#odds+1] = c
                end
                if ABN.is_dark(c) then
                    darks[#darks+1] = c
                end
                if ABN.is_light then
                    lights[#lights+1] = c
                end
            end
            if G.GAME.current_round.hands_played == 0 and #evens == 2 and #odds == 3 then
                ret.message = localize("k_upgrade_ex")
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain_1
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain_1
                ease_dollars(card.ability.extra.dollars_1)
            end
            if G.GAME.current_round.hands_played == 1 and #evens == 3 and #odds == 2 then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain_2
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain_2
                ease_dollars(card.ability.extra.dollars_2)
            end
            if G.GAME.current_round.hands_played == 2 and #lights == 2 and #darks == 3 then
                SMODS.smart_level_up_hand(card, card.ability.extra.type, nil, 1, nil)
            end

            ret.chips = card.ability.extra.chips
            ret.mult = card.ability.extra.mult
            return ret
        end
    end,
    in_pool = function(self, args)
        if G.GAME.hands["Full House"] and G.GAME.hands["Full House"].played > 0 then return true end
        return false
    end,

    abn_artist_credits = {
        artist = "Toyrapple",
    },
}