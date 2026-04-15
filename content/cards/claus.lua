
SMODS.Joker{
    key = 'claus',
    loc_txt = {
        ['en-us'] = {
			unlock = {
				"?????",
			},
        }
    },
    atlas = 'AbandoniaJokers',
    pos = { x = 7, y = 33 },
    soul_pos = { x = 8, y = 33 },
    cost = 20,
    config = {
        extra = { dollars = 2 } 
    },
    rarity = 4,
    blueprint_compat = true,
	unlocked = false,
	
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
            }
        }
    end,
	
	add_to_deck = function(self, card)
        unlock_card(self)
    end,

    calculate = function(self, card, context)
        -- Check if the Blind effect is starting
        if context.setting_blind then
			ease_dollars(card.ability.extra.dollars)
        end
    end
}