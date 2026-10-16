SMODS.Joker {
  key = 'blood_money',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.ABN_PLAGUED, G.C.WHITE, 1.0)
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet12',
  pos = { x = 6, y = 1 },
  cost = 12,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 2, dollars = 1 } },
  pools = { ["Plagued"] = true, },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.dollars,
      }
    }
  end,

  -- only available on jimbo stakes
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card then
        if context.other_card.ability.perma_x_mult < 1 then
          context.other_card.ability.perma_x_mult = (context.other_card.ability.perma_x_mult or 0) +
              card.ability.extra.xmult - 1
        else
          context.other_card.ability.perma_x_mult = (context.other_card.ability.perma_x_mult or 0) +
              card.ability.extra.xmult
        end
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT,
          dollars = -card.ability.extra.dollars,
        }
      end
    end

    --destroy if no money
    if context.destroy_card and context.cardarea == G.play and G.GAME.dollars - (card.ability.extra.dollars * #context.scoring_hand) <= 0 then
      return { remove = true }
    end
  end,

  abn_artist_credits = {
    artist = "Pepix",
  },
}
