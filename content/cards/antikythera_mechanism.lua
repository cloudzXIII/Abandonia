local Card_set_debuff = Card.set_debuff
function Card:set_debuff(should_debuff)
    if next(SMODS.find_card('j_abn_antikythera_mechanism')) then
        if self.config.center and self.config.center == G.P_CENTERS.m_steel or self.config.center and self.config.center == G.P_CENTERS.m_abn_fossil then
            self.debuff = false
            return
        end
    end
    Card_set_debuff(self, should_debuff)
end

local start_dissolve_original = Card.start_dissolve

function Card:start_dissolve(...)
    -- Only act on normal playing cards that are Enhanced
    if self.config and self.config.center and self.config.center.set == "Enhanced" then
        -- Check if the player owns the Antikythera Mechanism
        if next(SMODS.find_card('j_abn_antikythera_mechanism')) then
            local key = self.config.center

            -- Prevent destruction if it's a Steel or Fossil card
            if key == G.P_CENTERS.m_steel or key == G.P_CENTERS.m_abn_fossil then
                -- cancel destruction
                return
            end
        end
    end

    -- Always call original method if the conditions above aren't met
    return start_dissolve_original(self, ...)
end

SMODS.Joker {
    key = 'antikythera_mechanism',
    rarity = 3,
    atlas = 'ABNJokerSheet10',
    pos = { x = 6, y = 5 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    unlocked = true,
    config = { extra = { xmult = 1, xmultadd = 0.1 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_fossil
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmultadd } }
    end,

    in_pool = function(self)
        if not G.playing_cards then return false end

        -- steel card check
        local has_steel = false
        for _, card in ipairs(G.playing_cards) do
            if card.config.center == G.P_CENTERS.m_steel then
                has_steel = true
                break
            end
        end

        -- fossil card check
        local has_fossil = false
        for _, card in ipairs(G.playing_cards) do
            if card.config.center == G.P_CENTERS.m_abn_fossil then
                has_fossil = true
                break
            end
        end

        -- has a program card been used
        local program_card_used = false
        if G.GAME and G.GAME.consumeable_usage then
            for _, v in pairs(G.GAME.consumeable_usage) do
                if v.set == 'program_pack' then
                    program_card_used = true
                    break
                end
            end
        end

        -- if all yes spawn
        return has_steel and has_fossil and program_card_used
    end,

    calculate = function(self, card, context)
        -- Scoring
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end

        -- If using a program card
        if context.using_consumeable and context.consumeable.ability.set == "program_pack" then
            -- Gain xmult
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.ATTENTION,
                card = card
            }
        end
    end,

    abn_artist_credits = {
        artist = "La Ginger",
    },
}
