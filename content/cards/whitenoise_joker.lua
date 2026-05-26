SMODS.Joker {
  key = 'whitenoise_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet8',
  pos = { x = 9, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      xmult = 1,
      xmultadd = 1.5,
    }
  },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.xmultadd,
      },
    }
  end,

  calculate = function(self, card, context)
    -- Scaling Logic
    if context.before and not context.blueprint then
      local light_count = 0
      local dark_count = 0

      -- Count Light and Dark suits in the scoring hand
      for i = 1, #context.scoring_hand do
        if ABN.is_light(context.scoring_hand[i]) then
          light_count = light_count + 1
        elseif ABN.is_dark(context.scoring_hand[i]) then
          dark_count = dark_count + 1
        end
      end


      if (light_count + dark_count) > 0 and light_count % 2 == 0 and dark_count % 2 == 0 then
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd

        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT,
          card = card
        }
      end
    end

    -- Scoring Logic
    if context.joker_main then
      if card.ability.extra.xmult > 1 then
        return {
          Xmult = card.ability.extra.xmult
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Tisisrealnow",
  },
}
