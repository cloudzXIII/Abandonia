SMODS.Joker {
  key = 'example_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet11',
  pos = { x = 5, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,
  
  config = { extra = { last_hand = nil } },
  
  in_pool = function(self, args)
    local sigil_card_used = false
    if G.GAME.consumeable_usage then
        for _, v in pairs(G.GAME.consumeable_usage) do
            if v.set == 'sigils' then
                sigil_card_used = true
                break 
            end
        end
    end 
    return sigil_card_used
  end,
  
  calculate = function(self, card, context)    
    if context.cardarea == G.jokers and context.before and not context.blueprint then
        if context.scoring_name then
            card.ability.extra.last_hand = context.scoring_name
        end
    end

    if context.end_of_round and context.main_eval and not context.blueprint then
        if card.ability.extra.last_hand then
            local hand_to_sigil = {
                ['High Card']       = 'c_abn_bael',
                ['Pair']            = 'c_abn_botis',
                ['Two Pair']        = 'c_abn_vinea',
                ['Three of a Kind'] = 'c_abn_morax',
                ['Four of a Kind']  = 'c_abn_bune',
                ['Straight']        = 'c_abn_furfur',
                ['Flush']           = 'c_abn_bifrons',
                ['Full House']      = 'c_abn_crocell',
                ['Straight Flush']  = 'c_abn_belial',
                ['Five of a Kind']  = 'c_abn_astaroth',
                ['Flush House']     = 'c_abn_asmodeus',
                ['Flush Five']      = 'c_abn_camio',
            }

            local chosen_sigil = hand_to_sigil[card.ability.extra.last_hand]

            if not chosen_sigil then
                local all_sigils = {}
                for _, sigil in pairs(hand_to_sigil) do
                    table.insert(all_sigils, sigil)
                end
                chosen_sigil = pseudorandom_element(all_sigils, pseudorandom_seed('example_joker_fallback'))
            end

            if #G.consumeables.cards < G.consumeables.config.card_limit then
                local _card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, chosen_sigil)
                if _card then
                    _card:add_to_deck()
                    G.consumeables:emplace(_card)
                end
            else
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = "No Room!", colour = G.C.UI.TEXT_INACTIVE})
            end
            
            card.ability.extra.last_hand = nil
        end
    end
  end,
  abn_artist_credits = {
    artist = "Flote"
  },
}