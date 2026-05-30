SMODS.Joker {
    key = 'wet_joker',
    abn_coder = "LasagnaFelidae",
    rarity = 2,
    atlas = 'ABNJokerSheet4',
    pos = { x = 8, y = 5 },
    cost = 6,
    discovered = false,
    blueprint_compat = false,
    abn_artist_credits = {
        artist = "Inky",
    },
    in_pool = function(self)
        return (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.weather_report or 0) > 0
    end
}
