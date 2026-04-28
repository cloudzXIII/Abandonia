local config = SMODS.current_mod.config

SMODS.Sound({
    key = 'music_backrooms',
    path = 'music_backrooms.ogg',
	pitch = 1,
	speed = 1,
    select_music_track = function(self)
        -- If it's backrooms time play music
        if G.jokers then
			for i = 1, #G.jokers.cards do
				local j = G.jokers.cards[i]
				if j.config.center.key and j.config.center.key == 'j_abn_backrooms_joker' and config.Music ~= false then
					return 1e10
				end
			end
		end
    end
})

SMODS.Joker {
    key = 'backrooms_joker',
    rarity = 3,
    atlas = 'AbandoniaJokers',
    pos = { x = 3, y = 18 },
    cost = 10,
    discovered = false,
    blueprint_compat = true, 
    
    config = { extra = { xmult = 1.5, } },
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
		card:add_sticker("abn_violet", true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { 
            card.ability.extra.xmult, 
        } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			if #G.jokers.cards < G.jokers.config.card_limit then
				local new_card = SMODS.add_card({ 
                    set = 'Joker', 
                    rarity = "abn_ParallelRare" 
                })
                
                -- Apply stickers to the new card
                new_card:set_perishable(true)
                new_card:set_rental(true)
			end
		end
		
		-- if edition parallel rare give xmult
		if context.other_joker and context.other_joker:is_rarity("abn_ParallelRare") and card.edition then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,

    abn_artist_credits = {
        artist = "BrownieBread",
    },
}