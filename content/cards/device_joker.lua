SMODS.Joker {
  key = 'device_joker',
  loc_txt = {
    ['en-us'] = {
      name = "#1#",
      text = {
        "{C:attention}#2#{} cards are not destroyed by their own Effect",
        "If {C:attention}first hand{} is only {C:attention}#3#{} Suits",
        "they each gain {C:dark_edition}#2# Enhancement{}",
        "If they all have {C:dark_edition}#2# Enhancement{} they all gain {C:dark_edition}#4#{} and {C:attention}flip{} this Joker",
      }
    }
  },
  rarity = 2,
  atlas = 'ABNJokerSheet17',
  pos = { x = 3, y = 5 }, 
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  config = {
    extra = {
      mode = 'dark'
    }
  },

  loc_vars = function(self, info_queue, card)
    local dynamic_name = "DEVICE Joker"
    local enhancement_txt = "Darkner"
    local suit_txt = "Dark"
    local edition_txt = "Opaque"

    if card and card.ability and card.ability.extra and card.ability.extra.mode == 'light' then
      dynamic_name = "ECIVED Joker"
      enhancement_txt = "Lightner"
      suit_txt = "Light"
      edition_txt = "Bright"
    end

    if card and card.ability and card.ability.extra then
      if card.ability.extra.mode == 'dark' then
        info_queue[#info_queue+1] = G.P_CENTERS.m_abn_darkner
        info_queue[#info_queue+1] = G.P_CENTERS.e_abn_opaque
      else
        info_queue[#info_queue+1] = G.P_CENTERS.m_abn_lightner
        info_queue[#info_queue+1] = G.P_CENTERS.e_abn_bright
      end
    end

    return { 
      vars = { 
        dynamic_name,     -- #1#
        enhancement_txt,  -- #2#
        suit_txt,         -- #3#
        edition_txt       -- #4#
      } 
    }
  end,

  update = function(self, card)
    if card and card.ability and card.ability.extra then
      if card.ability.extra.mode == 'light' then
        self.pos.x = 4 -- Shipped over 1 index for ECIVED
      else
        self.pos.x = 3 -- Original starting index for DEVICE
      end
    end
  end,

  calculate = function(self, card, context)
    if context.before and context.cardarea == G.jokers and G.GAME.current_round.hands_played == 0 then

      if card.ability.extra.mode == 'dark' then
        local only_dark = true
        for i = 1, #context.scoring_hand do
          if not ABN.is_dark(context.scoring_hand[i]) then
            only_dark = false
            break
          end
        end

        if not only_dark then 
          return 
        end

        local already_all_darkner = true
        for i = 1, #context.scoring_hand do
          local center = context.scoring_hand[i].config.center
          if not center or (center.key ~= 'm_abn_darkner' and center.key ~= 'abn_darkner') then
            already_all_darkner = false
            break
          end
        end

        if not already_all_darkner then
          G.E_MANAGER:add_event(Event({
            trigger = 'before',
            func = function()
              for i = 1, #context.scoring_hand do
                local target_card = context.scoring_hand[i]
                target_card:set_ability(G.P_CENTERS.m_abn_darkner, nil, true)
                target_card:juice_up(0.5, 0.5)
              end
              play_sound('gold_seal', 1.0, 1.2)
              return true
            end
          }))
        else
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
              for i = 1, #context.scoring_hand do
                local target_card = context.scoring_hand[i]
                target_card:set_edition({ abn_dark = true }, true)
                target_card:juice_up(0.6, 0.6)
              end
              
              card:flip()
              card.ability.extra.mode = 'light'
              card:flip()

              play_sound('tarot2', 0.8, 0.9)
              return true
            end
          }))
        end

      elseif card.ability.extra.mode == 'light' then
        local only_light = true
        for i = 1, #context.scoring_hand do
          if ABN.is_dark(context.scoring_hand[i]) then
            only_light = false
            break
          end
        end

        if not only_light then 
          return 
        end

        local already_all_lightner = true
        for i = 1, #context.scoring_hand do
          local center = context.scoring_hand[i].config.center
          if not center or (center.key ~= 'm_abn_lightner' and center.key ~= 'abn_lightner') then
            already_all_lightner = false
            break
          end
        end

        if not already_all_lightner then
          G.E_MANAGER:add_event(Event({
            trigger = 'before',
            func = function()
              for i = 1, #context.scoring_hand do
                local target_card = context.scoring_hand[i]
                target_card:set_ability(G.P_CENTERS.m_abn_lightner, nil, true)
                target_card:juice_up(0.5, 0.5)
              end
              play_sound('gold_seal', 1.0, 1.4)
              return true
            end
          }))
        else
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
              for i = 1, #context.scoring_hand do
                local target_card = context.scoring_hand[i]
                target_card:set_edition({ abn_bright = true }, true)
                target_card:juice_up(0.6, 0.6)
              end
              
              card:flip()
              card.ability.extra.mode = 'dark'
              card:flip()

              play_sound('tarot2', 1.1, 1.2)
              return true
            end
          }))
        end

      end
    end
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}