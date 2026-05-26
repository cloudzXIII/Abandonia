-- Holy Mountain (coded by cloudzXIII)
SMODS.Joker {
  key = 'holy_mountain',

  rarity = 3,
  atlas = 'ABNJokerSheet10',
  pos = { x = 4, y = 3 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 0, chips_gain = 5, mult = 0, mult_gain = 2, type = "Full House" } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_sunscourge
    local cae = card.ability.extra
    return { vars = { cae.chips, cae.chips_gain, cae.mult, cae.mult_gain, localize(cae.type, 'poker_hands') } }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint and context.scoring_name == card.ability.extra.type then
      local snow_cards = {}
      for _, v in ipairs(context.scoring_hand) do
        if v:is_suit("abn_Snow") then
          snow_cards[#snow_cards + 1] = v
        end
      end
      if #snow_cards > 0 then
        local first_snow = snow_cards[1]
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.4,
          func = function()
            first_snow:set_edition("e_abn_sunscourge", true)
            card:juice_up(0.3, 0.5)
            return true
          end
        }))
      end
    end

    if context.individual and context.cardarea == G.play then
      if context.other_card.edition and context.other_card.edition.key == "e_abn_sunscourge" then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          scalar_value = "chips_gain",
          operation = '+',
          no_message = true,
        })
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_value = "mult_gain",
          operation = '+',
        })
      end
    end

    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult
      }
    end

    if context.abn_weather_destroyed_but_not_triggered and not context.card.edition then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
              SMODS.add_card { key = context.card.config.center.key, set = "weather_report", edition = "e_negative" }
              return true
            end
          }))
          return true
        end
      }))
    end
  end,
  abn_artist_credits = {
    artist = "Omicra",
  },
  in_pool = function(self)
    local weather = false
    if G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.weather_report and
        G.GAME.consumeable_usage_total.weather_report > 0 then
      weather = true
    end
    local snow_card = false
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if playing_card:is_suit("abn_Snow") then
        snow_card = true
        break
      end
    end
    return weather or snow_card
  end
}
