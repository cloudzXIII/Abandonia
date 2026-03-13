return {
  descriptions = {
    Joker = {
      j_abn_ichor = {
        name = "Ichor Joker",
        text = {
          "{C:dark_edition}Negative{} Jokers",
          "give {C:white,X:mult}X#1#{} Mult"
        }
      },
      j_abn_oddly_thomas = {
        name = "Oddly Thomas",
        text = {
          "Every played {C:attention}card{}",
          "with an {C:attention}odd{} rank",
          "permanently gains",
          "{C:chips}+#1#{} Chips when scored",
          "{C:inactive}(A, 9, 7, 5, 3)",
        }
      },
      j_abn_evenly_steven = {
        name = "Evenly Steven",
        text = {
          "Every played {C:attention}card{}",
          "with an {C:attention}even{} rank",
          "permanently gains",
          "{C:chips}+#1#{} Chips when scored",
          "{C:inactive}(10, 8, 6, 4, 2)",
        }
      },
      j_abn_evenly_split = {
        name = "That one evenly split",
        text = {
          {
            "Played cards with",
            "{C:attention}odd{} rank give",
            "{C:chips}+#1#{} Chips when scored",
            "{C:inactive}(A, 9, 7, 5, 3)",
          },
          {
            "Played cards with",
            "{C:attention}even{} rank give",
            "{C:white,X:mult}X#2#{} Mult when scored",
            "{C:inactive}(10, 8, 6, 4, 2)",
          }
        }
      },
      j_abn_unendy_wendy = {
        name = "Unendy Wendy",
        text = {
          {
            "Retrigger all",
            "played {C:attention}number{} cards",
          },
          {
            "Debuff all {C:attention}Face{} cards"
          }
        }
      },
      j_abn_ambigram = {
        name = "Ambigram",
        text = {
          "Each played card gives",
          "{C:mult}+#1#{} Mult when scored",
          "if played hand is {C:attention}symmetrical{}",
          "{C:inactive}(Ex: 4, 3, 5, 3, 4)"
        }
      },
      j_abn_melty_joker = {
        name = "Melty Joker",
        text = {
          "{C:attention}Leftmost{} played card",
          "permanently gains",
          "the rank of {C:attention}rightmost{}",
          "card as {C:chips}Chips{}, then",
          "destroy the {C:attention}rightmost{} card"
        }
      },
      j_abn_sharpshooter = {
        name = "Sharpshooter",
        text = {
          "Retrigger all played",
          "{C:attention}Wild Cards{} for every",
          "{C:attention}Wild Card{} in scoring hand,",
          "{C:green}#1# in #2#{} chance",
          "to destroy played {C:attention}Wild Cards{}"
        }
      },
      j_abn_superhero = {
        name = "Superhero",
        text = {
          "Each played {C:attention}number{} card",
          "gives their rank",
          "as {C:chips}Chips{} when scored",
        }
      },
      j_abn_mardi_gras = {
        name = "Mardi Gras Joker",
        text = {
          "Choose {C:attention}1{} additional",
          "card from {C:tarot}Arcana{} Packs",
        }
      },
      j_abn_elevator = {
        name = "Elevator",
        text = {
          "Played cards",
          "increase in rank by {C:attention}1{}",
          "after scoring",
        }
      },
      j_abn_square_rekoj = {
        name = "Square Rekoj",
        text = {
          "This Joker gains {C:chips}+#2#{} Chips",
          "and {C:white,X:mult}X#4#{} Mult",
          "if played hand has exactly",
          "{C:attention}4{} scoring cards",
          "{C:inactive}(Currently {C:chips}#1#{C:inactive} Chips, {C:white,X:mult}X#3#{C:inactive} Mult)",
        }
      },
      j_abn_colour_vortex = {
        name = "Colour Vortex",
        text = {
          "{C:white,X:mult}X#1#{} Mult if {C:attention}first poker hand{}",
          "of round is a {C:attention}#2#{},",
        }
      },
      j_abn_bios_joker = {
        name = "BIOS JOKER",
        text = {
          "{C:planet}Planet{} cards retrigger",
          "twice when used"
        }
      },
      j_abn_braile_joker = {
        name = "Braile Joker",
        text = {
          "{C:green}#1# in #2#{} chance for",
          "cards to be drawn face down",
          "Face down cards give",
          "{X:mult,C:white}X#3#{} Mult when scored"
        }
      },
      j_abn_digital_currency = {
        name = "Digital Currency",
        text = {
          "Every played {C:attention}card{}",
          "permanently gains",
          "{C:money}+$#1#{} when scored",
        }
      },
      j_abn_odd_couple = {
        name = "Odd Couple",
        text = {
          "Each played {C:attention}Ace{} and {C:attention}number{} card",
          "gives their rank",
          "as {C:mult}Mult{} when scored",
        }
      },
      j_abn_haunted_recording = {
        name = "Haunted Recording",
        text = {
          "This Joker gains {X:mult,C:white} X#2# {} Mult",
          "per {C:attention}consecutive{} hand played",
          "without playing a {C:attention}#3#",
          "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
        },
      },
      j_abn_j_for_joker = {
        name = "J is for Joker",
        text = {
          "{X:mult,C:white}X#1#{} Mult if ",
          "Joker slots are {C:attention}full",
        },
      },
      j_abn_communist_bear = {
        name = "Communist Bear",
        text = {
          "Debuffs played {C:attention}Face{} cards",
          "after scoring, This Joker",
          "gains {C:mult}+#2#{} Mult",
          "per {C:attention}Face{} card debuffed",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
        },
      },
      j_abn_shadowy_joker = {
        name = "Shadowy Joker",
        text = {
          "All cards and packs in",
          "shop are {C:attention}#1#%{} off,",
          "All {C:attention}Cards{} and {C:attention}Jokers{}",
          "are flipped"
        }
      },
      j_abn_eye_exam = {
        name = "Eye Exam",
        text = {
          "Pay {C:money}$#1#{}",
          "to unflip all",
          "{C:attention}flipped{} cards in hand",
        }
      },
      j_abn_yharman_joker = {
        name = "Yharman Joker",
        text = {
          "Destroy played {C:attention}flipped{} cards",
          "after scoring and gain {C:white,X:mult}X#2#{} Mult",
          "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
        }
      },
      j_abn_negative_suit = {
        name = "Negative Suit",
        text = {
          "Gives {C:chips}+#1#{} Chips",
          "for each {C:dark_edition}Negative Card",
          "in your {C:attention}full deck",
          "{C:inactive}(Currently {C:chips}#2#{C:inactive} Chips)",
        }
      },
      j_abn_mindflayer = {
        name = "Mindflayer",
        text = {
          "Every played {C:attention}flipped card{}",
          "permanently gains",
          "{C:mult}+#1#{} Mult when scored",
        }
      },
      j_abn_dorcelessness = {
        name = "Dorcelessness",
        text = {
          "Retrigger {C:attention}adjacent{}",
          "{C:attention}Flipped{} Jokers"
        }
      },
      j_abn_void_joker = {
        name = "Void Joker",
        text = {
          "All {C:attention}Flip{} Jokers in",
          "the shop are {C:attention}free",
          "and gain a {C:dark_edition}Foil{}, {C:dark_edition}Holographic{},",
          "or {C:dark_edition}Polychrome{} edition",
          "when purchased"
        }
      },
      j_abn_moai_joker = {
        name = "Moai Joker",
        text = {
          "Every played {C:attention}Stone Card{}",
          "permanently gains",
          "{C:mult}+#1#{} Mult and",
          "{C:money}+$#2#{} when scored",
        }
      },
      j_abn_construction_joker = {
        name = "Construction Joker",
        text = {
          "{C:attention}Steel Cards{} are also ",
          "considered {C:attention}Stone Cards{}"
        }
      },
      j_abn_van_joker = {
        name = "Van Joker",
        text = {
          "{C:attention}+#1#{} extra vouchers in the shop"
        }
      },
      j_abn_best_employ = {
        name = "Best Employ",
        text = {
          "This Joker gains {C:white,X:mult}X#2#{} Mult",
          "For every {C:attention}Boss Blind{} beaten",
          "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
        }
      },
      j_abn_feline_joker = {
        name = "Feline Joker",
        text = {
          "Randomly gives {C:blue}#2#{} chips",
          " {C:white,X:mult}X#1#{} Mult or {C:money}$#3#{}"
        }
      },
      j_abn_executioner = {
        name = 'Executioner',
        text = {
          "Cards held in hand",
          "permanently gain",
          "{C:chips}+#1#{} Chips",
          "when a {C:attention}playing card{}",
          "is destroyed",
        }
      },
      j_abn_menacing_clown = {
        name = "Menacing Clown",
        text = {
          "When {C:attention}Blind{} is selected,",
          "destroy Joker to the right",
          "and add a {C:dark_edition}Foil{}, {C:dark_edition}Holographic{},",
          "or {C:dark_edition}Polychrome{} edition",
          "to Joker to the left",
        },
      },
      j_abn_malicious_entity = {
        name = "Malicious Entity",
        text = {
          "If {C:attention}first hand{} of round",
          "destroy leftmost scoring card",
          "and gain {C:white,X:mult}X#2#{} Mult",
          "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
        }
      },
      j_abn_faded_graffiti = {
        name = "Faded Graffiti",
        text = {
          "When a hand is {C:attention}levelled up{},",
          "also level up {C:attention}Flush{}",
        }
      },
      j_abn_meta_joker = {
        name = "Meta Joker",
        text = {
          "Gives {C:white,X:mult}X#1#{} Mult",
          "for each {C:attention}unique rarity{}",
          "{C:attention}Joker{} in your possession",
          "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
        }
      },
      j_abn_joker_ai = {
        name = "Joker AI",
        text = {
          {
            "Forces {C:attention}1{} card to",
            "always be selected",
          },
          {
            "{C:attention}Force-selected{} cards",
            "permanently gain",
            "{C:chips}+#1#{} Chips and",
            "{C:mult}+#2#{} Mult when scored"
          }
        }
      },
      j_abn_inkblot_test = {
        name = "Inkblot Test",
        text = {
          {
            "Forces {C:attention}lowest{} ranked card",
            "to always be selected",
          },
          {
            "{C:attention}Force-selected{} cards",
            "always score"
          }
        }
      },
      j_abn_terminator = {
        name = "Terminator Joker",
        text = {
          {
            "{C:attention}Steel Cards{} permanently",
            "gain {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
            "when held in hand"
          },
          {
            "Destroy all scoring",
            "{C:attention}Steel Cards{}",
          }
        }
      },
      j_abn_assassin_joker = {
        name = "Assassin Joker",
        text = {
          "When a hand is played,",
          "destroy the {C:attention}lowest{} ranked card and",
          "earn {C:money}$#3#{} and",
          "This Joker gains {C:attention}+#2#{} Chips",
          "{C:inactive}(Currently {C:chips}#1#{C:inactive} Chips)",
        }
      },
      j_abn_escuderia_joker = {
        name = "Escuderia Joker",
        text = {
          "Gives {C:white,X:mult}X#1#{} Mult",
          "for each {C:attention}unique sticker{}",
          "among your {C:attention}Jokers{}",
          "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
        }
      },
      j_abn_statue_joker = {
        name = "Statue Joker",
        text = {
          "This Joker gains {C:mult}+#2#{} Mult",
          "when a {C:attention}rankless{} card",
          "is scored, then add",
          "{C:dark_edition}Polychrome{} to it",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
        }
      },
      j_abn_gallows_joker = {
        name = "Gallows Joker",
        text = {
          "This Joker has a {C:green}#1# in #2#{} chance",
          "to create {C:tarot}The Hanged Man{}",
          "when a {C:attention}face{} card",
          "is destroyed",
        }
      },
      j_abn_recycled_joker = {
        name = "Recycled Joker",
        text = {
          "{C:attention}Discarded{} cards",
          "are returned to deck"
        }
      },
      j_abn_vaporwave_joker = {
        name = "Vaporwave Joker",
        text = {
          "{C:dark_edition}Polychrome{} cards",
          "and Jokers give {C:mult}+#1#{} Mult"
        }
      },
      j_abn_maxwell_joker = {
        name = "Maxwell Joker",
        text = {
          "{C:dark_edition}Foil{} cards",
          "and Jokers give {X:chips,C:white}X#1#{} Chips"
        }
      },
      j_abn_melted_joker = {
        name = "Melted Joker",
        text = {
          {
            "When {C:attention}Blind{} is selected,",
            "apply {C:attention}Rental{} sticker",
            "to leftmost Joker",
          },
          {
            "{C:attention}Rental{} Jokers each give",
            "{X:mult,C:white}X#2#{} Mult and {C:money}$#1#{}"
          }
        }
      },
      j_abn_xenon_joker = {
        name = "Xenon Joker",
        text = {
          "{C:dark_edition}Holographic{} cards",
          "and Jokers give {X:mult,C:white}X#1#{} Mult"
        }
      },
      j_abn_polychameleon = {
        name = "Polychameleon",
        text = {
          "Gives {C:white,X:mult}X#1#{} Mult",
          "for per {C:dark_edition}Holographic{}",
          "or {C:dark_edition}Polychrome{} Joker owned",
          "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
        }
      },
      j_abn_dark_magokert = {
        name = "Dark Magokert",
        text = {
          "Cards with a {C:attention}dark suit{}",
          "are moved to the top of",
          "your {C:attention}full deck{}",
        }
      },
      j_abn_joe_kert = {
        name = "Joe Kert",
        text = {
          "Scored {C:attention}unenhanced{}",
          "cards give {C:mult}+#1#{} Mult"
        },
      },
      j_abn_totally_naked = {
        name = "Totally Naked",
        text = {
          "Scored {C:attention}unenhanced{}",
          "cards give {C:mult}+#1#{} Mult",
          "and {C:chips}+#2#{} Chips"
        },
      },
      j_abn_wee_mult = {
        name = "Wee Mult",
        text = {
          "Scored {C:attention}number",
          "{C:attention}Mult Cards{} permanently",
          "gain {C:white,X:mult}X#1#{} Mult"
        }
      },
      j_abn_wee_bonus = {
        name = "Wee Bonus",
        text = {
          "Scored {C:attention}number",
          "{C:attention}Bonus Cards{} permanently",
          "gain {C:chips}+#1#{} Chips"
        }
      },
      j_abn_union_jack = {
        name = "Union Jack Joker",
        text = {
          "Retrigger all played cards",
          "if played hand contains",
          "a {C:attention}Bonus Card{} and",
          "a {C:attention}Mult Card{}"
        }
      },
      j_abn_portal_joker = {
        name = "Portal Joker",
        text = {
          "{C:attention}Straights{} can wrap around",
          "{C:inactive}(Ex: Q, K, A, 2, 3)"
        }
      },
      j_abn_daredevil = {
        name = "Daredevil",
        text = {
          "{C:white,X:mult}X#1#{} Mult",
          "{C:attention}First{} hand is",
          "drawn {C:attention}face down{}"
        }
      },
      j_abn_dryeraser_board = {
        name = "Dryeraser Board J",
        text = {
          "{X:red,C:white} X#1# {} Mult if all",
          "cards played and held in hand",
          "are {C:spades}#2#{}",
        }
      },
      j_abn_respectable = {
        name = "Respectable Joker",
        text = {
          "When first {C:attention}unenhanced{}",
          "card is scored,",
          "this Joker gains their rank",
          "as {C:mult}Mult{}",
          "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult)"
        }
      },
      j_abn_turf_graffiti = {
        name = "Turf Graffiti",
        text = {
          "Played cards with",
          "{C:attention}Dark{} suit give",
          "{X:mult,C:white}X#1#{} Mult when scored",
        }
      },
      j_abn_newground_joker = {
        name = "Newground Joker",
        text = {
          "When {C:attention}Blind{} is selected,",
          "This Joker gains {C:mult}+#3#{} Mult",
          "and {C:chips}+#4#{} Chips",
          "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult, {C:chips}+#2#{} {C:inactive}Chips)"
        }
      },
      j_abn_insomniac_joker = {
        name = "Insomniac Joker",
        text = {
          "This Joker gains",
          "{C:chips}+#2#{} Chips every time",
          "a {C:planet}Planet{} card is used",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
        }
      },
      j_abn_gerrymandering = {
        name = "Gerrymandering",
        text = {
          "Retrigger all",
          "played cards",
          "with {V:1}#1#{} suit",
          "{s:0.8}suit changes at end of round",
        }
      },
      j_abn_lost_media = {
        name = "Lost Media",
        text = {
          "This Joker gains {X:mult,C:white} X#2# {} Mult for",
          "every {C:attention}rank{} missing from your deck",
          "{C:inactive}(Currently {X:mult,C:white} X#1# {} {C:inactive}Mult){}",
          "{C:inactive,s:0.8}(Missing: #3#){}",
        }
      },
      j_abn_sailor_joker = {
        name = "Sailor Joker",
        text = {
          {
            "Played {C:attention}Wild Cards{} and {C:attention}Bonus Cards",
            "give {C:chips}+#1#{} Chips when scored",
          },
          {
            "This Joker gains {C:mult}+#2#{} Mult",
            "if played hand contains a {C:attention}Wild Card",
            "or {C:attention}Bonus Card",
            "{C:inactive}(Currently {C:mult}+#3#{} {C:inactive}Mult){}",
          }
        }
      },
      j_abn_couple_goals = {
        name = "Couple Goals",
        text = {
          "This Joker gains {C:white,X:mult}X#2#{} Mult",
          "hand contains a scoring",
          "{C:attention}odd{} and {C:attention}even{} card",
          "{C:inactive}(Currently {X:mult,C:white} X#1# {} {C:inactive}Mult){}",
        }
      },
      j_abn_goth_gabe = {
        name = "Goth Gabe",
        text = {
          "This Joker gains {X:red,C:white}X#2#{} Mult",
          "if all suits played",
          "are {C:spades}Dark{}",
          "{C:inactive}(Currently {X:mult,C:white} X#1# {} {C:inactive}Mult){}",
        }
      },
      j_abn_synergy_joker = {
        name = "Synergy Joker",
        text = {
          "When another Joker gains",
          "{C:chips}+Chips{}or {C:mult}+Mult{},",
          "add that amount to This Joker",
          "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult, {C:chips}+#2#{} {C:inactive}Chips)"
        }
      },
      j_abn_fairytale_book = {
        name = "Fairytale Book",
        text = {
          '{C:legendary,E:1}Legendary{} Jokers may',
          'appear in the {C:attention}Shop',
        }
      },
      j_abn_joe_weatherman = {
        name = "Joe Weatherman",
        text = {
          "Each played {C:attention}number{} card has",
          "a {C:green}#1# in #2#{} chance to",
          "create a {C:tarot}Tarot{} card",
          "when scored",
        }
      },
      j_abn_inferno_comedian = {
        name = "Inferno Comedian",
        text = {
          {
            "Played cards give {C:white,X:mult}X#1#{} Mult",
            "when scored",
          },
          {
            "If score {C:attention}catches on fire{},",
            "This Joker gains chips equal",
            "to last played hand",
            "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
          }
        }
      },
      j_abn_gag_flower = {
        name = "Gag Flower",
        text = {
          "This Joker gains {C:mult}+#5#{} Mult",
          "and {C:chips}+#4#{} Chips per",
          "card scored if played",
          "hand contains",
          "a {C:attention}#1#",
          "{C:inactive}(Currently {C:mult}+#3#{}{C:inactive} Mult, {C:chips}+#2#{} {C:inactive}Chips)"
        }
      },
      j_abn_peel_off = {
        name = "Peel Off",
        text = {
          "When {C:attention}Blind{} is selected,",
          "remove all {C:attention}stickers{} from",
          "Jokers, Gains {C:white,X:mult}X#2#{} Mult",
          "per sticker removed",
          "{C:inactive}(Currently {X:mult,C:white} X#1# {} {C:inactive}Mult){}",
        }
      },
      j_abn_ruin_bastion = {
        name = "Ruin Bastion",
        text = {
          "When {C:attention}Blind{} is selected,",
          "add {C:dark_edition}Abandoned{} to",
          "rightmost Joker"
        }
      },
      j_abn_joker_midnight = {
        name = "Joker by Midnight",
        text = {
          {
            "Debuff all {C:diamonds}Light{} cards"
          },
          { "When {C:attention}Blind{} is selected,",
            "add {C:dark_edition}Sunscourge{} to",
            "leftmost Joker"
          },
          {
            "Gives {C:mult}+#1#{} Mult",
            "for each {C:dark_edition}Sunscourge{} Joker",
            "or card in your {C:attention}full deck{}",
            "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
          }
        }
      },
      j_abn_devil_fruit = {
        name = "Devil Fruit",
        text = {
          {
            "When {C:attention}Blind{} is selected,",
            "add {C:dark_edition}Chthonian{} to",
            "rightmost Joker",
          },
          {
            "{C:green}#1# in #2#{} chance this",
            "card is destroyed",
            "at end of round",
          },
        }
      },
      j_abn_polyolic_joker = {
        name = "Polyolic Joker",
        text = {
          {
            "All played {C:diamonds}Light{} cards",
            "become {C:dark_edition}Polychrome{}",
            "when scored",
          },
          {
            "Gives {X:mult,C:white} X#1# {} Mult",
            "for each {C:dark_edition}Polychrome{} card",
            "in your {C:attention}full deck",
            "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
          }
        }
      }
    },

    Spectral = {
      c_abn_flipside = {
        name = "Flipside",
        text = {
          "Flips up to {C:attention}#1#{}",
          "selected cards"
        },
      },
      c_abn_abyss = {
        name = "Abyss",
        text = {
          "Add {C:dark_edition}Chthonian{} effect to",
          "{C:attention}#1#{} selected card in hand",
        }
      }
    },
    Other = {
      abn_dark_suit = {
        name = "Dark Suit",
        text = {
          "{C:spades}Spades{}, {C:clubs}Clubs{}"
        }
      },
      abn_flipped_card = {
        name = "Flipped",
        text = {
          "{C:white,X:mult}X1.25{} Mult",
          "rank and suit",
          "are not visible",
        }
      },
      abn_credits = {
        text = {
          "{C:dark_edition,s:2}Founded by:",
          " ",
          "{C:dark_edition,s:1.3}Bunnet",
          " ",
          "{C:blue,s:2}Programmed by:",
          " ",
          "{C:blue,s:1.3}cloudzXIII{}",
          "{C:blue,s:1.3}Mills-44{}",
          " ",
          "{C:green,s:2}Art by:",
          " ",
          "{C:green,s:1.2}People from the Balatro Discord!",
          "{C:inactive,s:1.1}(look under the Jokers :>)"
        }
      }
    },
    Stake = {
    },
    Mod = {
      abandonia = {
        name = "Abandonia",
        text = {
          "Welcome to {C:attention}Abandonia{}!",
          "a mod to celebrate the many creative",
          "{C:blue}minds{} and {C:green}artists{} of Balatro!!",
          " ",
          " ",
          "Brought to you by {C:dark_edition}Bunnet{}!",
        }
      },
    },
    Edition = {
      e_abn_chthonian = {
        name = "Chthonian (UNIMPLEMENTED)",
        text = {
          "{C:attention}X2{} Joker Values,",
          "{C:attention}+5%{} Blind size",
        },
      },
      e_abn_iridescent = {
        name = "Iridescent",
        text = {
          "{C:white,X:mult}X#1#{} Mult,",
          "{C:money}$#2#{}",
        },
      },
      e_abn_abandond = {
        name = "Abandoned",
        text = {
          "{C:attention}+#1#{} Retrigger",
          "{C:red}-$#2#{} per retrigger"
        },
      },
      e_abn_sunscourge = {
        name = "Sunscourge",
        text = {
          "{C:mult}+#1#{} Mult,",
          "{C:chips}+#2#{} Chips,",
          "{C:attention}Doubles{} when",
          "score {C:attention}catches on fire{}"
        }
      }
    },
    Planet = {
      c_abn_supernova = {
        name = "Supernova",
        text = {
          "({V:1}lvl.#1#{}) Level up",
          "{C:attention}#2#",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips",
        },
      },
      c_abn_grandcross = {
        name = "Grandcross",
        text = {
          "({V:1}lvl.#1#{}) Level up",
          "{C:attention}#2#",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips",
        },
      },
    }
  },
  misc = {
    quips = {
    },
    challenge_names = {
    },
    dictionary = {
      k_abn_superrare = "Super Rare",
      k_abn_destroyed = "Destroyed!",
      k_abn_unflipped = "Unflipped!",
      k_abn_rental = "Rental!",
      k_abn_oneshot = "Fire!",
      k_abn_comedian = "Comedian",
      k_abn_polychrome = "Polychrome!"
    },
    labels = {
      abn_chthonian = "Chthonian",
      abn_iridescent = "Iridescent",
      abn_abandond = "Abandoned",
      abn_sunscourge = "Sunscourge"
    },
    ranks = {
    },
    v_text = {
    },
    poker_hands = {
      ["abn_triple_pair"] = "Triple Pair",
      ["abn_6oak"] = "Six of a Kind"
    },
    poker_hand_descriptions = {
      ["abn_triple_pair"] = { "3 pairs of cards with different ranks", },
      ["abn_6oak"] = { "6 cards with the same rank", }
    }
  }
}
