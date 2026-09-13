return {
  descriptions = {
    Joker = {
      --#region Start of Ortalab Crossmod
      j_abn_curse_mask = {
        name = "Curse Mask",
        text = {
          "When {C:attention}Blind{} is Selected remove Curses from all Jokers and Cards",
          "Gains {C:mult}+#3#{} Mult per Curse removed from a Joker and",
          "{C:chips}+#4#{} Chips per Curse removed from a Card",
          "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult{} {C:chips}+#2#{} {C:inactive}Chips){}"
        }
      },

      j_abn_anaglyphic_joker = {
        name = "Anaglyphic Joker",
        text = {
          "Apply {C:mult}A{}{C:chips}n{}{C:mult}a{}{C:chips}g{}{C:mult}l{}{C:chips}y{}{C:mult}p{}{C:chips}h{}{C:mult}i{}{C:chips}c{} to the {C:attention}first{} and {C:attention}last{} scoring card of your {C:attention}first played hand{}",
          "Gain {C:mult}+#3#{} Mult and {C:chips}+#4#{} Chips per {C:mult}A{}{C:chips}n{}{C:mult}a{}{C:chips}g{}{C:mult}l{}{C:chips}y{}{C:mult}p{}{C:chips}h{}{C:mult}i{}{C:chips}c{} card in your full deck",
          "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult,{} {C:chips}+#2#{} {C:inactive}Chips){}"
        }
      },

      j_abn_forsaken_joker = {
        name = "Forsaken Joker",
        text = {
          "{C:green}#1# in #2#{} chance to give",
          "{C:dark_edition}Overexposed{} to played {C:attention}Bent{} cards,",
          "{C:green}#3# in #4#{} chance to give",
          "{C:dark_edition}Fluorescent{} to played {C:attention}Post{} cards",
        }
      },

      j_abn_lunatic_joker = {
        name = "Lunatic Joker",
        text = {
          "If {C:attention}first hand{} of round,",
          "Add {C:inactive}Greyscale{} to scored {C:attention}even{} cards,",
          "If {C:attention}last hand of round,",
          "Add {C:planet}Cyan Seal{} to scored {C:attention}odd{} cards",
        }
      },

      j_abn_recursive_joker = {
        name = "Recursive Joker",
        text = {
          {
            "Jokers may appear multiple times",
          },
          {
            "Each Joker gives {X:chips,C:white}X#1#{} Chips",
            "per copy of that Joker",
          }
        }
      },

      j_abn_joker_jester = {
        name = "Joker Jester",
        text = {
          "{C:common}Common{} Jokers give {C:chips}+#1#{} Chips",
          "{C:uncommon}Uncommon{} Jokers give {C:mult}+#2#{} Mult",
          "{C:rare}Rare{} Jokers give {X:mult,C:white}X#3#{} Mult",
        }
      },
      --#endregion End of Ortalab Crossmod




      --#region Start of Fortlatro Crossmod
      j_abn_information_overload = {
        name = "Information Overload",
        text = {
          "All Scoring {C:attention}Even{} cards gain {C:spectral}Fire Aura",
          "All Scoring {C:attention}Odd{} cards gain {C:money}Based Aura",
        }
      },

      j_abn_pirate_server = {
        name = "Pirate Server",
        text = {
          "Scoring {C:money}Medium Ammo{} cards gain {C:abn_brown_seal}Brown Seal{}",
          "Scoring {C:purple}XP Boost{} cards gain {C:dark_edition}Chromatic Edition{}",
          "If this Joker has {C:tarot}Shockwaved{} retrigger all Jokers {C:attention}without{} {C:dark_edition}Editions{}",
        }
      },

      j_abn_the_big_cheese = {
        name = "The Big Cheese",
        text = {
          "All {C:uncommon}Uncommon{} and {C:rare}Rare{} Jokers are {C:attention}free{}",
          "But they gain {C:money}Mythic Edition{} upon {C:attention}purchase{}",
        }
      },

      j_abn_the_drink = {
        name = "The Drink",
        text = {
          {
            "If {C:attention}first hand{} of round",
            "has only {C:attention}5{} scoring cards,",
            "they all gain {C:tarot}Shockwaved{}",
          },
          {
            "If {C:attention}final hand{} of round is",
            "a {C:attention}High Card{}, add a {C:purple}Glitched Seal{}",
            "to all {C:attention}unscoring{} cards",
          }
        }
      },

      j_abn_certified_brainrot = {
        name = "Certified Brainrot",
        text = {
          {
            "{C:attention}Brainrot{} Jokers each give",
            "{X:chips,C:white}^#2#{} Chips and {X:mult,C:white}^#1#{} Mult",
          },
          {
            "Debuff all {C:attention}non-Brainrot{} Jokers",
          }
        }
      },

      j_abn_mini_balala = {
        name = "Mini Balala",
        text = {
          "When a {C:attention}Joker{} is {C:money}sold{}",
          "{C:green}#1# in #2#{} chance to create a {C:mult}Gnome{}",
          "{C:green}#1# in #3#{} chance to create a {C:purple}Bandage Bazooka{}",
          "{C:green}#1# in #4#{} chance to create a {C:money}FTC Lawsuit",
        }
      },

      j_abn_mango = {
        name = "Mango",
        text = {
          "#1#",
          "#2#",
        }
      },

      j_abn_joker_fortnite = {
        name = "Joker = Fortnite",
        text = {
          "If {C:purple}Fortnite{} is {C:attention}installed{},",
          "{X:mult,C:white}X#2#{} Mult per {C:dark_edition}Modded{} Joker",
          "Otherwise {C:mult}+#4#{} Mult per {C:dark_edition}Modded{} Joker",
          "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult,{} {C:mult}+#3#{} {C:inactive}Mult){}"
        }
      },

      j_abn_ugh_jimbo = {
        name = "Ugh Jimbo?",
        text = {
          "Likes to talk...maybe"
        }
      },
      --#endregion End of Fortlatro crossmod

      --#region Start of AiJ crossmod

      j_abn_narcoleptic_joker = {
        name = "Narcoleptic Joker",
        text = {
          {
            "{X:chips,C:white}X#1#{} Chips if played hand",
            "contains only {C:spades}Spades{} and {C:clubs}Clubs{}",
          },
          {
            "{X:mult,C:white}X#2#{} Mult if played hand",
            "contains only {C:spades}Spades{} and {C:abn_bow}Bows{}",
          }
        }
      },
      j_abn_spectrum_hell = {
        name = "Spectrum Hell",
        text = {
          "If played hand contains a {C:attention}Spectrum{}",
          "and score {C:attention}catches on fire{}, all",
          "{C:attention}Jokers{} permanently gain {X:mult,C:white}X#1#{} Mult",
        }
      },

      j_abn_nova_red_eyes_joker = {
        name = "Nova Red Eyes Joker",
        text = {
          "If {C:attention}first hand{} of round contains",
          "only {C:spades}dark suits{}, all scoring cards",
          "permanently gain {C:attention}+#1#{} Retrigger",
          "and {C:dark_edition}Chthonian{} edition",
        }
      },

      j_abn_cossak_joker = {
        name = "Cossack Joker",
        text = {
          {
            "{C:attention}Enhance{} played {C:abn_snow}Snows{} into",
            "{C:attention}Ice{} cards when scored",
          },
          {
            "This Joker gains {C:chips}+#2#{} Chips",
            "per scoring {C:abn_snow}Snow{} {C:attention}Ice{} card",
            "{C:inactive}(Currently {C:chips}+#1#{} {C:inactive}Chips){}"
          }
        }
      },

      j_abn_spectrum_hand = {
        name = "Spectrum Hand",
        text = {
          {
            "If played hand contains a {C:attention}Spectrum{},",
            "{C:attention}Enhance{} scoring {C:diamonds}Light Suits{} into",
            "{C:dark_edition}Silver{} {C:attention}Fervent{} cards, {C:attention}enhance{} scoring",
            "{C:spades}Dark Suits{} into {C:dark_edition}Chthonian{} {C:attention}Charged{} cards",
          },
          {
            "If this Joker has {C:dark_edition}Silver{} edition,",
            "gains {C:mult}+#1#{} Mult per card scored",
            "If this Joker has {C:dark_edition}Chthonian{} edition,",
            "gains {C:chips}+#2#{} Chips per card scored",
            "{C:inactive}(Currently {C:mult}+#3#{} {C:inactive}Mult {C:chips}+#4#{} {C:inactive}Chips){}"
          },
        }
      },

      j_abn_celestial_joker = {
        name = "Celestial Joker",
        text = {
          "When {C:attention}Blind{} is selected,",
          "all Jokers gain {C:chips}+#1#{} Chips",
        }
      },

      j_abn_mod_joker = {
        name = "Mod Joker",
        text = {
          "{C:chips}+#2#{} Chips per unique {C:attention}suit{}",
          "a {C:attention}Wild{} card is considered",
          "{C:inactive}(Currently {C:chips}+#1#{} {C:inactive}Chips){}",
        }
      },
      --#endregion End of AiJ crossmod

      --#region Start of Paperback crossmod
      j_abn_maltese_cross = {
        name = "Maltese Cross",
        text = {
          "Scoring {C:attention}Domino{} cards",
          "permanently gain {C:chips}+#1#{} Chips",
          "per time that {C:attention}rank{} has",
          "scored during this {C:attention}Blind{}",
        }
      },

      j_abn_backup_plan = {
        name = "Backup Plan",
        text = {
          "Retrigger {C:attention}first{} scoring",
          "card once for every",
          "other card in scoring hand",
        }
      },

      j_abn_sikhs_joker = {
        name = "Sikhs Joker",
        text = {
          "Scoring cards give {X:chips,C:white}X#2#{}",
          "Chips for every {C:attention}unique{}",
          "{C:tarot}Minor Arcana{} card used",
          "{C:inactive}(Currently{} {X:chips,C:white}X#1#{} {C:inactive}Chips){}",
        }
      },

      j_abn_sol_iii = {
        name = "Sol III",
        text = {
          "{C:attention}Poker hands{} give {C:gold}+#1#{} Asc. Power",
          "for each {C:attention}level{} they have",
        }
      },

      j_abn_librarian_joker = {
        name = "Librarian Joker",
        text = {
          "When a {C:lexica}Lexica{} card triggers",
          "during a {C:attention}Blind{}, create a",
          "random {C:dark_edition}Negative{} {C:calligraphy}Calligraphy{} card",
        }
      },
      --#region End of Paperback crossmod
    },
  },
}
