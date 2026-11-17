-- 2X cost
local rudimentary_set_cost_ref = Card.set_cost
function Card:set_cost()
  rudimentary_set_cost_ref(self)
  if self.ability and G.jokers and next(SMODS.find_card("j_abn_rudimentary_joker")) then
    local is_planet = self.ability.set == "Planet"
    local is_celestial_pack = self.ability.set == "Booster" and self.config and self.config.center and self.config.center.kind == "Celestial"
    if is_planet or is_celestial_pack then
      self.cost = self.cost * 2
    end
  end
end

-- Planet cards can be Foil
local rudimentary_create_card_ref = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
  local ret = rudimentary_create_card_ref(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
  if ret and ret.ability and ret.ability.set == "Planet" and not ret.edition and G.jokers then
    for _, rudimentary_joker in ipairs(SMODS.find_card("j_abn_rudimentary_joker")) do
      if SMODS.pseudorandom_probability(rudimentary_joker, 'j_abn_rudimentary_joker', 1, rudimentary_joker.ability.extra.odds, 'j_abn_rudimentary_joker') then
        ret:set_edition("e_foil", true, true)
        break
      end
    end
  end
  return ret
end

-- Celestial packs in the shop can be foil
local rudimentary_create_shop_card_ui_ref = create_shop_card_ui
function create_shop_card_ui(card, type, area)
  if card and card.ability and card.ability.set == "Booster" and not card.edition and G.jokers
    and card.config and card.config.center and card.config.center.kind == "Celestial" then
    for _, rudimentary_joker in ipairs(SMODS.find_card("j_abn_rudimentary_joker")) do
      if SMODS.pseudorandom_probability(rudimentary_joker, 'j_abn_rudimentary_joker_pack', 1, rudimentary_joker.ability.extra.odds, 'j_abn_rudimentary_joker_pack') then
        card:set_edition("e_foil", true, true)
        break
      end
    end
  end
  return rudimentary_create_shop_card_ui_ref(card, type, area)
end

SMODS.Joker {
  key = 'rudimentary_joker',
  rarity = 1,
  atlas = 'ABNJokerSheet25',
  pos = { x = 5, y = 1 },
  cost = 5,
  discovered = false,
  blueprint_compat = false,
  config = { extra = { odds = 4 } },
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_abn_rudimentary_joker')
    return { vars = { numerator, denominator } }
  end,

  abn_artist_credits = {
    artist = "Yahooyowza",
  },
}