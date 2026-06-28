-- Giacomo King of Jesters and Giacomo Hidden Scoundral (coded by cloudzXIII)

SMODS.Joker {
  key = 'giacomo',

  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    info_queue[#info_queue + 1] = G.P_CENTERS.j_joker
    return { vars = { cae.e_mult }, key = self.key .. "_" .. cae.side }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 2, y = 8 },
  soul_pos = { x = 3, y = 8 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { e_mult = 1.8, side = "king" } },

  update = function(self, card)
    if card.VT.w <= 0 then
      if card.ability.extra.side == 'king' then
        card.children.center:set_sprite_pos({ x = 2, y = 8 })
        card.children.floating_sprite:set_sprite_pos({ x = 3, y = 8 })
      else
        card.children.center:set_sprite_pos({ x = 4, y = 8 })
        card.children.floating_sprite:set_sprite_pos({ x = 5, y = 8 })
      end
    end
  end,

  calculate = function(self, card, context)
    if context.flip and not context.blueprint then
      if card.ability.extra.side == 'king' then
        card.ability.extra.side = 'hidden'
      else
        card.ability.extra.side = 'king'
      end
      card_eval_status_text(card, 'extra', nil, nil, nil, {
        message = G.localization.misc.dictionary
            ['abn_' .. (card.ability.extra.side == 'hidden' and 'king' or 'hidden') .. '_side'],
        colour = G.C.RED,
        instant = true
      })
    end
    if context.individual and context.cardarea == G.play then
      local id = context.other_card:get_id()
      local triggered = false
      print(card.ability.extra.side)
      if id == SMODS.Ranks["abn_11"].id or id == SMODS.Ranks["abn_12"].id or id == SMODS.Ranks["abn_13"].id or id == SMODS.Ranks["abn_14"].id then
        if card.ability.extra.side == "king" and (context.other_card:is_suit("Clubs") or context.other_card:is_suit("Diamonds")) then
          triggered = true
        end
        if card.ability.extra.side == "hidden" and (context.other_card:is_suit("Spades") or context.other_card:is_suit("Hearts")) then
          triggered = true
        end
        if triggered then
          if card.ability.extra.side == 'king' then
            card.ability.extra.side = 'hidden'
          else
            card.ability.extra.side = 'king'
          end
          G.E_MANAGER:add_event(Event({
            func = function()
              card:flip()
              return true
            end
          }))
          return {
            emult = card.ability.extra.e_mult,
          }
        end
      end
    end
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  abn_artist_credits = {
    artist = "Gfs",
  },
}
