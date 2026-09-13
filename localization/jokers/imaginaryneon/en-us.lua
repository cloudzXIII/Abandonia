--[[
 Note by cloudzXIII - I've left these in a seperate folder for now but I'm wondering if its ok
 to maybe move away from this since in the collection these Jokers appear
 out of order compared to the rest of the ones in alphabetical order due to it all being in "imaginaryneon.lua"
--]]
return {
  descriptions = {
    Joker = {
      j_abn_crease_joker = { -- ImaginaryNeon jokers start here
        name = "Crease Joker",
        text = {
          "{X:attention,C:white}X#1#{} hand size,",
          "Discard selection size",
          "reduced to {C:red}#2#{}",
        }
      },

      j_abn_double_dip = {
        name = 'Double Dip',
        text = {
          "This Joker gives the base {C:chips}Chips{} and {C:red}Mult{}",
          "of the played poker hand",
        }
      },

      j_abn_big_raff = {
        name = 'Big Riff',
        text = {
          {
            "{C:common}Common{} and {C:uncommon}Uncommon{} Jokers",
            "no longer appear in the Shop",
          },
          {
            "When {C:attention}Blind{} is selected,",
            "create a {C:rare}Rare{} Joker",
            "{C:inactive}(Must have room)",
          }
        }
      },

      j_abn_wiimotionplus = {
        name = 'Wii Joker',
        text = {
          "This Joker gains {C:mult}+#2#{} Mult",
          "at the start of each {C:attention}Blind",
          "if it hasn't started a {C:attention}Blind",
          "in that {C:attention}joker slot{} before",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult){}",
          "{C:inactive,s:0.8}(Used slots: #3#){}"
        }
      },

      j_abn_chips_to_mult = {
        name = 'Mult Matthew',
        text = {
          "Whenever another Joker gives {C:chips}Chips{},",
          "this Joker gives those Chips as {C:mult}Mult{}",
          --"{s:0.7,C:inactive}(Does not affect Jokers that give Chips after another Joker triggers){}"
        }
      },

      j_abn_mult_to_chips = {
        name = 'Bonus Bradly',
        text = {
          "Whenever another Joker gives {C:mult}Mult{},",
          "this Joker gives this Mult as {C:chips}Chips{}",
          --"{s:0.7,C:inactive}(Does not affect Jokers that give Mult after another Joker triggers){}"
        }
      },

      j_abn_spihcneve = {
        name = 'Spihcneve Joker',
        text = {
          {
            "When a {C:mult}Mult card{} scores,",
            "scoring non-Mult cards permenantly",
            "gain {C:chips}+#1#{} Chips",
          },
          {
            "When an {C:attention}Even {C:mult}Mult card{} scores,",
            "scoring {C:attention}Odd non-Mult{} cards",
            "permenantly gain {C:mult}+#2#{} Mult",
          }
        },
        --[[unlock = {
        "Enhance an {C:attention}even-ranked{} card",
        "into a {C:mult}Mult card{}"
        }--]]
      },

      j_abn_meatkin = {
        name = 'Meatkin Joker',
        text = {
          "When a {C:attention}Steel card{} scores,",
          "each scoring non-Steel card",
          "permenantly gains {X:mult,C:white}+X#1#{} Mult"
        },
        --[[unlock = {
        "Have at least {C:attention}one-fourth{}",
        "of your deck be {C:attention}Steel{} cards"
        }--]]
      },

      j_abn_triskaidekaphobia = {
        name = 'Triskaidekaphobia',
        text = {
          {
            "When a {C:attention}Lucky card{} scores,",
            "scoring non-Lucky cards permenantly",
            "have their base {C:chips}Chips{} doubled"
          },
          {
            "When a {C:attention}13{} scores,",
            "gain {C:attention}+#3#{} Joker slot at the cost",
            "of {X:blind,C:white}X#2#{} Blind size and",
            "{X:blind,C:white}+X#4#{} starting Blind size",
            "{C:inactive}(Currently {X:blind,C:white}X#5#{C:inactive} Blind size){}"
          }
        },
      },

      j_abn_rorrim = {
        name = 'Rorrim Joker',
        text = {
          {
            "When a {C:attention}Glass card{} scores,",
            "scoring non-Glass cards gain",
            "{C:chips}+#2#{} Chips and {C:mult}+#1#{} Mult",
            "per scoring card played"
          },
          {
            "When a {C:attention}Glass card{} breaks",
            "other scoring cards have their",
            "base Chips {C:attention}doubled{}"
          }
        },
      }, -- ImaginaryNeon Jokers end here (for now)
    },
  },
}
