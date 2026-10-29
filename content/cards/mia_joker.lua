local function count_missing()
    local rank_keys = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' }
    local suit_keys = { 'Hearts', 'Diamonds', 'Clubs', 'Spades' }

    local ranks_present = {}
    local suits_present = {}
    for _, deck_card in ipairs(G.playing_cards or {}) do
        if not SMODS.has_no_rank(deck_card) then
            ranks_present[deck_card.base.value] = true
        end
        if not SMODS.has_no_suit(deck_card) then
            for _, suit in ipairs(suit_keys) do
                if deck_card:is_suit(suit, true) then suits_present[suit] = true end
            end
        end
    end

    local missing_ranks = 0
    for _, rank in ipairs(rank_keys) do
        if not ranks_present[rank] then missing_ranks = missing_ranks + 1 end
    end
    local missing_suits = 0
    for _, suit in ipairs(suit_keys) do
        if not suits_present[suit] then missing_suits = missing_suits + 1 end
    end

    return missing_ranks, missing_suits
end

SMODS.Joker {
    key = 'mia_joker',
    atlas = 'ABNJokerSheet12',
    pos = { x = 1, y = 3 },
    rarity = 2,
    cost = 8,
    blueprint_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,

    config = { extra = { chips = 8, mult = 2 } },

    loc_vars = function(self, info_queue, card)
        local missing_ranks, missing_suits = 0, 0
        if G.playing_cards then
            missing_ranks, missing_suits = count_missing()
        end
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.chips * missing_ranks,
                card.ability.extra.mult * missing_suits,
            }
        }
    end,

    in_pool = function(self)
        if not G.playing_cards then return false end
        local missing_ranks, missing_suits = count_missing()
        return missing_ranks > 0 or missing_suits > 0
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local missing_ranks, missing_suits = count_missing()
            return {
				chips = card.ability.extra.chips * missing_ranks,
                mult = card.ability.extra.mult * missing_suits,
            }
        end
    end,

    abn_artist_credits = {
		artist = "Alatr"
	},
}