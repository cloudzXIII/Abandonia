SMODS.Joker {
  key = 'joker_besties',
  rarity = 3,
  atlas = 'ABNJokerSheet13',
  pos = { x = 4, y = 5 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chips = 5,
      x_chips_foil = 4,
      x_chips_holo = 6,
      x_chips_poly = 8,
      x_mult_foil = 2,
      x_mult_holo = 4,
      x_mult_poly = 6,
      extra_chips = 10,
      extra_mult = 4
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_chips_foil,
        card.ability.extra.x_chips_holo,
        card.ability.extra.x_chips_poly,
        card.ability.extra.x_mult_foil,
        card.ability.extra.x_mult_holo,
        card.ability.extra.x_mult_poly,
        card.ability.extra.extra_chips,
        card.ability.extra.extra_mult
      }
    }
  end,
  
  in_pool = function(self)
    if not G.playing_cards then return false end

    for _, c in ipairs(G.playing_cards) do
      if c and c.edition and c.edition.foil then
        if c.config.center == G.P_CENTERS.m_fn_Wood or c.config.center == G.P_CENTERS.m_fn_Brick then
          return true
        end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    local function upgrade_edition(target_card)
      local current_edition = target_card.edition and target_card.edition.type
      local next_edition = nil

      if current_edition == 'foil' then
        next_edition = 'holo'
      elseif current_edition == 'holo' then
        next_edition = 'polychrome'
      elseif current_edition == 'polychrome' then
        next_edition = 'abn_chromatic'
      end

      if next_edition then
        target_card:set_edition({ [next_edition] = true }, true)
      end
    end

    local function is_vanilla_suit(c)
      return c:is_suit('Spades') or c:is_suit('Hearts') or c:is_suit('Clubs') or c:is_suit('Diamonds')
    end

    local function is_modded_suit(c)
      return c.base and not is_vanilla_suit(c)
    end

    if context.individual and context.cardarea == G.play then
      local target = context.other_card
      local set_type = target.config and target.config.center and target.config.center.set

      if set_type == "Default" or set_type == "Enhanced" then
        local return_chips = nil
        local apply_upgrade = false

        if target.edition and target.edition.type then
          local ed = target.edition.type
          
          if G.play.cards then
            local vanilla_foil_count, modded_foil_count = 0, 0
            local vanilla_holo_count, modded_holo_count = 0, 0
            local vanilla_poly_count, modded_poly_count = 0, 0

            for _, sc in ipairs(G.play.cards) do
              if sc.edition and sc.edition.type == 'foil' then
                if is_vanilla_suit(sc) then vanilla_foil_count = vanilla_foil_count + 1
                elseif is_modded_suit(sc) then modded_foil_count = modded_foil_count + 1 end
              elseif sc.edition and sc.edition.type == 'holo' then
                if is_vanilla_suit(sc) then vanilla_holo_count = vanilla_holo_count + 1
                elseif is_modded_suit(sc) then modded_holo_count = modded_holo_count + 1 end
              elseif sc.edition and sc.edition.type == 'polychrome' then
                if is_vanilla_suit(sc) then vanilla_poly_count = vanilla_poly_count + 1
                elseif is_modded_suit(sc) then modded_poly_count = modded_poly_count + 1 end
              end
            end

            if ed == 'foil' and vanilla_foil_count > 0 and vanilla_foil_count == modded_foil_count then
              return_chips = card.ability.extra.x_chips_foil
            elseif ed == 'holo' and vanilla_holo_count > 0 and vanilla_holo_count == modded_holo_count then
              return_chips = card.ability.extra.x_chips_holo
            elseif ed == 'polychrome' and vanilla_poly_count > 0 and vanilla_poly_count == modded_poly_count then
              return_chips = card.ability.extra.x_chips_poly
            end
          end

          if card.edition and card.edition.foil then
            if ed == 'foil' or ed == 'holo' or ed == 'polychrome' then
              apply_upgrade = true
            end
          end
        end

        if apply_upgrade then
          upgrade_edition(target)
          target.ability.bonus = (target.ability.bonus or 0) + card.ability.extra.extra_chips
        end

        if return_chips or apply_upgrade then
          return {
            xchips = return_chips,
            mult = apply_upgrade and card.ability.extra.extra_mult or nil,
            chips = apply_upgrade and card.ability.extra.extra_chips or nil
          }
        end
      end
    end

    if context.other_joker and context.other_joker ~= card then
      local target = context.other_joker
      if target.config and target.config.center and target.config.center.set == "Joker" then
        
        local return_mult = nil
        local apply_joker_upgrade = false

        if target.edition and target.edition.type then
          local ed = target.edition.type
          
          if G.jokers and G.jokers.cards then
            local v_foil, m_foil, v_holo, m_holo, v_poly, m_poly = false, false, false, false, false, false
            for _, j in ipairs(G.jokers.cards) do
              if j.edition then
                local is_mod_joker = j.config.center.mod and j.config.center.mod.id ~= nil
                if j.edition.foil then if is_mod_joker then m_foil = true else v_foil = true end end
                if j.edition.holo then if is_mod_joker then m_holo = true else v_holo = true end end
                if j.edition.polychrome then if is_mod_joker then m_poly = true else v_poly = true end end
              end
            end

            if ed == 'foil' and v_foil and m_foil then
              return_mult = card.ability.extra.x_mult_foil
            elseif ed == 'holo' and v_holo and m_holo then
              return_mult = card.ability.extra.x_mult_holo
            elseif ed == 'polychrome' and v_poly and m_poly then
              return_mult = card.ability.extra.x_mult_poly
            end
          end

          if card.edition and card.edition.foil then
            if ed == 'foil' or ed == 'holo' or ed == 'polychrome' then
              apply_joker_upgrade = true
            end
          end
        end

        if apply_joker_upgrade then
          upgrade_edition(target)
        end

        if return_mult or apply_joker_upgrade then
          return {
            x_mult = return_mult,
            mult = apply_joker_upgrade and card.ability.extra.extra_mult or nil,
            chips = apply_joker_upgrade and card.ability.extra.extra_chips or nil
          }
        end

      end
    end
  end,
  
  abn_artist_credits = {
    artist = "Comykel",
  },
}