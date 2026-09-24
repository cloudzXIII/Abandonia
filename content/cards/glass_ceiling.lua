local start_dissolve_original = Card.start_dissolve

function Card:start_dissolve(...)
    local is_in_playing_cards = false
    if G and G.playing_cards then
        for _, v in ipairs(G.playing_cards) do
            if v == self then
                is_in_playing_cards = true
                break
            end
        end
    end

    if is_in_playing_cards and self.config and self.config.center and 
       (self.config.center.set == "Default" or self.config.center.set == "Enhanced") then
        G.GAME.abn_cards_destroyed_count = (G.GAME.abn_cards_destroyed_count or 0) + 1
    end

    return start_dissolve_original(self, ...)
end

local shatter_original = Card.shatter

function Card:shatter(...)
    if self.config and self.config.center and G and (self.config.center.set == "Default" or self.config.center.set == "Enhanced") then
        G.GAME.abn_cards_destroyed_count = (G.GAME.abn_cards_destroyed_count or 0) + 1
    end

    return shatter_original(self, ...)
end

SMODS.Joker {
    key = 'glass_ceiling',
    rarity = 3,
    atlas = 'ABNJokerSheet14',
    pos = { x = 1, y = 3 },
    cost = 15,
    discovered = false,
    blueprint_compat = true,
    
    config = { 
        extra = { 
            hands_played = 0,
            hands_required = 6,
            asc_add = 0.50,
            bonus_chips = 30,
            bonus_mult = 10,
        } 
    },
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hands_played, card.ability.extra.hands_required, card.ability.extra.asc_add, card.ability.extra.bonus_chips, card.ability.extra.bonus_mult } }
    end,

    in_pool = function(self, args)
        local glass_count = 0
        if G and G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_glass') then
                    glass_count = glass_count + 1
                end
            end
        end
        return glass_count >= 6
    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(1)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-1)
    end,

    calculate = function(self, card, context)
        if context.before then
            local all_glass = true
            if context.scoring_name ~= "High Card" then
                for _, scored_card in ipairs(context.scoring_hand) do
                    if not SMODS.has_enhancement(scored_card, 'm_glass') then
                        all_glass = false
                        break
                    end
                end
            else
                all_glass = false
            end

            if all_glass then
                local scoring_count = #context.scoring_hand
                local destroyed_count = G.GAME.abn_cards_destroyed_count or 0
                local scaled_asc = card.ability.extra.asc_add * destroyed_count
                
                if scoring_count >= 6 then
                    card.ability.extra.hands_played = card.ability.extra.hands_played + 1
                end
                
                for _, scored_card in ipairs(context.scoring_hand) do
                    scored_card.ability.abn_perma_asc = (scored_card.ability.abn_perma_asc or 0) + scaled_asc
                end
                
                if card.ability.extra.hands_played >= card.ability.extra.hands_required then
                    if G.playing_cards then
                        for _, playing_card in ipairs(G.playing_cards) do
                            playing_card.ability.perma_bonus = (playing_card.ability.perma_bonus or 0) + card.ability.extra.bonus_chips
                            playing_card.ability.perma_mult = (playing_card.ability.perma_mult or 0) + card.ability.extra.bonus_mult
                        end
                    end
                    card:start_dissolve()
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "ThunderEdge",
    },
}