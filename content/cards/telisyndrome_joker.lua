SMODS.Joker {
  key = 'telisyndrome_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.ABN_PLAGUED, G.C.WHITE, 1.0)
  end,

  rarity = "abn_VirusRare",
  atlas = 'ABNJokerSheet12',
  pos = { x = 7, y = 2 },
  cost = 25,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { echips = 2.3, mult = 100 } },
  pools = { ["Plagued"] = true, },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.echips,
        card.ability.extra.mult
      }
    }
  end,

  -- only available on jimbo stakes
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local unique_enhancements = {}
      local count = 0

      if context.scoring_hand then
        for i = 1, #context.scoring_hand do
          local scoring_card = context.scoring_hand[i]
          if scoring_card.config.center and scoring_card.config.center ~= G.P_CENTERS.c_base then
            local enhancement_key = scoring_card.config.center.key
            if not unique_enhancements[enhancement_key] then
              unique_enhancements[enhancement_key] = true
              count = count + 1
            end
          end
        end
      end

      if count > 0 then
        return {
          echips = card.ability.extra.echips * count,
          colour = G.C.CHIPS
        }
      end
    end

    if context.other_joker and context.other_joker ~= card then
      if context.other_joker.config.center.pools and context.other_joker.config.center.pools.Plagued then
        local unique_editions = {}
        local edition_count = 0

        if G.jokers and G.jokers.cards then
          for i = 1, #G.jokers.cards do
            local jkr = G.jokers.cards[i]
            if jkr.edition and jkr.edition.key then
              if not unique_editions[jkr.edition.key] then
                unique_editions[jkr.edition.key] = true
                edition_count = edition_count + 1
              end
            end
          end
        end

        if edition_count > 0 then
          local total_mult = edition_count * card.ability.extra.mult
          return {
            mult = total_mult,
            card = card
          }
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "Da Gorbage Rat",
  },
}
