local updateref = Card.update
function Card:update(dt)
	local ref = updateref(self, dt)

	if not self.config or not self.ability or self.ability.set ~= 'Enhanced' then
		return ref
	end

	if not (self.config.center and self.config.center.mod) then
		return ref
	end

	local in_valid_area = (self.area == G.hand or self.area == G.play)
		or (self.states and self.states.drag and self.states.drag.is)
		or (G.hand and self.parent == G.hand)
		or (G.play and self.parent == G.play)

	local amplifier_count = in_valid_area and #SMODS.find_card("j_abn_amplifier") or 0

	local is_modded_suit = false
	if amplifier_count > 0 then
		local base_suits = { Spades = true, Hearts = true, Clubs = true, Diamonds = true }
		for suit_key, _ in pairs(SMODS.Suits) do
			if not base_suits[suit_key] and self:is_suit(suit_key) then
				is_modded_suit = true
				break
			end
		end
	end

	local base_boost_per_joker = is_modded_suit and 1.0 or 0.5
	local target_factor = 1 + (base_boost_per_joker * amplifier_count)

	self.ability.amplifier_applied = self.ability.amplifier_applied or { factor = 1 }
	local prev_factor = self.ability.amplifier_applied.factor or 1
	local diff = target_factor / prev_factor

	if diff ~= 1 then
		local function get_stat_mode(key_str)
			local k = tostring(key_str):lower()

			if k:find("^x_?mult$") or k:find("^x_?chips$") then
				return "multiplicative"
			end

			if k:find("mult") or k:find("chips") or k == "bonus" then
				return "additive"
			end

			return nil
		end

		local function scale_tbl(tbl, ratio)
			if type(tbl) ~= "table" then return end
			for k, v in pairs(tbl) do
				if type(v) == "number" then
					local mode = get_stat_mode(k)

					if mode == "multiplicative" and v > 1 then
						tbl[k] = 1 + ((v - 1) * ratio)

					elseif mode == "additive" and v > 0 then
						tbl[k] = v * ratio
					end
				end
			end
		end

		scale_tbl(self.ability, diff)

		if type(self.ability.extra) == "table" then
			scale_tbl(self.ability.extra, diff)
		end

		self.ability.amplifier_applied.factor = target_factor
	end

	return ref
end

SMODS.Joker {
	key = 'amplifier',
	rarity = 3, 
	cost = 8,
	atlas = 'ABNJokerSheet18',
	pos = { x = 5, y = 3 },
	blueprint_compat = false,
	discovered = false,
	
	in_pool = function(self, args)
		if G.playing_cards then
			for _, card in ipairs(G.playing_cards) do
				if card.ability and card.ability.set == 'Enhanced' and card.config and card.config.center and card.config.center.mod then
					return true
				end
			end
		end
		return false
	end,

	abn_artist_credits = {
		artist = "Cosine Rave",
	},
}