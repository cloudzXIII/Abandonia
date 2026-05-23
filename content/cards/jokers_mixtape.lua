SMODS.Joker {
  key = 'jokers_mixtape',
  rarity = 2,
  atlas = 'ABNJokerSheet9',
  pos = { x = 4, y = 5 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  unlocked = true,
  config = { extra = { text = "Give +10 chips per Joker owned" } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.text } }
  end,

  update = function(self, card)
    if card.area == G.jokers then
      local target_x = 4
      local target_y = 5

      if card.edition then
        -- black
        if card.edition.negative or card.edition.abn_abandond then
          card.ability.extra.text = "Give X1 Mult per Joker owned"
          target_x = 3
        -- red
        elseif card.edition.polychrome or card.edition.abn_pearlenscene then
          card.ability.extra.text = "Retrigger All Jokers"
          target_x = 1
        -- blue
        elseif card.edition.foil or card.edition.abn_gloss then
          card.ability.extra.text = "X3 Chips"
          target_x = 0
        -- yellow
        elseif card.edition.holo or card.edition.abn_iridescent then
          card.ability.extra.text = "Gives Xmult equal to the number of scoring cards"
          target_x = 2
        else
          card.ability.extra.text = "Give +10 chips per Joker owned"
        end
      else
        card.ability.extra.text = "Give +10 chips per Joker owned"
      end

      if card.children and card.children.center then
        if not card.children.center.sprite_pos_is_unique then
          card.children.center.sprite_pos = { x = target_x, y = target_y }
          card.children.center.sprite_pos_is_unique = true
        elseif card.children.center.sprite_pos.x ~= target_x or card.children.center.sprite_pos.y ~= target_y then
          card.children.center.sprite_pos.x = target_x
          card.children.center.sprite_pos.y = target_y
        end
      end
    end
  end,

  calculate = function(self, card, context)
    local ed = card.edition

    if context.joker_main then
      -- black (Negative / Abandoned)
      if ed and (ed.negative or ed.abn_abandond) then
        return {
          xmult = #G.jokers.cards,
          card = card
        }
      -- yellow (Holo / Iridescent)
      elseif ed and (ed.holo or ed.abn_iridescent) then
        return {
          xmult = #context.scoring_hand,
          card = card
        }
      -- blue (Foil / Gloss)
      elseif ed and (ed.foil or ed.abn_gloss) then
        return {
          xchips = 3,
          card = card
        }
      -- grey (Base / No impactful edition)
      elseif not ed or (not ed.negative and not ed.abn_abandond and not ed.holo and not ed.abn_iridescent and not ed.polychrome and not ed.abn_pearlenscene and not ed.foil and not ed.abn_gloss) then
        return {
          chips = 10 * #G.jokers.cards,
          card = card
        }
      end
    end
    
    -- red (Polychrome / Pearlenscene retrigger logic)
    if context.retrigger_joker_check and not context.retrigger_joker and context.other_card then
      if ed and (ed.polychrome or ed.abn_pearlenscene) then
        -- Prevent infinite loops by ensuring it doesn't retrigger itself or another Mixtape
        if context.other_card.config.center.key ~= 'j_jokers_mixtape' then
          return {
            message = localize('k_again_ex'),
            repetitions = 1,
            card = card
          }
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}