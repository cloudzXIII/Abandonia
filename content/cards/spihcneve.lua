SMODS.Joker {
  key = 'spihcneve', -- what the hell is a 'Spihcneve' even supposed to be? oh wait it's "even chips" backwards okay
  rarity = 3,
  abn_coder = "ImaginaryNeon",
  atlas = 'ABNJokerSheet11',
  pos = { x = 9, y = 5 },
  --atlas = 'jonklers',     -- test sprites from my own mod
  --pos = { x = 0, y = 0 }, -- Chair
  cost = 8,
  discovered = false,
  --unlocked = false,
  blueprint_compat = true,
  demicoloncompat = false,
  config = { extra = { chip_gain = 40, mult_gain = 10 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
    return { vars = { card.ability.extra.chip_gain, card.ability.extra.mult_gain } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_mult") then
        if ABN.is_even(context.other_card) then
          for _, scored_card in ipairs(context.scoring_hand) do
            if ABN.is_odd(scored_card) and not SMODS.has_enhancement(scored_card, "m_mult") then
              count = count + 1
              scored_card.ability.perma_mult = (scored_card.ability.perma_mult or 0) +
                  card.ability.extra.mult_gain
            end
          end
        end
        local count = 0
        for _, scored_card in ipairs(context.scoring_hand) do
          if not SMODS.has_enhancement(scored_card, "m_mult") then
            count = count + 1
            scored_card.ability.perma_bonus = (scored_card.ability.perma_bonus or 0) +
                card.ability.extra.chip_gain
            G.E_MANAGER:add_event(Event({
              func = function()
                scored_card:juice_up()
                return true
              end
            }))
          end
        end
        if count > 0 then
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS
          }
        end
      end
    end
  end,
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_mult') and ABN.is_even(playing_card) then
        return true
      end
    end
    return false
  end,
  --[[check_for_unlock = function(self, args)
        if args.type == 'modify_deck' then
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(playing_card, 'm_mult') and ABN.is_even(playing_card) then
                    return true
                end
            end
        end
        return false
    end,--]]
  abn_artist_credits = {
    artist = "Inky",
  }
}
