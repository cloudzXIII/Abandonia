
SMODS.Joker {
    key = "joker_unlimited",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    atlas = 'ABNJokerSheet5',
    pos = { x = 8, y = 0 },
    abn_coder = "LasagnaFelidae",
    config = { 
        extra = { 
            xmult_gain = 2, xmult = 0
        },
    },
    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.xmult_gain, card.ability.extra.xmult
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.press_play then
            if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.boss then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.RED
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.end_of_round and context.main_eval and not context.game_over and context.beat_boss then
            --Double the Deck
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5) -- Changed 'used_tarot' to 'card'

                local new_cards = {}
                -- Copy the current deck state into a temporary list
                local cards_to_copy = {}
                for _, v in ipairs(G.playing_cards) do
                    table.insert(cards_to_copy, v)
                end

                for i, source_card in ipairs(cards_to_copy) do
                    --Create the copy
                    local _card = copy_card(source_card)

                    --Add to playing cards global table
                    _card:add_to_deck()
                    G.playing_cards = G.playing_cards or {} -- Safety check
                    table.insert(G.playing_cards, _card)

                    --Put it in the deck
                    G.deck:emplace(_card)

                    --Visual feedback
                    _card:start_materialize(nil, i == 1)
                    table.insert(new_cards, _card)
                end

                --Notify Jokers
                playing_card_joker_effects(new_cards)

                return true
            end
        }))
        end
    end,

    abn_artist_credits = {
        artist = "Toyrapple",
    },
}