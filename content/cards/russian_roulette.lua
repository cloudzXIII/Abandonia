local add_to_deckref = Card.add_to_deck

function Card.add_to_deck(self, from_debuff)
  if not self.added_to_deck then
    if not from_debuff then
      if self.ability and self.ability.set == "Joker" then
        if next(SMODS.find_card("j_abn_russian_roulette")) then
			self:add_sticker("abn_fragile", true)
        end
      end
    end
  end

  return add_to_deckref(self, from_debuff)
end

local old_use_consumeable = Card.use_consumeable

function Card:use_consumeable(area, copier)
    local roulette_cards = SMODS.find_card("j_abn_russian_roulette")
    
    if #roulette_cards > 0 then
        local roulette = roulette_cards[1]
        local odds = (roulette.ability and roulette.ability.extra and roulette.ability.extra.odds) or 6
        
        if pseudorandom('russian_roulette_consumeable') >= G.GAME.probabilities.normal / odds then

            stop_use()
            if not copier then set_consumeable_usage(self) end

            card_eval_status_text(roulette, 'extra', nil, nil, nil, {
                message = "Better luck next time!",
                colour = G.C.RED
            })
            roulette:juice_up(0.4, 0.4)
            return nil
        else
			ease_dollars(roulette.ability.extra.dollars)
            card_eval_status_text(roulette, 'extra', nil, nil, nil, {
                message = "Lady luck on your side!",
                colour = G.C.GREEN
            })
            roulette:juice_up(0.4, 0.4)
        end
    end

    return old_use_consumeable(self, area, copier)
end



SMODS.Joker {
    key = 'russian_roulette',
    rarity = 2,
    cost = 6,
    atlas = 'ABNJokerSheet24', 
    pos = { x = 6, y = 4 },
    blueprint_compat = true,
    perishable_compat = false,
    config = {
        extra = {
            odds = 6,
			dollars = 5,
        }
    },
    
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "abn_fragile", set = "Other", vars = { 1, 4 } }
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return { vars = { numerator, denominator, card.ability.extra.dollars } }
    end,
    
    update = function(self, card)
        if card.area == G.jokers and G.STATE == G.STATES.SHOP then
            if G.shop_booster and G.shop_booster.cards then
                for _, shop_card in ipairs(G.shop_booster.cards) do
                    shop_card.cost = 1
                end
            end

            if G.shop_jokers and G.shop_jokers.cards then
                for _, shop_card in ipairs(G.shop_jokers.cards) do
                    if shop_card.config and shop_card.config.center and shop_card.config.center.set == 'Joker' then
                        shop_card.cost = 1
                    end
                end
            end
        end
    end,
	
	calculate = function(self, card, context)
        if context.open_booster then
            return {
                message = "Click...",
            }
        end
    end,

    abn_artist_credits = {
        artist = "Cubegetsreal",
    },
}