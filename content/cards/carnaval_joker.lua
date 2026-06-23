SMODS.Joker {
  key = 'carnaval_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet8',
  pos = { x = 9, y = 5 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      mult = 10
    }
  },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    return {
      vars = {
        card.ability.extra.mult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local first_penumbra_index = nil

      -- Find penumbra card
      for i = 1, #context.scoring_hand do
        if context.full_hand[i]:is_suit("abn_Penumbra") then
          first_penumbra_index = i
          break
        end
      end

      -- If we didn't find one fail
      if not first_penumbra_index then
        card.ability.extra.carnaval_active = false
      else
        local has_other_dark = false
        local has_other_light = false

        for i = 1, #context.scoring_hand do
          -- Skip first penumbra
          if i ~= first_penumbra_index then
            local check_card = context.scoring_hand[i]

            if ABN.is_dark(check_card) then
              has_other_dark = true
            end
            if ABN.is_light(check_card) then
              has_other_light = true
            end
          end
        end

        if has_other_dark and has_other_light then
          card.ability.extra.carnaval_active = true
        else
          card.ability.extra.carnaval_active = false
        end
      end
    end

    -- Upgrade cards
    if context.individual and context.cardarea == G.play then
      local master_card = context.blueprint_card or card

      if master_card.ability.extra.carnaval_active then
        local target = context.other_card

        target.ability.perma_mult = (target.ability.perma_mult or 0) + card.ability.extra.mult

        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT,
          card = card
        }
      end
    end

    if context.final_scoring_step then
      card.ability.extra.carnaval_active = false
    end
  end,

  abn_artist_credits = {
    artist = "Muddz",
  },
}
