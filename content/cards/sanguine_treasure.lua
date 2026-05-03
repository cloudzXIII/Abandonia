SMODS.Joker {
  key = 'sanguine_treasure',
  rarity = 2,
  atlas = 'ABNJokerSheet5',
  pos = { x = 9, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
    return { vars = { localize({ type = 'name_text', key = "m_gold", set = "Enhanced" }) } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_gold") then
        local card_rank = context.other_card:get_id()
        local chips_amount = card_rank
        context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
        chips_amount = chips_amount + context.other_card.ability.perma_bonus
        if context.other_card.ability.bonus then chips_amount = chips_amount + context.other_card.ability.bonus end
        local dollars_amount = context.other_card.ability.h_dollars * 2
        if context.other_card.ability.perma_h_dollars then
          dollars_amount = dollars_amount + (context.other_card.ability.perma_h_dollars * 2)
        end
        return {
          chips = chips_amount,
          dollars = dollars_amount,
        }
      end
    end
  end,
  in_pool = function()
    local gold_card_count = 0
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, "m_gold") then
        gold_card_count = gold_card_count + 1
        if gold_card_count >= 3 then break end
      end
    end
    if gold_card_count >= 3 then return true end
    return false
  end,

  abn_artist_credits = {
    artist = "donnie",
  },
}
