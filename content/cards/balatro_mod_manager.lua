-- Balatro Mod Manager (code by Noodlemire)

--[[
When Boss Blind is defeated,
each Joker gains a random Enhancement

Whenever a Joker changes
Enhancement, it gains
+1 Ascension Power
--]]

SMODS.Joker{
	key = "balatro_mod_manager",
	atlas = "ABNJokerSheet8",
	rarity = 3,
	cost = 10,
	pos = {x = 7, y = 0},
	pixel_size = {h = 71},
	blueprint_compat = true,
	config = {extra = {asc_gain = 1}},
	loc_vars = function(self, info_queue, joker)
		return {vars = {joker.ability.extra.asc_gain}}
	end,
	calculate = function(self, joker, context)
		if context.round_eval and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then
			for _, area in ipairs(SMODS.get_card_areas("jokers")) do
				for __, other in ipairs(area.cards) do
					if other.ability and other.ability.set == "Joker" then
						local pool = {}
						for _, key in ipairs(ABN.EnhStickerPool) do
							if not other.ability[key] then
								table.insert(pool, key)
							end
						end
						local enh_sticker = SMODS.poll_object({pool = pool, seed = "j_abn_balatro_mod_manager"})
						if enh_sticker then
							other:add_sticker(enh_sticker, true)
						end
					end
				end
			end
			return {message = localize("k_abn_enhanced_ex")}
		elseif context.abn_joker_enhanced and context.previous_enhancement then --See content/misc/stickers_enhancements.lua for this context's origin
			context.card.ability.abn_perma_asc = (context.card.ability.abn_perma_asc or 0) + joker.ability.extra.asc_gain
			return {
				message = localize({type = "variable", key = "a_asc", vars = {joker.ability.extra.asc_gain}}),
				message_card = context.card
			}
		end
	end,
	abn_artist_credits = {
		artist = "DrSmey"
	},
}
