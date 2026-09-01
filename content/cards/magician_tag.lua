SMODS.Joker {
    key = 'magician_tag',
    rarity = 2,
    cost = 6,
    atlas = 'ABNJokerSheet24', 
    pos = { x = 6, y = 3 },
    blueprint_compat = true,
    perishable_compat = false,

    calculate = function(self, card, context)
        if context.reroll_shop and #G.GAME.tags > 0 then
            local tag_count = #G.GAME.tags

            for i = #G.GAME.tags, 1, -1 do
                G.GAME.tags[i]:remove()
            end

            for i = 1, tag_count do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local tag_key = get_next_tag_key(self.key)
                        add_tag(Tag(tag_key))
                        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end
                }))
            end
        end
    end,

    abn_artist_credits = {
        artist = "Patitofi8",
    },
}