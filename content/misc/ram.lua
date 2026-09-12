SMODS.ConsumableType {
  key = "ram",
  primary_colour = HEX("0da451"),
  secondary_colour = HEX("0da451"),
  text_colour = HEX("d3af37"),
  collection_rows = { 6, 6 },
  shop_rate = 0,
}

local smu = set_consumeable_usage
set_consumeable_usage = function(card)
	local ret = smu(card)

	if card and card.config and card.config.center and card.config.center.mod then
		if card.config.center.key and card.config.center.key ~= 'c_abn_ram_00' then
			G.E_MANAGER:add_event(Event({
				trigger = 'immediate',
				func = function()
					G.E_MANAGER:add_event(Event({
						trigger = 'immediate',
						func = function()
							G.GAME.last_modded = card.config.center_key
							return true
						end
					}))
					return true
				end
			}))
		end
	end

	return ret
end

SMODS.Consumable {
    key = "ram_00",
    set = 'ram',
    cost = 4,
    atlas = "abn_AbandoniaRam",
    pos = { x = 0, y = 0 },

    loc_vars = function(self, info_queue, card)
        local last_key = G.GAME and G.GAME.last_modded
        local modded_card = last_key and G.P_CENTERS[last_key] or nil

        if modded_card then
            info_queue[#info_queue + 1] = modded_card
        end

        return {
            main_end = {
                {
                    n = G.UIT.C,
                    config = { align = "bm", padding = 0.02 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { 
                                align = "m", 
                                colour = (not modded_card and G.C.RED or G.C.GREEN), 
                                r = 0.05, 
                                padding = 0.05 
                            },
                            nodes = {
                                { 
                                    n = G.UIT.T, 
                                    config = { 
                                        text = ' ' .. (modded_card and localize{type = 'name_text', key = modded_card.key, set = modded_card.set} or localize('k_none')) .. ' ', 
                                        colour = G.C.UI.TEXT_LIGHT, 
                                        scale = 0.3, 
                                        shadow = true 
                                    } 
                                },
                            }
                        }
                    }
                }
            }
        }
    end,

    in_pool = function(self, args)
        return G.GAME and G.GAME.last_modded ~= nil
    end,

    can_use = function(self, card)
        return #G.consumeables.cards <= G.consumeables.config.card_limit and G.GAME and G.GAME.last_modded ~= nil
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                if #G.consumeables.cards < G.consumeables.config.card_limit then
                    play_sound('timpani')
                    local card_type = G.P_CENTERS[G.GAME.last_modded].set
                    local new_card = create_card(card_type, G.consumeables, nil, nil, nil, nil, G.GAME.last_modded, 'ram00')
                    new_card:add_to_deck()
                    G.consumeables:emplace(new_card)
                    card:juice_up(0.3, 0.5)
                end
                return true
            end
        }))
        delay(0.6)
    end,

    abn_artist_credits = {
        artist = "GM36"
    },
}

SMODS.Consumable {
    key = "ram_01",
    set = 'ram',
    cost = 4,
    atlas = "abn_AbandoniaRam",
    pos = { x = 1, y = 0 },


    can_use = function(self, card)
        if not G.consumeables or not G.consumeables.cards then return false end
        for _, c in ipairs(G.consumeables.cards) do
            if c ~= card and c.config and c.config.center and not c.config.center.mod then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        local modded_centers = {}
        for key, center in pairs(G.P_CENTERS) do
            if center.mod and center.consumeable and center.set and center.set ~= 'ram' then
                table.insert(modded_centers, center)
            end
        end

        if #modded_centers == 0 then return end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                
                local to_replace = {}
                for _, c in ipairs(G.consumeables.cards) do
                    if c ~= card and c.config and c.config.center and not c.config.center.mod then
                        table.insert(to_replace, c)
                    end
                end
                for _, target in ipairs(to_replace) do
                    target:juice_up(0.3, 0.3)
                    local chosen_center = pseudorandom_element(modded_centers, pseudoseed('ram01'))
                    local new_card = create_card(chosen_center.set, G.consumeables, nil, nil, nil, nil, chosen_center.key, 'ram01')
                    new_card:add_to_deck()
                    G.consumeables:emplace(new_card)
                    target:start_dissolve()
                end

                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,

    abn_artist_credits = {
        artist = "GM36"
    },
}