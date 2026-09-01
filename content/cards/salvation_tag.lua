local original_add_tag = add_tag
function add_tag(tag, immediate)

	if next(SMODS.find_card('j_abn_salvation_tag')) then
		-- Check if this tag hasn't already been converted to avoid infinite loops
		if not tag._hazard_checked and tag.key then
			tag._hazard_checked = true
        
			local base_id = tag.key:gsub("^tag_", ""):gsub("^abn_", "")
			local hazard_key = "tag_abn_hazard_" .. base_id

			-- Check if the hazard variant exists
			if SMODS.Tags[hazard_key] then
				tag = Tag(hazard_key)
				tag._hazard_checked = true
			end
		end
	end

    original_add_tag(tag, immediate)
end

SMODS.Joker {
    key = 'salvation_tag',
    rarity = 2,
    cost = 6,
    atlas = 'ABNJokerSheet24', 
    pos = { x = 8, y = 3 },
    blueprint_compat = true,
    perishable_compat = false,

    abn_artist_credits = {
        artist = "Patitofi8",
    },
}