local get_new_boss_ref = get_new_boss
function get_new_boss()
  local has_final_showdown = next(SMODS.find_card("j_abn_final_showdown"))

  if has_final_showdown then
    -- just nabbed all this from the original get_new_boss() but made it only look for showdowns when this joker is present
    G.GAME.perscribed_bosses = G.GAME.perscribed_bosses or {
    }
    if G.GAME.perscribed_bosses and G.GAME.perscribed_bosses[G.GAME.round_resets.ante] then
      local ret_boss = G.GAME.perscribed_bosses[G.GAME.round_resets.ante]
      G.GAME.perscribed_bosses[G.GAME.round_resets.ante] = nil
      G.GAME.bosses_used[ret_boss] = G.GAME.bosses_used[ret_boss] + 1
      return ret_boss
    end
    if G.FORCE_BOSS then return G.FORCE_BOSS end

    local eligible_bosses = {}
    for k, v in pairs(G.P_BLINDS) do
      local res, options = SMODS.add_to_pool(v)
      options = options or {}
      if v.boss and v.boss.showdown then
        if v.in_pool and type(v.in_pool) == 'function' then
          eligible_bosses[k] = res and true or nil
        else
          eligible_bosses[k] = res and true or nil
        end
      end
    end
    for k, v in pairs(G.GAME.banned_keys) do
      if eligible_bosses[k] then eligible_bosses[k] = nil end
    end

    local min_use = 100
    for k, v in pairs(G.GAME.bosses_used) do
      if eligible_bosses[k] then
        eligible_bosses[k] = v
        if eligible_bosses[k] <= min_use then
          min_use = eligible_bosses[k]
        end
      end
    end
    for k, v in pairs(eligible_bosses) do
      if eligible_bosses[k] then
        if eligible_bosses[k] > min_use then
          eligible_bosses[k] = nil
        end
      end
    end
    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))
    boss = boss or "bl_wall"
    G.GAME.bosses_used[boss] = G.GAME.bosses_used[boss] + 1

    return boss
  end
  return get_new_boss_ref()
end

SMODS.Joker {
  key = 'final_showdown',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.amount } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet3',
  pos = { x = 4, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  config = {
    extra = {
      amount = 1,
      joker_slots = 0
    },
  },
  calculate = function(self, card, context)
    -- check if end of shop / starting round / end of round and make it showdown if it isnt already
    if context.ending_shop or context.setting_blind or (context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint) then
      if G.GAME.round_resets.blind_choices.Boss and not (G.P_BLINDS[G.GAME.round_resets.blind_choices.Boss].boss or {}).showdown then
        G.from_boss_tag = true -- so money isn't taken away
        G.FUNCS.reroll_boss()
      end
    end
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and context.beat_boss and (G.P_BLINDS[G.GAME.round_resets.blind_choices.Boss].boss or {}).showdown then
      card.ability.extra.joker_slots = card.ability.extra.joker_slots + card.ability.extra.amount
      G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.amount
      SMODS.calculate_effect({ message = localize('k_upgrade_ex'), colour = G.C.FILTER }, card)
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    if G.GAME.round_resets.blind_choices.Boss and not (G.P_BLINDS[G.GAME.round_resets.blind_choices.Boss].boss or {}).showdown then
      G.from_boss_tag = true -- so money isn't taken away
      G.FUNCS.reroll_boss()
    end
  end,
  abn_artist_credits = {
    artist = "superb_thing"
  },
}
