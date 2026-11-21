
local function abn_planet_edition_loc_vars(edition_key, card)
    return ABN.planet_edition_loc_vars(edition_key, card)
end

local old_set_cost = Card.set_cost
function Card:set_cost()
    old_set_cost(self)
    if self.edition then
        if self.edition.key == "e_abn_chthonian" then
            self.cost = self.cost * 2
            self.sell_cost = self.sell_cost * 2
        elseif self.edition.key == "e_abn_reversal" then
            self.cost = -self.cost
            self.sell_cost = -self.sell_cost
        end
    end
end

SMODS.Shader {
    key = 'chthonian',
    path = 'chthonian.fs',
}

SMODS.Edition {
    key = 'abn_chthonian',
    shader = "chthonian",
    discovered = true,
    config = { percent = 1.05 },
    in_shop = true,
    weight = 1.2,
    loc_vars = function(self, info_queue, card)
        local planet_vars = abn_planet_edition_loc_vars('e_abn_chthonian', card)
        if planet_vars then return planet_vars end

        return { vars = { card.edition.percent } }
    end,
    calculate = function(self, card, context)
    end,
    on_apply = function(card)
        Spectrallib.manipulate(card, {type = "X", value = 2})
        if G.GAME.abn then
            G.GAME.abn.cthonian = true
        end
    end,
    on_remove = function(card)
        Spectrallib.manipulate(card, {type = "X", value = 0.5})
    end,
    abn_artist_credits = {
        artist = "Bro-Fly"
    },
}

SMODS.Shader {
    key = 'iridescent',
    path = 'iridescent.fs',
}

SMODS.Edition {
    key = 'abn_iridescent',
    shader = "iridescent",
    discovered = true,
    config = { x_mult = 2, dollars = 3, },
    in_shop = true,
    weight = 0.2,
    extra_cost = 8,
    loc_vars = function(self, info_queue, card)
        local planet_vars = abn_planet_edition_loc_vars('e_abn_iridescent', card)
        if planet_vars then return planet_vars end

        return { vars = { card.edition.x_mult, card.edition.dollars } }
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_mult = card.edition.x_mult,
                dollars = card.edition.dollars
            }
        end
    end,
    on_apply = function(card)
    end,
    abn_artist_credits = {
        artist = "Bro-Fly"
    },
}

SMODS.Shader {
    key = 'abandond',
    path = 'abandond.fs',
}

SMODS.Edition {
    key = 'abn_abandond',
    shader = "abandond",
    discovered = true,
    config = { repetitions = 1, dollars = 3 },
    in_shop = true,
    weight = 1.7,
    extra_cost = -1,
    loc_vars = function(self, info_queue, card)
        local planet_vars = abn_planet_edition_loc_vars('e_abn_abandond', card)
        if planet_vars then return planet_vars end

        return { vars = { card.edition.repetitions, card.edition.dollars } }
    end,
    calculate = function(self, card, context)
        if ((context.repetition and context.cardarea == G.play) or context.retrigger_joker_check) and context.other_card == card then
            ease_dollars(-card.edition.dollars)
            return {
                repetitions = card.edition.repetitions
            }
        end
    end,
    abn_artist_credits = {
        artist = "Bro-Fly"
    },
}

SMODS.Shader {
    key = 'sunscourge',
    path = 'sunscourge.fs',
}

SMODS.Edition {
    key = 'abn_sunscourge',
    shader = "sunscourge",
    discovered = true,
    config = { chips = 2, mult = 2, multiplier = 2 },
    in_shop = true,
    weight = 0.2,
    extra_cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.chips, card.edition.mult } }
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                chips = card.edition.chips,
                mult = card.edition.mult
            }
        end
        if context.after and context.main_eval and not context.blueprint and SMODS.last_hand_oneshot then
            SMODS.scale_card(card, {
                ref_table = card.edition,
                ref_value = "chips",
                scalar_value = "multiplier",
                operation = 'X',
                no_message = true
            })
            SMODS.scale_card(card, {
                ref_table = card.edition,
                ref_value = "mult",
                scalar_value = "multiplier",
                operation = 'X',
                scaling_message = {
                    message = localize("k_abn_oneshot"),
                    colour = G.C.FILTER
                }
            })
        end
    end,
    abn_artist_credits = {
        artist = "Bro-Fly"
    },
}

SMODS.Shader {
    key = 'gloss',
    path = 'gloss.fs',
}

SMODS.Edition {
    key = 'abn_gloss',
    shader = "gloss",
    discovered = true,
    config = { x_chips = 2, dollars = 5, },
    in_shop = true,
    weight = 1,
    extra_cost = 6,
    loc_vars = function(self, info_queue, card)
        local planet_vars = abn_planet_edition_loc_vars('e_abn_gloss', card)
        if planet_vars then return planet_vars end

        return { vars = { card.edition.x_chips, card.edition.dollars } }
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_chips = card.edition.x_chips,
                dollars = card.edition.dollars
            }
        end
    end,
    abn_artist_credits = {
        artist = "Bro-Fly"
    },
}

SMODS.Shader {
    key = 'pearlescent',
    path = 'pearlescent.fs',
}

SMODS.Edition {
    key = 'abn_pearlescent',
    shader = "pearlescent",
    discovered = true,
    config = { chips = 100, mult = 20, },
    in_shop = true,
    weight = 0.4,
    extra_cost = 7,
    loc_vars = function(self, info_queue, card)
        local planet_vars = abn_planet_edition_loc_vars('e_abn_pearlescent', card)
        if planet_vars then return planet_vars end

        return { vars = { card.edition.mult, card.edition.chips } }
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                chips = card.edition.chips,
                mult = card.edition.mult
            }
        end
    end,
    abn_artist_credits = {
        artist = "Bro-Fly"
    },
}

-- New editions

SMODS.Shader {
    key = 'chromatic',
    path = 'chromatic.fs',
}

SMODS.Edition {
    key = 'abn_chromatic',
    shader = "chromatic",
    discovered = true,
    config = { x_mult = 1.3, dollars = 4, x_chips = 1.5 },
    in_shop = true,
    weight = 0.01,
    extra_cost = 10,
    loc_vars = function(self, info_queue, card)
        local planet_vars = abn_planet_edition_loc_vars('e_abn_chromatic', card)
        if planet_vars then return planet_vars end

        return { vars = { card.edition.x_chips, card.edition.x_mult, card.edition.dollars } }
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_chips = card.edition.x_chips,
                x_mult = card.edition.x_mult,
                dollars = card.edition.dollars
            }
        end
    end,
    abn_artist_credits = {
        artist = "Bro-Fly"
    },
}

SMODS.Shader {
    key = 'flash',
    path = 'flash.fs',
}

SMODS.Edition {
    key = 'abn_reversal',
    shader = "flash",
    discovered = true,
    config = {},
    in_shop = true,
    weight = 1.3,
    loc_vars = function(self, info_queue, card)
        local planet_vars = abn_planet_edition_loc_vars('e_abn_reversal', card)
        if planet_vars then return planet_vars end

        return { vars = {} }
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                message = localize('k_swapped_ex'),
                swap = true
            }
        end
    end,
    abn_artist_credits = {
        artist = "Bro-Fly"
    },
}

SMODS.Shader {
    key = 'exs',
    path = 'exs.fs',
}

SMODS.Edition {
    key = 'abn_bit_rot',
    shader = "exs",
    discovered = true,
    config = { emult = 1.3 },
    in_shop = true,
    weight = 0.01,
    extra_cost = 1.2,
    loc_vars = function(self, info_queue, card)
        local planet_vars = abn_planet_edition_loc_vars('e_abn_bit_rot', card)
        if planet_vars then return planet_vars end

        return { vars = { card.edition.emult } }
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                emult = card.edition.emult
            }
        end
    end,
    abn_artist_credits = {
        artist = "Bro-Fly"
    },
    in_pool = function(self)
        return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
    end,
}

SMODS.Shader {
    key = 'cam',
    path = 'cam.fs',
}

SMODS.Edition {
    key = 'abn_reel',
    shader = "cam",
    discovered = true,
    config = { echips = 1.2 },
    in_shop = true,
    weight = 0.01,
    extra_cost = 1.6,
    loc_vars = function(self, info_queue, card)
        local planet_vars = abn_planet_edition_loc_vars('e_abn_reel', card)
        if planet_vars then return planet_vars end

        return { vars = { card.edition.echips } }
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                echips = card.edition.echips
            }
        end
    end,
    abn_artist_credits = {
        artist = "Bro-Fly"
    },
    in_pool = function(self)
        return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
    end,
}

SMODS.Shader {
    key = 'orange',
    path = 'orange.fs',
}

SMODS.Edition {
    key = 'abn_collodion',
    shader = "orange",
    discovered = true,
    config = { percent = 20 },
    in_shop = true,
    weight = 1.5,
    extra_cost = 2,
    loc_vars = function(self, info_queue, card)
        local planet_vars = abn_planet_edition_loc_vars('e_abn_collodion', card)
        if planet_vars then return planet_vars end

        return { vars = { card.edition.percent } }
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                abn_balance_percent = card.edition.percent
            }
        end
    end,
    abn_artist_credits = {
        artist = "Bro-Fly"
    },
    in_pool = function(self)
        return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
    end,
}

SMODS.Shader {
    key = 'plata',
    path = 'plata.fs',
}

SMODS.Edition {
    key = 'abn_vintage',
    shader = "plata",
    discovered = true,
    config = { chips = 2, mult = 1, dollars = 1 },
    in_shop = true,
    weight = 1.2,
    extra_cost = 4,
    loc_vars = function(self, info_queue, card)
        local planet_vars = abn_planet_edition_loc_vars('e_abn_vintage', card)
        if planet_vars then return planet_vars end

        return { vars = { card.edition.chips, card.edition.mult, card.edition.dollars } }
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            local level = G.GAME.hands[context.scoring_name].level
            return {
                chips = card.edition.chips * level,
                mult = card.edition.mult * level,
                dollars = card.edition.dollars * level
            }
        end
    end,
    abn_artist_credits = {
        artist = "Bro-Fly"
    },
    in_pool = function(self)
        return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
    end,
}

SMODS.Shader {
    key = 'white',
    path = 'white.fs',
}

SMODS.Edition {
    key = 'abn_bright',
    shader = "white",
    discovered = true,
    config = { chips = 20, mult = 8 },
    in_shop = true,
    weight = 1.1,
    extra_cost = 1,

    loc_vars = function(self, info_queue, card)
        local planet_vars = abn_planet_edition_loc_vars('e_abn_bright', card)
        if planet_vars then return planet_vars end

        if card and card.edition then
            return { vars = { card.edition.chips, card.edition.mult } }
        end
        return { vars = { self.config.chips, self.config.mult } }
    end,

    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            local scaling_factor = 0

            for i = 1, #context.scoring_hand do
                local scoring_card = context.scoring_hand[i]

                if ABN.is_light(scoring_card) and not SMODS.has_no_rank(scoring_card) then
                    local rank_key = scoring_card.base.value
                    local rank_data = G.GAME.abn_rank_upgrades[rank_key]

                    if rank_data and rank_data.level and rank_data.level > 1 then
                        scaling_factor = scaling_factor + rank_data.level
                    end
                end
            end

            if scaling_factor > 0 then
                return {
                    chips = (card.edition.chips or self.config.chips) * scaling_factor,
                    mult = (card.edition.mult or self.config.mult) * scaling_factor,
                    card = card
                }
            end
        end
    end,

    abn_artist_credits = {
        artist = "Bro-Fly"
    },
}

SMODS.Shader {
    key = 'balablack',
    path = 'balablack.fs',
}

SMODS.Edition {
    key = 'abn_opaque',
    shader = "balablack",
    discovered = true,
    config = { chips = 20, mult = 8 },
    in_shop = true,
    weight = 1.1,
    extra_cost = 1,

    loc_vars = function(self, info_queue, card)
        local planet_vars = abn_planet_edition_loc_vars('e_abn_opaque', card)
        if planet_vars then return planet_vars end

        if card and card.edition then
            return { vars = { card.edition.chips, card.edition.mult } }
        end
        return { vars = { self.config.chips, self.config.mult } }
    end,

    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            local scaling_factor = 0

            for i = 1, #context.scoring_hand do
                local scoring_card = context.scoring_hand[i]

                if ABN.is_dark(scoring_card) and not SMODS.has_no_rank(scoring_card) then
                    local rank_key = scoring_card.base.value
                    local rank_data = G.GAME.abn_rank_upgrades[rank_key]

                    if rank_data and rank_data.level and rank_data.level > 1 then
                        scaling_factor = scaling_factor + rank_data.level
                    end
                end
            end

            if scaling_factor > 0 then
                return {
                    chips = (card.edition.chips or self.config.chips) * scaling_factor,
                    mult = (card.edition.mult or self.config.mult) * scaling_factor,
                    card = card
                }
            end
        end
    end,

    abn_artist_credits = {
        artist = "Bro-Fly"
    },
}

-- Vanilla Negative Planet tooltip.
-- Keep the regular Negative tooltip for all non-Planet cards
-- and when Rudimentary Joker is not owned.
SMODS.Edition:take_ownership('negative', {
    loc_vars = function(self, info_queue, card)
        if ABN.has_planet_transfer() and card and card.ability and card.ability.set == 'Planet' then
            return {
                key = card.ability.rank and 'e_negative_rank_planet' or 'e_negative_planet',
                vars = { 100 }
            }
        end

        return { vars = {card.edition.card_limit} }
    end
}, true)

SMODS.Shader({key = 'glitter', path = 'glitter.fs'})
SMODS.Shader({key = 'sparkling', path = 'sparkling.fs'})
SMODS.Shader({key = 'ultraviolet', path = 'ultraviolet.fs'})
SMODS.Shader({key = 'rgb', path = 'rgb.fs'})
SMODS.Shader({key = 'fragmented', path = 'fragmented.fs'})

SMODS.Edition {
    key = 'rgb',
    shader = 'rgb',
    in_shop = true,
    weight = 1.3,
    extra_cost = 5,
    calculate = function(self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
			local h = G.GAME.hands[context.scoring_name]
        	return {
				xmult = h.mult,
				xchips = h.chips
			}
		end
	end
}

SMODS.Sound({
	key = "ultraviolet",
	path = "ultraviolet.ogg",
})

SMODS.Edition {
    key = 'ultraviolet',
    shader = 'ultraviolet',
    in_shop = true,
    weight = 1.1,
    extra_cost = 6,
	sound = {sound = "abn_ultraviolet", percent = 0.6, volume = 1},
    calculate = function(self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            local default = G.GAME.hands["High Card"].level
			for k, v in pairs(G.GAME.hands) do
				if SMODS.is_poker_hand_visible(k) and v.level ~= default then
					default = nil
					break
				end
			end
			local h = G.GAME.hands[default and "Flush" or ABN.highest_level_hand()]
        	return {
				mult = h.mult,
				chips = h.chips
			}
		end
	end
}

local function fragment_card(card, effect, context)
	local c, m = false, false
	if card.ability and card.ability.set == "Joker" then
		if card == ABN.get_leftmost_joker() then
			c = true
		end
		if card == ABN.get_rightmost_joker() then
			m = true
		end
	elseif card.playing_card and context.scoring_hand then
		if card == context.scoring_hand[1] then
			c = true
		end
		if card == context.scoring_hand[#context.scoring_hand] then
			m = true
		end
	elseif card.area then
		if card == card.area.cards[1] then
			c = true
		end
		if card == card.area.cards[#card.area.cards] then
			m = true
		end
	end
	if not c and not m then return end
	local ret_num_cache = {}
	for k, v in pairs(effect) do
		if (c and ABN.chips_to_mult[k]) or (m and ABN.mult_to_chips[k]) then
			ret_num_cache[k] = tostring(v):gsub("%.", "%%.")
			effect[k] = v * (100 + card.edition.pchips) / 100
		end
	end
	if effect.message then
		for k, v in pairs(ret_num_cache) do
			effect.message = effect.message:gsub(v, tostring(effect[k]))
		end
	end
end

local old_eval_card = eval_card
function eval_card(card, context)
    local ret, post = old_eval_card(card, context)
	if card and card.edition and card.edition.key == "e_abn_fragmented" then
		for cat, effect in pairs(ret or {}) do
			if cat ~= "jokers" and cat ~= "retriggers" then
				fragment_card(card, effect, context)
			end
		end
	end
    return ret, post
end

SMODS.Sound({
	key = "fragmented",
	path = "fragmented.ogg",
})

SMODS.Edition {
    key = 'fragmented',
    shader = 'fragmented',
    in_shop = true,
    weight = 1.2,
    extra_cost = 4,
	sound = {sound = "abn_fragmented", percent = 1, volume = 1},
	config = { pchips = 20, pmult = 20 },
    loc_vars = function(self, info_queue, card)
        local cfg = card and card.edition or self.config
		local ret = {vars = {cfg.pchips, cfg.pmult}}
		if card and card.playing_card then
			ret.key = self.key.."_pc"
		elseif card and card.ability and card.ability.set == "Joker" then
			ret.key = self.key.."_joker"
		end
		return ret
    end,
    calculate = function(self, card, context)
		if context.abn_alter_effect and (not card.playing_card and (context.card == card or context.abn_alter_effect.card == card or context.abn_alter_effect.juice_card == card)) then
			fragment_card(card, context.abn_alter_effect, context)
		end
	end
}

SMODS.Edition {
    key = 'sparkling',
    shader = 'sparkling',
    in_shop = true,
    weight = 1.5,
    extra_cost = 4,
	config = { mult = 20 },
    loc_vars = function(self, info_queue, card)
        local cfg = card and card.edition or self.config
		return {vars = {cfg.mult}}
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
			local count = 0
			local _, _, hands = G.FUNCS.get_poker_hand_info(#G.play.cards > 0 and G.play.cards or G.hand.highlighted)
			for _, h in pairs(hands) do
				if next(h) then
					count = count + 1
				end
			end
        	return {mult = card.edition.mult * count}
		end
	end
}

SMODS.Sound({
	key = "glitter",
	path = "glitter.ogg",
})

SMODS.Edition {
    key = 'glitter',
    shader = 'glitter',
    in_shop = true,
    weight = 1.7,
    extra_cost = 2,
	sound = {sound = "abn_glitter", percent = 1, volume = 1},
	config = { score_mult = 100 },
    loc_vars = function(self, info_queue, card)
        local cfg = card and card.edition or self.config
		return {vars = {cfg.score_mult}}
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
			local h = G.GAME.hands[context.scoring_name]
        	return {score = (h.mult + h.chips) * card.edition.score_mult}
		end
	end
}

SMODS.Shader({key = 'bunnet_heat', path = 'bunnet_heat.fs'})

SMODS.Edition {
    key = 'thermal',
    shader = 'bunnet_heat',
    in_shop = true,
    weight = 0.5,
    extra_cost = 7,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
			local h = G.GAME.hands[context.scoring_name]
			local l = math.floor(h.level)
			if l <= 0 then return end
			if l == 1 then
				for i = 1, 2 do
					SMODS.calculate_effect({
						message = localize("k_level_prefix")..' 1',
					}, card)
					SMODS.calculate_effect({
						mult = h.mult,
						chips = h.chips
					}, card, true)
				end
			elseif l <= 6 then
				local _h = SMODS.PokerHands[context.scoring_name]
				local i = 0
				while i < l do
					SMODS.calculate_effect({
						message = localize("k_level_prefix")..' '..(i+1),
					}, card)
					SMODS.calculate_effect({
						mult = _h.mult + _h.l_mult*i,
						chips = _h.chips + _h.l_chips*i,
					}, card, true)
					i = i + 1
				end
			else
				local _h = SMODS.PokerHands[context.scoring_name]
				local c, m, i = 0, 0, 0
				while i < l do
					c = c + _h.chips + _h.l_chips*i
					m = m + _h.mult + _h.l_mult*i
					i = i + 1
				end
				SMODS.calculate_effect({
					mult = m,
					chips = c,
				}, card, true)
			end
		end
	end
}
