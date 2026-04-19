local original_game_update = Game.update
function Game:update(dt)
    original_game_update(self, dt)
    
    -- Basic safety checks
    if G.STAGE ~= G.STAGES.RUN or not G.shop_jokers or not G.shop_jokers.cards then return end

    -- Check if we are in the shop 
    if G.STATE == G.STATES.SHOP then
        if G.GAME.BonusDied and G.GAME.CreechieDied then
            --Check if creechie is ALREADY in the shop
            local comp_in_shop = false
            for _, v in pairs(G.shop_jokers.cards) do
                if v.config.center.key == 'j_abn_composite_creechie' then
                    comp_in_shop = true
					G.GAME.CompSpotted = (G.GAME.CompSpotted or 0) + 1
                    break
                end
            end

            --If creechie isn't there, spawn it
            if not comp_in_shop and not next(SMODS.find_card('j_abn_composite_creechie')) and (G.GAME.CompSpotted or 0) <= 0  then
                local new_card = SMODS.create_card{
                    key = 'j_abn_composite_creechie',
                    area = G.shop_jokers
                }
                new_card:add_to_deck()
                G.shop_jokers:emplace(new_card)
                create_shop_card_ui(new_card)
            end
        end
    end
end



SMODS.Joker {
    key = 'composite_creechie',
    rarity = 1,
    atlas = 'AbandoniaJokers',
    pos = { x = 9, y = 24 },
    cost = 5,
    discovered = false,
    blueprint_compat = true,
    config = { extra = { xmult = 1, xmultadd = 1, odds = 20, } },
	
	loc_vars = function(self, info_queue, card)
        local numerator,denominator = SMODS.get_probability_vars(card,1,card.ability.extra.odds)
        return {vars = {numerator,denominator, card.ability.extra.xmult,  card.ability.extra.xmultadd }}
    end,
	
	--only appear if both died
	in_pool = function(self)

        -- Only return true if BOTH conditions are met
        return G.GAME.BonusDied and G.GAME.CreechieDied 
    end,
	
	
	update = function(self, card)
		-- Only run during a game run
		if G.STAGE ~= G.STAGES.RUN then return end
		
		-- count Commedians
        local count = 0
        for i = 1, #G.jokers.cards do
            local j = G.jokers.cards[i]
            if j.config.center and j.config.center.rarity and j.config.center.rarity == "abn_SuperRare" then
                count = count + 1
            end
        end

        card.ability.extra.xmult = count * card.ability.extra.xmultadd
		
    end,
	
    calculate = function(self, card, context)
	
        if context.individual and context.cardarea == G.play then
			local currentCard = context.other_card			
			
            if currentCard and currentCard.edition and currentCard.config.center and currentCard.config.center.set and currentCard.config.center.set ~= "Enhanced" then
				return { xmult = card.ability.extra.xmult }
			end
			
			if currentCard and currentCard.config.center and currentCard.config.center.set and currentCard.config.center.set == "Enhanced" and not currentCard.edition then
				return { xmult = card.ability.extra.xmult }
			end
			
			if currentCard and currentCard.config.center and currentCard.config.center.set and currentCard.config.center.set == "Enhanced" and currentCard.edition then
				return { xmult = card.ability.extra.xmult * 2 }
			end
		end
		
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			if SMODS.pseudorandom_probability(card,'abn_creechie',1,card.ability.extra.odds) then
				SMODS.destroy_cards(card, nil, nil, true)
				G.GAME.CreechieDied = true
				return {
                    message = ("oops"),
                    colour = G.C.ATTENTION
                }
			else
                return {
                    message = localize('k_safe_ex')
                }
			end
		end
		
    end,

    abn_artist_credits = {
        artist = "Creechie",
    },
}