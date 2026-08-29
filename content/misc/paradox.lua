loc_colour()
G.C.PARADOX = HEX("1bab90")
G.C.PARADOX_SECONDARY = HEX("983933")
G.ARGS.LOC_COLOURS["abn_Paradox"] = G.C.PARADOX

SMODS.ConsumableType {
  key = "paradox",
  collection_rows = { 5, 5 },
  shop_rate = 4,
  primary_colour = G.C.PARADOX,
  secondary_colour = G.C.PARADOX_SECONDARY,
  text_colour = HEX("1bab90"),
}


SMODS.Consumable {
    key = "laplace",
    set = "paradox",
    config = {},
    pos = { x = 0, y = 0 },
    atlas = "AbandoniaParadox",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
        return { vars = {} }
    end,

    can_use = function(self, card)
        local is_even = (G.GAME.round_resets.ante % 2 == 0)

        if is_even then
            return G.hand and G.hand.cards and #G.hand.cards > 0
        else
            return G.playing_cards and #G.playing_cards > 0
        end
    end,

    use = function(self, card, area, copier)
        local is_even = (G.GAME.round_resets.ante % 2 == 0)

        if is_even then
            -- Even
            local target_cards = {}
            for _, c in ipairs(G.hand.cards) do
                target_cards[#target_cards + 1] = c
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    return true
                end
            }))

            for i, c in ipairs(target_cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        if c.facing == 'front' then
                            c:flip()
                        end
                        c.ability.abn_perma_flipped = true
                        c:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
        else
            -- Odd
            local eligible_cards = {}
            for _, c in ipairs(G.playing_cards) do
                eligible_cards[#eligible_cards + 1] = c
            end

            pseudoshuffle(eligible_cards, pseudoseed('laplace'))

            local target_count = math.min(5, #eligible_cards)
            
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    return true
                end
            }))

            for i = 1, target_count do
                local c = eligible_cards[i]
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        if c.facing == 'front' then
                            c:flip()
                        end
                        c.ability.abn_perma_flipped = true
                        c:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
        end
    end,

    abn_artist_credits = {
        artist = "Tatsu",
    },
}