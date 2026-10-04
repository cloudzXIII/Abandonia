SMODS.ConsumableType {
  key = "mercantile",
  primary_colour = HEX("630700"),
  secondary_colour = HEX("ffd700"),
  collection_rows = { 6, 6 },
  shop_rate = 4,
  select_card = "consumeables"
}

local set_cost_ref = Card.set_cost 
function Card:set_cost()
  local ret = set_cost_ref(self)
  if self.ability.set == "mercantile" then
    self.sell_cost = 0
  end
  return ret
end

SMODS.Consumable {
  key = "co_interest",
  set = "mercantile",
  config = { extra = { dollars = 4 } },
  pos = { x = 0, y = 0 },
  atlas = "AbandoniaMercantile",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.dollars,
      }
    }
  end,

  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0
  end,

  use = function(self, card, area, copier)
    for i = 1, #G.jokers.cards do
      local joker = G.jokers.cards[i]
      joker.sell_cost = joker.sell_cost + card.ability.extra.dollars
      card_eval_status_text(joker, 'extra', nil, nil, nil, {
        message = localize('k_val_up'),
        colour = G.C.MONEY
      })
      joker:juice_up(0.5, 0.5)
    end
  end,

  abn_artist_credits = {
    artist = "Sustato",
  },
}

SMODS.Consumable {
  key = "labor_market",
  set = "mercantile",
  config = { extra = { price = 1, jokers = 1 } },
  pos = { x = 1, y = 0 },
  atlas = "AbandoniaMercantile",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "rental", set = "Other", vars = { 3 } }
    return {
      vars = {
        card.ability.extra.price,
        card.ability.extra.jokers,
      }
    }
  end,

  can_use = function(self, card)
    if G.STATE == G.STATES.SHOP and G.shop_jokers and G.shop_jokers.highlighted then
      if #G.shop_jokers.highlighted == card.ability.extra.jokers then
        local target = G.shop_jokers.highlighted[1]
        if target.ability.set == 'Joker' and not target.ability.rental then
          return true
        end
      end
    end
    return false
  end,

  use = function(self, card, area, copier)
    if G.shop_jokers and G.shop_jokers.highlighted and #G.shop_jokers.highlighted == card.ability.extra.jokers then
      local target = G.shop_jokers.highlighted[1]
      if target.ability.set == 'Joker' then
        target:set_rental(true)
        target:set_cost(card.ability.extra.price)
        target:juice_up(0.5, 0.5)
      end
    end
  end,

  abn_artist_credits = {
    artist = "Sustato",
  },
}

SMODS.Consumable {
  key = "finance_leverage",
  set = "mercantile",
  config = {},
  pos = { x = 2, y = 0 },
  atlas = "AbandoniaMercantile",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  can_use = function(self, card)
    return G.GAME and G.GAME.blind and G.GAME.blind.in_blind and G.GAME.dollars > 0
  end,

  use = function(self, card, area, copier)
    if G.GAME.blind.boss then
		G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 1.5)
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		ease_dollars(G.GAME.dollars*2)
	else
		G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 1.5)
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		ease_dollars(G.GAME.dollars)
	end
  end,

  abn_artist_credits = {
    artist = "Sustato",
  },
}

SMODS.Consumable {
  key = "finance_leverage",
  set = "mercantile",
  config = {},
  pos = { x = 3, y = 0 },
  atlas = "AbandoniaMercantile",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  can_use = function(self, card)
    return true
  end,

  use = function(self, card, area, copier)
    
  end,

  abn_artist_credits = {
    artist = "Sustato",
  },
}

SMODS.Consumable {
  key = "bargain",
  set = "mercantile",
  config = { extra = { odds = 2, percent = 25 } },
  pos = { x = 3, y = 0 },
  atlas = "AbandoniaMercantile",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME and G.GAME.probabilities.normal or 1,
        card.ability.extra.odds,
        card.ability.extra.percent,
      }
    }
  end,

  can_use = function(self, card)
    return true
  end,

  use = function(self, card, area, copier)
    if pseudorandom('bargain') < G.GAME.probabilities.normal / card.ability.extra.odds then
      G.GAME.discount_percent = (G.GAME.discount_percent or 0) + card.ability.extra.percent
    else
      G.GAME.discount_percent = (G.GAME.discount_percent or 0) - card.ability.extra.percent
      card_eval_status_text(card, 'extra', nil, nil, nil, {
        message = localize('k_nope_ex'),
        colour = G.C.SECONDARY_SET.Tarot
      })
      local new_card = copy_card(card, nil)
      new_card:add_to_deck()
      G.consumeables:emplace(new_card)
    end
  end,

  abn_artist_credits = {
    artist = "Sustato",
  },
}

local add_to_highlighted_ref = CardArea.add_to_highlighted
function CardArea:add_to_highlighted(card, silent)
    local multi_limits = {}
    if G.shop_booster  then multi_limits[G.shop_booster]  = 9999 end  
    if G.shop_vouchers then multi_limits[G.shop_vouchers] = 9999 end 

    local limit = multi_limits[self]
    if limit and limit > 1 then
        if #self.highlighted >= limit then
            self:remove_from_highlighted(self.highlighted[1])
        end
        self.highlighted[#self.highlighted + 1] = card
        card:highlight(true)
        if not silent then play_sound('cardSlide1') end
        return
    end

    return add_to_highlighted_ref(self, card, silent)
end

SMODS.Consumable {
  key = "currency_conversion",
  set = "mercantile",
  config = { extra = { booster_max = 2, voucher_max = 1 } },
  pos = { x = 4, y = 0 },
  atlas = "AbandoniaMercantile",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.booster_max,
        card.ability.extra.voucher_max,
      }
    }
  end,

  can_use = function(self, card)
    if G.STATE ~= G.STATES.SHOP then return false end

    if G.shop_booster and G.shop_booster.highlighted then
      if #G.shop_booster.highlighted >= 1 and #G.shop_booster.highlighted <= card.ability.extra.booster_max then
        return true
      end
    end

    if G.shop_vouchers and G.shop_vouchers.highlighted then
      if #G.shop_vouchers.highlighted == card.ability.extra.voucher_max then
        return true
      end
    end

    return false
  end,

  use = function(self, card, area, copier)

    if G.shop_booster and G.shop_booster.highlighted and #G.shop_booster.highlighted > 0 then
      local highlighted_boosters = {}
      for _, c in ipairs(G.shop_booster.highlighted) do
        table.insert(highlighted_boosters, c)
      end

      for i, b_card in ipairs(highlighted_boosters) do
        local pack_key = get_pack('shop_pack').key
        local pos = b_card.ability and b_card.ability.booster_pos or i
        if G.GAME.current_round and G.GAME.current_round.used_packs then
          G.GAME.current_round.used_packs[pos] = pack_key
        end

        local c = G.shop_booster:remove_card(b_card)
        c:remove()

        local new_card = Card(
          G.shop_booster.T.x + G.shop_booster.T.w / 2,
          G.shop_booster.T.y,
          G.CARD_W * 1.27,
          G.CARD_H * 1.27,
          G.P_CARDS.empty,
          G.P_CENTERS[pack_key],
          { bypass_discovery_center = true, bypass_discovery_ui = true }
        )
        create_shop_card_ui(new_card, 'Booster', G.shop_booster)
        new_card.ability.booster_pos = pos
        new_card:start_materialize()
        G.shop_booster:emplace(new_card)
      end

    elseif G.shop_vouchers and G.shop_vouchers.highlighted and #G.shop_vouchers.highlighted > 0 then
      local v_card = G.shop_vouchers.highlighted[1]
      local voucher_key = get_next_voucher_key(true)

      if voucher_key then
        local c = G.shop_vouchers:remove_card(v_card)
        c:remove()

        local new_voucher = Card(
          G.shop_vouchers.T.x + G.shop_vouchers.T.w / 2,
          G.shop_vouchers.T.y,
          G.CARD_W,
          G.CARD_H,
          G.P_CARDS.empty,
          G.P_CENTERS[voucher_key],
          { bypass_discovery_center = true, bypass_discovery_ui = true }
        )
        create_shop_card_ui(new_voucher, 'Voucher', G.shop_vouchers)
        new_voucher:start_materialize()
        G.shop_vouchers:emplace(new_voucher)
      end
    end
  end,

  abn_artist_credits = {
    artist = "Sustato",
  },
}