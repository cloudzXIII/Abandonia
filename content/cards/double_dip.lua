SMODS.Joker {
    key = 'double_dip',
    rarity = 2,
    abn_coder = "ImaginaryNeon",
    atlas = 'ABNJokerSheet22',
    pos = { x = 8, y = 2 },
    --atlas = 'jonklers',
    --pos = { x = 1, y = 0 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    demicoloncompat = true,
    config = { extra = { is_real = false } },
    loc_vars = function(self, info_queue, card)
        return { vars = { "the" } }
    end,
    calculate = function(self, card, context) --attempt to work around weird bugs with prior method that no longer are relevant (probably)
        if context.joker_main or context.forcetrigger then
            local text = context.scoring_name
            if next(SMODS.find_card("j_neonmod_flowery")) then
                return {
                    chips = math.max(G.GAME.hands[text].chips, 999),
                    mult = math.max(G.GAME.hands[text].mult, 99)
                }
            else
                return {
                    chips = G.GAME.hands[text].chips,
                    mult = G.GAME.hands[text].mult
                }
            end
        end
    end,
    abn_artist_credits = {
        artist = "Tisisrealnow",
    },
}