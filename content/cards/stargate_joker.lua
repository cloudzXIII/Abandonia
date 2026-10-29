
local function set_stargate_limit(raise, amount)
    if not G.GAME then return end
    if raise and not G.GAME.abn_stargate_applied then
        G.GAME.abn_stargate_applied = amount
        SMODS.change_play_limit(amount)
    elseif not raise and G.GAME.abn_stargate_applied then
        SMODS.change_play_limit(-G.GAME.abn_stargate_applied)
        G.GAME.abn_stargate_applied = nil
    end
end

local parse_highlighted_ref = CardArea.parse_highlighted
function CardArea:parse_highlighted()
    local ret = parse_highlighted_ref(self)

    if G.hand and self == G.hand and G.GAME then
        local stargate = SMODS.find_card('j_abn_stargate_joker')[1]
        local is_straight = false
        if stargate and #G.hand.highlighted >= 5 then
            local results = evaluate_poker_hand(G.hand.highlighted)
            is_straight = results['Straight'] and next(results['Straight']) ~= nil
        end
        local was_raised = G.GAME.abn_stargate_applied ~= nil
        set_stargate_limit(is_straight, stargate and stargate.ability.extra.play_limit)

        if was_raised and not is_straight then
            local normal_limit = (G.GAME.starting_params and G.GAME.starting_params.play_limit) or 5
            if #G.hand.highlighted > normal_limit then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:unhighlight_all()
                        return true
                    end
                }))
            end
        end
    end

    return ret
end

SMODS.Joker {
    key = 'stargate_joker',
    atlas = 'ABNJokerSheet10',
    pos = { x = 7, y = 3 },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,

    config = { extra = { asc = 0, amp = 0, asc_gain = 0.25, amp_gain = 0.25, play_limit = 9999 } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.asc_gain,
                card.ability.extra.amp_gain,
                card.ability.extra.asc,
                card.ability.extra.amp,
            }
        }
    end,

    remove_from_deck = function(self, card, from_debuff)
        set_stargate_limit(false)
    end,

    calculate = function(self, card, context)
        if context.after or context.end_of_round then
            set_stargate_limit(false)
        end

        if context.before and not context.blueprint and context.poker_hands and next(context.poker_hands['Straight']) then
            local extra_cards = #context.poker_hands['Straight'][1] - 5
            if extra_cards > 0 then
                card.ability.extra.asc = card.ability.extra.asc + card.ability.extra.asc_gain * extra_cards
                card.ability.extra.amp = card.ability.extra.amp + card.ability.extra.amp_gain * extra_cards
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.ATTENTION,
                }
            end
        end

        if context.joker_main and card.ability.extra.asc > 0 then
            return {
                asc = card.ability.extra.asc,
                amp = card.ability.extra.amp,
            }
        end
    end,

    abn_artist_credits = {
		artist = "Toyrapple" 
	},
}