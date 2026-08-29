ABN.EnhSticker = SMODS.Sticker:extend{
    apply = function(self, card, val)
        if val then
            for _, key in ipairs(ABN.enh_stickers_list) do
              card:remove_sticker(key)
            end
        end
        card.ability[self.key] = val
    end,
    default_compat = false,
    no_collection =  false,
}


ABN.EnhSticker {
  key = 'stk_bonus',
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 13 },
  badge_colour = HEX("1FAEFF"),
  
  loc_vars = function(self, info_queue, card)
    return { vars = {self.config.extra.chips}}
  end,
  config = {
    extra = { 
      chips = 30,
    }
  },
  
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = self.config.extra.chips
      }
    end
  end,
}

ABN.EnhSticker {
  key = 'stk_mult',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 13 },
  badge_colour = HEX("FE5F55"),
  
  loc_vars = function(self, info_queue, card)
    return { vars = {self.config.extra.mult}}
  end,
  config = {
    extra = { 
      mult = 4,
    }
  },
  
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = self.config.extra.mult
      }
    end
  end,
  
}

ABN.EnhSticker {
  key = 'stk_wild',
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 13 },
  badge_colour = HEX("4F6367"),
  
  loc_vars = function(self, info_queue, card)
    return { vars = {}}
  end,
  config = {
    extra = { 
    }
  },
  
  
}

ABN.EnhSticker {
  key = 'stk_gold',
  atlas = "AbandoniaStickers",
  pos = { x = 3, y = 13 },
  badge_colour = HEX("CCA757"),
  
  loc_vars = function(self, info_queue, card)
    return { vars = {self.config.extra.dollars}}
  end,
  config = {
    extra = { 
      dollars = 3,
    }
  },
  
  
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false then
      return {
        dollars = self.config.extra.dollars,
      }
    end
  end,
  
}

ABN.EnhSticker {
  key = 'stk_steel',
  atlas = "AbandoniaStickers",
  pos = { x = 4, y = 13 },
  badge_colour = HEX("ADBDD7"),
  
  loc_vars = function(self, info_queue, card)
    return { vars = {self.config.extra.xmult}}
  end,
  config = {
    extra = { 
      xmult = 1.5,
    }
  },
  
  
  calculate = function(self, card, context)
    if context.final_scoring_step then
      return {
        xmult = self.config.extra.xmult
      }
    end
  end,
}

ABN.EnhSticker {
  key = 'stk_stone',
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 14 },
  badge_colour = HEX("B9BDC2"),
  
  loc_vars = function(self, info_queue, card)
    return { vars = {self.config.extra.chips}}
  end,
  config = {
    extra = { 
      chips = 15,
    }
  },
  
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = self.config.extra.chips
      }
    end
    if context.modify_scoring_hand and not context.blueprint then
      return {
        add_to_hand = true
      }
    end
  end,
}

ABN.EnhSticker {
  key = 'stk_glass',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 14 },
  badge_colour = HEX("89D4E5"),
  
  loc_vars = function(self, info_queue, card)
    local n, d = SMODS.get_probability_vars(card,self.config.extra.n,self.config.extra.d,"abn_stk_glass",pseudoseed("abn_stk_glass"))
    return { vars = {self.config.extra.xmult, n, d}}
  end,
  config = {
    extra = { 
      n = 1,
      d = 4,
      xmult = 2,
    }
  },
  
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        xmult = self.config.extra.xmult
      }
    end
    if (context.after and SMODS.pseudorandom_probability(card, "abn_stk_glass", self.config.extra.n,self.config.extra.d)) then
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = function()
          card:shatter()
          SMODS.calculate_context({ joker_type_destroyed = true, card = card, shatters = true })
          return true
        end
      }))
    end
  end,
}

ABN.EnhSticker {
  key = 'stk_lucky',
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 14 },
  badge_colour = HEX("5EA07D"),
  
  loc_vars = function(self, info_queue, card)
    local n, d = SMODS.get_probability_vars(card,self.config.extra.n,self.config.extra.d,"abn_stk_lucky",pseudoseed("abn_stk_lucky"))
    local n2, d2 = SMODS.get_probability_vars(card,self.config.extra.n2,self.config.extra.d2,"abn_stk_lucky2",pseudoseed("abn_stk_lucky2"))
    return { vars = { n, d, self.config.extra.mult,n2, d2, self.config.extra.dollars,}}
  end,
  config = {
    extra = { 
      mult = 20,
      dollars = 20,
      n = 1,
      d = 4,
      n2 = 1,
      d2 = 15,
    }
  },
  
  
  calculate = function(self, card, context)
    if context.joker_main then
      local ret = {}
      
      if SMODS.pseudorandom_probability(card, "abn_stk_lucky", self.config.extra.n,self.config.extra.d) then
        card.lucky_trigger = true
        ret.mult = self.config.extra.mult
      end
      if SMODS.pseudorandom_probability(card, "abn_stk_lucky2", self.config.extra.n2,self.config.extra.d2) then
        card.lucky_trigger = true
        ret.dollars = self.config.extra.dollars
      end
    end
    if context.after then
      local cats = SMODS.find_card("j_lucky_cat", false)
      if card.lucky_trigger == true then
        for _, cat in ipairs(cats) do
          
          SMODS.scale_card(cat, {
            ref_table = cat.ability,
            ref_value = "x_mult",
            scalar_value = "extra",
            scaling_message = {
              message_key = 'a_xmult',
              colour = G.C.RED
            }
          })
        end
        card.lucky_trigger = false
      end
      return ret
    end
  end,
  
}

ABN.EnhSticker {
  key = 'stk_petroleum',
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 16 },
  badge_colour = HEX("374649"),
  
  loc_vars = function(self, info_queue, card)
    return { vars = {self.config.extra.chips,self.config.extra.dollars, n, d,}}
  end,
  config = {
    extra = { 
      chips = 100,
      dollars = 2,
    }
  },
  
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = self.config.extra.chips,
        dollars = self.config.extra.dollars
      }
    end
    if context.after and context.main_eval and not context.blueprint then
      if SMODS.last_hand_oneshot then
        card:juice_up(0.3, 0.4)
        card.ability.abn_burnt = true
        card:add_sticker("abn_stk_oilfire", true)  
      end
    end
  end,
  
}
ABN.EnhSticker {
  key = 'stk_oilfire',
  atlas = "AbandoniaStickers",
  pos = { x = 2, y = 15 },
  badge_colour = HEX("AD6E52"),
  
  loc_vars = function(self, info_queue, card)
    local n, d = SMODS.get_probability_vars(card,self.config.extra.n,self.config.extra.d,"abn_stk_oilfire",pseudoseed("abn_stk_oilfire"))
    return { vars = {self.config.extra.mult,self.config.extra.dollars, n, d,}}
  end,
  config = {
    extra = { 
      mult = 10,
      dollars = 3,
      n = 1,
      d = 2,
      
    }
  },
  
  
  calculate = function(self, card, context)
    if context.before and card.ability.abn_burnt then
      card.ability.abn_burnt = nil
    end
    if context.joker_main then
      return {
        xmult = self.config.extra.xmult,
        dollars = -self.config.extra.dollars
      }
    end
    if (context.after 
    and SMODS.pseudorandom_probability(card, "abn_stk_oilfire", self.config.extra.n,self.config.extra.d)) 
    and not card.getting_sliced 
    and not card.ability.abn_burnt then
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = function()
          SMODS.destroy_cards(card)
          SMODS.calculate_context({ joker_type_destroyed = true, card = card, shatters = false })
          return true
        end
      }))
    end
  end,
  
}

ABN.EnhSticker {
  key = 'stk_mercurial',
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 15 },
  badge_colour = HEX("FC80A1"),
  
  loc_vars = function(self, info_queue, card)
    local _key = card.ability[self.key .. "_t"] and card.ability[self.key .. "_t"] or self.config.extra
    return { vars = {_key.chips_mod,_key.chips,}}
  end,
  config = {
    extra = { 
      chips = 0,
      chips_mod = 5,
      
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
      card.ability[self.key .. "_t"] = {}

      for k, v in pairs(self.config.extra) do
          card.ability[self.key .. "_t"][k] = v
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = card.ability[self.key .. "_t"].chips
      }
    end
    if context.before then
      local suits, num = {}, 0
      for k, v in pairs(context.scoring_hand) do
        if not suits[v.base.suit] then
          suits[v.base.suit] = true
          num = num + 1
        end
      end
      for i = 1, num do
        SMODS.scale_card(card, {
          ref_table = card.ability[self.key .. "_t"],
          ref_value = "chips",
          scalar_value = "chips_mod",
          no_message = true
        })
      end
      if #context.scoring_hand > 0 then
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, card)
      end
    end
  end,
}

ABN.EnhSticker {
  key = 'stk_kintsugi',
  atlas = "AbandoniaStickers",
  pos = { x = 3, y = 19 },
  badge_colour = HEX("E0AC55"),
  
  loc_vars = function(self, info_queue, card)
    local n1, d1 = SMODS.get_probability_vars(card, self.config.extra.n_clone, self.config.extra.d_clone, 'abn_stk_kintsugi_1')
    local n2, d2 = SMODS.get_probability_vars(card, self.config.extra.n_double, self.config.extra.d_double, 'abn_stk_kintsugi_2')
    local _key = card.ability[self.key .. "_t"] and card.ability[self.key .. "_t"] or self.config.extra
    return { vars = { _key.chips, _key.mult, _key.dollars, n1, d1, n2, d2 } }
  end,
  config = {
    extra = {
      chips = 1,
      mult = 1,
      dollars = 1,
      n_clone = 1,
      d_clone = 7,
      n_double = 1,
      d_double = 9,
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
      card.ability[self.key .. "_t"] = {}

      for k, v in pairs(self.config.extra) do
          card.ability[self.key .. "_t"][k] = v
      end
    end
    card.ability[self.key] = val
    card.ability.cloned = nil 
  end,
  
  calculate = function(self, card, context)
    if context.ante_change and context.ante_end then
        if card.ability.cloned == true then 
            card.ability.cloned = nil 
            return {
                message = localize("k_reset")
            }
        end
    end
    if context.remove_playing_cards 
    and not context.blueprint 
    and SMODS.pseudorandom_probability(card, "abn_stk_kintsugi_1", self.config.extra.n_clone, self.config.extra.d_clone) and not card.ability.cloned then
      card.ability.cloned = true
      local chosen_joker = card
      local is_negative = (card.edition and card.edition.key == "e_negative") and 1 or 0
      if #G.jokers.cards < G.jokers.config.card_limit + is_negative then
        
        local copied_joker = copy_card(chosen_joker, nil, nil, nil, chosen_joker.edition and chosen_joker.edition.negative)
        copied_joker.ability.cloned = true
        if copied_joker.ability.invis_rounds then copied_joker.ability.invis_rounds = 0 end
        if type(copied_joker.ability.extra) == "table" and copied_joker.ability.extra.invis_rounds then copied_joker.ability.extra.invis_rounds = 0 end
        copied_joker:add_to_deck()
        G.jokers:emplace(copied_joker)
      end
    end
    
    if context.joker_main then
      local ret = {}
      if SMODS.pseudorandom_probability(card, "abn_stk_kintsugi_1", self.config.extra.n_double, self.config.extra.d_double) then
        SMODS.scale_card(card, {
          ref_table = card.ability[self.key .. "_t"],
          ref_value = "chips",
          scalar_value = "chips",
          no_message = true,
        })
        SMODS.scale_card(card, {
          ref_table = card.ability[self.key .. "_t"],
          ref_value = "mult",
          scalar_value = "mult",
          no_message = true,
        })
        SMODS.scale_card(card, {
          ref_table = card.ability[self.key .. "_t"],
          ref_value = "dollars",
          scalar_value = "dollars",
          no_message = true,
        })
        ret.message = localize('k_upgrade_ex')
        ret.colour = G.C.ATTENTION
      end
      ret.chips = card.ability[self.key .. "_t"].chips
      ret.mult = card.ability[self.key .. "_t"].mult
      ret.dollars = card.ability[self.key .. "_t"].dollars
      ret.card = card
      return ret
    end
  end,
}
ABN.EnhSticker {
  key = 'stk_infra',
  atlas = "AbandoniaStickers",
  pos = { x = 0, y = 16 },
  badge_colour = HEX("C55A84"),
  
  loc_vars = function(self, info_queue, card)
    local _key = card.ability[self.key .. "_t"] and card.ability[self.key .. "_t"] or self.config.extra
    return { vars = {_key.mult,_key.mult_mod,_key.chips,_key.chips_mod,}}
  end,
  config = {
    extra = { 
      mult = 0, 
      mult_mod = 2, 
      chips = 0, 
      chips_mod = 3,
      
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
      card.ability[self.key .. "_t"] = {}

      for k, v in pairs(self.config.extra) do
          card.ability[self.key .. "_t"][k] = v
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.before then
      if #context.scoring_hand > 3 then
        SMODS.scale_card(card, {
            ref_table = card.ability[self.key .. "_t"],
            ref_value = "mult",
            scalar_value = "mult_mod",
            operation = function(ref_table, ref_value, initial, change)
              ref_table[ref_value] = initial + #context.scoring_hand * change
            end,
            no_message = true
        })
        SMODS.scale_card(card, {
            ref_table = card.ability[self.key .. "_t"],
            ref_value = "chips",
            scalar_value = "chips_mod",
            operation = function(ref_table, ref_value, initial, change)
              ref_table[ref_value] = initial + #context.scoring_hand * change
            end,
            no_message = true
        })

        if #context.scoring_hand > 0 then
          SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, card)
        end
        return {
          mult = card.ability[self.key .. "_t"].mult,
          chips = card.ability[self.key .. "_t"].chips,
        }
      else
        SMODS.destroy_cards(card)
      end
    end

    if context.destroy_card and (context.cardarea == G.play or context.cardarea == 'unscored') and (#context.scoring_hand or 0) <= 3 and context.destroy_card == card then
      return { remove = true }
    end
  end,
}
ABN.EnhSticker {
  key = 'stk_hazard',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 16 },
  badge_colour = HEX("F5C678"),
  
  loc_vars = function(self, info_queue, card)
    local n1, d1 = SMODS.get_probability_vars(card, self.config.extra.n1, self.config.extra.d1, 'abn_stk_hazard')
    local _key = card.ability[self.key .. "_t"] and card.ability[self.key .. "_t"] or self.config.extra
    return { vars = {_key.xmult,_key.xmult_mod,n1,d1,self.config.extra.xblind}}
  end,
  config = {
    extra = { 
      xmult = 2, 
      xmult_mod = 0.25, 
      n1 = 1, 
      d1 = 10,
      xblind = 1.1
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
      card.ability[self.key .. "_t"] = {}

      for k, v in pairs(self.config.extra) do
          card.ability[self.key .. "_t"][k] = v
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      local hazard_count = -1
      for i, v in ipairs(G.jokers.cards) do
        if v.ability[self.key] then
          hazard_count = hazard_count + 1
        end
      end

      if hazard_count >= 1 then
        SMODS.scale_card(card, {
          ref_table = card.ability[self.key .. "_t"],
          ref_value = "xmult",
          scalar_value = "xmult_mod",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + (hazard_count * change)
          end,
        })
      end

      return {
        xblindsize = self.config.extra.xblind,
        xmult = card.ability[self.key .. "_t"].xmult,
        card = card
      }
    end

    if context.retrigger_joker_check and context.other_card == card then
      if SMODS.pseudorandom_probability(card, "abn_stk_hazard", self.config.extra.n1, self.config.extra.d1) then
        return {
          message = localize('k_again_ex'),
          repetitions = 1,
          card = card
        }
      end
    end
  end,
}

ABN.EnhSticker {
  key = 'stk_wallpaper',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 19 },
  badge_colour = HEX("C7B496"),
  
  loc_vars = function(self, info_queue, card)
    local _key = card.ability[self.key .. "_t"] and card.ability[self.key .. "_t"] or self.config.extra
    return { vars = {_key.mult,_key.mult_mod,_key.chips,_key.chips_mod,}}
  end,
  config = {
    extra = { 
      mult = 0, 
      mult_mod = 1, 
      chips = 0, 
      chips_mod = 2,
      
    }
  },
  apply = function(self, card, val)
    if val then
      for _, key in ipairs(ABN.enh_stickers_list) do
        card:remove_sticker(key)
      end
      card.ability[self.key .. "_t"] = {}

      for k, v in pairs(self.config.extra) do
          card.ability[self.key .. "_t"][k] = v
      end
    end
    card.ability[self.key] = val
  end,
  
  calculate = function(self, card, context)
    if context.before then
      local seals_scored = 0
      local seals_held = 0
      for _, v in ipairs(context.scoring_hand) do
        if v.seal then
          seals_scored = seals_scored + 1
        end
      end
      for _, v in ipairs(G.hand.cards) do
        if v and v.seal then
          seals_held = seals_held + 1
        end
      end
      if seals_scored > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability[self.key .. "_t"],
          ref_value = "mult",
          scalar_value = "mult_mod",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + seals_scored * change
          end,
          no_message = true
        })
      end
      if seals_held > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability[self.key .. "_t"],
          ref_value = "chips",
          scalar_value = "chips_mod",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + seals_scored * change
          end,
          no_message = true
        })
      end
      if seals_scored > 0 or seals_held > 0 then
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, card)
      end
    end
    if context.joker_main then
      return {
        mult = card.ability[self.key .. "_t"].mult,
        chips = card.ability[self.key .. "_t"].chips
      }
    end
  end,
}

ABN.EnhSticker {
  key = 'stk_fossil',
  atlas = "AbandoniaStickers",
  pos = { x = 1, y = 15 },
  badge_colour = HEX("A58968"),
  
  loc_vars = function(self, info_queue, card)
    local n, d = SMODS.get_probability_vars(card,self.config.extra.n,self.config.extra.d,"abn_stk_fossil",pseudoseed("abn_stk_fossil"))
    return { vars = {self.config.extra.xmult,self.config.extra.dollars, n, d,}}
  end,
  config = {
    extra = { 
      xmult = 3,
      dollars = 10,
      n = 1,
      d = 2,
      
    }
  },
  
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        xmult = self.config.extra.xmult,
        dollars = self.config.extra.dollars
      }
    end
    if (context.after and SMODS.pseudorandom_probability(card, "abn_stk_fossil", self.config.extra.n,self.config.extra.d)) then
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = function()
          SMODS.destroy_cards(card)
          SMODS.calculate_context({ joker_type_destroyed = true, card = card, shatters = false })
          return true
        end
      }))
    end
  end,
  
}


ABN.monitor_suits = {
    {key = "diamonds",   suit="Diamonds",		x=1, y=17},
    {key = "spades",      suit="Spades",		x=2, y=17},
    {key = "clubs",         suit="Clubs",			x=3, y=17},
    {key = "hearts",        suit="Hearts",			x=4, y=17},
}
ABN.EnhSticker {
    key = 'stk_monitor',
    atlas = "AbandoniaStickers",
    pos = { x = 0, y = 17 },
    badge_colour = HEX("56A786"),
    needs_enable_flag = true,
    rate = 0,
    
}
for _, suit in ipairs(ABN.monitor_suits) do
  ABN.EnhSticker {
    key = 'stk_monitor_'..suit.key,
    atlas = "AbandoniaStickers",
    pos = { x = suit.x, y = suit.y },
    badge_colour = HEX("56A786"),
    no_collection = true,
    loc_vars = function(self, info_queue, card)
      return { vars = {self.config.extra.suit}}
    end,
    config = {
      extra = { 
        suit = suit.suit
      }
    },
    
    
    calculate = function(self, card, context)
      if context.final_scoring_step then
        local match_count = 0
        if context.scoring_hand then
          for _, sc in ipairs(context.scoring_hand) do
            if sc:is_suit(self.config.extra.suit) then
              match_count = match_count + 1
            end
          end
        end

        if match_count > 1 then
          return {
            e_mult = match_count,
            card = card,
          }
        end
      end
    end,
    
  }
end
























ABN.enh_stickers_vars = {
  abn_stk_bonus     = SMODS.Stickers["abn_stk_bonus"] and {
    SMODS.Stickers["abn_stk_bonus"].config.extra.chips
  },
  abn_stk_mult     =  SMODS.Stickers["abn_stk_mult"] and {
    SMODS.Stickers["abn_stk_mult"].config.extra.mult 
  },
  abn_stk_gold     =  SMODS.Stickers["abn_stk_gold"] and {
    SMODS.Stickers["abn_stk_gold"].config.extra.dollars 
  },
  abn_stk_stone     = SMODS.Stickers["abn_stk_stone"] and {
    SMODS.Stickers["abn_stk_stone"].config.extra.chips
  },
  abn_stk_glass     = SMODS.Stickers["abn_stk_glass"] and {
    SMODS.Stickers["abn_stk_glass"].config.extra.xmult, 
    SMODS.Stickers["abn_stk_glass"].config.extra.n, 
    SMODS.Stickers["abn_stk_glass"].config.extra.d,
  },
  abn_stk_steel     = SMODS.Stickers["abn_stk_steel"] and {
    SMODS.Stickers["abn_stk_steel"].config.extra.xmult 
  },
  abn_stk_lucky     = SMODS.Stickers["abn_stk_lucky"] and {
    SMODS.Stickers["abn_stk_lucky"].config.extra.n, 
    SMODS.Stickers["abn_stk_lucky"].config.extra.d, 
    SMODS.Stickers["abn_stk_lucky"].config.extra.mult,
    SMODS.Stickers["abn_stk_lucky"].config.extra.n2, 
    SMODS.Stickers["abn_stk_lucky"].config.extra.d2, 
    SMODS.Stickers["abn_stk_lucky"].config.extra.dollars,
  },
  abn_stk_fossil     = SMODS.Stickers["abn_stk_fossil"] and {
    SMODS.Stickers["abn_stk_fossil"].config.extra.xmult,
    SMODS.Stickers["abn_stk_fossil"].config.extra.dollars,
    SMODS.Stickers["abn_stk_fossil"].config.extra.n, 
    SMODS.Stickers["abn_stk_fossil"].config.extra.d,
  },
  abn_stk_petroleum     = SMODS.Stickers["abn_stk_petroleum"] and {
    SMODS.Stickers["abn_stk_petroleum"].config.extra.chips,
    SMODS.Stickers["abn_stk_petroleum"].config.extra.dollars,
  },
  abn_stk_oilfire     = SMODS.Stickers["abn_stk_oilfire"] and {
    SMODS.Stickers["abn_stk_oilfire"].config.extra.mult,
    SMODS.Stickers["abn_stk_oilfire"].config.extra.dollars,
    SMODS.Stickers["abn_stk_oilfire"].config.extra.n, 
    SMODS.Stickers["abn_stk_oilfire"].config.extra.d,
  },
  abn_stk_mercurial     = SMODS.Stickers["abn_stk_mercurial"] and {
    SMODS.Stickers["abn_stk_mercurial"].config.extra.chips_mod,
    SMODS.Stickers["abn_stk_mercurial"].config.extra.chips,
  },
  abn_stk_wallpaper     = SMODS.Stickers["abn_stk_wallpaper"] and {
    SMODS.Stickers["abn_stk_wallpaper"].config.extra.mult,
    SMODS.Stickers["abn_stk_wallpaper"].config.extra.mult_mod,
    SMODS.Stickers["abn_stk_wallpaper"].config.extra.chips,
    SMODS.Stickers["abn_stk_wallpaper"].config.extra.chips_mod,
  },
  abn_stk_kintsugi     = SMODS.Stickers["abn_stk_kintsugi"] and {
    SMODS.Stickers["abn_stk_kintsugi"].config.extra.chips,
    SMODS.Stickers["abn_stk_kintsugi"].config.extra.mult,
    SMODS.Stickers["abn_stk_kintsugi"].config.extra.dollars,
    SMODS.Stickers["abn_stk_kintsugi"].config.extra.n_clone, 
    SMODS.Stickers["abn_stk_kintsugi"].config.extra.d_clone, 
    SMODS.Stickers["abn_stk_kintsugi"].config.extra.n_double, 
    SMODS.Stickers["abn_stk_kintsugi"].config.extra.d_double, 
  },
  abn_stk_infra     = SMODS.Stickers["abn_stk_infra"] and {
    SMODS.Stickers["abn_stk_infra"].config.extra.mult,
    SMODS.Stickers["abn_stk_infra"].config.extra.mult_mod,
    SMODS.Stickers["abn_stk_infra"].config.extra.chips,
    SMODS.Stickers["abn_stk_infra"].config.extra.chips_mod,
  },
  abn_stk_hazard     = SMODS.Stickers["abn_stk_hazard"] and {
    SMODS.Stickers["abn_stk_hazard"].config.extra.xmult,
    SMODS.Stickers["abn_stk_hazard"].config.extra.xmult_mod,
    SMODS.Stickers["abn_stk_hazard"].config.extra.n1,
    SMODS.Stickers["abn_stk_hazard"].config.extra.d1,
    SMODS.Stickers["abn_stk_hazard"].config.extra.xblind,
  },
}