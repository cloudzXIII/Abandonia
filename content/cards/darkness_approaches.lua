SMODS.Joker {
  key = 'darkness_approaches',
  rarity = 1,
  atlas = 'ABNJokerSheet25',
  pos = { x = 4, y = 1 },
  cost = 5,
  discovered = false,
  blueprint_compat = false,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = {
      set = "abn_BlindEdition",
      key = "ble_abn_opaque",
      vars = ABN.BlindEditions.ble_abn_opaque:loc_vars(ABN.BlindEditions.ble_abn_opaque).vars
    }
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_bright
  end,
 
  add_to_deck = function(self, card, from_debuff)
    ABN.force_blind_edition("ble_abn_opaque", true)
    if G.GAME and G.GAME.round_resets and G.GAME.round_resets.blind_states then
      for _, blind_type in ipairs(G.GAME.round_resets.blind_order or {}) do
        local state = G.GAME.round_resets.blind_states[blind_type]
        if state == "Select" or state == "Upcoming" then
          ABN.add_edition_to_blind(blind_type)
        end
      end
    end
  end,
 
  remove_from_deck = function(self, card, from_debuff)
    ABN.force_blind_edition("ble_abn_opaque", false)
  end,
 
  calculate = function(self, card, context)
    if context.blueprint then return end
    if context.final_scoring_step and G.GAME.blind and SMODS.calculate_round_score() >= G.GAME.blind.chips then
      local gave_edition = false
      for _, played_card in ipairs(context.full_hand) do
        if not played_card.edition or played_card.edition.key ~= "e_abn_bright" then
          gave_edition = true
          played_card:set_edition("e_abn_bright", true)
          G.E_MANAGER:add_event(Event({
            func = function()
              played_card:juice_up()
              return true
            end
          }))
        end
      end
      if gave_edition then
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.WHITE,
          card = card
        }
      end
    end
  end,
 
  abn_artist_credits = {
    artist = "Toyrapple",
  },
}
 