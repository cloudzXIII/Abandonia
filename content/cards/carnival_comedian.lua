SMODS.Joker {
  key = 'carnival_comedian',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.xmultadd,
        card.ability.extra.pity
      }
    }
  end,

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,

  rarity = "abn_SuperRare",
  atlas = 'ABNJokerSheet4',
  pos = { x = 8, y = 1 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 1, xmultadd = 1, pity = 0 } },
  pools = { ["Comedians"] = true, },

  -- cannot appear in shop
  in_pool = function(self, args)
    if G.STATE == G.STATES.SHOP then
      return false
    end
  end,

  calculate = function(self, card, context)
    -- Pity System: Triggers on Reroll or entering the Shop
    if context.reroll_shop or context.starting_shop then
      card.ability.extra.pity = card.ability.extra.pity + 1

      -- If we've hit the threshold (6), roll for the 1-in-4 chance
      if card.ability.extra.pity >= 6 then
        local chance = math.random(1, 4)
        if chance == 2 then
          card.ability.extra.pity = 0 -- Reset pity

          -- Create a SuperRare card
          local new_card = SMODS.create_card({
            set = 'Joker',
            area = G.shop_jokers,
            rarity = "abn_SuperRare"
          })

          -- Force the card into the shop container
          G.shop_jokers:emplace(new_card)
          create_shop_card_ui(new_card)
        end
      end
    end

    if context.buying_card then
      if context.buying_card and context.card.config.center.rarity and context.card.config.center.rarity == 'abn_SuperRare' then
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.RED,
          card = card
        }
      end
    end

    -- Scoring logic
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "Tjinnea & Riley",
  },
}
