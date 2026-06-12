SMODS.Joker {
    key = "usury_joker",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    config = { extra = { money = 5, bankrupt_at = 10} },
    atlas = 'ABNJokerSheet15',
    pos = { x = 5, y = 2 },
    abn_coder = "LasagnaFelidae",
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money, card.ability.extra.bankrupt_at, } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.bankrupt_at
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.bankrupt_at
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.base.suit == "Clubs" or context.other_card.base.suit == "abn_Bow" or context.other_card.base.suit == "abn_Tie" then
                context.other_card:set_ability("m_lucky")
                if context.other_card.lucky_trigger then
                    ease_dollars(-card.ability.extra.money)
                end
            end
        end
    end,
    abn_artist_credits = {
        artist = "IPreferCheddar",
    },
}