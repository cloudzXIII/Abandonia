-- Gloss Tag
SMODS.Tag {
  key = "gloss",
  pos = { x = 0, y = 0 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_gloss
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_gloss", set = "Edition" })
      }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card.temp_edition = nil
          context.card:set_edition("e_abn_gloss", true)
          context.card.ability.couponed = true
          context.card:set_cost()
          G.CONTROLLER.locks[lock] = nil
          return true
        end)
        tag.triggered = true
        return true
      end
    end
  end,
  in_pool = function(self, args)
    return G.P_CENTERS["e_abn_gloss"].discovered
  end
}

-- Pearlenscene Tag
SMODS.Tag {
  key = "pearlenscene",
  pos = { x = 1, y = 0 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_pearlenscene
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_pearlenscene", set = "Edition" })
      }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card.temp_edition = nil
          context.card:set_edition("e_abn_pearlenscene", true)
          context.card.ability.couponed = true
          context.card:set_cost()
          G.CONTROLLER.locks[lock] = nil
          return true
        end)
        tag.triggered = true
        return true
      end
    end
  end,
  in_pool = function(self, args)
    return G.P_CENTERS["e_abn_pearlenscene"].discovered
  end
}

-- Iridescent Tag
SMODS.Tag {
  key = "iridescent",
  pos = { x = 2, y = 0 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_iridescent
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_iridescent", set = "Edition" })
      }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card.temp_edition = nil
          context.card:set_edition("e_abn_iridescent", true)
          context.card.ability.couponed = true
          context.card:set_cost()
          G.CONTROLLER.locks[lock] = nil
          return true
        end)
        tag.triggered = true
        return true
      end
    end
  end,
  in_pool = function(self, args)
    return G.P_CENTERS["e_abn_iridescent"].discovered
  end
}

-- Abandon Tag
SMODS.Tag {
  key = "abandon",
  pos = { x = 3, y = 0 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_abandond
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_abandond", set = "Edition" })
      }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card.temp_edition = nil
          context.card:set_edition("e_abn_abandond", true)
          context.card.ability.couponed = true
          context.card:set_cost()
          G.CONTROLLER.locks[lock] = nil
          return true
        end)
        tag.triggered = true
        return true
      end
    end
  end,
  in_pool = function(self, args)
    return G.P_CENTERS["e_abn_abandond"].discovered
  end
}

-- Sunscourge Tag
SMODS.Tag {
  key = "sunscourge",
  pos = { x = 4, y = 0 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_sunscourge
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_sunscourge", set = "Edition" })
      }
    }
  end,
  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card.temp_edition = nil
          context.card:set_edition("e_abn_sunscourge", true)
          context.card.ability.couponed = true
          context.card:set_cost()
          G.CONTROLLER.locks[lock] = nil
          return true
        end)
        tag.triggered = true
        return true
      end
    end
  end,
  in_pool = function(self, args)
    return G.P_CENTERS["e_abn_sunscourge"].discovered
  end
}

-- Calamity Tag
SMODS.Tag {
  key = "calamity",
  min_ante = 2,
  pos = { x = 0, y = 1 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.p_abn_calamitybooster
  end,
  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true
      tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
        local booster = SMODS.create_card { key = 'p_abn_calamitybooster', area = G.play }
        booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
        booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
        booster.T.w = G.CARD_W * 1.27
        booster.T.h = G.CARD_H * 1.27
        booster.cost = 0
        booster.from_tag = true
        G.FUNCS.use_card({ config = { ref_table = booster } })
        booster:start_materialize()
        G.CONTROLLER.locks[lock] = nil
        return true
      end)
      tag.triggered = true
      return true
    end
  end
}

-- Sigil Tag
SMODS.Tag {
  key = "sigil",
  min_ante = 2,
  pos = { x = 1, y = 1 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.p_abn_sigilbooster
  end,
  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true
      tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
        local booster = SMODS.create_card { key = 'p_abn_sigilbooster', area = G.play }
        booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
        booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
        booster.T.w = G.CARD_W * 1.27
        booster.T.h = G.CARD_H * 1.27
        booster.cost = 0
        booster.from_tag = true
        G.FUNCS.use_card({ config = { ref_table = booster } })
        booster:start_materialize()
        G.CONTROLLER.locks[lock] = nil
        return true
      end)
      tag.triggered = true
      return true
    end
  end
}

-- Astro Tag
SMODS.Tag {
  key = "astro",
  min_ante = 2,
  pos = { x = 2, y = 1 },
  atlas = "AbandoniaTags",
  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.p_abn_astrobooster
  end,
  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true
      tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
        local booster = SMODS.create_card { key = 'p_abn_astrobooster', area = G.play }
        booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
        booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
        booster.T.w = G.CARD_W * 1.27
        booster.T.h = G.CARD_H * 1.27
        booster.cost = 0
        booster.from_tag = true
        G.FUNCS.use_card({ config = { ref_table = booster } })
        booster:start_materialize()
        G.CONTROLLER.locks[lock] = nil
        return true
      end)
      tag.triggered = true
      return true
    end
  end
}
