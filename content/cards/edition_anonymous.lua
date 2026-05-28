-- Rip edition tracking from Fortlatro
local set_edition_ref = Card.set_edition

local function _detect_edition_name(ed)
    if not ed then return nil end
    if type(ed) == "string" then
        return ed:match("^e_(.+)$") or ed
    elseif type(ed) == "table" then
        if type(ed.type) == "string" then return ed.type end
        if type(ed.key)  == "string" then return ed.key  end
        local EXCLUDE = { chips = true, mult = true, type = true, key = true, xmult = true, x_mult = true, xchips = true }
        for k, v in pairs(ed) do
            if v == true and not EXCLUDE[k] and type(k) == "string" then
                return k
            end
        end
    end
    return nil
end

function Card:set_edition(edition, immediate, silent)
    local run = true
    if edition then
        local is_foil_req = (edition == "e_foil") or (type(edition) == "table" and edition.foil == true)
        if is_foil_req
            and G and G.GAME and G.GAME.modifiers and G.GAME.modifiers.no_foil_jokers
            and self.ability and self.ability.set == "Joker"
        then
            self:juice_up(0.5)
            run = false
        end

        if run then

            local ret = set_edition_ref(self, edition, immediate, silent)

            if self.edition then
                local anon_jokers = SMODS.find_card("j_abn_edition_anonymous")
                if anon_jokers and next(anon_jokers) then
                    -- Grab the scaling values from the first instance found
                    local anon_joker = anon_jokers[1]
                    local bonus_mult = anon_joker.ability.extra.mult or 0
                    local bonus_chips = anon_joker.ability.extra.chips or 0

                    --scaling
					if self.ability.set == 'Default' or self.ability.set == 'Enhanced' then
						self.ability.perma_bonus = (self.ability.perma_bonus or 0) + bonus_chips
						self.ability.perma_mult = (self.ability.perma_mult or 0) + bonus_mult
					elseif self.ability.set == 'Joker' then
						self.ability.abn_perma_bonus = (self.ability.abn_perma_bonus or 0) + bonus_chips
						self.ability.abn_perma_mult = (self.ability.abn_perma_mult or 0) + bonus_mult
					end
                end
            end

            if self.edition and self.area == G.hand then
                local applied = _detect_edition_name(self.edition)
                if applied then
                    G.GAME.purchased_editions = G.GAME.purchased_editions or {}
                    G.GAME.last_edition = applied

                    local already = false
                    for _, stored in ipairs(G.GAME.purchased_editions) do
                        if stored == applied then already = true; break end
                    end
                    if not already then
                        table.insert(G.GAME.purchased_editions, applied)
                    end
                end
            end

            return ret
        end
    end
end


SMODS.Joker {
  key = 'edition_anonymous',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet11',
  pos = { x = 3, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = false,

  config = {
    extra = {
      mult = 7,
      chips = 5,
    },
  },
  
  in_pool = function(self, args)
    if not G.jokers or #G.jokers.cards == 0 then 
      return false
    end
    
    for i = 1, #G.jokers.cards do
      if not G.jokers.cards[i].edition then
        return false 
      end
    end
    
    return true -- Every Joker has an edition!
  end,
  
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
        if context.other_card.edition then
            context.other_card:set_edition(poll_edition('anonymous', nil, false, true), true)
        end
    end
    
    if context.end_of_round and context.main_eval and not context.blueprint and G.GAME.blind.boss then
        for i = 1, #G.jokers.cards do
            local j = G.jokers.cards[i]
            j:set_edition(poll_edition('anonymous', nil, false, true))
        end
    end
  end,
  abn_artist_credits = {
    artist = "Flote"
  },
}