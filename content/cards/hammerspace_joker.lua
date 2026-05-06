SMODS.Joker {
  key = 'hammerspace_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet5',
  pos = { x = 7, y = 2 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { xmult = 1, mult = 0, xchips = 1, chips = 0, xmultadd = 0.3, multadd = 10, xchipsadd = 1, chipsadd = 20 } },
  
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult, card.ability.extra.mult, card.ability.extra.xchips, card.ability.extra.chips, card.ability.extra.xmultadd, card.ability.extra.multadd, card.ability.extra.xchipsadd, card.ability.extra.chipsadd } }
  end,

  add_to_deck = function(self, card)
     G.consumeables.config.card_limit = G.consumeables.config.card_limit + 2
  end,
  
  remove_from_deck = function(self, card)
    G.consumeables.config.card_limit = G.consumeables.config.card_limit - 2
  end,

  calculate = function(self, card, context)
    -- Scaling Logic: End of Boss Blind
    if context.end_of_round and context.main_eval and not context.blueprint and G.GAME.blind.boss then
        local upgraded = false
        local sets_found = {} -- Track which sets we've already processed this round

        for _, v in pairs(G.consumeables.cards) do
            local set = v.config.center.set
            
            -- Sigils -> XMult
            if set == "sigils" and not sets_found["sigils"] then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
                sets_found["sigils"] = true
                upgraded = true
            
            -- Astro Cards -> Mult
            elseif set == "astro_cards" and not sets_found["astro_cards"] then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
                sets_found["astro_cards"] = true
                upgraded = true
            
            -- Tarot -> Chips
            elseif set == "Tarot" and not sets_found["Tarot"] then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
                sets_found["Tarot"] = true
                upgraded = true
            
            -- Spectral -> XChips
            elseif set == "Spectral" and not sets_found["Spectral"] then
                card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchipsadd
                sets_found["Spectral"] = true
                upgraded = true
            end
        end

        if upgraded then
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.Mult,
                card = card
            }
        end
    end
    
    -- Scoring Logic
    if context.joker_main then
        return {
            xmult = card.ability.extra.xmult, 
            mult = card.ability.extra.mult,
            xchips = card.ability.extra.xchips,
            chips = card.ability.extra.chips,
        }
    end
  end,

  abn_artist_credits = {
    artist = "Null",
  },
}
