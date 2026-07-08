local function choose_joker()
  G.GAME.abn_emergency_contact = true
  G.FUNCS.overlay_menu({ definition = create_UIBox_your_collection_jokers() })
end

SMODS.Joker {
  key = 'emergency_contact',
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.rounds,
        card.ability.extra.current,
      }
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet13',
  pos = { x = 6, y = 4 },
  cost = 5,
  discovered = false,
  blueprint_compat = false,

  config = {
    extra = {
      rounds = 3,
      current = 0,
    },

  },

  calculate = function(self, card, context)
    if context.selling_self and not context.blueprint and not context.retrigger_joker then
      if card.ability.extra.current == card.ability.extra.rounds then
        choose_joker()
      end
    end
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      if card.ability.extra.current == card.ability.extra.rounds then
        local eval = function(card) return not card.REMOVED end
        juice_card_until(card, eval, true)
      else
        card.ability.extra.current = card.ability.extra.current + 1
      end
      return {
        message = (card.ability.extra.current < card.ability.extra.rounds) and
            (card.ability.extra.current .. '/' .. card.ability.extra.rounds) or
            localize('k_active_ex'),
        colour = G.C.ATTENTION
      }
    end
  end,


  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}

local ccl = Card.click
function Card:click()
  local ret = ccl(self)
  if G.GAME.abn_emergency_contact then
    local center = self.config.center
    if self:is_rarity("Rare") and center.discovered then
      local key = center.key
      local added_card = SMODS.create_card({
        key = key
      })
      added_card:add_sticker("perishable", true)
      G.jokers:emplace(added_card)
      added_card:add_to_deck()
      G.GAME.abn_emergency_contact = nil
      G.FUNCS.exit_overlay_menu()
    end
  end
  return ret
end

local overlay_menu = G.FUNCS.exit_overlay_menu
G.FUNCS.exit_overlay_menu = function(e)
  local ret = overlay_menu(e)
  if G.GAME.abn_emergency_contact ~= nil then
    G.GAME.abn_emergency_contact = nil
  end
  return ret
end
