-- Jevil the Mad Jester (coded by cloudzXIII)
-- I'm having a lot of fun with this joker lol

local count_unique = function(area, type)
  local cards = {}
  local thingy = type == "suit" and "suit" or type == "rank" and "value"

  for _, v in ipairs(area) do
    cards[v.base[thingy]] = true
  end

  local unique = 0
  for _ in pairs(cards) do
    unique = unique + 1
  end

  return unique
end

local function abn_i_can_do_anything(card, suit_no)
  local suit_conditions = {
    "unique_suit_1",
    "unique_suit_2",
    "unique_suit_3",
    "unique_suit_4",
    "unique_suit_5",
    "unique_suit_6",
  }

  for _, condition in ipairs(suit_conditions) do
    card.ability.extra[condition] = false
  end

  card.ability.extra[suit_no] = true
  return
end

to_number = to_number or function(x)
  return tonumber(x)
end

SMODS.Joker {
  key = 'jevil',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = {} }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet13',
  pos = { x = 8, y = 0 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { repetitions = 2, blind_req_down = 0.1, xmult = 2, xmult_gain = 0.5, asc = 0.02, unique_suit_1 = false, unique_suit_2 = false, unique_suit_3 = false, unique_suit_4 = false, unique_suit_5 = false, unique_suit_6 = false } },
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local unique_suits = count_unique(context.scoring_hand, "suit")
      if unique_suits == 6 then
        abn_i_can_do_anything(card, "unique_suit_6")
        -- Destroy all non-Legendary Jokers (except itself) and replace them with random Legendary Jokers
        local has_wild = false
        for _, v in ipairs(context.scoring_hand) do
          if SMODS.has_any_suit(v) then
            has_wild = true
          end
        end
        if not has_wild then
          local to_destroy = {}
          for _, joker in ipairs(G.jokers.cards) do
            if joker ~= card and joker.config.center.rarity ~= 4 then
              to_destroy[#to_destroy + 1] = joker
            end
          end
          local count = #to_destroy

          SMODS.destroy_cards(to_destroy)

          for i = 1, count do
            G.E_MANAGER:add_event(Event({
              func = function()
                SMODS.add_card { set = "Joker", rarity = "Legendary" }
                return true
              end
            }))
          end
        end
      end
      return {
        message = localize("k_abn_i_can_do_anything"),
        colour = G.C.PURPLE
      }
    end
    if context.individual and context.cardarea == G.play then
      local unique_suits = count_unique(context.scoring_hand, "suit")
      if unique_suits == 2 then
        abn_i_can_do_anything(card, "unique_suit_2")
        -- Every card scored lowers blind requirements by 10%
        return {
          xblindsize = 1 - card.ability.extra.blind_req_down,
        }
      elseif unique_suits == 3 then
        abn_i_can_do_anything(card, "unique_suit_3")
        -- Scoring cards give the combined rank of adjacent cards as Chips
        local pos = ABN.get_pos(context.other_card, context.scoring_hand)
        local left = context.scoring_hand[pos - 1]
        local right = context.scoring_hand[pos + 1]
        return {
          chips = (left and left.base.nominal or 0) + (right and right.base.nominal or 0)
        }
      elseif unique_suits == 4 then
        abn_i_can_do_anything(card, "unique_suit_4")
        -- X2 Mult, gives an additional X0.5 Mult per unique suit in played hand (wait a minute this is just 4X mult lol)
        return {
          x_mult = card.ability.extra.xmult + (card.ability.extra.xmult_gain * unique_suits)
        }
      elseif unique_suits == 5 then
        abn_i_can_do_anything(card, "unique_suit_5")
        -- all cards permanently gain +0.02 ascension power
        context.other_card.ability.slib_perma_plus_asc = (context.other_card.ability.slib_perma_plus_asc or 0) +
            card.ability.extra.asc
        return {
          message = localize("k_upgrade_ex"),
          colour = G.C.GOLD
        }
      end
    end
    if context.repetition and context.cardarea == G.play then
      local unique_suits = count_unique(context.scoring_hand, "suit")
      local money = type(G.GAME.dollars) == "number" and G.GAME.dollars or to_number(G.GAME.dollars)
      if unique_suits == 1 and ABN.is_prime(money) then
        abn_i_can_do_anything(card, "unique_suit_1")
        return {
          repetitions = card.ability.extra.repetitions
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Modliich",
  },
}

local add_multiboxes_ref = ABN.add_extra_multiboxes
---@diagnostic disable-next-line: duplicate-set-field
function ABN.add_extra_multiboxes(_c, info_queue, card, desc_nodes, specific_vars, full_UI_table, ability, ...)
  add_multiboxes_ref(_c, info_queue, card, desc_nodes, specific_vars, full_UI_table, ability, ...)
  if G.jokers and _c.set == "Joker" and _c.key == "j_abn_jevil" then
    local suit_conditions = {
      "unique_suit_1",
      "unique_suit_2",
      "unique_suit_3",
      "unique_suit_4",
      "unique_suit_5",
      "unique_suit_6",
    }

    for _, condition in ipairs(suit_conditions) do
      if ability.extra[condition] then
        ABN.generate_ui_multiboxes({
          {
            localized_text = G.localization.misc.dictionary["abn_" .. condition],
            loc_vars = function(self, card, center)
              return {
                vars = {
                  ability.extra.repetitions or 1,
                  1 - ability.extra.blind_req_down or (1 - 0.1),
                  ability.extra.xmult * 2,
                  ability.extra.asc or 0.02,
                  ability.extra.repetitions or 2,
                }
              }
            end
          }
        })(_c, info_queue, card, desc_nodes, specific_vars, full_UI_table)
      end
    end
  end
end
