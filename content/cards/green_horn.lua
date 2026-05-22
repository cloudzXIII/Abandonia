-- Green Horn (coded by cloudzXIII)
SMODS.Joker {
  key = 'green_horn',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.xmult, ABN.highest_level_hand() } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet6',
  pos = { x = 5, y = 3 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 3, } },
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,

  abn_artist_credits = {
    artist = "Tje.tsu",
  },
}

local triggered = false
local debuff_hand_ref = Blind.debuff_hand
function Blind:debuff_hand(cards, hand, handname, check)
  if next(SMODS.find_card('j_abn_green_horn')) then
    if handname == ABN.highest_level_hand() then
      triggered = true
      return true
    end
    triggered = false
  else
    triggered = false
  end
  return debuff_hand_ref(self, cards, hand, handname, check)
end

local get_loc_debuff_textref = Blind.get_loc_debuff_text
function Blind:get_loc_debuff_text()
  if triggered then
    return localize("k_green_horn")
  end
  return get_loc_debuff_textref(self)
end
