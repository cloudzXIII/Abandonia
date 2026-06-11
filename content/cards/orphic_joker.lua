SMODS.Joker {
    key = 'orphic_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet16',
    pos = { x = 2, y = 1 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { mult_mod = 10, mult = 0, chips_mod = 20, chips = 0, poker_hand = "Four of a Kind" } },
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                localize(card.ability.extra.poker_hand, 'poker_hands'), 
                card.ability.extra.mult_mod,card.ability.extra.chips_mod,
                card.ability.extra.mult , card.ability.extra.chips
            } 
        }
    end,
  
    calculate = function(self, card, context)

        if context.joker_main and context.scoring_name == card.ability.extra.poker_hand then
            local has_hearts, has_clubs, has_diamonds, has_spades = false, false, false, false
            local has_penumbra, has_snow, has_ties, has_bows = false, false, false, false
            for i, playing_card in ipairs(G.play.cards) do
                if playing_card.base.suit == "Hearts" then has_hearts = true end
                if playing_card.base.suit == "Clubs" then has_clubs = true end
                if playing_card.base.suit == "Diamonds" then has_diamonds = true end
                if playing_card.base.suit == "Spades" then has_spades = true end
                if playing_card.base.suit == "abn_Penumbra" then has_penumbra = true end
                if playing_card.base.suit == "abn_Snow" then has_snow = true end
                if playing_card.base.suit == "abn_Bow" then has_bows = true end
                if playing_card.base.suit == "abn_Tie" then has_ties = true end
            end
            if has_ties and has_bows and has_snow and has_penumbra then
                for i, _card in ipairs(context.scoring_hand) do
                    local _rank = G.GAME.abn_rank_upgrades[_card.base.value]
                    update_hand_text(
                        { sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
                        { handname = _rank.name .. "s", chips = _rank.chips, mult = _rank.mult, level = _rank.level }
                    )
                    ABN.level_up_rank(_card, _card.base.value, 1)
                    update_hand_text(
                        { sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
                        { mult = 0, chips = 0, handname = "", level = "" }
                    )
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
                end
            elseif has_hearts and has_clubs and has_diamonds and has_spades then
                if ct == 6 then SMODS.smart_level_up_hand(nil, card.ability.extra.poker_hand, false, 1) end
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            end
            
			return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
		end

    end,

    in_pool = function(self, args)
        if G.GAME.hands["Four of a Kind"] and G.GAME.hands["Four of a Kind"].played > 0 then return true end
        return false
    end,

    
    
    abn_artist_credits = {
        artist = "NiceCream",
    },
}
