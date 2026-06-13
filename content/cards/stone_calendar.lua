
SMODS.Joker {
    key = "stone_calendar",
    blueprint_compat = true,
    rarity = 3,
    cost = 10,
    atlas = 'ABNJokerSheet15',
    pos = { x = 5, y = 0 },
    abn_coder = "LasagnaFelidae",
    config = { extra = { xchips = 1 , xchips_mod = 1, odds = 5, create = false } },
    
    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return { vars = { card.ability.extra.xchips_mod, card.ability.extra.xchips, num, denom } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, "m_abn_petroleum") then

               local success =
                   card.ability.extra.create
                   or SMODS.pseudorandom_probability(card, "m_abn_petroleum", 1, card.ability.extra.odds)

               if success then
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                       G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.add_card({set="astro_cards", area = G.consumeables})
                                G.GAME.consumeable_buffer = 0 
                                return true
                            end
                        }))
                    end
                end
            end
        end
        if context.joker_main  then
            local suits = {}
            local ret = {}

            for _, c in ipairs(context.scoring_hand) do
                if SMODS.has_enhancement(c, "m_stone") then
                    suits[c.base.suit] = true
                end
            end

            local suits_c = 0
            for _ in pairs(suits) do
                suits_c = suits_c + 1
            end

            if suits_c >= 4 then
                card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_mod
                ret.message = "+"..card.ability.extra.xchips_mod.." xChips"
                ret.colour = G.C.CHIPS
            end

            local odd_s = 0
            local even_p = 0

            for _, c in ipairs(context.scoring_hand) do

                local rank = c.base.id
                if c.base.value == "abn_14" 
                or c.base.value == "abn_13"
                or c.base.value == "abn_12"
                or c.base.value == "abn_11" then 
                    rank = c.base.nominal 
                end

                if SMODS.has_enhancement(c, "m_stone") then
                    if rank <= 10 and rank >= 0 and rank % 2 == 1 then
                        odd_s = odd_s + 1
                    end
                end

                if SMODS.has_enhancement(c, "m_abn_petroleum") then
                    if rank <= 10 and rank >= 0 and rank % 2 == 0 then
                        even_p = even_p + 1
                    end
                end

            end

            if odd_s >= 2 and even_p >= 2 then
                card.ability.extra.create = true
            end

            ret.xchips = card.ability.extra.xchips

            return ret

        end
        if context.setting_blind then
            card.ability.extra.create = false
        end
    end,
    in_pool = function(self, args)
        for i, playing_card in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(playing_card, "m_stone") or SMODS.has_enhancement(playing_card, "m_abn_petroleum") then
                return true
            end
        end
        return false
    end,
    abn_artist_credits = {
        artist = "Sustato",
    },
}