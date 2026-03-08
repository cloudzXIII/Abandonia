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
          "shop are {C:attention}#1#%{} off",
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
      j_abn_making_statue = {
        name = "Making Statue",
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
      j_abn_hangman = {
        name = "Hangman",
        text = {
          "This Joker gains {C:chips}+#2#{} Chips",
          "when a {C:attention}face{} card",
          "is destroyed",
          "{C:inactive}(Currently {C:chips}#1#{C:inactive} Chips)",
        }
      },
      j_abn_van_joker = {
        name = "Van Joker",
        text = {
          "{C:attention}+1{} extra vouchers in the shop"
        }
      },
    },

    Spectral = {
      c_abn_flipside = {
        name = "Flipside",
        text = {
          "Flips up to {C:attention}#1#{}",
          "selected cards"
        },
      },
    },
    Other = {
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
  },
  misc = {
    quips = {
    },
    challenge_names = {
    },
    dictionary = {
      k_abn_destroyed = "Destroyed!",
      k_abn_unflipped = "Unflipped!"
    },
    labels = {
    },
    ranks = {
    },
    v_text = {
    },
  }
}
