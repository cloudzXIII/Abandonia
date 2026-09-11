-- Coded by Okronix
SMODS.Joker {
    key = 'cloten',
    rarity = 4,
    atlas = 'AbandoniaLegendary2',
    pos = { x = 0, y = 1 },
    soul_pos = { x = 1, y = 1 },
    cost = 20,
    discovered = false,
    blueprint_compat = true,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, "m_bonus") then
                return {
                    xchips = context.other_card:get_id(),
					repetitions = 1,
                }
            end
        end
    end,

    abn_artist_credits = {
        artist = "Mini Bit",
    },
}