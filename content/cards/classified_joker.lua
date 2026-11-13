-- Classified Joker (coded by cloudzXIII and Noodlemire)
SMODS.Joker {
  key = 'classified_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
    local cae = card.ability.extra
    return { vars = { cae.c_cost, cae.mult, cae.j_cost, cae.xchips, cae.xchips_gain} }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet10',
  pos = { x = 3, y = 5 },
  cost = 2,
  discovered = false,
  blueprint_compat = true,

  config = { abn_use_cost = "?", extra = { c_cost = 5, j_cost = 10, mult = 0, xchips = 0.25, xchips_gain = 0.05 } },

  abn_artist_credits = {
    artist = "Flote"
  },
  abn_use_config = { colour = G.C.RED, text = "UNFLIP", cost = 0 },
  can_use = function(self, card)
    local h_jokers = ABN.highlighted_jokers(function(joker) return joker ~= card end)
    if #G.hand.highlighted + #h_jokers ~= 1 or (G.hand.highlighted[1] or h_jokers[1]).facing ~= "back" then
      card.ability.abn_use_cost = "?"
      return false
    end
    local ctype = G.hand.highlighted[1] and "c_cost" or "j_cost"
    card.ability.abn_use_cost = tostring(card.ability.extra[ctype])
	return G.GAME.dollars - card.ability.extra[ctype] >= G.GAME.bankrupt_at
  end,
  use = function(self, card)
    local h_jokers = ABN.highlighted_jokers(function(joker) return joker ~= card end)
    local sel = G.hand.highlighted[1] or h_jokers[1]
    ease_dollars(-(sel.playing_card and card.ability.extra.c_cost or card.ability.extra.j_cost))
    sel.ability.abn_perma_flipped = nil
    sel:flip()
    if sel.playing_card then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_table = sel.base,
        scalar_value = "nominal",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + change * 2
        end,
        message_colour = G.C.MULT
      })
    elseif sel.sell_cost > 0 then
      local any = false
      for _, c in ipairs(G.playing_cards) do
        if c.ability and c.ability.abn_perma_flipped then
          any = true
		  SMODS.scale_card(c, {
		    ref_table = c.ability,
		    ref_value = "perma_mult",
		    scalar_table = sel,
		    scalar_value = "sell_cost",
		    no_message = true
		  })
        end
      end
      if any then
        SMODS.calculate_effect({message = localize("k_upgrade_ex"), colour = G.C.MULT}, card)
      end
    end
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local flipped_jokers = ABN.count_jokers(function(joker)
        return joker.ability and joker.ability.abn_perma_flipped
      end)
      if flipped_jokers > 0 then
        return {xchips = 1 + card.ability.extra.xchips * flipped_jokers}
      end
    elseif context.joker_main then
      return {mult = card.ability.extra.mult}
    elseif context.end_of_round and context.main_eval then
      local flipped_jokers = ABN.count_jokers(function(joker)
        return joker.ability and joker.ability.abn_perma_flipped
      end)
      if flipped_jokers > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "xchips",
          scalar_value = "xchips_gain",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + change * flipped_jokers
          end,
          message_colour = G.C.CHIPS
        })
      end
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    if card.ability.extra.activated then return end
    card.ability.extra.activated = true
    for i = 1, #G.jokers.cards do
      local v = G.jokers.cards[i]
      if not v.ability.abn_perma_flipped then
        if v.facing == 'front' then
          v:flip()
        end
        v.ability.abn_perma_flipped = true
      end
    end
    for i = 1, #G.playing_cards do
      local v = G.playing_cards[i]
      if not v.ability.abn_perma_flipped then
        if v.facing == 'front' then
          v:flip()
        end
        v.ability.abn_perma_flipped = true
      end
    end
  end,
}
