local function faces_in_hand()
    local a = 0
    for k, v in pairs(G.hand.cards) do
        if v:is_face(true) then
            a = a + 1
        end
    end
    return a
end

SMODS.Consumable({
	key = "crown",
	set = "Tarot",
    hidden = true,
    soul_set = "Tarot",
    soul_rate = 0.975,
	config = { extra = {} },
	pos = { x = 0, y = 0 },
	atlas = "AbandoniaTarots",
	cost = 4,
	unlocked = true,
	discovered = true,
	loc_vars = function(self,info_queue,card)
	end,
	can_use = function(self, card)
		return G.hand and #G.hand.cards>0 and #G.hand.highlighted==1 and not G.hand.highlighted[1]:is_face() and faces_in_hand()>0
	end,
	use = function(self, card)
        local aeaeae, ccard = 0,G.hand.highlighted[1]
        for k, v in pairs(G.hand.cards)do
            if v ~= ccard and v:is_face() then
                aeaeae = aeaeae + v.base.nominal
                SMODS.destroy_cards(v)
            end
        end

        ccard.ability.perma_bonus = ccard.ability.perma_bonus or 0
        ccard.ability.perma_bonus = ccard.ability.perma_bonus + aeaeae
        card_eval_status_text(ccard, "extra", nil, nil, nil, { message = localize("k_upgrade_ex") })
	end,
    abn_artist_credits = {
    artist = "b.b.b.b",
  },
})

SMODS.Consumable({
	key = "eon",
	set = "Tarot",
    hidden = true,
    soul_set = "Tarot",
    soul_rate = 0.975,
	config = { extra = {max = 2} },
	pos = { x = 2, y = 0 },
	atlas = "AbandoniaTarots",
	cost = 4,
	unlocked = true,
	discovered = true,
	loc_vars = function(self,info_queue,card)
        return{vars={card.ability.extra.max}}
	end,
	can_use = function(self, card)
		if G.jokers and #G.jokers.highlighted>0 and #G.jokers.highlighted<(card.ability.extra.max+1) then
            local no = false
            for k, v in pairs(G.jokers.highlighted) do
                if v.eternal_compat==false then
                    no = true
                end
            end

            if not no then
                return true
            end
        end
        return false
	end,
	use = function(self, card)
        for k, v in pairs(G.jokers.highlighted)do
            v:add_sticker("eternal", true)
            v:juice_up()
            G.jokers:unhighlight_all()
        end
	end,
    abn_artist_credits = {
        artist = "b.b.b.b",
    },
})