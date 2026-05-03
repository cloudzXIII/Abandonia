-- Credits Tab

SMODS.ObjectType {
  key = "abn_credit_card",
  primary_colour = G.C.BLUE,
  secondary_colour = HEX("734933"),

  process_loc_text = function(self)
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_' .. string.lower(self.key), self.loc_txt, 'name')
    SMODS.process_loc_text(G.localization.descriptions.Other, 'undiscovered_' .. string.lower(self.key),
      self.loc_txt, 'undiscovered')

    G.C.SECONDARY_SET[self.key] = self.secondary_colour
    G.C.SET[self.key] = self.primary_colour
  end,
};

ABN.CreditCard = SMODS.Center:extend({
  class_prefix = "credit",
  set = "abn_credit_card",
  atlas = "abn_ABNJokerSheet1",
  pos = { x = 0, y = 0 },
  discovered = true,
  required_params = {
    "key",
  },
  config = {},
  no_mod_badges = true,
  inject = function(self)
    SMODS.Center.inject(self)
  end,
})

ABN.CreditCard {
  key = "cloudzXIII",
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_coder"), G.C.BLUE, G.C.WHITE, 1.2)
  end,
}
ABN.CreditCard {
  key = "bunnet",
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_founder"), G.C.DARK_EDITION, G.C.WHITE, 1.2)
    badges[#badges + 1] = create_badge(localize("k_abn_artist"), G.C.PURPLE, G.C.WHITE, 1.2)
  end,
}
ABN.CreditCard {
  key = "coderevo",
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_coder"), G.C.BLUE, G.C.WHITE, 1.2)
  end,
}
ABN.CreditCard {
  key = "ericthetoon",
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_coder"), G.C.BLUE, G.C.WHITE, 1.2)
  end,
}
ABN.CreditCard {
  key = "deleteduser",
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_coder"), G.C.BLUE, G.C.WHITE, 1.2)
  end,
}
ABN.CreditCard {
  key = "j8bit",
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_coder"), G.C.BLUE, G.C.WHITE, 1.2)
  end,
}
ABN.CreditCard {
  key = "marffe",
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_coder"), G.C.BLUE, G.C.WHITE, 1.2)
  end,
}
ABN.CreditCard {
  key = "mills",
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_coder"), G.C.BLUE, G.C.WHITE, 1.2)
  end,
}
ABN.CreditCard {
  key = "rkart",
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_music"), G.C.RED, G.C.WHITE, 1.2)
  end,
  --link = "https://www.youtube.com/@RKart-Musica"
}
ABN.CreditCard {
  key = "firch",
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_music"), G.C.RED, G.C.WHITE, 1.2)
  end,
}

local function create_abn_credit_area(cards, scale)
  scale = scale or 1
  local abn_credits = CardArea(
    G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
    5.25 * G.CARD_W * scale,
    0.95 * G.CARD_H * scale,
    { card_limit = #cards, type = 'title', highlight_limit = 0, collection = true }
  )

  local silent = false
  for i, center in ipairs(cards) do
    local card = Card(
      abn_credits.T.x + (abn_credits.T.w / 2),
      abn_credits.T.y,
      G.CARD_W * scale,
      G.CARD_H * scale,
      G.P_CARDS.empty,
      center,
      {
        bypass_discovery_center = true,
        bypass_discovery_ui = true,
        bypass_lock = true,
        viewing_back = false,
      }
    )
    abn_credits:emplace(card)
    card:hard_set_T(abn_credits.T.x + (abn_credits.T.w / 2))
    card.sprite_facing = 'front'
    card.facing = 'front'
    card:start_materialize({ G.C.RED }, silent)
    silent = true
  end
  return abn_credits
end
ABN.credits_tab = function()
  local title_text = DynaText({
    string = "Contributors",
    colours = { G.C.WHITE },
    shadow = true,
    float = true,
    silent = true,
    spacing = 5,
    scale = 1.3,
    rotate = true,
    pop_in = 0,
  })
  title_text.states.visible = false

  local first_cards = { "credit_abn_bunnet", "credit_abn_cloudzXIII", "credit_abn_ericthetoon", "credit_abn_coderevo" }
  local second_cards = { "credit_abn_deleteduser", "credit_abn_j8bit", "credit_abn_marffe", "credit_abn_firch",
    "credit_abn_rkart", "credit_abn_mills" }

  local loc_nodes = {}

  localize {
    type = "descriptions",
    set = "Other",
    key = "abn_credits",
    nodes = loc_nodes,
    vars = {}
  }

  return {
    n = G.UIT.ROOT,
    config = {
      emboss = 0.05,
      r = 0.1,
      align = "tm",
      padding = 0.2,
      colour = G.C.BLACK
    },
    nodes = {
      {
        n = G.UIT.R,
        config = { r = 0.1, minw = 4, align = "tm", padding = 0.2, colour = G.C.BLACK },
        nodes = {
          {
            n = G.UIT.C,
            config = { align = "cm", padding = 0.5, colour = darken(G.C.BLACK, 0.2), emboss = 0.05, r = 0.1 },
            nodes = {
              {
                n = G.UIT.R,
                config = { align = "cm" },
                nodes = {
                  { n = G.UIT.O, config = { object = title_text } },
                }
              },
              {
                n = G.UIT.R,
                config = { align = "cm", no_fill = true },
                nodes = {
                  { n = G.UIT.O, config = { object = create_abn_credit_area(first_cards) } },
                }
              },
              {
                n = G.UIT.R,
                config = { align = "cm", no_fill = true },
                nodes = {
                  { n = G.UIT.O, config = { object = create_abn_credit_area(second_cards, 0.75) } },
                }
              },
              {
                n = G.UIT.R,
                config = { align = "cm", no_fill = true },
                nodes = {
                  desc_from_rows(loc_nodes, true, 7)
                }
              },
            }
          },
        }
      },
    }
  }
end

--[[ potentially something for later, want to make it only for double clicks though
local click_ref = Card.click
function Card:click()
  local ret = click_ref(self)
  if self.ability.set == "abn_credit_card" and self.config.center.link then
    love.system.openURL(self.config.center.link)
  end
  return ret
end
]]
