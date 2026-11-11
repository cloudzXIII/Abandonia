SMODS.Joker {
  key = 'chips_to_mult', -- Mult Matthew
  rarity = 3,
  abn_coder = "ImaginaryNeon",
  atlas = 'ABNJokerSheet23',
  pos = { x = 0, y = 0 },
  cost = 8,
  discovered = false,
  blueprint_compat = false,
  demicoloncompat = false,
  config = { extra = { mult = 1.1 } },
  loc_vars = function(self, info_queue, card)
	if not card.ability.abn_stk_mult then
	  info_queue[#info_queue + 1] = {key = "abn_stk_mult", set = "Other", vars = ABN.enh_stickers_vars.abn_stk_mult}
	end
    return { vars = { card.ability.extra.mult } }
  end,
  calculate = function(self, card, context)
    if context.post_trigger and not context.blueprint then
      local other_ret = context.other_ret.jokers or {}
      local new_ret = {}
      local ret_num_cache = {}
      for k, v in pairs(other_ret) do
		if ABN.chips_to_mult[k] then
          ret_num_cache[ABN.chips_to_mult[k]] = tostring(v):gsub("%.", "%%.")
		  new_ret[ABN.chips_to_mult[k]] = v * (card.ability.abn_stk_mult and card.ability.extra.mult or 1)
		end
      end
      if other_ret.message then
        new_ret.message = other_ret.message
		new_ret.message = new_ret.message:gsub("Chips", "Mult")
		new_ret.message = new_ret.message:gsub("chips", "mult")
        for k, v in pairs(ret_num_cache) do
          --Really, gsub, really? You really can't just auto-convert
          --a number as the replacement text to a string yourself?
          --Is that REALLY worth crashing over?
          --smh
		  new_ret.message = new_ret.message:gsub(v, tostring(new_ret[k]))
        end
      end
      if next(new_ret) then
        new_ret.message_card = card
        return new_ret
      end
    end
  end,
  abn_artist_credits = {
    artist = "GM36",
  }
}
