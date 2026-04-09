local upd = Game.update
function Game:update(dt)
    upd(self, dt)

    -- Only run during a game run
    if G.STAGE ~= G.STAGES.RUN then return end

    -- Ensure the play cards table exists
    local cards = G.play and G.play.cards
    if not cards or #cards == 0 then
        return
    end

    -- Check for 4+ unique suits in the played hand
    if not G.GAME.FourSuitsPlayed then
        local suits_found = {}
        local count = 0
        for _, play_card in ipairs(cards) do
            if play_card.base and play_card.base.suit and not suits_found[play_card.base.suit] then
                suits_found[play_card.base.suit] = true
                count = count + 1
            end
        end
        
        if count >= 4 then
            G.GAME.FourSuitsPlayed = true
        end
    end
end

SMODS.Joker {
    key = 'power_four',
    rarity = 2,
    atlas = 'AbandoniaJokers',
    pos = { x = 8, y = 12 },
    cost = 6,
    discovered = false,
    blueprint_compat = true, 
    
    config = { extra = { xmult = 1.0, xmultadd = 0.1 } },

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.xmult, card.ability.extra.xmultadd }}
    end,
    
    in_pool = function(self)
        if G.GAME.FourSuitsPlayed then
            return true
        end
        return false
    end,

    calculate = function(self, card, context)
        -- Permanent Scaling Logic
        if context.before and not context.blueprint then
            local suits = {}
            for _, v in ipairs(context.scoring_hand) do
                suits[v.base.suit] = true
            end
            
            local count = 0
            for _ in pairs(suits) do count = count + 1 end

            if count > 0 then
                card.ability.extra.xmult = card.ability.extra.xmult + (card.ability.extra.xmultadd * count)
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.RED,
                    card = card
                }
            end
        end

        -- Retrigger Logic
        -- context.repetition triggers for every card in the played hand
        if context.repetition and context.cardarea == G.play then
            local suits = {}
            for _, v in ipairs(context.scoring_hand) do
                suits[v.base.suit] = true
            end
            
            local count = 0
            for _ in pairs(suits) do count = count + 1 end
            
            -- Only retrigger if the hand has 4 or more unique suits
            if count >= 4 then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card
                }
            end
        end
        
        -- Final Scoring Logic
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,

    abn_artist_credits = {
        artist = "DOS",
    },
}