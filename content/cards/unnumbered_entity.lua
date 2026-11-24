SMODS.Joker {
    key = 'unnumbered_entity',
    rarity = 2,
    atlas = 'ABNJokerSheet20',
    pos = { x = 3, y = 6 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { scaling_base = 1.5, bosses_beaten = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.scaling_base, card.ability.extra.scaling_base * card.ability.extra.bosses_beaten } }
    end,
    
    update = function(self, card)
        if card.area == G.jokers and G.STATE == G.STATES.SHOP then
            if G.shop_jokers and G.shop_jokers.cards then
                for _, shop_card in ipairs(G.shop_jokers.cards) do
                    if shop_card.config and shop_card.config.center and shop_card.config.center.set == 'Joker' and shop_card.ability.perishable == nil and shop_card.cost == 0 then
                        print("Adding perishable sticker to card: " .. shop_card.config.center.key)
                        shop_card:add_sticker("perishable", true)
                    end
                end
            end
        end
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and context.beat_boss then
            if SMODS.calculate_round_score() > G.GAME.blind.chips then
                add_tag(Tag("tag_abn_hazard_super", false, 'Small'))
            else
                add_tag(Tag("tag_abn_hazard_legendary", false, 'Small'))
            end
            
            card.ability.extra.bosses_beaten = card.ability.extra.bosses_beaten + 1
            
        end
        
        if context.setting_blind and card.ability.extra.scaling_base and card.ability.extra.bosses_beaten >= 1 then
            return {
                xblindsize = card.ability.extra.scaling_base * card.ability.extra.bosses_beaten,
            }
        end

        
    end,
    
    
    abn_artist_credits = {
        artist = "Vega",
    },
}
