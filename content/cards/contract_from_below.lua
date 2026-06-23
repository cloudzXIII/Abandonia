SMODS.Joker {
  key = 'contract_from_below',
  rarity = 2,
  atlas = 'ABNJokerSheet4',
  pos = { x = 5, y = 3 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  loc_vars = function(self, info_queue, center)
    info_queue[#info_queue + 1] = { key = "perishable", set = "Other", vars = { 5 } }
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chthonian
  end,

  add_to_deck = function(self, card)
    -- Take ownership of Spectral Packs
    SMODS.Booster:take_ownership_by_kind('Spectral', {
      create_card = function(_, card, i)
        -- Force a Nightshift card in the first slot (i == 1)
        if i == 1 and next(SMODS.find_card('j_abn_contract_from_below')) then
          -- pool to pull from
          local nightshift_pool = {
            "c_abn_furtive",
            "c_abn_intrusion",
            "c_abn_aparition",
            "c_abn_smirk",
            "c_abn_observer",
          }
          local choice = nightshift_pool[math.floor(pseudorandom('contract_nightshift') * #nightshift_pool) + 1]

          return {
            set = "nightshift_cards",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key = choice,
            key_append = "spec_night"
          }
        else
          -- Default Spectral generation for other slots
          return {
            set = "Spectral",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "spec_normal"
          }
        end
      end
    }, true)
  end,

  set_ability = function(self, card, initial)
    card:add_sticker("abn_vessel", true)
    card:add_sticker("rental", true)
  end,

  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      local leftmost_joker = G.jokers.cards[1]
      if leftmost_joker and leftmost_joker ~= card then
        leftmost_joker:add_sticker("abn_vessel", true)
        leftmost_joker:add_sticker("perishable", true)
        leftmost_joker:set_edition({ abn_chthonian = true }, true)
        leftmost_joker:juice_up()
      end
    end
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}
