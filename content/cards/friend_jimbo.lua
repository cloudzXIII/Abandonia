SMODS.Joker {
  key = 'friend_jimbo',
  rarity = 1, 
  atlas = 'ABNJokerSheet17', 
  pos = { x = 1, y = 3 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { chips = 0 } },

  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
    return { vars = { card.ability.extra.chips } }
  end,

  calculate = function(self, card, context)
    if context.remove_playing_cards and not context.blueprint then
      local dark_cards_count = 0
      local gained_chips = 0

      for _, removed_card in ipairs(context.removed) do
        if ABN.is_dark(removed_card) then
          dark_cards_count = dark_cards_count + 1
          
          if removed_card.config.center == G.P_CENTERS.m_abn_darkner then
            if removed_card.base and removed_card.base.value and SMODS.Ranks[removed_card.base.value] then
              gained_chips = gained_chips + SMODS.Ranks[removed_card.base.value].nominal
            end
          end
        end
      end

      if dark_cards_count > 0 then
        if gained_chips > 0 then
          card.ability.extra.chips = card.ability.extra.chips + gained_chips
        end

        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.3,
          func = function()
            for i = 1, dark_cards_count do
              local stone_card = SMODS.create_card { set = "Base", enhancement = "m_stone", area = G.deck }
              
              G.playing_card = (G.playing_card and G.playing_card + 1) or 1
              stone_card.playing_card = G.playing_card
              table.insert(G.playing_cards, stone_card)

              G.deck:emplace(stone_card)
              stone_card:start_materialize({ G.C.SECONDARY_SET.Enhanced })
              
              G.deck.config.card_limit = G.deck.config.card_limit + 1
              
              SMODS.calculate_context({ playing_card_added = true, cards = { stone_card } })
            end
            return true
          end
        }))

        if gained_chips > 0 then
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS,
          }
        else
          local text_notification = dark_cards_count > 1 and " Stones" or " Stone"
          return {
            message = "+" .. dark_cards_count .. text_notification,
            colour = G.C.SECONDARY_SET.Enhanced,
          }
        end
      end
    end
    
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Szymii",
  },
}