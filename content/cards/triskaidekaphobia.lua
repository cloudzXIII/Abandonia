SMODS.Joker {
  key = 'triskaidekaphobia', -- Triskaidekaphobia
  rarity = 3,
  abn_coder = "ImaginaryNeon",
  atlas = 'ABNJokerSheet11',
  pos = { x = 6, y = 5 },
  --atlas = 'jonklers',     -- test sprites from my own mod
  --pos = { x = 4, y = 4 }, -- Hideous Mass
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  demicoloncompat = false,
  config = { extra = { xperm = 2, xblind = 2, slots = 1, xblindp = 1, xblind_gain = 0.1 }, immutable = { active = false } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
    return { vars = { card.ability.extra.xperm, card.ability.extra.xblind, card.ability.extra.slots, card.ability.extra.xblind_gain, card.ability.extra.xblindp } }
  end,
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint and not card.getting_sliced then
      card.ability.immutable.active = false
      if card.ability.extra.xblindp > 1 then
        G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.xblindp
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        G.HUD_blind:recalculate()
        G.E_MANAGER:add_event(Event({
          func = function()
            G.E_MANAGER:add_event(Event({
              func = function()
                play_sound("timpani")
                delay(0.4)
                return true
              end,
            }))
            return true
          end,
        }))
      end
    end
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_lucky") then
        local count = 0
        for _, scored_card in ipairs(context.scoring_hand) do
          if not SMODS.has_enhancement(scored_card, "m_lucky") then
            count = count + 1
            scored_card.ability.perma_bonus = scored_card:get_chip_bonus() --(card.ability.extra.xperm * ((scored_card.ability.perma_bonus or 0) + ((scored_card.base.nominal) or 0))) - (scored_card.ability.perma_bonus or 0)
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
            colour = G.C.RED
          }
        end
      end
      if context.other_card:get_id() == 'abn_13' and not context.blueprint then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'xblindp',
          scalar_value = 'xblind_gain',
          message_colour = G.C.ATTENTION
        })
        card.ability.immutable.active = true
        G.jokers:change_size(card.ability.extra.slots) -- Add 1 Joker slot
        return {
          xblind = card.ability.extra.xblind
        }
      end
      --if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      --end
    end
  end,
  in_pool = function(self, args) --equivalent to `watergate = 'true and real'`
    local check = false
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_lucky') then
        check = true
      end
    end
    if check == true then
      for _, playing_card2 in ipairs(G.playing_cards or {}) do
        if playing_card2:get_id() == 'abn_13' then
          return true
        end
      end
    end
    return false
  end,
  abn_artist_credits = {
    artist = "Ruby",
  }
}
