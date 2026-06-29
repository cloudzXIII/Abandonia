SMODS.Joker {
    key = 'luftballon_joker',
    rarity = 3,
    atlas = 'ABNJokerSheet7',
    pos = { x = 7, y = 2 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { mult_mod = 9, mult = 0, poker_hand = "abn_6oak" } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_mod, localize(card.ability.extra.poker_hand, 'poker_hands'), card.ability.extra.mult } }
    end,

    countNines = function(self, card)
        local ct = 0
        if G.playing_cards then
            for i, playing_card in ipairs(G.playing_cards) do
                if playing_card:get_id() == 9 then ct = ct + 1 end
            end
        end
        return ct
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 9 then
            local ct = self.countNines()
            card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_mod*ct)
            SMODS.calculate_effect({message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_mod*ct } },
                colour = G.C.RED,
            }, card)
        end
        if context.joker_main and context.scoring_name == card.ability.extra.poker_hand then
            local ct = 0
            for i, playing_card in ipairs(G.play.cards) do
                if playing_card:get_id() == 9 then ct = ct + 1 end
            end
            if ct == 6 then SMODS.smart_level_up_hand(nil, card.ability.extra.poker_hand, false, 9) end
			return {
                mult = card.ability.extra.mult
            }
		end

    end,

    in_pool = function(self, args)
        if G.GAME.hands["abn_6oak"] and G.GAME.hands["abn_6oak"].played > 0 then return true end
        return false
    end,

    
    
    abn_artist_credits = {
        artist = "Thebaggutegamer",
    },
}


