-- Cenobite Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'cenobite_joker',

  rarity = 3,
  atlas = 'ABNJokerSheet1',
  pos = { x = 5, y = 5 },
  cost = 10,
  discovered = false,
  blueprint_compat = false,
  config = { extra = { type = "Two Pair" } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chthonian
    info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    return { vars = { localize(card.ability.extra.type, 'poker_hands') }, }
  end,


  calculate = function(self, card, context)
    if context.before and not context.blueprint and context.scoring_name == card.ability.extra.type then
      local light_suits = {}
      for _, v in ipairs(context.scoring_hand) do
        if ABN.is_light(v) then
          light_suits[#light_suits + 1] = v
        end
      end
      local first_card = light_suits[1]
      local last_card = light_suits[#light_suits]
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          first_card:set_edition("e_abn_chthonian", true)
          if last_card ~= first_card then
            last_card:set_edition("e_abn_chthonian", true)
          end
          card:juice_up(0.3, 0.5)
          return true
        end
      }))
    end
  end,
  abn_artist_credits = {
    artist = "Vlambambo",
  },
}
