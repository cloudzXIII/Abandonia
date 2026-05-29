return {
  descriptions = {
    continent = {
      c_abn_africa = {
        name = "Africa",
        text = {
          {
            "Convert all {C:diamonds}light suits{}",
            "held into {C:attention}Stone Cards{}",
            "with {C:gold}Gold Seals{}"
          },
          {
            "Convert all {C:spades}dark suits{}",
            "into {C:dark_edition}Negative{} {C:attention}Gold Cards"
          }
        },
      },
      c_abn_austrailia = {
        name = "Austrailia",
        text = {
          {
            "Convert all {C:attention}odd{} cards",
            "held into {C:dark_edition}Foil{} {C:attention}Wild Cards{}",
          },
          {
            "Convert all {C:attention}even{} cards",
            "held into {C:attention}Glass Cards{}",
            "with {C:red}Red Seals{}"
          }
        },
      },
      c_abn_asia = {
        name = "Asia",
        text = {
          {
            "Convert all {C:attention}Aces{}",
            "held into {C:dark_edition}Foil{} {C:attention}Mult Cards{}",
          },
          {
            "Convert all {C:attention}face{} cards",
            "held into {C:attention}Bonus Cards{}",
            "with {C:abn_white_seal}White Seals{}"
          }
        },
      },
      c_abn_europe = {
        name = "Europe",
        text = {
          {
            "Convert all held cards",
            "with ranks below {C:attention}5{} into",
            "{C:attention}Steel Cards{} with {C:abn_orange_seal}Orange Seals{}",
          },
          {
            "Convert all held cards",
            "with ranks above {C:attention}6{} into",
            "{C:dark_edition}Abandoned{} {C:attention}Fossil Cards{}",
          }
        },
      },
      c_abn_antarctica = {
        name = "Antarctica",
        text = {
          {
            "Convert all {C:diamonds}light suit{} cards",
            "held into {C:dark_edition}Holographic{} {C:abn_Snow}Snows{}",
          },
          {
            "Convert all {C:spades}dark suit{} cards",
            "held into {C:abn_penumbra}Penumbras{}",
            "with {C:abn_lavender_seal}Lavender Seals{}"
          }
        },
      },
      c_abn_avalon = {
        name = "Avalon",
        text = {
          "If a {C:attention}Five of a Kind{}",
          "is played using only {C:attention}face{} cards,",
          "destroy all of them and",
          "create a {C:legendary}Legendary{} Joker",
          "with a {C:abn_black}Top Hat{} sticker"
        }
      },
      c_abn_keris = {
        name = "Keris",
        text = {
          "If a {C:attention}Flush{} is played",
          "using only {C:attention}face{} cards,",
          "destroy all of them and",
          "create a {C:abn_parallelrare}Parallel Rare{} Joker",
          "with a {C:abn_black}Bullseye{} sticker"
        }
      },
      c_abn_mu = {
        name = "Mu",
        text = {
          "If played hand contains a {C:attention}Spectrum{}",
          "using only {C:attention}Aces{},",
          "destroy all of them and",
          "create a {C:dark_edition}Holographic{} {C:attention}Comedian{}",
          "with a {C:abn_black}Pump Up{} sticker"
        }
      },
    },
    lexica = {
      c_abn_a = {
        name = "A(mperage)",
        text = {
          "Next time a {C:attention}Joker{} with",
          "an {C:dark_edition}Edition{} {C:attention}triggers{},",
          "add the same edition to the {C:attention}first{}",
          "and {C:attention}last{} scoring card"
        }
      },
      c_abn_b = {
        name = "B(arometer)",
        text = {
          "Next time a {C:attention}Mult Card{}",
          "{C:attention}triggers{}, give",
          "triple the {C:mult}mult"
        }
      },
      c_abn_c = {
        name = "C(adence)",
        text = {
          "Next time a {C:attention}Two Pair{}",
          "{C:attention}triggers{}, each scoring",
          "card gives {C:white,X:chips}X#1#{} Chips"
        }
      },
      c_abn_d = {
        name = "D(ebridement)",
        text = {
          "Next time a {C:attention}face-down{} card",
          "{C:attention}triggers{}, flip all cards",
          "in your {C:attention}full deck{} face up",
          "and they each permanently gain {C:chips}+#1#{} Chips"
        }
      },
      c_abn_e = {
        name = "E(lapse)",
        text = {
          "Next time a {C:attention}Blind{} is skipped,",
          "gain a random {C:abn_hazard}Hazard Tag{}"
        }
      },
      c_abn_f = {
        name = "F(eudatory)",
        text = {
          "Next time a {C:gold}Gold Seal{} {C:attention}triggers{},",
          "All Jokers gain {C:white,X:mult}X#1#{} Mult"
        }
      },
      c_abn_g = {
        name = "G(allant)",
        text = {
          "Next time a {C:attention}Full House{}",
          "{C:attention}triggers{}, {C:red}destroy{}",
          "all {C:attention}face{} cards,",
          "{C:attention}lowest rank{} held in hand",
          "gains all their {C:chips}Chips{}"
        }
      },
      c_abn_h = {
        name = "H(omage)",
        text = {
          "Next time you use a {C:tarot}Tarot{} card,",
          "create a {C:dark_edition}Negative{} copy of it",
        }
      },
      c_abn_i = {
        name = "I(ntrinsic)",
        text = {
          "Next time an {C:attention}unenhanced{} card scores,",
          "it permanently gains {C:attention}+1{} retrigger"
        }
      },
      c_abn_j = {
        name = "J(unction)",
        text = {
          "Next time a {C:attention}Straight{} is played,",
          "increase it's level by {C:attention}1{} for every",
          "{C:attention}numbered{} card played"
        }
      },
      c_abn_k = {
        name = "K(armic)",
        text = {
          "Next time a {C:attention}Glass Card{}",
          "is {C:red}destroyed{}, all scoring",
          "cards permanently gain {C:white,X:mult}X#1#{} Mult"
        }
      },
      c_abn_l = {
        name = "L(ament)",
        text = {
          "Next time a {C:green}probability{} fails,",
          "Level up your {C:attention}most played{}",
          "hand by {C:attention}1{}"
        }
      },
      c_abn_m = {
        name = "M(atriculate)",
        text = {
          "Next time you level up",
          "a hand, also level up",
          "your {C:attention}most played{} hand"
        }
      },
      c_abn_n = {
        name = "N(omenclature)",
        text = {
          "Next time a {C:attention}Wild Card",
          "scores, all cards",
          "held in hand",
          "gain a {C:abn_brown_seal}Brown Seal{}"
        }
      },
      c_abn_o = {
        name = "O(beisance)",
        text = {
          "Next time a {C:attention}Gold Card",
          "scores, permanently triple",
          "its {C:chips}Chips{}"
        }
      },
      c_abn_p = {
        name = "P(hantasm)",
        text = {
          "Next time you use a {C:spectral}Spectral{} card,",
          "create a {C:dark_edition}Negative{} copy of it",
        }
      },
      c_abn_q = {
        name = "Q(uagmire)", -- family guy reference?!!?
        text = {
          "Next time a {C:attention}Stone Card",
          "scores, all Jokers",
          "gain {C:chips}+#1#{} Chips"
        }
      },
      c_abn_r = {
        name = "R(equiem)", -- resident evil requiem reference?!?
        text = {
          "Next time you use a {C:sigils}Sigil{} card,",
          "all scoring cards in the next hand",
          "become {C:dark_edition}Polychrome",
          "and gain a {C:abn_violet_seal}Violet Seal{}"
        }
      },
      c_abn_s = {
        name = "S(acrilege)",
        text = {
          "Next time a hand contains",
          "both {C:diamonds}light{} and {C:spades}dark suits{},",
          "destroy all cards and create",
          "a {C:dark_edition}Negative{} {C:attention}Soul{}"
        }
      },
      c_abn_t = {
        name = "T(orrent)", -- sailing the seven seas are we now?
        text = {
          "Next time a {C:attention}Flush{}",
          "{C:attention}triggers{}, add a",
          "{C:abn_skyblue_seal}Skyblue Seal{} to",
          "each played card"
        }
      },
      c_abn_u = {
        name = "U(biquitous)",
        text = {
          "Next time a {C:attention}Bonus Card",
          "is played, add {C:dark_edition}Gloss{} to it",
        }
      },
      c_abn_v = {
        name = "V(enture)",
        text = {
          "Next time you play a hand containing",
          "only {C:spades}dark suits{}, destroy",
          "all cards and create a",
          "{C:dark_edition}Negative{} {C:attention}Body{}",
          "{C:inactive}Excluding High Card{}",
        }
      },
      c_abn_w = {
        name = "W(oebegone)",
        text = {
          "Next time a {C:attention}Lucky Card{}",
          "scores, add {C:dark_edition}Abandoned{} edition",
          "and a {C:red}Red Seal{}"
        }
      },
      c_abn_x = {
        name = "X(enocentric)",
        text = {
          "Next time you play a {C:attention}Spectrum{},",
          "all Jokers gain",
          "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult"
        }
      },
      c_abn_y = {
        name = "Y(onder)",
        text = {
          "Next time you use a {C:astro_cards}Astro{} card,",
          "it's {C:green}probabilites{} succeed,",
          "create a random {C:dark_edition}Negative{}",
          "{C:planet}Rank Planet{} card"
        }
      },
      c_abn_z = {
        name = "Z(ealot)",
        text = {
          "Next time you play a hand containing",
          "only {C:diamonds}light suits{}, destroy",
          "all cards and create a",
          "{C:dark_edition}Negative{} {C:attention}Mind{}",
          "{C:inactive}Excluding High Card{}",
        }
      },
      c_abn_thorn = {
        name = "T(horn)",
        text = {
          "Next time you use a {C:nightshift_cards}Nightshift{} card,",
          "All Jokers gain {C:chips}+#1#{} Chips and",
          "have their {C:attention}stickers{} {C:red}removed"
        }
      },
    },
    program_pack = {
      c_abn_png = {
        name = ".PNG",
        text = {
          "Enhances {C:attention}#1#{} random",
          "cards in hand into",
          "{C:dark_edition}Negative{} {C:attention}Lucky Cards{}",
        }
      },
      c_abn_mp4 = {
        name = ".MP4",
        text = {
          "Enhances {C:attention}#1#{} random",
          "cards in hand into",
          "{C:dark_edition}Gloss{} {C:attention}Bonus Cards{},",
          "{C:red}destroy{} all others"
        }
      },
      c_abn_exe = {
        name = ".EXE",
        text = {
          "{C:green}#1# in #2#{} chance to add {C:dark_edition}Chthonian{},",
          "{C:green}#3# in #4#{} chance to become {C:attention}Fossil{},",
          "{C:green}#5# in #6#{} chance to {C:red}destroy{}",
          "each card in your {C:attention}full deck{}",
        }
      },
      c_abn_apk = {
        name = ".APK",
        text = {
          "Enhances all {C:attention}numbered{}",
          "cards in hand into",
          "{C:dark_edition}Foil{} {C:attention}Mercurial Cards{}",
        }
      },
      c_abn_zip = {
        name = ".ZIP",
        text = {
          "Enhances all {C:attention}2s{}, {C:attention}3s{}, {C:attention}4s{},",
          "and {C:attention}5s{} in hand into",
          "{C:dark_edition}Holographic{} {C:attention}Mult Cards{}",
        }
      },
      c_abn_obj = {
        name = ".OBJ",
        text = {
          "Convert all {C:attention}face{} cards",
          "in hand into",
          "{C:dark_edition}Abandoned{} {C:attention}Aces"
        }
      },
    },
    weather_report = {
      c_abn_clear_sky = {
        name = "Clear Sky",
        text = {
          "Retrigger all scoring",
          "{C:attention}unenhanced{} cards",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_cloudz = {
        name = "Clouds",
        text = {
          "Destroy {C:attention}1{} selected",
          "{C:attention}Joker{}, copy a",
          "random owned Joker",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_rain = {
        name = "Rain",
        text = {
          "Create a copy of a random",
          "{C:attention}playing card{} in hand",
          "{C:inactive}({C:attention}#1#{C:inactive} uses left)",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_snow = {
        name = "Snow",
        text = {
          "{C:red}+#1#{} discard every round,",
          "{C:attention}Destroy{} all played",
          "{C:attention}non-{C:abn_snow}Snow{} cards",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_storm = {
        name = "Storm",
        text = {
          "Give {C:attention}2{} selected cards",
          "random {C:dark_edition}Editions{}, {C:attention}Seals{},",
          "and {C:attention}Enhancements{}",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_wind = {
        name = "Wind",
        text = {
          "Discard all {C:attention}non-selected{} cards",
          "and draw new ones",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_hail = {
        name = "Hail",
        text = {
          "When a hand is played,",
          "Each card held in hand",
          "has a {C:green}#1# in #2#{} chance",
          "to be {C:red}destroyed{}",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_fog = {
        name = "Fog",
        text = {
          "{C:white,X:mult}X#1#{} Mult",
          "All cards are",
          "drawn {C:attention}face down{}",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_rainbow = {
        name = "Rainbow",
        text = {
          "Give a random {C:dark_edition}Edition{}",
          "to {C:attention}#1#{} random cards in hand",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_tornado = {
        name = "Tornado",
        text = {
          "{C:blue}+#1#{} Hand every round",
          "Discarded cards",
          "are {C:red}destroyed",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_hurricane = {
        name = "Hurricane",
        text = {
          "Draw {C:attention}#1#{} {C:attention}flipped{} cards,",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_ash_cloud = {
        name = "Ash Cloud",
        text = {
          "{C:blue}+#1#{} Hand every round",
          "Debuffs all {C:diamonds}light suits{}",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_drought_weather = {
        name = "Drought",
        text = {
          "Destroy all {C:clubs}Clubs{}",
          "in hand, then {C:attention}draw{} hand",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_frigid = {
        name = "Frigid",
        text = {
          "Scoring {C:diamonds}light suit{} cards",
          "gain random {C:dark_edition}Editions",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_pollen = {
        name = "Pollen",
        text = {
          "Discard all {C:attention}Enhanced{} cards",
          "and draw that many cards",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_blizzard_weather = {
        name = "Blizzard",
        text = {
          "Scoring {C:spades}dark suit{} cards",
          "gain random {C:dark_edition}Editions",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_sandstorm = {
        name = "Sandstorm",
        text = {
          "{C:attention}Destroy{} all {C:abn_snow}Snow{} cards",
          "in hand, then {C:attention}draw{} hand",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_smog = {
        name = "Smog",
        text = {
          "{C:attention}Destroy{} all {C:hearts}Hearts{}",
          "in hand, then {C:attention}draw{} hand",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_dust_devil = {
        name = "Dust Devil",
        text = {
          "{C:attention}Destroy{} all {C:spades}Spades{}",
          "in hand, then {C:attention}draw{} hand",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_acid_rain = {
        name = "Acid Rain",
        text = {
          "{C:attention}Destroy{} all {C:diamonds}Diamonds{},",
          "in hand, then {C:attention}draw{} hand",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_fire_rainbow = {
        name = "Fire Rainbow",
        text = {
          "Level up next played hand",
          "containing a {C:attention}Spectrum{},",
          "{C:red}Destroy{} all played cards",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
      c_abn_dew = {
        name = "Dew",
        text = {
          "{C:blue}+#1#{} Hand every round",
          "Debuffs all {C:spades}dark suits{}",
          "{C:inactive}(Destroyed at end of round)",
        }
      },
    },
    Back = {
      b_abn_CrimsonDeck = {
        name = "Crimson Deck",
        text = {
          "Base {C:chips}Chips{} for",
          "Poker hands are {C:attention}halved{}",
          "{X:mult,C:white}X2{} Mult",
          "{C:red}X1.7{} base Blind size",
        }
      },
      b_abn_AzulDeck = {
        name = "Azul Deck",
        text = {
          "Can {C:chips}play{} and {C:mult}discard{} {C:attention}6{} cards",
          "lose {C:money}$3{} when playing less then {C:attention}6{} cards",
        }
      },
      b_abn_GoldenDeck = {
        name = "Golden Deck",
        text = {
          "Gain {C:money}$1{} per played card",
          "If money reaches {C:money}$0{}",
          "automatically lose the round",
        }
      },
      b_abn_EmeraldDeck = {
        name = "Emerald Deck",
        text = {
          "Start with {C:green,T:v_reroll_surplus}Reroll Surplus{}",
          "and {C:green,T:v_reroll_glut}Reroll Glut{}",
          "{C:attention}0{} Consumable slots",
        }
      },
      b_abn_WhiteDeck = {
        name = "White Deck",
        text = {
          "{C:attention}-2{} Joker Slots",
          "Jokers are {C:attention}2X{} more likely",
          "to be {C:dark_edition}Negative{}",
        }
      },
      b_abn_CatastropheDeck = {
        name = "Catastrophe Deck",
        text = {
          "Replace all {C:tarot}Tarot{} packs",
          "with {C:abn_sigil}Sigil{} packs",
        }
      },
      b_abn_EvenOddDeck = {
        name = "Even and Odd deck",
        text = {
          "Start run with",
          "only {C:attention}numbered{} cards",
          "in your deck",
        }
      },
      b_abn_SnowDeck = {
        name = "Snow Deck",
        text = {
          "Start with a set",
          "of {C:abn_snow}Snow{} cards",
        }
      },
      b_abn_PenumbraDeck = {
        name = "Penumbra Deck",
        text = {
          "Start with a set",
          "of {C:abn_penumbra}Penumbra{} cards",
        }
      },
      b_abn_DarkNebulaDeck = {
        name = "Dark Nebula Deck",
        text = {
          "{C:planet}Planet{} Packs don't appear in the shop",
          "{C:abn_astro}Astro{} Cards appear {C:attention}2X{} more often",
        }
      },
      b_abn_PoltergiestDeck = {
        name = "Poltergiest Deck",
        text = {
          "{C:abn_nightshift}Nightshift{} cards appear more often",
          "Each used {C:attention}consumable{} increases",
          "{C:attention}blind requirements{} by {X:attention,C:white}x0.02{}",
        }
      },
      b_abn_InvertedQualia = {
        name = "Inverted Qualia",
        text = {
          "After every {C:attention}Ante{}",
          "choose a random {C:attention}Suit{}",
          "This suit counts as {C:attention}ALL{} suits",
          "Current Suit: #1#",
        }
      },
      b_abn_OxidizedDeck = {
        name = "Oxidized Deck",
        text = {
          "{C:dark_edition}Enhanced{} Cards are",
          "{C:mult}debuffed{} after {C:attention}scoring",
          "Non-Enhanced cards can't be {C:mult}debuffed{}",
        }
      },
      b_abn_PlatinumDeck = {
        name = "Platinum Deck",
        text = {
          "Start with {C:red}Hone{} and {C:red}Glow Up{}",
          "{C:green}1 in 5{} chance for Jokers",
          "without {C:dark_edition}editions{} to be {C:mult}destroyed",
        }
      }
    },
    Tag = {
      --#region Hazard Tags
      tag_abn_hazard_uncommon = {
        name = "Uncommon Hazard",
        text = {
          "Shop has {C:attention}#1#{} free",
          "{C:green}Uncommon{} Jokers",
        }
      },
      tag_abn_hazard_rare = {
        name = "Rare Hazard",
        text = {
          "Shop has {C:attention}#1#{} free",
          "{C:red}Rare{} Jokers",
        }
      },
      tag_abn_hazard_super = {
        name = "Super Hazard",
        text = {
          "Shop has a free",
          "{C:abn_superrare}Super Rare Joker",
        }
      },
      tag_abn_hazard_parallel = {
        name = "Parallel Hazard",
        text = {
          "Shop has a free",
          "{C:abn_parallelrare}Parallel Rare Joker",
        }
      },
      tag_abn_hazard_legendary = {
        name = "Legendary Hazard",
        text = {
          "Shop has a free",
          "{C:legendary}Legendary Joker",
        }
      },

      tag_abn_hazard_negative = {
        name = "Negative Hazard",
        text = {
          "Add {C:dark_edition}#2#{} to",
          "{C:attention}1 Joker{} and {C:attention}#1# cards{}",
          "in your deck"
        }
      },
      tag_abn_hazard_foil = {
        name = "Foil Hazard",
        text = {
          "Add {C:dark_edition}#2#{} to",
          "a random {C:attention}Joker{} and {C:attention}#1#{}",
          "cards in your {C:attention}full deck"
        }
      },
      tag_abn_hazard_holo = {
        name = "Holographic Hazard",
        text = {
          "Add {C:dark_edition}#2#{} to",
          "a random {C:attention}Joker{} and {C:attention}#1#{}",
          "cards in your {C:attention}full deck"
        }
      },
      tag_abn_hazard_polychrome = {
        name = "Polychrome Hazard",
        text = {
          "Add {C:dark_edition}#2#{} to",
          "a random {C:attention}Joker{} and {C:attention}#1#{}",
          "cards in your {C:attention}full deck"
        }
      },

      tag_abn_hazard_gloss = {
        name = "Gloss Hazard",
        text = {
          "Add {C:dark_edition}#1#{} to",
          "a random {C:attention}Joker{} and {C:attention}1{}",
          "card in your {C:attention}full deck"
        }
      },
      tag_abn_hazard_pearlescent = {
        name = "Pearlescent Hazard",
        text = {
          "Add {C:dark_edition}#1#{} to",
          "a random {C:attention}Joker{} and {C:attention}1{}",
          "card in your {C:attention}full deck"
        }
      },
      tag_abn_hazard_iridescent = {
        name = "Iridescent Hazard",
        text = {
          "Add {C:dark_edition}#1#{} to",
          "a random {C:attention}Joker{} and {C:attention}1{}",
          "card in your {C:attention}full deck"
        }
      },
      tag_abn_hazard_abandon = {
        name = "Abandon Hazard",
        text = {
          "Add {C:dark_edition}#1#{} to",
          "a random {C:attention}Joker{} and {C:attention}1{}",
          "card in your {C:attention}full deck"
        }
      },
      tag_abn_hazard_sunscourge = {
        name = "Sunscourge Hazard",
        text = {
          "Add {C:dark_edition}#1#{} to",
          "a random {C:attention}Joker{} and {C:attention}1{}",
          "card in your {C:attention}full deck"
        }
      },
      --#endregion
      --#region Normal Tags
      tag_abn_gloss = {
        name = "Gloss Tag",
        text = {
          "Next base edition shop",
          "Joker is free and",
          "becomes {C:dark_edition}#1#",
        },
      },
      tag_abn_pearlescent = {
        name = "Pearlescent Tag",
        text = {
          "Next base edition shop",
          "Joker is free and",
          "becomes {C:dark_edition}#1#",
        },
      },
      tag_abn_iridescent = {
        name = "Iridescent Tag",
        text = {
          "Next base edition shop",
          "Joker is free and",
          "becomes {C:dark_edition}#1#",
        },
      },
      tag_abn_abandon = {
        name = "Abandon Tag",
        text = {
          "Next base edition shop",
          "Joker is free and",
          "becomes {C:dark_edition}#1#",
        },
      },
      tag_abn_sunscourge = {
        name = "Sunscourge Tag",
        text = {
          "Next base edition shop",
          "Joker is free and",
          "becomes {C:dark_edition}#1#",
        },
      },
      tag_abn_calamity = {
        name = "Calamity Tag",
        text = {
          "Gives a free",
          "{C:attention}Calamity Pack",
        }
      },
      tag_abn_sigil = {
        name = "Sigil Tag",
        text = {
          "Gives a free",
          "{C:attention}Sigil Pack",
        }
      },
      tag_abn_astro = {
        name = "Astro Tag",
        text = {
          "Gives a free",
          "{C:attention}Astro Pack",
        }
      },
      tag_abn_lefty = {
        name = "Lefty Tag",
        text = {
          "{C:blue}+#1#{} hand",
          "next blind"
        }
      },
      tag_abn_trash = {
        name = "Trash Tag",
        text = {
          "{C:red}+#1#{} discard",
          "next blind"
        }
      },
      tag_abn_top_filled = {
        name = "Top-filled Tag",
        text = {
          "Create up to {C:attention}#1#",
          "{C:green}Uncommon{} Jokers",
          "{C:inactive}(Must have room)",
        }
      },
      tag_abn_unrevealed = {
        name = "Unrevealed Tag",
        text = {
          "Shop has a free",
          "{C:attention}Flipped{} Joker",
          "of a random rarity"
        }
      },
      tag_abn_nightshift = {
        name = "Nightshift Tag",
        text = {
          "Shop has a free",
          "{C:abn_nightshift}Nightshift{} card",
        }
      },
      tag_abn_hazard = {
        name = "Hazard Tag",
        text = {
          "Create a random",
          "{C:abn_hazard}Hazard Tag{}",
        }
      },
      tag_abn_weather_report = {
        name = "Weather Tag",
        text = {
          "Shop has a free",
          "{C:weather_report}Weather{} card",
        }
      },
      tag_abn_lexica = {
        name = "Lexica Tag",
        text = {
          "Shop has a free",
          "{C:lexica}Lexica{} card",
        }
      },
      tag_abn_program = {
        name = "Program Tag",
        text = {
          "Shop has a free",
          "{C:program_pack}Program{} card",
        }
      },
      tag_abn_rank_planet = { -- prolly think of a better name
        name = "Rank Planet Tag",
        text = {
          "Shop has a free",
          "{C:planet}Rank Planet{} card",
        }
      },
      tag_abn_continent = {
        name = "Continental Tag",
        text = {
          "Shop has a free",
          "{C:continent}Continent{} card",
        }
      },
      --#endregion
    },
    Blind = {
      bl_abn_magenta_magnet = {
        name = "Magenta Magnet",
        text = {
          "Hand must contain",
          "a Gold or Steel card"
        },
      },
      bl_abn_silver_star = {
        name = "Silver Star",
        text = {
          "Cards with light suits",
          "are debuffed"
        },
      },
      bl_abn_gold_belt = {
        name = "Gold Belt",
        text = {
          "Hand must contain",
          "a Lucky card"
        },
      },
      bl_abn_lime_lock = {
        name = "Lime Lock",
        text = {
          "Increase requirement",
          "by 5% for each debuffed",
          "card in your deck"
        },
      },
      bl_abn_pink_pin = {
        name = "Pink Pin",
        text = {
          "Must play 3 cards",
          "or less"
        },
      },
      bl_abn_wild_cherry = {
        name = "Wild Cherry",
        text = {
          "Hand must contain",
          "a Wild card"
        },
      },
      bl_abn_teal_tear = {
        name = "Teal Tear",
        text = {
          "Hand must contain",
          "exactly 4 cards"
        },
      },
      bl_abn_dark_shield = {
        name = "Dark Shield",
        text = {
          "Cards with dark suits",
          "are debuffed"
        },
      },
      bl_abn_the_crown = {
        name = "The Crown",
        text = {
          "Hand must contain",
          "a face card"
        },
      },
      bl_abn_lima_anchor = {
        name = "Lima Anchor",
        text = {
          "1st, 3rd, 5th,",
          "and subsequent odd hands",
          "decrease score",
        },
      },
      bl_abn_pink_r = {
        name = "Pink Ya",
        text = {
          "All Jokers must trigger",
        },
      },
      bl_abn_slate_slab = {
        name = "Slate Slab",
        text = {
          "Hand must contain",
          "a Stone card"
        },
      },
      bl_abn_azure_circle = {
        name = "Azure Circle",
        text = {
          "Scored cards only",
          "give 1/4 of their chips"
        },
      },
      bl_abn_rainbow_oracle = {
        name = "Rainbow Oracle",
        text = {
          "Hand must contain",
          "atleast 4 different suits"
        },
      },
      bl_abn_mint_£ = {
        name = "Mint £",
        text = {
          "Mult can't go above 3X $"
        },
      },
      bl_abn_notequal_teal = {
        name = "Not Equal Teal",
        text = {
          "All Joker values are halved"
        },
      },
      bl_abn_orange_± = {
        name = "Orange ±",
        text = {
          "Retriggers are disabled"
        },
      },
      bl_abn_turquoise_yot = {
        name = "Turquoise Yot",
        text = {
          "25% of held cards are destroyed",
        },
      },
      bl_abn_bloody_chain = {
        name = "Bloody Chain",
        text = {
          "Rare Jokers are debuffed",
        },
      },
      bl_abn_ocean_rook = {
        name = "Ocean Rook",
        text = {
          "Cards below rank 5 are debuffed",
        },
      },
      bl_abn_murex_antisigma = {
        name = "Murex Antisigma",
        text = {
          "Cards above rank 5 are debuffed",
        },
      },
      bl_abn_belphegors_prime = {
        name = "Belphegor's Prime",
        text = {
          "2's, 3's, 5's and 7's are debuffed",
        },
      },
      bl_abn_tumeric_chakra = {
        name = "Tumeric Chakra",
        text = {
          "Hand must have atleast 3 suits",
        },
      },
      bl_abn_azurite_axe = {
        name = "Azurite Axe",
        text = {
          "Legendary Jokers are debuffed",
        },
      },
      bl_abn_amaranth_chalice = {
        name = "Amaranth Chalice",
        text = {
          "Debuff 1 card in hand and...",
        },
      },
      bl_abn_inversion_arrow = {
        name = "Inversion Arrow",
        text = {
          "Must contain odd and even cards",
        },
      },
      bl_abn_acid_tower = {
        name = "Acid Tower",
        text = {
          "Jokers with editions are destroyed",
        },
      },
      -- hazard
      bl_abn_hazard_tower = {
        name = "Hazard Tower",
        text = {
          "Jokers with editions are destroyed",
          "Must play 5 cards",
        },
      },
      bl_abn_hazard_arrow = {
        name = "Hazard Arrow",
        text = {
          "Must contain odd and even cards",
          "#1# in 5 cards are flipped",
        },
      },
      bl_abn_hazard_chalice = {
        name = "Hazard Chalice",
        text = {
          "Debuff 1 card in hand",
          "1 random Joker and...",
        },
      },
      bl_abn_hazard_axe = {
        name = "Hazard Axe",
        text = {
          "Legendary Jokers are debuffed",
          "Hand must contain a Spade",
        },
      },
      bl_abn_hazard_chakra = {
        name = "Hazard Chakra",
        text = {
          "Hand must have atleast 3 suits",
          "and 0 discards",
        },
      },
      bl_abn_hazard_belphegor = {
        name = "Hazard Belphegor",
        text = {
          "2's, 3's, 5's and 7's are debuffed",
          "Only one hand type can be played this round",
        },
      },
      bl_abn_hazard_antisigma = {
        name = "Hazard Antisigma",
        text = {
          "Cards above rank 5 are debuffed",
          "Forces 1 card to always be selected"
        },
      },
      bl_abn_hazard_rook = {
        name = "Hazard Rook",
        text = {
          "Cards below rank 5 are debuffed",
          "No repeating hand types",
        },
      },
      bl_abn_hazard_chain = {
        name = "Hazard Chain",
        text = {
          "Rare Jokers are debuffed",
          "Base Chips and Mult",
          "are halved",
        },
      },
      bl_abn_hazard_magnet = {
        name = "Hazard Magnet",
        text = {
          "Hand must contain",
          "a Gold and a Steel card",
          "Debuff a random Joker",
          "after each hand"
        },
      },
      bl_abn_hazard_star = {
        name = "Hazard Star",
        text = {
          "Cards with light suits",
          "are debuffed",
          "Can only discard 1",
          "card at a time"
        },
      },
      bl_abn_hazard_belt = {
        name = "Hazard Belt",
        text = {
          "Hand must contain",
          "a Lucky card",
          "Increase blind requirement",
          "by 5% when a card is triggered"
        },
      },
      bl_abn_hazard_pin = {
        name = "Hazard Pin",
        text = {
          "Must play 2 cards",
          "or less",
          "Debuff the rightmost Joker",
          "every hand"
        },
      },
      bl_abn_hazard_lock = {
        name = "Hazard Lock",
        text = {
          "Debuff 12 random playing cards",
          "when blind is set",
          "Increase requirement",
          "by 7% for each debuffed",
          "card in your deck"
        },
      },
      bl_abn_hazard_slab = {
        name = "Hazard Slab",
        text = {
          "Hand must contain",
          "a Stone card",
          "Debuff the leftmost Joker",
          "every hand"
        },
      },
      bl_abn_hazard_circle = {
        name = "Hazard Circle",
        text = {
          "Scored cards do not",
          "give any chips",
          "A random card is debuffed",
          "before scoring"
        }
      },
      bl_abn_hazard_oracle = {
        name = "Hazard Oracle",
        text = {
          "Hand must contain",
          "atleast 5 different suits",
          "Debuff the rightmost Joker",
          "every hand"
        },
      },
      bl_abn_hazard_cherry = {
        name = "Hazard Cherry",
        text = {
          "Hand must contain",
          "a Wild card",
          "Played hand must contain",
          "5 cards or less" -- confusion??
        },
      },
      bl_abn_hazard_tear = {
        name = "Hazard Tear",
        text = {
          "Hand must contain",
          "exactly 3 cards",
          "All jokers are Debuffed",
          "after the first hand"
        },
      },
      bl_abn_hazard_shield = {
        name = "Hazard Shield",
        text = {
          "Cards with dark suits",
          "are debuffed",
          "All jokers are Debuffed",
          "after the first hand"
        },
      },
      bl_abn_hazard_crown = {
        name = "Hazard Crown",
        text = {
          "Hand must contain",
          "a King or a Queen",
          "Face cards only",
          "give half of their chips"
        },
      },
      bl_abn_hazard_heart = {
        name = "Hazard Heart",
        text = {
          "2 random Jokers",
          "and 1 card",
          "disabled every hand",
        },
      },
      bl_abn_hazard_bell = {
        name = "Hazard Bell",
        text = {
          "Forces 2 cards to",
          "always be selected",
          "Debuffs the leftmost Joker",
        },
      },
      bl_abn_hazard_acorn = {
        name = "Hazard Acorn",
        text = {
          "Flips and shuffles",
          "all Joker cards",
          "every hand,",
          "Debuffs the rightmost Joker",
        },
      },
      bl_abn_hazard_leaf = {
        name = "Hazard Leaf",
        text = {
          "All cards debuffed",
          "until 2 Jokers sold",
        },
      },
      bl_abn_hazard_vessel = {
        name = "Hazard Vessel",
        text = {
          "Very Large blind,",
          "leftmost card in",
          "hand is debuffed",
        },
      },
      bl_abn_hazard_anchor = {
        name = "Hazard Anchor",
        text = {
          "1st, 3rd, 5th,",
          "and subsequent odd hands",
          "decrease score",
          "must play 5 cards",
        },
      },
      bl_abn_hazard_r = {
        name = "Hazard Ya",
        text = {
          "All Jokers must trigger",
          "Hands above level 3 are debuffed",
        },
      },
      bl_abn_hazard_£ = {
        name = "Hazard £",
        text = {
          "Mult can't go above 2X $",
          "2 card Hands are debuffed",
        },
      },
      bl_abn_hazard_notequal = {
        name = "Not Equal Hazard",
        text = {
          "All Joker values are halved",
          "3 card Hands are debuffed",
        },
      },
      bl_abn_hazard_± = {
        name = "Hazard ±",
        text = {
          "Retriggers are disabled",
          "Hearts are debuffed",
        },
      },
      bl_abn_hazard_yot = {
        name = "Hazard Yot",
        text = {
          "50% of held cards are destroyed",
          "Spades are debuffed",
        },
      },
    },
    Joker = {
      j_abn_elementalist_joker = {
        name = "Elementalist Joker",
        text = {
          {
            "Upgrade level of played",
            "hand if it contains",
            "{C:attention}6{} or more suits",
          },
          {
            "If {C:attention}poker hand{} is a",
            "{C:attention}#1#{}, level up",
            "{C:planet}planet{} {C:attention}rank{} of all cards scored"
          }
        }
      },
      j_abn_hand_puppet = {
        name = "Hand Puppet",
        text = {
          "This Joker gains {C:attention}double{} the",
          "rank of {C:dark_edition}editioned{} cards",
          "held in hand as {C:mult}Mult{}",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
        }
      },
      j_abn_hawk = {
        name = "Hawk",
        text = {
          {
            "Scored {C:abn_penumbra}Penumbras{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:abn_penumbra}Penumbra{} is scored",
          },
          {
            "On {C:attention}winning hand{} of round,",
            "level up {C:planet}planet{} {C:attention}rank{}",
            "of all cards scored"
          }
        }
      },
      j_abn_kaufmo = {
        name = "Kaufmo",
        text = {
          {
            "Scored {C:abn_snow}Snows{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:abn_snow}Snow{} is scored",
          },
          {
            "On {C:attention}winning hand{} of round,",
            "level up {C:planet}planet{} {C:attention}rank{}",
            "of all cards scored"
          }
        }
      },
      j_abn_uboa = {
        name = "Uboa",
        text = {
          {
            "Scored {C:spades}Dark suits{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:spades}Dark suit{} is scored",
          },
          {
            "On {C:attention}winning hand{} of round,",
            "level up {C:planet}planet{} {C:attention}rank{}",
            "of all cards scored"
          }
        }
      },
      j_abn_kefka = {
        name = "Kefka",
        text = {
          {
            "Scored {C:diamonds}Light suits{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:diamonds}Light suit{} is scored",
          },
          {
            "On {C:attention}winning hand{} of round,",
            "level up {C:planet}planet{} {C:attention}rank{}",
            "of all cards scored"
          }
        }
      },
      j_abn_hastur = {
        name = "Hastur",
        text = {
          "Scored {C:diamonds}Diamonds{} give {X:mult,C:white}X#1#{} Mult,",
          "increases by {X:mult,C:white}X#2#{} Mult",
          "when a {C:diamonds}Diamond{} is scored",
        }
      },
      j_abn_giacomo = {
        name = "Giacomo",
        text = {
          "Scored {C:hearts}Hearts{} give {X:mult,C:white}X#1#{} Mult,",
          "increases by {X:mult,C:white}X#2#{} Mult",
          "when a {C:hearts}Heart{} is scored",
        }
      },
      j_abn_cicero = {
        name = "Cicero",
        text = {
          "Scored {C:spades}Spades{} give {X:mult,C:white}X#1#{} Mult,",
          "increases by {X:mult,C:white}X#2#{} Mult",
          "when a {C:spades}Spade{} is scored",
        }
      },
      j_abn_spawn_joker = {
        name = "Spawn Joker",
        text = {
          {
            "Scoring {C:attention}6s{} and {C:attention}4s{}",
            "become {C:dark_edition}Negative{}",
          },
          {
            "{C:dark_edition}Negative{} cards",
            "give double their rank",
            "as {C:chips}chips{} when scored"
          },
          {
            "{C:green}#1# in #2#{} chance for",
            "played {C:attention}Infra{} cards",
            "level up scoring hand",
          },
        }
      },
      j_abn_i_am_not_joker = {
        name = "I am not Joker",
        text = {
          {
            "When {C:attention}Boss Blind{} is defeated,",
            "{C:attention}leftmost{} Joker becomes {C:attention}flipped{}",
          },
          {
            "Gains {C:mult}+#2#{} Mult when a",
            "{C:attention}flipped{} Joker triggers",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
          },
          {
            "If this card is {C:attention}flipped{},",
            "convert first scoring card",
            "into a {C:attention}Hazard Card{}",
          },
        }
      },
      j_abn_rekoj_esrever = {
        name = "Rekoj Esrever",
        text = {
          {
            "Scoring {C:attention}flipped{} cards",
            "turn face up after scoring",
          },
          {
            "Gains {C:mult}+#2#{} Mult and {C:chips}+#3#{} Chips",
            "per card {C:attention}unflipped{}",
            "{C:inactive}(Currently {C:chips}+#4#{C:inactive} Chips, {C:mult}+#1#{C:inactive} Mult)",
          },
        }
      },
      j_abn_lawn_joker = {
        name = "Lawn Joker",
        text = {
          {
            "Scoring {C:spades}Spades{} permanently",
            "gain {C:chips}+#5#{} Chips and {C:mult}+#6#{} Mult",
            "per {C:continent}Continent{} card held",
          },
          {
            "This Joker gains {C:chips}+#2#{} Chips and",
            "{C:mult}+#4#{} Mult per {C:weather_report}Weather{} card used",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, {C:mult}+#3#{C:inactive} Mult)",
          },
        }
      },
      j_abn_joker_tv = {
        name = "Joker TV",
        text = {
          "When you use a {C:program_pack}Program{} card all Joker sell values increase by {C:money}$#1#{} and all {C:diamonds}Light{} Suits gain {C:mult}+#2#{} Mult",
        }
      },
      j_abn_classified_joker = {
        name = "Classified Joker",
        text = {
          {
            "All Cards and Jokers become",
            "{C:attention}flipped{} upon purchase",
          },
          {
            "Pay {C:money}$#1#{} to {C:attention}unflip{}",
            "selected Cards and Jokers",
            "and gain {C:chips}+#2#{} Chips",
            "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)"
          }
        }
      },
      j_abn_cenobite_joker = {
        name = "Cenobite Joker",
        text = {
          "If played hand is a {C:attention}#1#{},",
          "add {C:dark_edition}Chthonian{} effect to",
          "first and last scoring {C:diamonds}light suits{}"
        },
      },
      j_abn_calendar = {
        name = "Calendar",
        text = {
          "{C:abn_Astro}Astro{} cards always",
          "{C:green}succeed{} during round"
        }
      },
      j_abn_marionette_joker = {
        name = "Marionette Joker",
        text = {
          {
            "Forces {C:attention}#3#{} cards to",
            "always be selected",
          },
          {
            "This Joker gains {C:white,X:mult}X#2#{} Mult",
            "for every card scored",
            "{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult)"
          }
        }
      },
      j_abn_glasgow_smile = {
        name = "Glasgow Smile",
        text = {
          "Played cards with {C:spades}dark suits{}",
          "in your {C:attention}first{} and {C:attention}last{} hand",
          "become {C:dark_edition}Chthonian{} and {C:attention}flipped{}",
        }
      },
      j_abn_slippery_joker = {
        name = "Slippery Joker",
        text = {
          "Earn {C:money}$#1#{} when a {C:weather_report}Weather{} card",
          "destroys itself without triggering,",
          "This Joker gains {C:money}$#2#{} of {C:attention}sell value{}",
          "when a {C:weather_report}Weather{} card triggers"
        }
      },
      j_abn_joker_stamp = {
        name = "Joker Stamp",
        text = {
          "{C:continent}Continent{} cards may appear",
          "in any {C:attention}Booster Pack{}",
          --[[
          --i swear this is like impossible to check... or idk :p
          --(maybe we do a context or something? but for EVERY continent card is a bit excessive)
          "Cards affected by {C:continent}Continent{} cards",
          "permanently gain {C:chips}+5{} Chips",
          "and {C:mult}+2{} Mult"
          --]]
        }
      },
      j_abn_penultimate_joker = {
        name = "Penultimate Joker",
        text = {
          {
            "Retrigger all played cards",
            "with a {C:diamonds}light suit{} once",
            "for every unique {C:attention}Enhancement{}",
            "on scoring {C:spades}dark suits"
          },
          {
            "Retrigger all played cards",
            "with a {C:spades}dark suit{} once",
            "for every unique {C:attention}Enhancement{}",
            "on scoring {C:diamonds}light suits"
          }
        }
      },
      j_abn_ultimo_joker = {
        name = "Ultimo Joker",
        text = {
          "Retrigger all played cards",
          "once for every unique",
          "{C:attention}Enhancement{} in scoring hand"
        }
      },
      j_abn_time_attack = {
        name = "Time Attack",
        text = {
          {
            "All {C:attention}Jokers{} scale",
            "{C:attention}twice{} as fast"
          },
          {
            "Retrigger all played cards",
            "with {C:dark_edition}editions",
          },
          {
            "All Jokers must trigger",
            "before {C:attention}Blind{} is defeated,",
            "otherwise {C:red}destroy all cards in deck{}"
          }
        }
      },
      j_abn_joker_rave = {
        name = "Joker Rave",
        text = {
          {
            "When a {C:attention}Blind{} is selected,",
            "{C:attention}flip{} all Jokers and Cards",
            "without editions"
          },
          {
            "This Joker gains {C:chips}+#2#{} Chips",
            "when a {C:attention}flipped{} card scores,",
            "Gains {C:mult}+#4#{} Mult when a",
            "{C:attention}flipped{} Joker is triggered",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, {C:mult}+#3#{C:inactive} Mult)"
          },
          {
            "If this Joker has an {C:dark_edition}edition{},",
            "{C:attention}retrigger{} all played",
            "{C:attention}flipped{} cards"
          }
        }
      },
      j_abn_joker_collector = {
        name = "Joker Collector",
        text = {
          "This Joker gains {C:chips}+#1#{} Chips for",
          "every unique joker {C:attention}purchased{} this run,",
          "Gives {C:white,X:mult}X#3#{} Mult if you have",
          "purchased {C:attention}10{} or more Jokers ",
          "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
        }
      },
      j_abn_moe_joker = {
        name = "Moe Joker",
        text = {
          "{C:attention}Polkadot{} cards {C:attention}held",
          "in hand count in scoring,",
          "{C:attention}Polkadot{} cards permanently gain",
          "{C:mult}+#1#{} Mult when scored"
        }
      },
      j_abn_frontier_joker = {
        name = "Frontier Joker",
        text = {
          {
            "Earn {C:money}$#1#{} per {C:attention}consumable{}",
            "held at end of round",
          },
          {

            "Add {C:money}$#2#{} of {C:attention}sell value",
            "to every {C:attention}Joker{} when",
            "a {C:continent}Continent{} card is used"
          }
        }
      },
      j_abn_explorer_joker = {
        name = "Explorer Joker",
        text = {
          {
            "Scoring {C:diamonds}Diamond{} cards gain",
            "{C:chips}+#6#{} Chips and {C:mult}+#7#{} Mult",
            "per {C:continent}Continent{} card held"
          },
          {
            "{C:continent}Continent{} cards sell for {C:money}$#5#{},",
            "This Joker gains {C:chips}+#2#{} Chips and",
            "{C:mult}+#4#{} Mult per sold {C:continent}Continent{} card",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, {C:mult}+#3#{C:inactive} Mult)"
          }
        }
      },
      j_abn_undiscovered_sunset = {
        name = "Undiscovered Sunset",
        text = {
          {
            "First scoring {C:abn_penumbra}Penumbra{} card in a",
            "{C:attention}#5#{} gains {C:dark_edition}Sunscourge"
          },
          {
            "Gains {C:mult}+#4#{} Mult and {C:chips}+#2#{} Chips",
            "per {C:dark_edition}Sunscourge{} card scored",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult, {C:chips}+#3#{C:inactive} Chips)"
          },
          {
            "{C:continent}Continent{} cards become {C:dark_edition}Negative{}",
            "upon purchase"
          }
        }
      },
      j_abn_holy_mountain = {
        name = "Holy Mountain",
        text = {
          {
            "First scoring {C:abn_snow}Snow{} card in a",
            "{C:attention}#5#{} gains {C:dark_edition}Sunscourge"
          },
          {
            "Gains {C:mult}+#4#{} Mult and {C:chips}+#2#{} Chips",
            "per {C:dark_edition}Sunscourge{} card scored",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult, {C:chips}+#3#{C:inactive} Chips)"
          },
          {
            "When a {C:attention}non-negative{} {C:weather_report}Weather{} card",
            "is destroyed, create a {C:dark_edition}Negative{} copy of it"
          }
        }
      },
      j_abn_armageddon_road = {
        name = "Armageddon Road",
        text = {
          {
            "When {C:attention}Big Blind{} is defeated,",
            "destroy all held {C:continent}Continent{} cards",
            "and create a {C:dark_edition}Negative{} {C:calamity_cards}Calamity{}",
            "card for every one destroyed"
          },
          {
            "When {C:attention}Big Blind{} is defeated,",
            "destroy all held {C:tarot}Tarot{} cards",
            "and create a {C:dark_edition}Negative{} {C:weather_report}Weather{}",
            "card for every one destroyed"
          },
        }
      },
      j_abn_castle_jester = {
        name = "Castle Jester",
        text = {
          "If a {C:continent}Continent{} card is held,",
          "Adds the rank of all {C:attention}face{} cards",
          "held in hand to this Joker's {C:mult}Mult{},",
          "Adds the rank of all {C:attention}numbered{} cards",
          "held in hand to this Joker's {C:chips}Chips{}",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult, {C:chips}+#2#{C:inactive} Chips)"
        }
      },
      j_abn_jokertopia = {
        name = "Jokertopia",
        text = {
          {
            "All {C:continent}Continent{} cards are {C:attention}free{,",
          },
          {
            "If a {C:continent}Continent{} card is held,",
            "Every Joker gains {C:mult}+#1#{} Mult",
            "per unique scoring suit in a {C:attention}#2#{}",
          }
        }
      },
      j_abn_joker_republic = {
        name = "Joker Republic",
        text = {
          {
            "When {C:attention}Big Blind{} is selected,",
            "create a {C:continent}Continent{} card",
            "{C:inactive}(Must have room)",
          },
          {
            "When a {C:continent}Continent{} card is used,",
            "level up first scoring card's rank"
          }
        }
      },
      j_abn_caesar = {
        name = "Caesar Joker",
        text = {
          {
            "Scoring {C:hearts}Hearts{} permanently",
            "gain {C:chips}+#5#{} Chips and {C:mult}+#6#{} Mult",
            "per {C:continent}Continent{} card {C:attention}held{}",
          },
          {
            "This Joker gains {C:chips}+#1#{} Chips",
            "and {C:white,X:mult}X#2#{} Mult when",
            "score {C:attention}catches fire{}",
            "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips, {C:white,X:mult}X#4#{C:inactive} Mult)",
          }
        }
      },
      j_abn_map_joker = {
        name = "Map Joker",
        text = {
          {
            "Scoring {C:attention}Aces{} permanently",
            "gain {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
            "per {C:continent}Continent{} card {C:attention}held{}",
          },
          {
            "Mult and Chips gained increases",
            "by {C:chips}+#3#{} Chips and {C:mult}+#4#{} Mult",
            "when a {C:continent}Continent{} card is used"
          }
        }
      },
      j_abn_gachapon = {
        name = "Gachapon",
        text = {
          "When {C:attention}Blind{} is selected, {C:money}-$#1#{},",
          "{C:green}#2# in #3#{} chance to create",
          "a random {C:green}Uncommon{} Joker,",
          "{C:green}#4# in #5#{} chance to create",
          "a random {C:red}Rare{} Joker,",
          "{C:red}self-destructs at $0{}",
          "{C:inactive}(Must have room)",
        }
      },
      j_abn_stygian_joker = {
        name = "Stygian Joker",
        text = {
          {
            "Played cards with a {C:hearts}Heart{} suit",
            "have a {C:green}#3# in #4#{} chance",
            "to gain {C:dark_edition}Chthonian{}"
          },
          {
            "Gives {X:mult,C:white}X#1#{} Mult",
            "for each {C:dark_edition}Chthonian{} Card",
            "in your {C:attention}full deck",
            "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
          },
        },
      },
      j_abn_cyber_half = {
        name = "Cyber Half",
        text = {
          "{C:attention}Steel Cards{} give",
          "gives {C:attention}twice{} their rank as",
          "{C:chips}Chips{} when held in hand",
        }
      },
      j_abn_artistic_interpretation = { -- I did this art :D (cloudzXIII)
        name = "Artistic Interpretation",
        text = {
          "This Joker gains {C:chips}+#2#{} Chips",
          "per {C:attention}consecutive{} hand played",
          "with the same {C:attention}poker hand{}",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
        }
      },
      j_abn_stop_sign = {
        name = "Stop Sign",
        text = {
          "{C:attention}Jokers{} no longer appear in the {C:attention}shop{},",
          "You may choose up to {C:attention}2{} cards",
          "from all {C:attention}Buffoon{} Packs"
        }
      },
      j_abn_tag_joker = {
        name = "Tag Joker",
        text = {
          "This Joker gains {C:white,X:mult}X#2#{} Mult",
          "when a {C:attention}Tag{} is triggered",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
        }
      },
      j_abn_green_horn = {
        name = "Green Horn",
        text = {
          "{C:white,X:mult}X#1#{} Mult,",
          "You cannot play your",
          "{C:attention}highest level{} hand",
          "{C:inactive}(Currently {C:attention}#2#{C:inactive})"
        }
      },
      j_abn_hieroglyph = {
        name = "Hieroglyph",
        text = {
          "{C:attention}Unscored{} cards become",
          "{C:attention}Fossil Cards{} when played"
        }
      },
      j_abn_heart_of_glass = {
        name = "Heart of Glass",
        text = {
          "{C:attention}Glass Cards{} give {C:white,X:chips}X#1#{} Chips",
          "when scored, and always {C:attention}shatter",
          "This Joker gains {C:chips}+#2#{} Chips",
          "for every {C:hearts}Heart{} {C:attention}Glass Card{} destroyed",
          "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)"
        }
      },
      j_abn_living_card = {
        name = "Living Card",
        text = {
          "{C:attention}Unscored{} cards permanently",
          "gain {C:chips}+#2#{} Chips and {C:mult}+#1#{} Mult",
          "when played"
        }
      },
      j_abn_bibliophile = {
        name = "Bibliophile",
        text = {
          "{C:attention}+2{} Consumable Slots",
          "When a {C:attention}Boss Blind{} is defeated,",
          "Gains {X:mult,C:white}X#5#{} Mult if a {C:lexica}Lexica{} Card is {C:attention}held{}",
          "Gains {C:mult}+#6#{} Mult if a {C:program_pack}Program{} Card is {C:attention}held{}",
          "Gains {C:chips}+#8#{} Chips if a {C:weather_report}Weather{} Card is {C:attention}held{}",
          "Gains {X:chips,C:white}X#7#{} Mult if a {C:calamity_cards}Calamity{} Card is {C:attention}held{}",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult,{} {C:mult}+#2#{} {C:inactive}Mult,{} {X:chips,C:white}X#3#{} {C:inactive}Chips,{} {C:chips}+#4#{} {C:inactive}Chips){}"
        }
      },
      j_abn_drifter_joker = {
        name = "Drifter Joker",
        text = {
          "If {C:attention}first discard{} of round,",
          "discarded cards become {C:attention}Fossil Cards{},",
          "{C:attention}Rankless{} cards {C:attention}return{} to hand",
          "when played for the first time"
        }
      },
      j_abn_elated_joker = {
        name = "Elated Joker",
        text = {
          {
            "Hands containing {C:attention}4{} or more",
            "Suits cannot be debuffed"
          },
          {
            "This Joker gains {C:chips}+#4#{} per",
            "unique {C:attention}suit{} discarded,",
            "gains {C:mult}+#2#{} Mult per",
            "unique {C:attention}suit{} played",
            "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips, {C:mult}+#1#{C:inactive} Mult)",
          }
        }
      },
      j_abn_ironworks = {
        name = "Ironworks",
        text = {
          {
            "Gives {X:mult,C:white}X#3#{} Mult",
            "for each {C:attention}Hot Iron Card",
            "in your {C:attention}full deck",
            "{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)",
          },
          {
            "Gives {X:chips,C:white}X#1#{} Chips",
            "for each {C:attention}Steel Card",
            "in your {C:attention}full deck",
            "{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive} Chips)",
          }
        }
      },
      j_abn_prehistoric_joker = {
        name = "Prehistoric Joker",
        text = {
          "This Joker gains {C:white,X:mult}X#2#{} Mult",
          "when a {C:attention}Stone Card{} scores, {C:white,X:chips}X#4#{}",
          "Chips when a {C:attention}Fossil Card{} scores",
          "{C:inactive}(Currently {C:white,X:chips}X#3#{C:inactive} Chips, {C:white,X:mult}X#1#{C:inactive} Mult)",
        }
      },
      j_abn_spare_suit = {
        name = "Spare Suit",
        text = {
          "This Joker gains {C:mult}+#2#{} Mult",
          "if played hand contains a {C:attention}#3#{},",
          "Retrigger played {C:attention}Mercurial Cards{}",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
        }
      },
      j_abn_underblackcloudz = {
        name = "Under Black Cloud",
        text = {
          "Retrigger all {C:weather_report}Weather{} effects,",
          "This Joker gains {C:chips}+#4#{} Chips and {C:mult}+#2#{} Mult",
          "when a {C:weather_report}Weather{} effect {C:attention}triggers",
          "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips, {C:mult}+#1#{C:inactive} Mult)",
        }
      },
      j_abn_monocromator_joker = {
        name = "Monocromator Joker",
        text = {
          {
            "When a {C:weather_report}Weather{} Card is used,",
            "add {C:dark_edition}Abandoned{} to {C:attention}lowest{}",
            "ranked card held in hand",
          },
          {
            "This Joker gains {C:chips}+#4#{} Chips{}",
            "and {C:mult}+#2#{} Mult when an",
            "{C:dark_edition}Abandoned{} card is scored",
            "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips, {C:mult}+#1#{C:inactive} Mult)",

          }
        }
      },
      j_abn_joker_of_the_weekend = {
        name = "Joker by the Weekend",
        text = {
          "When {C:attention}odd Blind{} is defeated,",
          "this Joker gains {C:white,X:mult}X#2#{} Mult,",
          "When {C:attention}even Blind{} is defeated,",
          "this Joker gains {C:white,X:chips}X#4#{} Chips",
          "{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult, {C:white,X:chips}X#3#{C:inactive} Chips)"
        }
      },
      j_abn_joker_of_the_week = {
        name = "Joker by the Week",
        text = {
          "When {C:attention}Blind{} is defeated with",
          "an {C:attention}odd{} number of {C:attention}Jokers,",
          "this Joker gains {C:white,X:mult}X#2#{} Mult,",
          "otherwise gain {C:white,X:chips}X#4#{} Chips",
          "{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult, {C:white,X:chips}X#3#{C:inactive} Chips)"
        }
      },
      j_abn_zip_folder = {
        name = "ZIP Folder",
        text = {
          "{C:attention}Doubles{} consumable slots,",
          "When {C:attention}Blind{} is defeated",
          "gain {C:chips}+#2#{} Chips for",
          "each consumable {C:attention}held{}",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
        }
      },
      j_abn_crimson_neko = {
        name = "Crimson Neko",
        text = {
          "{C:attention}Lucky{} cards cannot be debuffed,",
          "This Joker gains {X:chips,C:white}X#2#{} Chips",
          "every time a {C:attention}Lucky{} card",
          "{C:green}successfully{} triggers",
          "{C:inactive}(Currently {X:chips,C:white}X#1#{C:inactive} Mult)",
        },
      },
      j_abn_brothers_memento = {
        name = "Brother's Memento",
        text = {
          "First played {C:attention}Ace",
          "card gives {X:mult,C:white} X#1# {} Mult",
          "when scored",
        },
      },
      j_abn_qrcode_joker = {
        name = "QR Code",
        text = {
          "Create a {C:program_pack}Program{} card",
          "when {C:attention}Blind{} is selected",
          "{C:inactive}(Must have room)",
        },
      },
      j_abn_foreign_license = {
        name = "Foreign License",
        text = {
          "{X:chips,C:white}X#1#{} Mult if you have",
          "at least {C:attention}#2#{} Enhanced",
          "cards in your full deck",
          "{C:inactive}(Currently {C:attention}#3#{C:inactive})",
        },
      },
      j_abn_blackhat_joker = {
        name = "Blackhat Joker",
        text = {
          "Every played card gives",
          "{C:chips}+#1#{} Chips when scored if",
          "a {C:program_pack}Program{} card is {C:attention}held{}"
        }
      },
      j_abn_jimbo_10 = {
        name = "Jimbo 10",
        text = {
          {
            "This Joker gains {C:chips}+#4#{} Chips",
            "and {C:white,X:mult}X#2#{} Mult",
            "when a {C:attention}10{} is scored",
            "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips, {X:mult,C:white}X#1#{C:inactive} Mult)",
          },
          {
            "Earn {C:money}$#5#{} for each",
            "{C:attention}10{} in your {C:attention}full deck",
            "at end of round",
            "{C:inactive}(Currently {C:money}$#6#{}{C:inactive})",
          }
        }
      },
      j_abn_whitedwarf_joker = {
        name = "Whitedwarf Joker",
        text = {
          "This Joker gains",
          "{X:mult,C:white}X#1#{} Mult every time",
          "a {C:planet}Rank Planet{} card is used",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_abn_avalanche_joker = {
        name = "Avalanche",
        text = {
          "{X:mult,C:white}X#1#{} Mult if played",
          "hand has a scoring",
          "{C:abn_snow}Snow{} card and a scoring",
          "card of any other {C:attention}suit",
        },
      },
      j_abn_syntha_joker = {
        name = "Syntha Joker",
        text = {
          "{C:red}+#1#{} Mult per {C:lexica}Lexica{}",
          "card activated this run",
          "{C:inactive}(Currently {C:red}+#2#{C:inactive})",
        }
      },
      j_abn_frigid_joker = {
        name = "Frigid Joker",
        text = {
          "Played cards with",
          "{C:abn_snow}#2#{} suit give",
          "{C:mult}+#1#{} Mult when scored",
        },
      },
      j_abn_scrabble_joker = {
        name = "Scrabble Joker",
        text = {
          "This Joker gains",
          "{X:mult,C:white}X#2#{} Mult every time",
          "a {C:lexica}Lexica{} card is activated",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
        },
      },
      j_abn_ishihara_joker = {
        name = "Ishihara Joker",
        text = {
          "Played cards with",
          "{C:abn_penumbra}#2#{} suit give",
          "{C:mult}+#1#{} Mult when scored",
        },
      },
      j_abn_alternate_outfit = {
        name = "Alternate Outfit",
        text = {
          {
            "You may play and discard",
            "up to {C:attention}6{} cards,",
          },
          {
            "This Joker gains {C:mult}+#2#{} Mult",
            "if played hand is a {C:attention}#4#{},",
            "Played {C:attention}Infra{} cards permanently",
            "gain {C:money}$#3#{} when scored",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
          }
        }
      },
      j_abn_vintage_joker = {
        name = "Vintage Joker",
        text = {
          "This Joker gains {C:chips}+#2#{} Chips",
          "when a {C:attention}Fossil Card{} is scored",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
        }
      },
      j_abn_egg_arrival = {
        name = "Egg Arrival",
        text = {
          {
            "Add {C:money}$#1#{} of {C:attention}sell value",
            "to every {C:attention}Joker{} when",
            "a {C:weather_report}Weather{} card is used",
          },
          {
            "Retrigger all {C:attention}Jokers{}",
            "with at least {C:money}$#2#{} sell value",
          },
        }
      },
      j_abn_shovel_knight = {
        name = "Shovel Knight",
        text = {
          "Adds one {C:attention}Fossil{} card",
          "to deck when",
          "{C:attention}Blind{} is selected",
        },
      },
      j_abn_jimbo_inscryption = {
        name = "Jimbo Inscryption",
        text = {
          "Each {C:attention}9{} and {C:attention}3{}",
          "held in hand",
          "give {C:white,X:mult}X#1#{} Mult"
        }
      },
      j_abn_wildfrost_joker = {
        name = "Wildfrost Joker",
        text = {
          "This Joker gains {C:mult}+#3#{} if",
          "played hand is a {C:attention}#5#{}",
          "and gains {C:chips}+#4#{} Chips when",
          "a {C:abn_snow}Snow{} card is scored",
          "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips, {C:mult}+#1#{C:inactive} Mult){}"
        }
      },
      j_abn_crybaby = {
        name = "Crybaby",
        text = {
          "Playing cards permanently",
          "gain {C:mult}+#1#{} Mult",
          "when {C:attention}discarded",
        }
      },
      j_abn_photoalbum = {
        name = "Photoalbum Joker",
        text = {
          "This Joker gains {C:chips}+#2#{} Chips",
          "per {C:attention}Face{} card held in hand",
          "when a {C:attention}numbered{} card scores",
          "Resets if played hand contains a {C:attention}face{} card",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips){}"
        }
      },
      j_abn_will = {
        name = "Will",
        text = {
          "Gain {X:chips,C:white}X#2#{} Chips when",
          "scoring hands with",
          "{C:attention}odd{} ranked cards",
          "{C:inactive}(A, 9, 7, 5, 3)",
          "{C:inactive}(Currently {C:white,X:chips}X#1#{C:inactive} Chips){}"
        }
      },
      j_abn_archibald = {
        name = "Archibald",
        text = {
          "Gain {X:chips,C:white}X#2#{} Chips when",
          "scoring hands with",
          "{C:attention}even{} ranked cards",
          "{C:inactive}(10, 8, 6, 4, 2)",
          "{C:inactive}(Currently {C:white,X:chips}X#1#{C:inactive} Chips){}"
        }
      },
      j_abn_malware_joker = {
        name = "Malware Joker",
        text = {
          "Retrigger all {C:attention}Jokers{},",
          "Every Joker has a",
          "{C:green}#1# in #2#{} chance to",
          "be {C:red}destroyed{} every hand",
        }
      },
      j_abn_planet_rejok = {
        name = "Planet Rejok",
        text = {
          "Gives {C:mult}Mult{} and {C:chips}Chips",
          "of all {C:attention}hand types{} contained",
          "within played hand"
        }
      },
      j_abn_planetary_joker = {
        name = "Planetary Joker",
        text = {
          "Create the {C:planet}Planet{} card",
          "for played {C:attention}poker hand{}",
          "in {C:attention}final hand{} of round",
        }
      },
      j_abn_moon_joker = {
        name = "Moon Joker",
        text = {
          "This Joker gains",
          "{C:mult}+#2#{} Mult every time",
          "a {C:planet}Planet{} card is used",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
        }
      },
      j_abn_planet_joker = {
        name = "Planet Joker",
        text = {
          "If {C:attention}Boss Blind{} is defeated",
          "in a {C:attention}single{} hand,",
          "Upgrade every {C:legendary,E:1}poker hand",
          "by {C:attention}#1#{} level",
        }
      },
      j_abn_attack_777 = {
        name = "Attack 777",
        text = {
          "{X:mult,C:white}X#3#{} Mult if played hand contains",
          "only {C:hearts}Hearts{} and {C:diamonds}Diamonds{}.",
          "{C:green}#1# in #2#{} chance to retrigger",
          "each {C:attention}played{} card",
        }
      },
      j_abn_ancient_prophet = {
        name = "Ancient Prophet",
        text = {
          "Retrigger any {C:red}Debuffed{} and",
          "{C:attention}Flipped{} card, {C:red}Debuffed{}",
          "and {C:attention}Flipped{} cards give",
          "{C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips when scored",
        }
      },
      j_abn_trojan_joker = {
        name = "Trojan Joker",
        text = {
          "When {C:attention}Blind{} is selected, {C:red}destroys{} both",
          "{C:attention}adjacent Jokers{}, and gains their",
          "accumulated {C:chips}Chips{}, {C:mult}Mult{}, and {X:mult,C:white}XMult{}",
          '{C:inactive}(Currently {C:chips}+#1#{C:inactive}/{C:mult}+#2#{C:inactive}/{X:mult,C:white}X#3#{C:inactive})',
        }
      },
      j_abn_sacred_bleu = {
        name = 'Sacred Bleu',
        text = {
          "This Joker gains {C:white,X:mult}X#2#{} Mult",
          "per unique {C:attention}suit{},",
          "{C:chips}+#4#{} Chips per unique {C:attention}rank{},",
          "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips, {C:white,X:mult}X#1#{} {C:inactive}Mult)",
        },
      },
      j_abn_sacred_rouge = {
        name = 'Sacred Rouge',
        text = {
          "Each scored card with a ",
          "{C:attention}matching suit{} scores {C:chips}+#1#{} Chips,",
          "each scored card with a",
          "{C:attention}matching rank{} scores {C:mult}+#2#{} Mult"
        }
      },
      j_abn_ichor = {
        name = "Ichor Joker",
        text = {
          "{C:dark_edition}#2#{} Jokers",
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
            "played {C:attention}numbered{} cards",
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
          "{C:mult}+#1#{} Mult when scored if",
          "played hand is {C:attention}symmetrical{}",
          "{C:inactive}(ex: {C:attention}4 3 5 3 4{C:inactive})",
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
          "{C:green}#1# in #2#{} chance to",
          "destroy played {C:attention}Wild Cards{}"
        }
      },
      j_abn_superhero = {
        name = "Superhero",
        text = {
          "Each played {C:attention}numbered{} card",
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
          "once when used"
        }
      },
      j_abn_braile_joker = {
        name = "Braile Joker",
        text = {
          "{C:green}#1# in #2#{} chance for",
          "cards to be drawn {C:attention}face down{}",
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
          "Each played {C:attention}Ace{} and {C:attention}numbered{}",
          "card gives their rank",
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
          "Pay {C:money}$#1#{} to unflip all",
          "{C:attention}flipped{} cards in hand",
        }
      },
      j_abn_yharman_joker = {
        name = "Yharman Joker",
        text = {
          "Destroy played {C:attention}flipped{} cards",
          "after scoring and gain {C:white,X:mult}X#2#{} Mult per card",
          "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
        }
      },
      j_abn_negative_suit = {
        name = "Negative Suit",
        text = {
          "Gives {C:chips}+#1#{} Chips",
          "for each {C:dark_edition}#3#{} Card",
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
          "and gain a {C:dark_edition}#1#{}, {C:dark_edition}#2#{},",
          "or {C:dark_edition}#3#{} edition",
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
          "Each scoring {C:attention}Steel{} Card gives {C:chips}+#1#{} Chips",
          "Each scoring {C:attention}Stone{} Card gives {X:mult,C:white}X#2#{} Mult",
        }
      },
      j_abn_van_joker = {
        name = "Van Joker",
        text = {
          "{C:attention}+#1#{} voucher slot",
          "in {C:green}shop"
        }
      },
      j_abn_best_employ = {
        name = "Best Employee",
        text = {
          "This Joker gains {C:white,X:mult}X#2#{} Mult",
          "for every {C:attention}Boss Blind{} beaten",
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
        name = "Executioner",
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
          "and add a {C:dark_edition}#1#{}, {C:dark_edition}#2#{},",
          "or {C:dark_edition}#3#{} edition",
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
          "destroy the {C:attention}lowest{} ranked",
          "card and earn {C:money}$#3#{} and",
          "This Joker gains {C:chips}+#2#{} Chips",
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
          "when a {C:attention}#3#{} card",
          "is scored, then add",
          "{C:dark_edition}#4#{} to it",
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
          "{C:dark_edition}#2#{} cards",
          "and Jokers give {C:mult}+#1#{} Mult"
        }
      },
      j_abn_maxwell_joker = {
        name = "Maxwell Joker",
        text = {
          "{C:dark_edition}#2#{} cards and",
          "Jokers give {X:chips,C:white}X#1#{} Chips"
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
          "{C:dark_edition}#2#{} cards",
          "and Jokers give {X:mult,C:white}X#1#{} Mult"
        }
      },
      j_abn_polychameleon = {
        name = "Polychameleon",
        text = {
          "Gives {C:white,X:mult}X#1#{} Mult",
          "for each {C:dark_edition}#4#{} or",
          "{C:dark_edition}#3#{} Joker owned",
          "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
        }
      },
      j_abn_dark_magokert = {
        name = "Dark Magokert",
        text = {
          "Cards with a {C:spades}dark suit{}",
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
          "Scored {C:attention}numbered",
          "{C:attention}Mult Cards{} permanently",
          "gain {C:white,X:mult}X#1#{} Mult"
        }
      },
      j_abn_wee_bonus = {
        name = "Wee Bonus",
        text = {
          "Scored {C:attention}numbered",
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
          "{C:inactive}(ex: {C:attention}Q K A 2 3{C:inactive})",
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
          "this Joker gains their",
          "{C:attention}rank{} as {C:mult}Mult{}",
          "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult)"
        }
      },
      j_abn_turf_graffiti = {
        name = "Turf Graffiti",
        text = {
          "Played cards with",
          "{C:spades}dark{} suit give",
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
          "{C:chips}+Chips{} or {C:mult}+Mult{}, add",
          "that amount to this Joker",
          "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult, {C:chips}+#2#{} {C:inactive}Chips)"
        }
      },
      j_abn_fairytale_book = {
        name = "Fairytale Book",
        text = {
          "{C:legendary,E:1}Legendary{} Jokers may",
          "appear in the {C:attention}Shop",
        }
      },
      j_abn_wireframe_joker = {
        name = "Wireframe Joker",
        text = {
          "{C:green}#1# in #2#{} chance for each",
          "played {C:attention}numbered{} card to",
          "create a {C:tarot}Tarot{} card",
          "when scored",
          "{C:inactive}(Must have room)",
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
          "This Joker gains {C:mult}+#5#{} Mult and",
          "{C:chips}+#4#{} Chips per card scored",
          "if played hand contains",
          "a {C:attention}#1#",
          "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult, {C:chips}+#2#{C:inactive} Chips)",
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
        name = "Ruined Bastion",
        text = {
          "When {C:attention}Blind{} is selected,",
          "add {C:dark_edition}#1#{} to",
          "{C:attention}rightmost{} Joker"
        }
      },
      j_abn_joker_midnight = {
        name = "Joker by Midnight",
        text = {
          {
            "Debuff all {C:diamonds}Light{} cards"
          },
          { "When {C:attention}Blind{} is selected,",
            "add {C:dark_edition}#3#{} to",
            "leftmost Joker"
          },
          {
            "Gives {C:mult}+#1#{} Mult",
            "for each {C:dark_edition}#3#{} Joker",
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
            "add {C:dark_edition}#3#{} to",
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
            "become {C:dark_edition}#3#{}",
            "when scored",
          },
          {
            "Gives {X:mult,C:white} X#1# {} Mult",
            "for each {C:dark_edition}#3#{} card",
            "in your {C:attention}full deck",
            "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
          }
        }
      },
      j_abn_jorick = {
        name = "Jorik",
        text = {
          "This Joker gains",
          "{X:mult,C:white} X#1# {} Mult every {C:attention}#2#{C:inactive} (#3#){}",
          "cards drawn to hand",
          "{C:inactive}(Currently {X:mult,C:white} X#4# {C:inactive} Mult)",
        },
      },
      j_abn_nightstalker = {
        name = "Nightstalker Joker",
        text = {
          {
            "All played {C:spades}Dark{} cards",
            "become {C:dark_edition}#3#{}",
            "when scored",
          },
          {
            "Gives {X:mult,C:white} X#1# {} Mult",
            "for each {C:dark_edition}#3#{} card",
            "in your {C:attention}full deck",
            "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
          },
        },
      },


      j_abn_bloody_comedian = {
        name = "Bloody Comedian",
        text = {
          {
            "When {C:attention}Blind{} is selected,",
            "destroy Joker to the left",
            "and create a random",
            "{C:attention}Comedian{} Joker",
          },
          {
            "{C:attention}Comedian{} Jokers",
            "each give {X:mult,C:white} X#1# {} Mult",
          }
        },
      },
      j_abn_bubbly_comedian = {
        name = "Bubbly Comedian",
        text = {
          "This Joker gains {C:mult}+#4#{} Mult,",
          "{C:chips}+#5#{} Chips and {C:money}+$#6#{} when",
          "a {C:attention}Comedian{} Joker is triggered",
          "{C:inactive,s:0.8}(Excluding Bubbly Comedian)",
          "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive}, {C:chips}+#2#{} {C:inactive}, {C:money}$#3#{}{C:inactive})"
        }
      },
      j_abn_gimbo = {
        name = "Gimbo",
        text = {
          "Each played {C:attention}2{},",
          "{C:attention}3{}, or {C:attention}5{} gives",
          "{C:white,X:mult}X#1#{} Mult when scored",
        }
      },
      j_abn_boozy_joker = {
        name = "Boozy Joker",
        text = {
          {
            "Can {C:blue}play{} and {C:red}discard{}",
            "up to {C:attention}6{} cards"
          },
          {
            "{C:attention}6{} card hands",
            "give {C:money}$#1#{}"
          }
        }
      },
      j_abn_witching_hour = {
        name = "Witching Hour",
        text = {
          {
            "All cards with a {C:spades}dark suit{}",
            "are drawn face down",
          },
          {
            "This Joker gains {X:mult,C:white}X#2#{} Mult",
            "per card drawn face down",
            "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
          }
        }
      },
      j_abn_bitcoin_joker = {
        name = "Bitcoin Joker",
        text = {
          "When an {C:abn_Astro}Astro{} card {C:red}fails{},",
          "this Joker gains {C:chips}+#4#{} Chips",
          "and {C:money}$#2#{} of {C:attention}sell value{},",
          "When an {C:abn_Astro}Astro{} card {C:green}succeeds{},",
          "this Joker gains {C:mult}+#3#{} Mult",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, {C:mult}+#5#{C:inactive} Mult)",
        },
      },
      j_abn_joker_form = {
        name = "Joker Form",
        text = {
          "Each played {C:attention}8{} or {C:attention}2",
          "gives {C:chips}+#1#{} Chips and",
          "{C:mult}+#2#{} Mult when scored",
        },
      },
      j_abn_10_4_joker = {
        name = "10-4 Joker",
        text = {
          "Each played {C:attention}10{} gains {C:mult}+#1#{} Mult",
          "Each played {C:attention}4{} gains {C:chips}+#2#{} Chips"
        },
      },
      j_abn_light_collage = { -- TO RELOCALIZE
        name = "Light Collage",
        text = {
          "Gains {C:chips}+#1#{} Chips when a {C:edition}Foil{} card scores",
          "Gains {C:mult}+#2#{} Mult when a {C:edition}Gloss{} card scores",
          "{C:green}#3# in {C:green}#4#{} chance to convert 1 random non edition card",
          "in the deck into a {C:edition}Foil{} card when {C:abn_sigil}Sigil card{} is used",
          "{C:green}#5# in {C:green}#6#{} chance to convert 1 random non edition card",
          "in the deck into a {C:edition}Gloss{} card when {C:abn_sigil}Sigil card{} is used",
          "{C:inactive}(Currently {C:chips}+#7#{C:inactive} Chips, {C:mult}+#8#{C:inactive} Mult)"
        },
      },
      j_abn_funambulist = {
        name = "Funambulist",
        text = {
          "{C:chips}+#1#{} Chips per Joker to the {C:attention}right{},",
          "{C:mult}+#2#{} Mult per Joker to the {C:attention}left{}"
        }
      },
      j_abn_marques_the_joker = {
        name = "Marques the Joker",
        text = {
          "Played {C:attention}Gold Cards{}",
          "permanently gain {X:mult,C:white}+X#1#{} Mult",
          "and {C:chips}+#2#{} chips when scored",
          "Non-gold cards gets debuffed when scored",
        },
      },
      j_abn_alchemical_joker = {
        name = "Alchemical Joker",
        text = {
          "This Joker gives {X:mult,C:white}X#1#{} Mult",
          "for each unique {C:attention}Enhancement{},",
          "{C:dark_edition}Edition{}, {C:attention}Seal{} and {C:attention}Sticker",
          "in scored hand",
        },
      },
      j_abn_sanguine_treasure = {
        name = "Sanguine Treasure",
        text = {
          "Scoring {C:attention}Gold cards",
          "gives double their {C:chips}chips{} and {C:money}money",
        },
      },
      j_abn_vitamin_joker = {
        name = "Vitamin Joker",
        text = {
          "Scoring cards with a {C:attention}seal",
          "permanently gain {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult,",
          "{C:green}#3# in #4#{} chance this card is",
          "{C:attention}eaten{} after a hand is played"
        },
      },
      j_abn_combo_maker = {
        name = 'Combo Maker',
        text = {
          "This Joker gains {C:white,X:mult}X#2#{} Mult",
          "per {C:attention}consecutive{} hand played",
          "with at least {C:attention}1 numbered card{}",
          "{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult)",
        },
      },
      j_abn_the_mule = {
        name = "The Mule",
        text = {
          "{C:chips}+#1#{} Chips,",
          "{C:red}-#2#{} chips for",
          "each {C:money}$1{} you have",
          "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)",
        }
      },
      j_abn_artistic_difference = {
        name = "Artistic Difference",
        text = {
          "If {C:attention}first hand{} of round",
          "contains no {C:attention}face{} cards,",
          "create the {C:planet}Planet{} card",
          "of played {C:attention}poker hand{}",
          "{C:inactive}(Must have room)"
        }
      },
      j_abn_zoom_in = {
        name = 'Zoom In',
        text = {
          "This Joker gains {C:mult}+#2#{} Mult",
          "if hand played contains",
          "an {C:attention}Ace{} and a {C:attention}numbered card{}",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
        },
      },

      j_abn_abandonia = {
        name = "Abandonia",
        text = {
          "Scored cards",
          "give {C:white,X:mult}X#1#{} Mult",
          "and {C:white,X:chips}X#2#{} Chips"
        },
      },
      j_abn_felix_joker = {
        name = 'Felix Joker',
        text = {
          "When {C:attention}Blind{} is defeated,",
          "turn held {C:attention}consumables{}",
          "into {C:spectral}Spectral{} cards",
        }
      },
      j_abn_gris_gris_joker = {
        name = 'Gris Gris Joker',
        text = {
          "{C:blue}Blue{} and {C:purple}Purple{} {C:attention}seals{}",
          "can {C:attention}activate{} when played"
        }
      },
      j_abn_misplaced_texture = {
        name = 'Misplaced Texture',
        text = {
          "All {C:attention}face{} cards",
          "are considered",
          "{C:attention}numbered{} cards",
        },
      },
      j_abn_missing_texture = {
        name = 'Missing Texture',
        text = {
          "Turns every scored card into an {C:attention}Ace{}"
        },
      },
      j_abn_mult_speed = {
        name = 'Mult Speed',
        text = {
          "Scoring cards in {C:attention}even hands{} permanently gain {C:mult}+#1#{} mult",
          "Scoring cards in {C:attention}odd hands{} permanently gain {C:chips}+#2#{} chips",
          "Scoring cards in {C:attention}final hands{} permanently gain {C:money}$#3#",
        }
      },
      j_abn_old_as_dirt = {
        name = 'Old as Dirt',
        text = {
          "This Joker gains {C:white,X:mult}X#1# {} Mult for",
          "each {C:money}$1{} below {C:red}$0{}",
          "{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)"
        }
      },

      j_abn_transvestite_joker = {
        name = 'Transvestite Joker',
        text = {
          "Any cards that have had their",
          "rank or suit changed gain",
          "{C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips"
        }
      },

      j_abn_double_entendre = {
        name = "Double Entendre",
        text = {
          "{C:white,X:mult}X#1#{} Mult on {C:attention}even hands{},",
          "{C:white,X:chips}X#2#{} Chips on {C:attention}odd hands{}",
        }
      },
      j_abn_tronie_joker = {
        name = "Tronie Joker",
        text = {
          "{C:chips}+#3#{} Joker Slots",
          "{X:mult,C:white}#1#X{} {C:attention}Blind requirement{}",
          "Increases by {X:mult,C:white}#2#X{} when {C:attention}Ante{} is defeated",
        },
      },
      j_abn_garden_gnome = {
        name = "Garden Gnome",
        text = {
          "{C:attention}Scored{} {C:spades}Spades{} and {C:clubs}Clubs",
          "have a {C:green}#1#{} in {C:green}#2#",
          "to become {C:dark_edition}Negative",
        }
      },
      j_abn_interminable_joker = {
        name = "Interminable Joker",
        text = {
          "If you have 6 or more {C:attention}Jokers",
          "each one gives {X:mult,C:white}X#1#{} {C:mult}Mult",
        }
      },
      j_abn_codding_error = {
        name = "Coding Error",
        text = {
          "{C:attention}Retrigger{} cards with {C:red}even{} ranks",
          "{C:attention}flips{} between {C:red}even{} and {C:blue}odd{} each round",
          "{C:inactive}(Currently {C:attention}#1#{C:inactive})"
        }
      },
      j_abn_figurehead = {
        name = "Figurehead",
        text = {
          "Retrigger all",
          "{C:legendary,E:1}Legendary{} Jokers"
        }
      },
      j_abn_joker_invoice = {
        name = "Joker Invoice",
        text = {
          "{C:mult}+#1#{} Mult",
          "if hand is played with",
          "{C:money}$#2#{} or less"
        }
      },
      j_abn_daddy_warbucks = {
        name = "Daddy Warbucks",
        text = {
          "Played cards give",
          "{C:chips}+#1#{} Chips when scored",
          "if hand is played with",
          "{C:money}$#2#{} or more"
        }
      },
      j_abn_fatal_silhouette = {
        name = "Fatal Silhouette",
        text = {
          "Retrigger all",
          "played {C:attention}face{} cards",
          "and destroy them",
          "{C:attention}after{} scoring"
        }
      },
      j_abn_joerror = {
        name = "Joeerror",
        text = {
          "Jokers each give",
          "{X:mult,C:white} X#1# {} Mult,",
          "{C:red,E:1}self-destructs{}"
        }
      },
      j_abn_pankert = {
        name = "Pankert",
        text = {
          "This Joker gains {C:white,X:mult}X#1#{}",
          "for each {C:attention}consumable{} held",
          "{C:inactive}(Currently {C:white,X:mult}X#2#{} {C:inactive}Mult)"
        }
      },
      j_abn_final_showdown = {
        name = "Final Showdown",
        text = {
          {
            "{C:attention}Boss Blinds{} are replaced",
            "with {C:legendary,E:1}Showdown{}{C:attention} Boss Blinds{}",
          },
          {
            "Gains {C:attention}+#1#{} Joker Slot",
            "when a {C:legendary,E:1}Showdown{}{C:attention} Boss Blind{}",
            "is defeated"
          }
        }
      },
      j_abn_dead_or_alive = {
        name = "Dead or Alive",
        text = {
          "When a {C:attention}#1#{} of {V:1}#2#{} is played,",
          "permanently double it's {C:chips}chips{}",
          "and gain {C:money}${} equal to it's rank",
          "{s:0.8}Card changes every round",
        },
      },
      j_abn_getter_robo = {
        name = "Getter Robo!",
        text = {
          "{X:mult,C:white}X#1#{} Mult {X:chips,C:white}X#2#{} Chips {X:attention,C:white}X#3#{} {C:attention}Boss requirement{}",
          "{C:attention}Double{} these values after {C:attention}boss blind{} is defeated",
        },
      },
      j_abn_joker_blast = {
        name = "Joker Blast",
        text = {
          "This Joker gains {C:chips}+#1#{} Chips",
          "and {C:mult}+#2#{} Mult for each",
          "{c:attention}consecutive {C:attention}Blind{} beaten",
          "in a {C:attention}single{} hand",
          "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips, {C:mult}+#4#{C:inactive} Mult){}"
        },
      },
      j_abn_metropolitan_joker = {
        name = "Metropolitan Joker",
        text = {
          "{X:mult,C:white}X#1#{} Mult for each {C:attention}#2#{}",
          "card in your {C:attention}full deck{}",
          "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
        }
      },
      j_abn_telejoker = {
        name = "TeleJoker",
        text = {
          "Retrigger all cards played if",
          "hand is a {C:attention}#1#{} or {C:attention}#2#{}",
          "only containing {C:attention}#3#{} cards"
        }
      },
      j_abn_spice_melange = {
        name = "Spice Melange",
        text = {
          "Retrigger Joker to the {C:attention}left{}",
          "for the next {C:attention}#1#{} hands"
        }
      },
      j_abn_electrocuted_joker = {
        name = "Electrocuted Joker",
        text = {
          {
            "Retrigger all {C:attention}#1#s{} and {C:attention}#2#s{}",
          },
          {
            "{C:green}#3# in #4#{} chance to {C:red}destroy{}",
            "{C:attention}#1#s{} and {C:attention}#2#s{} when scored"
          }
        }
      },
      j_abn_demolition_expert = {
        name = "Demolition Expert",
        text = {
          "{X:mult,C:white}X#1#{} Mult",
          "{C:red}Destroy{} leftmost Joker",
          "after each hand played",
          --"{s:0.8}#2# excluded"
        }
      },
      j_abn_prime_paul = {
        name = "Prime Paul",
        text = {
          "Each played {C:attention}#1#{}, {C:attention}#2#{}, {C:attention}#3#{} or {C:attention}#4#{}",
          "gives {X:mult,C:white}X#5#{} Mult when scored"
        }
      },
      j_abn_composite_charles = {
        name = "Composite Charles",
        text = {
          "Each played {C:attention}#1#{}, {C:attention}#2#{}, {C:attention}#3#{}, {C:attention}#4#{} or {C:attention}#5#{}",
          "gives {X:chips,C:white}X#6#{} Chips when scored"
        }
      },
      j_abn_certified_joker = {
        name = "Certified Joker",
        text = {
          "Each played {C:attention}#1#{} gives {X:mult,C:white}X#2#{} Mult",
          "and {X:chips,C:white}X#3#{} Chips when scored"
        }
      },
      j_abn_ante_up = {
        name = "Ante Up!",
        text = {
          "Cards {C:attention}held in hand{} give",
          "{C:attention}double{} their ranks as {C:red}Mult{}.",
          "Winning ante is {C:attention}doubled{}",
        }
      },
      j_abn_the_joker = {
        name = "The Joker",
        text = {
          "Scored cards reduce {C:attention}blind requirement{} by {C:attention}10%{}",
        }
      },
      j_abn_annihilated_joker = {
        name = "Annihilated Joker",
        text = {
          "Every {C:attention}#1#{} {C:inactive}(#2#){} {C:attention}Jokers{} destroyed,",
          "Create a random {C:abn_Calamity}Calamity Card",
          "{C:inactive}(Must have room)",
        }
      },
      j_abn_astro_joker = {
        name = "Astro Joker",
        text = {
          "All {C:abn_Astro}Astro Cards{} always {C:green}succeed",
          "{C:green}#1# in #2# chance{} this {C:attention}Joker{} is",
          "{C:red}destroyed{} at end of round.",
        }
      },
      j_abn_archaic_joker = {
        name = "Archaic Joker",
        text = {
          "This Joker gains {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
          "When a {C:attention}blind{} is defeated with",
          "an {C:attention}odd{} number of cards",
          "{C:inactive}(Currently {C:chips}+#3#{} {C:inactive}Chips,{} {C:mult}+#4#{} {C:inactive}Mult{}{C:inactive})",
        }
      },
      j_abn_outdated_joker = {
        name = "Outdated Joker",
        text = {
          "This Joker gains {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
          "if {C:attention}Blind{} is defeated with",
          "an {C:attention}even{} number of cards",
          "{C:inactive}(Currently {C:chips}+#3#{} {C:inactive}Chips,{} {C:mult}+#4#{} {C:inactive}Mult){}",
        }
      },
      j_abn_haphazard_joker = {
        name = "Haphazard Joker",
        text = {
          "Enhanced {C:attention}Even{} cards give {X:mult,C:white}X#4#{} Mult",
          "Increase this by {X:mult,C:white}X#3#{} for each card scored",
          "{C:green}#1# in #2#{} chance for a {C:abn_hazard}Hazard Tag{}",
          "to be created when {C:attention}Even{} cards score",
        }
      },
      j_abn_prenatural_joker = {
        name = "Prenatural Joker",
        text = {
          "Enhanced {C:attention}Odd{} cards give {X:chips,C:white}X#4#{} Chips",
          "Increase this by {X:chips,C:white}X#3#{} for each card scored",
          "{C:green}#1# in #2#{} chance for a {C:attention}Voucher{}",
          "to be created when {C:attention}Odd{} cards score",
        }
      },
      j_abn_jokerge = {
        name = "Jokerge",
        text = {
          "{C:attention}Double{} all Joker values",
        }
      },
      j_abn_hunter_license = {
        name = "Hunter License",
        text = {
          "Gain {C:money}$#1#{} when this obtained",
          "{C:mult}self-destructs{} if money reaches {C:money}$0{}",
        }
      },
      j_abn_triple_star_license = {
        name = "Triple Star License",
        text = {
          "{X:mult,C:white}X#1#{} Mult {X:chips,C:white}X#2#{} Chips",
          "{C:mult}self-destructs{} if a Joker is sold",
        }
      },
      j_abn_patient_zero = {
        name = "Patient Zero",
        text = {
          "When {C:attention}Blind{} is selected,",
          "apply a sticker",
          "to {C:attention}rightmost Joker",
        }
      },
      j_abn_melnibone_comedian = {
        name = "Melnibone Comedian",
        text = {
          "Gain {X:mult,C:white}X#3#{} Mult when a Joker is {C:attention}sold{}",
          "Gain {C:chips}+#4#{} Chips when a Joker is {C:mult}destroyed{}",
          "{C:inactive}C(urrently{} {X:mult,C:white}X#1#{} {C:inactive}Mult,{} {C:chips}+#2#{} {C:inactive}Chips){}",
          "{C:attention}Sold{} and {C:mult}destroyed{} Jokers cannot reappear",
        }
      },
      j_abn_camorrista = {
        name = "Camorrista",
        text = {
          "When {C:attention}Blind{} is selected,",
          "steal {C:money}$#3#{} of sell value from other Jokers,",
          "Gain {X:mult,C:white}X#2#{} Mult for every {C:money}$#3#{} stolen",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
        }
      },
      j_abn_watermelon = {
        name = "Watermelon",
        text = {
          "Jokers gain {C:mult}+#3#{} Mult when {C:attention}triggered{},",
          "{C:green}#1# in #2#{} chance to be",
          "{C:attention}consumed{} at end of round",
        }
      },
      j_abn_jakdos = {
        name = "Jakdos",
        text = {
          "{X:mult,C:white}X#1#{} Mult",
          "Scoring cards without {C:dark_edition}Chthonian{} are {C:mult}Debuffed{}"
        }
      },
      j_abn_power_four = {
        name = "Power Four",
        text = {
          "Retrigger all cards in hands",
          "containing {C:attention}4{} or more {C:attention}suits{},",
          "This Joker gains {X:mult,C:white}X#2#{} Mult",
          "per different suit used",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
        }
      },
      j_abn_daybreak_aurora = {
        name = "Daybreak Aurora",
        text = {
          "Scoring {C:dark_edition}Holographic{} cards give {C:chips}+#2#{} Chips,",
          "{C:dark_edition}Holographic{} Jokers give {C:chips}+#1#{} Chips,",
          "{C:attention}double{} the number of chips given",
          "if this Joker is {C:dark_edition}Holographic{}",
        }
      },
      j_abn_bowie = {
        name = "Bowie",
        text = {
          "Jokers with {C:dark_edition}Editions{}",
          "each give {X:mult,C:white}X#1#{} Mult",
        }
      },
      j_abn_blackmore_joker = {
        name = "Blackmore Joker",
        text = {
          "The first {C:attention}scoring card{} gives",
          "its {C:attention}Rank{} as {X:mult,C:white} XMULT {}",
        }
      },
      j_abn_feste = {
        name = "Feste",
        text = {
          "Create a {C:dark_edition}Negative{}",
          "{C:abn_nightshift}Nightshift{} card when",
          "{C:attention}Blind{} is selected",
        }
      },
      j_abn_aliasing_joker = {
        name = "Aliasing Joker",
        text = {
          { "Adds {C:dark_edition}Gloss{}, {C:dark_edition}Pearlescent{},",
            "or {C:dark_edition}Iridescendent{} edition to",
            "first scoring {C:attention}numbered{} card",
            "of {C:attention}first{} and {C:attention}final{} hand",
          },
          {
            "Scoring cards with {C:dark_edition}editions{} give {C:money}$#1#",
          },
        }
      },
      j_abn_ponzi = {
        name = "Ponzi",
        text = {
          "All cards gain {C:mult}+#1#{} Mult and",
          "{C:chips}+#2#{} Chips when {C:money}money{} is lost,",
          "Lose {C:money}$#3#{} per {C:attention}scoring{} card"
        }
      },
      j_abn_forsake_joker = { -- TO RELOCALIZE
        name = "Forsake Joker",
        text = {
          "When {C:dark_edition}Abandoned edition{} triggers gain {C:money}$#1#{}",
          "If triggered on a {C:attention}Card{} gain Chips equal to {C:attention}double{} its rank",
          "If triggered on a {C:attention}Joker{} gain {C:mult}+#4#{} Mult",
          "{C:inactive}(Currently{} {C:mult}+#3#{} {C:inactive}Mult, {C:chips}+#2# {C:inactive}Chips)",
        }
      },
      j_abn_conspiracy_joker = {
        name = "Conspiracy Joker",
        text = {
          "On {C:attention}Even{} turns flip all and shuffle all Jokers",
          "If a Joker triggers while flipped gain {C:mult}+#3#{} Mult",
          "On {C:attention}Odd{} turns flip all Jokers face up",
          "If a Joker triggers while face up gain {C:chips}+#4#{} Chips",
          "{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult, {C:chips}+#1# {C:inactive}Chips)",
        }
      },
      j_abn_mana = {
        name = "Mana",
        text = {
          "If {C:attention}first hand{} of round,",
          "add {C:dark_edition}Sunscourge{} to first",
          "scoring {C:attention}Ace{} and {C:attention}2",
        }
      },
      j_abn_streetart_joker = {
        name = "Streetart Joker",
        text = {
          "Stone Cards retain their",
          "{C:attention}rank{} and {C:attention}suit{}",
        }
      },
      j_abn_ill_gotten_gains = {
        name = "Ill-gotten Gains",
        text = {
          "{C:attention}Glass Cards{} give {C:money}$#1#{} when scored,",
          "Earn {C:money}$#2#{} for every",
          "{C:attention}Glass Card{} destroyed",
        }
      },
      j_abn_forgemaster_joker = {
        name = "Forgemaster Joker",
        text = {
          "{C:attention}Unscoring{} cards turn into {C:attention}Hot Iron{} cards",
          "{C:attention}Hot Iron{} cards can score when played",
        }
      },
      j_abn_carnival_comedian = {
        name = "Carnival Comedian",
        text = {
          "{C:abn_superrare}Super Rare{} Jokers may appear in the shop,",
          "This Joker gains {X:mult,C:white}X#2#{} Mult each time",
          "you purchase a {C:abn_superrare}Super Rare{} Joker",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
        }
      },
      j_abn_malefactor_comedian = {
        name = "Malefactor Comedian",
        text = {
          "Gains {C:chips}Chips{} {C:attention}equal{} to the the ranks of scoring Light Suits",
          "Gains {C:mult}Mult{} {C:attention}equal{} to the the ranks of scoring Dark Suits",
          "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult, {C:chips}+#2# {C:inactive}Chips)",
        }
      },
      j_abn_basiquat_joker = { -- TO RELOCALIZE
        name = "Basiquat Joker",
        text = {
          "If hand contains an {C:attention}even{} number of scoring cards",
          "Gain {C:chips}Chips{} equal to {C:attention}twice{} the {C:money}sell value{} of current Jokers",
          "If hand contains an {C:attention}odd{} number of scoring cards",
          "Gain {C:mult}Mult{} equal to {C:attention}twice{} the {C:money}sell value{} of current Jokers",
          "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult, {C:chips}+#2# {C:inactive}Chips)",
        }
      },
      j_abn_coercive_comedian = {
        name = "Coercive Comedian",
        text = {
          "Card {C:chips}play{} and {C:mult}discard{} limit {C:attention}+1{}",
          "Gain {X:mult,C:white}X#2#{} Mult per {C:attention}Unique{} number card scored",
          "Gain {C:chips}+#4#{} Chips per hand played",
          "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult, {C:chips}+#3# {C:inactive}Chips)",
        }
      },
      j_abn_night_comedian = {
        name = "Night Comedian",
        text = {
          "Each scored {C:attention}Enhanced{} card gains {C:chips}+#5#{} Chips and {C:mult}+#6#{} Mult for each matching {C:attention}Enhancement{}",
          "This Joker gains {C:chips}+#4#{} Chips per scoring Enhanced card",
          "Each scored {C:dark_edition}Editioned{} card gains {C:chips}+#6#{} Chips and {C:mult}+#5#{} Mult for each matching {C:dark_edition}Edition{}",
          "This Joker gains {X:mult,C:white}X#3#{} Mult per scoring {C:dark_edition}Edition{}",
          "{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult, {C:chips}+#1# {C:inactive}Chips)",
        }
      },
      j_abn_minimus = {
        name = "Minimus",
        text = {
          "Scoring number cards below {C:attention}5{}",
          "Give {X:mult,C:white}X#1#{} Mult and {X:chips,C:white}X#2#{} Chips",
        }
      },
      j_abn_claus = {
        name = "Claus",
        text = {
          "Retrigger {C:attention}first{} scoring card",
          "once per remaining {C:attention}discard",
        }
      },
      j_abn_jamie = {
        name = "Jamie",
        text = {
          "Upgrade level of",
          "played {C:attention}poker hand{}",
        }
      },
      j_abn_richard = {
        name = "Richard",
        text = {
          {
            "Forces {C:attention}1{} card to",
            "always be selected",
          },
          {
            "{C:attention}Force-selected{} cards give {X:mult,C:white}X#1#{} Mult,",
            "Retrigger {C:attention}force-selected{} cards",
            "once for every card {C:attention}held{} that",
            "that shares a {C:attention}suit{} with it",
          }
        }
      },
      j_abn_tom = {
        name = "Tom",
        text = {
          "Retrigger {C:attention}last{} scoring card",
          "once per remaining {C:attention}hand",
        }
      },
      j_abn_goldcartridge_joker = {
        name = "Golden Cartridge",
        text = {
          "Jokers with a lower {C:attention}sell value",
          "than this Joker give {X:mult,C:white}X#1#{} Mult,",
          "Gains {C:money}$#2#{} of {C:attention}sell value{}",
          "at end of round",
        }
      },
      j_abn_insolvent_comedian = {
        name = "Insolvent Comedian",
        text = {
          "All Jokers gain {C:chips}+#1#{} Chips",
          "and {C:mult}+#2#{} Mult if played hand",
          "matches the {C:attention}final poker hand{}",
          "of {C:attention}previous{} round",
          "{C:inactive}(Currently {C:attention}#4#{C:inactive})",
        }
      },
      j_abn_inescapable_encounter = {
        name = "Inescapable Encounter",
        text = {
          "Scored cards gain {C:chips}Chips{}",
          "equal to their {C:attention}ranks{},",
          "{C:mult}Skips{} are disabled",
        }
      },
      j_abn_joker_of_destruction = {
        name = "Joker Of Destruction",
        text = {
          "if {C:attention}first hand{} of round",
          "contains {C:attention}4{} cards,",
          "{C:mult}Destroy{} them and create a summoning {C:spectral}Spectral{} card",
        }
      },
      j_abn_tier_list = {
        name = "Tier List",
        text = {
          "Based on the rarity of the last obtained Joker grant the following:",
          "{C:common}Common{}: {C:chips}+#6#{} Chips",
          "{C:uncommon}Uncommon{}: {C:mult}+#7#{} Mult",
          "{C:rare}Rare{}: {X:mult,C:white}+X#8#{} Mult",
          "{C:abn_superrare}Super Rare: {X:chips,C:white}+X#9#{} Chips ",
          "{C:purple}Parallel Rare: {C:attention}+#10#{} Retriggers",
          "{C:legendary}Legendary{}: Double all values",
          "{C:inactive}(Currently {C:attention}#5#{} {C:inactive}Retriggers,{} {X:mult,C:white}X#3#{} {C:inactive}Mult,{} {X:chips,C:white}X#4#{} {C:inactive}Chips,{} {C:mult}+#2#{} {C:inactive}Mult,{} {C:chips}+#1#{} {C:inactive}Chips)",
          "Last Rarity: {C:attention}#11#{}",
        }
      },
      j_abn_hard_and_dry = {
        name = "Hard and Dry",
        text = {
          "Blinds are {C:attention}obscured{},",
          "{C:attention}Double{} the values of {C:attention}Leftmost{} Joker",
          "when {C:attention}Blind{} is defeated",
        }
      },
      j_abn_bonus_buffoon = {
        name = "Bonus Buffoon",
        text = {
          "{C:attention}Enhanced{} cards give {X:mult,C:white}X#4#{} Mult for each {C:abn_superrare}Comedian{} you own",
          "{C:green}#1# in #2#{} chance this is destroyed at the end of round",
          "{C:inactive}(Currently{} {X:mult,C:white}X#3#{} {C:inactive}Mult){}",
        }
      },
      j_abn_creechie_buffoon = {
        name = "Creechie Buffoon",
        text = {
          "{C:dark_edition}Editioned{} cards give {X:mult,C:white}X#4#{} Mult for each {C:abn_superrare}Comedian{} you own",
          "{C:green}#1# in #2#{} chance this is destroyed at the end of round",
          "{C:inactive}(Currently{} {X:mult,C:white}X#3#{} {C:inactive}Mult){}",
        }
      },
      j_abn_composite_creechie = {
        name = "Composite Creechie",
        text = {
          "{C:attention}Enhanced{} cards give {X:mult,C:white}X#4#{} Mult for each {C:abn_superrare}Comedian{} you own",
          "{C:dark_edition}Editioned{} cards give {X:mult,C:white}X#4#{} Mult for each {C:abn_superrare}Comedian{} you own",
          "{C:green}#1# in #2#{} chance this is destroyed at the end of round",
          "{C:inactive}(Currently{} {X:mult,C:white}X#3#{} {C:inactive}Mult){}",
        }
      },
      j_abn_number_44 = {
        name = "Number 44",
        text = {
          "When {C:attention}Blind{} is selected,",
          "Create {C:attention}#1#{} joker slots and",
          "fill them with random {C:attention}Jokers",
        }
      },
      j_abn_gabagool_sandwhich = {
        name = "Gabagool Sandwich",
        text = {
          "Whenever a Joker triggers",
          "add {C:chips}+#3#{} Chips to it,",
          "{C:green}#1# in #2#{} chance to be",
          "{C:attention}consumed{} at end of round",
        }
      },
      j_abn_marmalade_sandwhich = {
        name = "Marmalade Sandwich",
        text = {
          "Whenever a Joker triggers",
          "add {X:mult,C:white}+X#3#{} Mult to it,",
          "{C:green}#1# in #2#{} chance to be",
          "{C:attention}consumed{} at end of round",
        }
      },
      j_abn_voracity_joker = {
        name = "Voracity Joker",
        text = {
          "Retrigger all {C:attention}Food{} Jokers,",
          "{C:green}#1# in #2#{} chance to {C:attention}consume{}",
          "all {C:attention}Food{} Jokers at end of round",
        }
      },
      j_abn_busybee = {
        name = "Busybee",
        text = {
          "{C:attention}Food{} Jokers never expire",
          "Retrigger the {C:attention}rightmost{}",
          "{C:attention}Food{} Joker and lose {C:money}$#3#",
        }
      },
      j_abn_bravais_joker = {
        name = "Bravais Joker",
        text = {
          "Gains {C:chips}+#3#{} Chips for each {C:hearts}Wild{} Card used in Spectrum hands",
          "Gains {C:mult}+#4#{} Mult for each {C:mult}Mercurial{} Card used in Spectrum hands",
          "If this Joker has an {C:dark_edition}edition{} {C:hearts}Wild{} Cards gain {C:chips}+#3#{} Chips and {C:mult}Mercurial{} Cards gain {C:mult}+#4#{} Mult",
          "{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult,{} {C:chips}+#1#{} {C:inactive}Chips)",
        }
      },
      j_abn_photodegradation = {
        name = "Photodegredation",
        text = {
          "When played hand contains a {C:attention}Spectrum{}",
          "Gain {C:chips}+#4#{} Chips and {C:mult}+#5#{} Mult for each card held in hand with matching suits",
          "If this Joker has an {C:dark_edition}edition{} gain {X:mult,C:white}X#6#{} Mult for matching suits",
          "{C:inactive}(Currently{} {X:mult,C:white}X#3#{} {C:inactive}Mult,{} {C:mult}+#2#{} {C:inactive}Mult,{} {C:chips}+#1#{} {C:inactive}Chips){}"
        }
      },
      j_abn_ulam_joker = { -- TO RELOCALIZE
        name = "Ulam Joker",
        text = {
          "Gains {C:mult}Mult{} and {C:chips}Chips{} equal to the rank difference",
          "between {C:attention}first{} and {C:attention}last{} scored cards in a {C:attention}Spectrum{} hand",
          "If this Joker has an {C:dark_edition}edition{} gains twice the difference",
          "{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult,{} {C:chips}+#1#{} {C:inactive}Chips){}"
        }
      },
      j_abn_beyond_the_rainbow = { -- TO RELOCALIZE
        name = "Beyond The Rainbow",
        text = {
          "Gain {X:mult,C:white}X#2#{} Mult for each different {C:attention}suit{} in {C:attention}Spectrum{} hands",
          "If this Joker has an {C:dark_edition}edition{} {C:green}#3# in #4#{} scoring cards create {C:attention}Double Tags{}",
          "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}"
        }
      },
      j_abn_perfidious_comedian = {
        name = "Perfidious Comedian",
        text = {
          "{C:attention}Even{} scoring cards with {C:red}seals{} give {X:mult,C:white}X#1#{} Mult",
          "{C:attention}Odd{} scoring cards with {C:red}seals{} give {X:chips,C:white}X#2#{} Chips",
        }
      },
      j_abn_venom_comedian = { -- TO RELOCALIZE
        name = "Venom Comedian",
        text = {
          "Gain {X:mult,C:white}X#3#{} Mult per scoring {C:abn_snow}Snow{} card in {C:attention}Spectrum{} hands",
          "Gain {C:chips}+#4#{} Chips per scoring {C:abn_penumbra}Penumbra{} card in {C:attention}Spectrum{} hands",
          "If this Joker has an {C:dark_edition}edition{} played {C:attention}Spectrum{} hands gain {C:attention}2{} levels",
          "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult,{} {C:chips}+#2#{} {C:inactive}Chips)"
        }
      },
      j_abn_marmalize_joker = {
        name = "Marmalize Joker",
        text = {
          "Jokers cannot be {C:mult}debuffed{} or have {C:abn_perishable}stickers{}",
          "When {C:attention}Blind{} is selected,",
          "all Jokers gain {C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips",
        }
      },
      j_abn_backrooms_joker = {
        name = "Backrooms Joker",
        text = {
          "Blinds are {C:attention}obscured{},",
          "When {C:attention}Blind{} is defeated, create a {C:purple}Parallel{} ",
          "{C:purple}Rare{} Joker with {C:abn_perishable}Perishable{} and {C:money}Rental{}",
          "If this Joker has an {C:dark_edition}edition{}, {C:purple}Parallel Rare{}",
          "Jokers each give {X:mult,C:white}X#1#{} Mult",
        }
      },
      j_abn_fraud_soul = {
        name = "Fraud Soul",
        text = {
          "When {C:attention}Blind{} is selected,",
          "Held {C:tarot}Tarots{} give the {C:attention}rightmost{} Joker {C:chips}+#1#{} Chips",
          "Held {C:planet}Planets{} give the {C:attention}rightmost{} Joker {C:mult}+#2#{} Mult",
          "Held {C:spectral}Spectrals{} give the {C:attention}rightmost{} Joker {X:mult,C:white}+X#3#{} Mult",
          "Held {C:abn_sigil}Sigils{} give the {C:attention}rightmost{} Joker {X:chips,C:white}+X#4#{} Chips",
          "Held {C:abn_astro}Astros{} give the {C:attention}rightmost{} Joker {C:money}$#5#{}",
          "Held {C:abn_calamity}Calamitys{} double all values on this Joker",
          "Held {C:abn_nightshift}Nightshifts{} give a {C:attention}random{} card in hand {C:attention}+#6#{} Retriggers",
        }
      },
      j_abn_parkateo = {
        name = "Parkateo",
        text = {
          "Held {C:attention}consumables{} give {X:mult,C:white}X#1#{} Mult",
        }
      },
      j_abn_perrrkeo = {
        name = "Perrrkeo",
        text = {
          "Balances {C:purple}#3#%{C:inactive}",
          "of {C:mult}Mult{} and {C:chips}Chips{},",
          "Adds {C:purple}#2#%{} for every",
          "consumable {C:attention}held",
        }
      },
      j_abn_rubicante = {
        name = "Rubicante",
        text = {
          "{C:attention}Even{} scoring cards give {C:mult}Mult{}",
          "equal to {C:attention}triple{} their rank",
        }
      },
      j_abn_dangerlet = {
        name = "Dangerlet",
        text = {
          "Played cards give {C:chips}+#1#{} Chips,",
          "{C:mult}+#2#{} Mult, {X:mult,C:white}X#3#{} Mult, and",
          "{C:money}$#4#{} when scored, and",
          "have a {C:green}#5# in #6#{} chance",
          "to be {C:mult}destroyed",
        }
      },
      j_abn_j_jimbob = { -- TO RELOCALIZE
        name = "J'Jimbob",
        text = {
          "Scoring {C:inactive}Stone{}, {C:inactive}Glass{}, {C:money}Lucky{} and {C:mult}Mult{} cards give {X:chips,C:white}X#2#{} Chips",
          "Scoring {C:inactive}Steel{}, {C:chips}Bonus{}, {C:money}Gold{} and {C:hearts}Wild{} cards give {X:mult,C:white}X#1#{} Mult",

        }
      },
      j_abn_trevulit = {
        name = "trevulit",
        text = {
          "{C:attention}Odd{} scoring cards give {C:mult}Mult{}",
          "equal to {C:attention}triple{} their rank",

        }
      },
      j_abn_york = {
        name = "York",
        text = {
          "Scoring Cards give {X:mult,C:white}X#1#{} Mult",
          "Cards held in hand give {X:chips,C:white}X#1#{} Chips",

        }
      },
      j_abn_hammerspace_joker = {
        name = "Hammerspace Joker",
        text = {
          "{C:attention}+2{} Consumable Slots",
          "When a {C:attention}Boss Blind{} is defeated,",
          "Gains {X:mult,C:white}X#5#{} Mult if a {C:abn_sigil}Sigil{} Card is {C:attention}held{}",
          "Gains {C:mult}+#6#{} Mult if an {C:abn_astro}Astro{} Card is {C:attention}held{}",
          "Gains {C:chips}+#8#{} Chips if a {C:tarot}Tarot{} Card is {C:attention}held{}",
          "Gains {X:chips,C:white}X#7#{} Mult if a {C:spectral}Spectral{} Card is {C:attention}held{}",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult,{} {C:mult}+#2#{} {C:inactive}Mult,{} {X:chips,C:white}X#3#{} {C:inactive}Chips,{} {C:chips}+#4#{} {C:inactive}Chips){}"
        }
      },
      j_abn_contract_from_below = {
        name = "Contract From Below",
        text = {
          "{C:abn_nightshift}Nightshift{} cards always appear in {C:spectral}Spectral{} packs",
          "When {C:attention}Blind{} is selected,",
          "Apply {C:purple}Violet{}, {C:abn_perishable}Perishable{} and {C:dark_edition}Chthonian{}",
          "to the {C:attention}leftmost{} Joker",

        }
      },
      j_abn_chip_stone = {
        name = "Chip Stone",
        text = {
          "{C:attention}Stone{} cards gain {C:dark_edition}Foil{}",
          "and {C:chips}+#1#{} Chips when scored",

        }
      },
      j_abn_mult_stone = {
        name = "Mult Stone",
        text = {
          "{C:attention}Stone{} cards gain {C:red}Red Seal{}",
          "and {C:mult}+#1#{} Mult when scored",

        }
      },
      j_abn_color_cascade = {
        name = "Colour Cascade",
        text = {
          "All hands are considered {C:attention}Flushes{}",

        }
      },
      j_abn_flawed_imitation = {
        name = "Flawed Imitation",
        text = {
          "{C:attention}Jokers{} may appear multiple times",
          "Each Joker gives {X:mult,C:white}X#1#{} Mult per copy of that Joker",

        }
      },
      j_abn_pixelgrid_joker = {
        name = "Pixelgrid Joker",
        text = {
          "This Joker gains {C:mult}+#2#{} Mult",
          "if played hand contains an",
          "{C:attention}even{} number of scoring cards",
          "{C:inactive}(Currently {C:mult}+#1#{} {C:inactive}Mult){}",

        }
      },
      j_abn_defective_pixel_joker = {
        name = "Defective Pixel Joker",
        text = {
          "This Joker gains {C:mult}+#2#{} Mult",
          "if played hand contains an",
          "{C:attention}odd{} number of scoring cards",
          "{C:inactive}(Currently {C:mult}+#1#{} {C:inactive}Mult){}",

        }
      },
      j_abn_whitenoise_joker = {
        name = "Whitenoise Joker",
        text = {
          "This Joker gains {X:mult,C:white}X#2#{} Mult",
          "when playing an {C:attention}even{} number of",
          "{C:diamonds}Light{} and {C:spades}Dark{} Suits",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult){}",

        }
      },
      j_abn_pong_joker = { -- I dont know who write this way but u scare me. with love, Marffe
        name = "Pong Joker",
        text = {
          "Gain {X:chips,C:white}X#4#{} Chips when playing a {C:attention}Straight{} made of only {C:spades}Dark{} Suits",
          "Gain {X:mult,C:white}X#3#{} Mult when playing a {C:attention}Straight{} made of only {C:diamonds}Light{} Suits",
          "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult,{} {X:chips,C:white}X#2#{} {C:inactive}Chips){}",
        }
      },
      j_abn_dual_identity = {
        name = "Dual Identity",
        text = {
          "{X:mult,C:white}X#1#{} Mult if you have",
          "an {C:attention}even{} number of Jokers",
          "of {C:attention}two different{} rarities",
        }
      },
      j_abn_tetris_joker = {
        name = "Tetris Joker",
        text = {
          "{X:mult,C:white}X#1#{} Mult when",
          "you have an {C:attention}Even{}",
          "number of Jokers",
        }
      },
      j_abn_erratic_joker = {
        name = "Erratic Joker",
        text = {
          "{C:attention}Before scoring{} each played",
          "card changes to a {C:attention}random{} suit",
          "and this Joker gains {C:chips}+#1#{} Chips",
          "whenever a card changes suit",
          "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
        }
      },
      j_abn_fanart_joker = {
        name = "Fanart Joker",
        text = {
          "{X:mult,C:white}X#1#{} Mult when",
          "you have an {C:attention}Odd{}",
          "number of Jokers",
        }
      },
      j_abn_edgesketch_joker = {
        name = "Edgesketch Joker",
        text = {
          "Gains {C:mult}+#3#{} Mult when the",
          "{C:attention}rightmost{} Joker triggers",
          "Gains {C:chips}+#4#{} Chips when the",
          "{C:attention}leftmost{} Joker triggers",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult, {C:chips}+#2#{C:inactive} Chips)",
        }
      },
      j_abn_phonechat_joker = {
        name = "Phonechat Joker",
        text = {
          "Gains {C:chips}+#3#{} Chips when Joker",
          "to the {C:attention}left{} triggers",
          "Gains {C:mult}+#4#{} Mult when Joker",
          "to the {C:attention}right{} triggers",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, {C:mult}+#2#{C:inactive} Mult)",
        }
      },
      j_abn_glossy_joker = {
        name = "Glossy Joker",
        text = {
          "{X:mult,C:white}X#1#{} Mult when {C:dark_edition}Gloss{} edition scores",
          "If this Joker has {C:dark_edition}Gloss{} edition gain {C:mult}+#3#{} Mult for each scoring {C:dark_edition}Gloss{} card",
          "{C:inactive}(Currently {C:mult}+#2#{} {C:inactive}Mult){}",
        }
      },
      j_abn_snow_route = {
        name = "Snow Route",
        text = {
          "Played cards with",
          "{C:abn_snow}Snow{} suit have a",
          "{C:green}#1# in #2#{} chance to",
          "{C:attention}level up{} played hand",
        }
      },
      j_abn_id_staff = {
        name = "ID Staff",
        text = {
          "When a {C:attention}face{} card is {C:mult}destroyed{},",
          "Add {C:abn_hazard}Hazard{} to the {C:attention}leftmost{} card in hand",
        }
      },
      j_abn_enchanted_night = {
        name = "Enchanted Night",
        text = {
          "{C:spades}Dark{} Suits with {C:dark_edition}Editions{} retrigger",
        }
      },
      j_abn_health_stickers = {
        name = "Health Stickers",
        text = {
          "When {C:attention}Blind{} is defeated",
          "Place a random {C:green}Beneficial{} {C:abn_perishable}Sticker{}",
          "on {C:attention}leftmost{} Joker",
        }
      },
      j_abn_the_joker_dance = {
        name = "The Joker Dance",
        text = {
          "Jokers {C:attention}cannot{} be moved",
          "When a hand is played {C:attention}shuffle{} all Jokers",
          "All Jokers gain {C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips",
        }
      },
      j_abn_royal_order = {
        name = "Royal Order",
        text = {
          "If scoring cards are in the following order",
          "{C:hearts}Heart{} {C:diamonds}Diamond{} {C:clubs}Club{} {C:spades}Spade{}",
          "level up the played hand by {C:attention}#1#",
          "and grant {X:mult,C:white}X#2#{} Mult",
        }
      },
      j_abn_joker_once_again = {
        name = "Joker Once Again",
        text = {
          "Add a {C:abn_white_seal}White Seal{}",
          "to first scoring {C:attention}card{}",
        },
      },
      j_abn_seal_letter = {
        name = "Seal Letter",
        text = {
          "Retrigger all played",
          "cards with {C:red}Red Seals{}",
        },
      },
      j_abn_planetoid_joker = {
        name = "Planetoid Joker",
        text = {
          "Place an {C:abn_orange_seal}Orange Seal{}",
          "on leftmost scoring card",
          "on your first played {C:attention}Straight"
        },
      },
      j_abn_ink_depleted_joker = {
        name = "Ink Depleted Joker",
        text = {
          "First scoring {C:attention}Full House{} with all {C:diamonds}Light{} Suits",
          "gains {C:dark_edition}Foil{} and {C:abn_orange_seal}Orange Seals",
          "First scoring {C:attention}Full House{} with all {C:spades}Dark{} Suits",
          "gains {C:dark_edition}Foil{} and {C:abn_pink_seal}Pink Seals"
        },
      },
      j_abn_barb_wire_joker = {
        name = "Barbwire Joker",
        text = {
          "First scoring {C:attention}4",
          "gains a {C:abn_black_seal}Black Seal{}",
          "{C:green}#1# in #2#{} chance for discarded cards to be {C:attention}destroyed"
        },
      },
      j_abn_till_joker = {
        name = "Till Joker",
        text = {
          "Add a {C:abn_grey_seal}Grey Seal{} to first {C:attention}numbered{} card",
          "of {C:attention}first hand{} of round,",
          "Add a {C:gold}Gold Seal{} to first {C:attention}numbered{} card",
          "of {C:attention}final hand{} of round",
        },
      },
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
          "Jokers may appear multiple times",
          "Each Joker gives {X:chips,C:white}X#1#{} Chips",
          "for every copy of that Joker",
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
      j_abn_hazard_cryptid = { -- TO RELOCALIZE
        name = "Hazard Cryptid",
        text = {
          "Gain {C:mult}+#4#{} Mult when poker hand contains a {C:abn_hazard}Hazard{} card and a {C:dark_edition}non-enhanced{} card",
          "{C:green}#1# in #2#{} chance to {C:mult}destroy{} all scored cards and this Joker",
          "{C:inactive}(Currently{} {C:mult}+#3#{} {C:inactive}Mult)"
        }
      },
      j_abn_noir_joker = { -- TO RELOCALIZE
        name = "Noir Joker",
        text = {
          "Whenever {C:diamonds}Light{} suit cards score apply {C:attention}flipped{} to all {C:spades}Dark{} Suit cards held in hand",
          "Gains {C:mult}+#3#{} Mult and {C:chips}+#4#{} Chips per scoring {C:attention}Flipped{} card",
          "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult, {C:chips}+#2#{} {C:inactive}Chips)"
        }
      },
      j_abn_deceitful_joker = {
        name = "Deceitful Joker",
        text = {
          "{X:mult,C:white}X#1#{} Mult",
          "When an {C:attention}Boss Blind{} is defeated,",
          "apply {C:attention}Flipped{} to all cards",
          "of a {C:attention}random{} owned suit",

        }
      },
      j_abn_seal_edition_joker = {
        name = "Seal Edition Joker",
        text = {
          "Each Joker gains {C:mult}+#1#{} Mult",
          "for every unique {C:attention}seal{}",
          "in scoring hand",
        }
      },
      j_abn_blessed_joker = {
        name = "Blessed Joker",
        text = {
          "First Scoring {C:dark_edition}Foil{} card gains {C:abn_violet_seal}Violet Seal{}",
          "First Scoring {C:dark_edition}Holographic{} card gains {C:abn_brown_seal}Brown Seal{}",
          "First Scoring {C:dark_edition}Polychrome{} card gains {C:mult}Red Seal{}",
        }
      },
      j_abn_clown_degree = { -- TO RELOCALIZE
        name = "Clown Degree",
        text = {
          "Cards with {C:attention}seals{} are shuffled to the top of the deck",
          "If a card with a {C:attention}seal{} is {C:mult}destroyed{}",
          "Apply that {C:attention}seal{} to another card without a {C:attention}seal{}",
        }
      },
      j_abn_corpuscular_joker = {
        name = "Corpuscular Joker",
        text = {
          "{C:dark_edition}Foil{} Jokers give {C:mult}+#1#{} Mult,",
          "{C:dark_edition}Foil{} Cards give {C:attention}double{}",
          "their rank as {C:mult}Mult",
        }
      },
      j_abn_ransom_joker = {
        name = "Ransom Joker",
        text = {
          {
            "Lose {C:money}$#3#{} per Joker owned",
            "at end of round,",
          },
          {
            "When a {C:attention}Joker{} is sold",
            "or destroyed, {C:green}#1# in #2#{} chance",
            "to create a {C:attention}higher rarity{} Joker"
          },
        }
      },
      j_abn_oilsplash = {
        name = "Oilsplash",
        text = {
          {
            "{C:attention}Unscored{} cards become",
            "{C:abn_black_seal}Petroleum{} cards when played",
          },
          {
            "If the Score {C:attention}catches fire{}",
            "{C:abn_black_seal}Petroleum{} cards do not",
            "turn into {C:abn_black_seal}Oilfire",
          },
        }
      },
      j_abn_oiled_joker = {
        name = "Oiled Joker",
        text = {
          {
            "If {C:attention}first discard{} of round",
            "contains a {C:abn_black_seal}Petroleum{} card,",
            "it is not {C:attention}consumed{}",
          },
          {
            "Played {C:abn_black_seal}Petroleum{} cards give {C:money}$#1#{},",
            "{C:mult}+#2#{} Mult and {C:chips}+#3#{} Chips",
          },
        }
      },
      j_abn_lotion_joker = { -- TO RELOCALIZE
        name = "Lotion Joker",
        text = {
          "Remove {C:dark_edition}enhancements{} from Played and Discarded {C:abn_black_seal}Petroleum{} and {C:inactive}Stone{} cards",
          "Gains {C:chips}+#2#{} Chips per card restored this way",
          "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips)",
        }
      },
      j_abn_yesman_joker = {
        name = "Yesman Joker",
        text = {
          "{C:dark_edition}Editions{} {C:attention}held in hand{} are triggered",
          "This Joker gains {C:mult}+#3#{} Mult and {C:chips}+#4#{} Chips",
          "when an {C:dark_edition}Edition{} triggers",
          "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult, {C:chips}+#2#{} {C:inactive}Chips)",
        }
      },
      j_abn_slot_machine = {
        name = "Slot Machine",
        text = {
          {
            "{C:attention}Listed{} {C:green,E:1,S:1.1}probabilities{} always",
            "{C:green}succeed{}, but cost {C:money}$5{} unless",
            "you own {C:attention}Golden Joker",
          },
          {
            "If {C:attention}poker hand{} is a",
            "{C:attention}Royal Flush{}, retrigger",
            "and level up hand",
          },
        }
      },
      j_abn_lucrative_joker = {
        name = "Lucrative Joker",
        text = {
          "No limit on {C:money}interest{} and {C:tarot}doubling{}",
          "{C:money}Gold{} cards and cards with {C:gold}Gold seals{} are shuffled to the top of the deck",
          "If you have {C:attention}Slot Machine{},",
          "double earnings from {C:money}Gold{} cards and Seals",
        }
      },
      j_abn_balatro_university = {
        name = "Balatro University",
        text = {
          "Whenever you gain money during a blind",
          "all Jokers gain {C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips",
          "If you own {C:attention}Lucrative Joker{},",
          "{C:attention}level up{} hands with {C:money}Gold{} cards",
          "If you own {C:attention}Slot Machine{} retrigger {C:gold}Gold seals{}",
        }
      },
      j_abn_mad_petr = {
        name = "Mad Petr",
        text = {
          "Retrigger all {C:attention}Jokers{}",
          "per unique consumable {C:attention}held{}",
          "{C:inactive}(Currently{} {C:attention}#1#{} {C:inactive}Retriggers)",
        }
      },
      j_abn_porke = {
        name = "Porke",
        text = {
          "Each Joker gives {X:chips,C:white}X#1#{} Chips",
          "per unique consumable {C:attention}held{}",
          "{C:inactive}(Currently {X:chips,C:white}X#2#{} {C:inactive}Chips){}",
        }
      },
      j_abn_parq = {
        name = "P'arq",
        text = {
          "Lowers {C:attention}blind requirements{} by {C:attention}#1#%{}",
          "per unique consumable {C:attention}held{}",
          "{C:inactive}(Currently {C:attention}#2#%{C:inactive})",
        }
      },
      j_abn_pracheo = {
        name = "Pracheo",
        text = {
          "Retrigger cards {C:attention}1{} time",
          "per unique consumable {C:attention}held{}",
          "{C:inactive}(Currently{} {C:attention}#1#{} {C:inactive}Retriggers)",
        }
      },
      j_abn_jorg = {
        name = "Jorg",
        text = {
          "{C:mult}Discarded{} cards give {X:mult,C:white}X#1#{} Mult",
          "on {C:attention}next{} played hand",
        }
      },
      j_abn_jurian = {
        name = "Jurian",
        text = {
          "{C:mult}Discarded{} cards give {X:chips,C:white}X#1#{} Chips",
          "On {C:attention}next{} played hand",
        }
      },
      j_abn_jfool = { -- TO RELOCALIZE
        name = "J'Fool",
        text = {
          "Each played {C:attention}Odd{} cards gives equal Xmult to the amount of {C:attention}Odd{} cards played",
          "Each played {C:attention}Even{} card gives equal Xmult to the amount of {C:attention}Even{} cards played",
        }
      },
      j_abn_tochic = {
        name = "Tochic",
        text = {
          "When {C:attention}Blind{} is selected,",
          "reduce {C:attention}blind requirements{} by {C:attention}#1#%{}",
          "for each {C:attention}Joker{} card",
          "{C:inactive}(Currently{} {C:attention}#2#%{C:inactive})",
        }
      },
      j_abn_obmij = {
        name = "Obmij",
        text = {
          "Give {C:white,X:mult}XMULT{} equal to",
          "the number of {C:attention}Jokers{} owned",
        }
      },
      j_abn_contagion_joker = {
        name = "Contagion Joker",
        text = {
          "{C:green}#1# in #2#{} chance for cards with {C:attention}seals{} to turn into {C:purple}Contagion Seals{}",
          "{C:green}#3# in #4#{} chance for {C:dark_edition}enhanced{} cards to turn into {C:purple}Contagion Bonus cards{}",
          "{C:green}#5# in #6#{} chance for played cards with {C:dark_edition}editions{} to turn into {C:purple}Contagion Mult{}",
          "Other {C:green}Plagued{} Jokers give {X:mult,C:white}^#7#{} Mult",
        }
      },
      j_abn_degraded_data_joker = {
        name = "Degraded Data Joker",
        text = {
          "Gain {C:mult}+#4#{} Mult when {C:purple}Contagion Bonus{} cards score",
          "Gain {X:mult,C:white}X#5#{} Mult when {C:purple}Contagion Seal{} cards score",
          "Gain {X:mult,C:white}^#6#{} Mult when {C:purple}Contagion Mult{} cards score",
          "{C:inactive}(Currently{} {C:mult}#1#{} {C:inactive}Mult,{} {X:mult,C:white}X#2#{} {C:inactive}Mult,{} {X:mult,C:white}^#3#{} {C:inactive}Mult)",
        }
      },
      j_abn_asylum_joker = {
        name = "Asylum Joker",
        text = {
          "Force select {C:attention}#2#{} cards",
          "Force selected cards give {X:chips,C:white}^#1#{} Chips"
        }
      },
      j_abn_ransomware_joker = {
        name = "Ransomware Joker",
        text = {
          "When certain {C:attention}consumables{} are used apply the following effects:",
          "{C:tarot}Tarot{} all Jokers gain {C:chips}+#1#{} Chips and you lose {C:money}$#2#",
          "{C:spectral}Spectral{} all Jokers gain {C:chips}+#3#{} Chips and you lose {C:money}$#4#",
          "{C:abn_calamity}Calamity{} all Jokers Chips values are multiplied by {X:chips,C:white}^#5#{} and you lose {C:money}$#6#",
          "{C:abn_snow}Weather Report{} all Jokers gain {C:mult}+#7#{} Mult and you lose {C:money}$#8#",
          "{C:abn_astro}Astro{} all Jokers gain {C:mult}+#9#{} Mult and you lose {C:money}$#10#",
          "{C:abn_nightshift}Nightshift{} all Jokers Mult values are multiplied by {X:mult,C:white}^#11#{}",
        }
      },
      j_abn_monitor_joker = {
        name = "Monitor Joker",
        text = {
          {
            "You may play and discard",
            "up to {C:attention}6{} cards,",
          },
          {
            "First played {C:attention}6 card{} hand",
            "with a {C:attention}Monitor Card{} levels up every",
            "played cards {C:attention}rank{} by {C:attention}1{},",
            "Played cards permanently gain",
            "{X:chips,C:white}X#1#{} Chips when scored",
          },
        }
      },
      j_abn_scantron_joker = {
        name = "Scantron Joker",
        text = {
          "Scoring {C:attention}Lucky{} cards give {X:chips,C:white}^#1#{} Chips",
          "Scoring {C:attention}Bonus{} cards give {X:mult,C:white}^#2#{} Mult",
          "Scoring {C:attention}Gold{} cards give {X:chips,C:white}^#3#{} Chips",
          "Scoring {C:attention}Wild{} cards give {X:mult,C:white}^#4#{} Mult",
        }
      },
      j_abn_fractured_identity_joker = {
        name = "Fractured Identity Joker",
        text = {
          "Scoring {C:mult}Mult{} cards give {X:chips,C:white}^#1#{} Chips",
          "Scoring {C:attention}Glass{} cards give {X:mult,C:white}^#2#{} Mult",
          "Scoring {C:attention}Steel{} cards give {X:chips,C:white}^#3#{} Chips",
          "Scoring {C:attention}Stone{} cards give {X:mult,C:white}^#4#{} Mult",
        }
      },
      j_abn_handbook_of_a_conman = {
        name = "Handbook Of A Conman",
        text = {
          "Double the {C:chips}Chips{} and {C:mult}Mult{} values of all hands",
          "{C:mult}Debuff{} all {C:green}non-Plagued{} Jokers",
        }
      },
      j_abn_fit_to_shape = {
        name = "Fit To Shape",
        text = {
          "{C:attention}4 card{} hands give",
          "{X:chips,C:white}^#1#{} Chips and {X:mult,C:white}^#2#{} Mult",
        }
      },
      j_abn_manga_panel_joker = {
        name = "Manga Panel Joker",
        text = {
          "Scoring {C:spades}Dark{} Suits give {X:chips,C:white}^#1#{} Chips and {X:mult,C:white}^#2#{} Mult ",
        }
      },
      j_abn_blood_money = {
        name = "Blood Money",
        text = {
          "Scoring cards gain {X:mult,C:white}X#1#{} Mult,",
          "lose {C:money}$#2#{} per played card,",
          "{C:mult}Destroy{} all played cards if",
          "money reaches {C:money}$0{} or lower",
        }
      },
      j_abn_suspicious_icon = {
        name = "Suspicious Icon",
        text = {
          "When {C:attention}Blind{} is selected,",
          "{C:mult}Destroy{} {C:attention}#1#{} non-Plagued Joker",
          "and create {C:attention}#1#{} {C:green}Plagued{} Joker",
        }
      },
      j_abn_badformat_joker = {
        name = "Badformat Joker",
        text = {
          "Scoring {C:diamonds}Light{} Suits give {X:chips,C:white}^#1#{} Chips and {X:mult,C:white}^#2#{} Mult ",
        }
      },
      j_abn_ruination_joker = {
        name = "Ruination Joker",
        text = {
          {
            "Played cards give {X:mult,C:white}^1.8{} Mult and {X:chips,C:white}^1.8{} Chips",
            "for every {C:attention}unique{} suit in scored hand",
          },
          {
            "If played hand contains a {C:attention}Spectrum{},",
            "{C:attention}Level up{} the {C:planet}planet{} {C:attention}rank{} of each card",
          },
          {
            "If this Joker has an {C:dark_edition}edition{},",
            "retrigger all played cards",
          },
        }
      },
      j_abn_rom_hack_balatro = {
        name = "ROM Hack Balatro",
        text = {
          "{C:attention}Vanilla{} Jokers each give",
          " {X:mult,C:white}X#1#{} Mult, {X:chips,C:white}X#2#{} Chips, and {C:money}$#3#{}",
        }
      },
      j_abn_jokers_mixtape = { -- TO RELOCALIZE (well, probably not relocalize just add colours to the var or add extra keys e.g. jokers_mixtape_negative)
        name = "Joker's Mixtape",
        text = {
          "#1#",
          "Effect changes with certain editions",
        }
      },
      j_abn_awakening_oopart = {
        name = "Awakening Oopart",
        text = {
          {
            "{C:planet}Planet{} and {C:program_pack}Program{} cards",
            "become {C:dark_edition}Negative{} when bought,",
          },
          {
            "Using {C:planet}Planet{} and {C:program_pack}Program{} cards",
            "give held {C:inactive}Steel{} Cards",
            "{C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips",
          },
        }
      },
      j_abn_antikythera_mechanism = { -- TO RELOCALIZE
        name = "Antikythera Mechanism",
        text = {
          {
            "This Joker gains",
            "{X:mult,C:white}X#2#{} Mult every time",
            "a {C:program_pack}Program{} card is used",
            "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult)",
          },
          {
            "{C:abn_brown_seal}Fossil{} Cards and {C:inactive}Steel{} Cards",
            "can't be {C:mult}debuffed{} or {C:mult}destroyed{}",
          },
        }
      },
      j_abn_pentomino_joker = {
        name = "Pentomino Joker",
        text = {
          "Held {C:diamonds}Light{} Suit cards gain {C:chips}+#1#{} Chips when a {C:program_pack}Program{} card is used",
          "{C:attention}Level up{} the {C:planet}planet{} {C:attention}rank{} of cards in the {C:attention}First{} scoring {C:diamonds}Light{} suit {C:attention}Straight{}",
        }
      },
      j_abn_nuruomino_joker = {
        name = "Nuruomino Joker",
        text = {
          "Held {C:spades}Dark{} Suit cards gain {C:chips}+#1#{} Chips",
          "when a {C:program_pack}Program{} card is used,",
          "{C:attention}Level up{} the {C:planet}planet{} {C:attention}rank{} of cards",
          "in {C:attention}First{} scoring {C:spades}Dark{} suit {C:attention}Straight{}",
        }
      },
      j_abn_isocromatic_joker = { -- TO RELOCALIZE
        name = "Isocromatic Joker",
        text = {
          "Scoring {C:dark_edition}Foil{} cards gain {C:attention}+#2#{} retrigger",
          "Scoring {C:dark_edition}Holographic{} cards increase their {C:planet}planet{} {C:attention}rank{} by {C:attention}#3#",
          "Scoring {C:dark_edition}Polychrome{} cards gain {C:chips}+#1#{} Chips",
        }
      },
      j_abn_color_anomia = { -- TO RELOCALIZE
        name = "Colour Anomia",
        text = {
          "{C:program_pack}Program{} cards are {C:money}free{},",
          "Played {C:attention}Spectrum{} hands with only {C:attention}Numbered{} cards {C:attention}level up{} the {C:planet}planet{} {C:attention}rank{} of each played card",
          "If this Joker has an {C:dark_edition}Edition{} gain {C:chips}+#2#{} Chips{} per used {C:program_pack}Program{} card",
          "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips){}"
        }
      },
      j_abn_grapheme_joker = { -- TO RELOCALIZE
        name = "Grapheme Joker",
        text = {
          "The {C:attention}First{} played {C:diamond}Light{} Suit card becomes {C:dark_edition}Negative{}",
          "Gain {C:chips}+#6#{} Chips and {C:mult}+#5#{} Mult per {C:dark_edition}Negative{} {C:diamonds}Light{} Suit played",
          "If this Joker has {C:dark_edition}Negative{} gain {X:mult,C:white}X#4#{} Mult per played {C:dark_edition}Negative{} card",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult,{} {C:mult}+#2#{} {C:inactive}Mult,{} {C:chips}+#3#{} {C:inactive}Chips){} "
        }
      },
      j_abn_suit_seal_joker = {
        name = "Suit Seal Joker",
        text = {
          {
            "If hand has {C:attention}4 unique{} suits",
            "Add a {C:abn_violet_seal}Violet Seal{} to all",
            "{C:spades}dark suit{} cards without seals,",
            "add a {C:abn_brown_seal}Brown Seal{} to all",
            "{C:diamonds}light suit{} cards without seals",
          },
          {
            "This Joker gains {C:chips}+#4#{} chips and {C:mult}+#3#{} Mult",
            "per played {C:diamonds}light suit{} with a seal,",
            "Gains {C:chips}+#3#{} chips and {C:mult}+#4#{} Mult",
            "per played {C:spades}dark suit{} with a seal",
            "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult,{} {C:chips}+#2#{} {C:inactive}Chips){}",
          },
        }
      },
      j_abn_destination_unknown = {
        name = "Destination Unknown",
        text = {
          "When {C:attention}Blind{} is selected,",
          "gain {C:chips}+#3#{} Chips per missing {C:attention}rank{} in your full deck",
          "If this has {C:dark_edition}Abandoned edition{},",
          "it gains an additional {X:chips,C:white}X#4#{} Chips per missing {C:attention}rank{}",
          "{C:inactive}(Currently {X:chips,C:white}X#1#{} {C:inactive}Chips,{} {C:chips}+#2#{} {C:inactive}Chips){}",
        }
      },
      j_abn_under_construction = {
        name = "Under Construction",
        text = {
          "After {C:attention}Boss Blind has been defeated{} sell this Joker to create {C:attention}any{} Joker in your collection",
          "{C:inactive}(can only create{} {C:common}Common{} {C:uncommon}Uncommon{} {C:inactive}and{} {C:rare}Rare{}{C:inactive}){}",
        }
      },
      j_abn_legends_remade = {
        name = "Legends Remade",
        text = {
          "If you own a {C:legendary}Legendary{} {C:money}sell{} {C:attention}this joker{}",
          "to create any {C:legendary}Legendary{} from your collection",
        }
      },
      j_abn_plastic_joker = {
        name = "Plastic Joker",
        text = {
          "When {C:abn_black_seal}Petroleum{} cards turn into {C:abn_black_seal}Oilfire{} cards,",
          "{C:attention}Level up{} the {C:planet}Planet{} {C:attention}Rank{} of the {C:attention}lowest{} rank held in hand",
        }
      },
      j_abn_propagator_joker = {
        name = "Propagator Joker",
        text = {
          "Scoring cards give {X:mult,C:white}^2.0{} Mult per",
          "card with the same {C:attention}rank{} and {C:attention}suit{},",
          "{C:green}#1# in #2#{} chance to create a",
          "copy of the {C:attention}first{} scoring card",
        }
      },
      j_abn_computerworm_joker = {
        name = "Computerworm Joker",
        text = {
          {
            "When {C:attention}Blind{} is selected, {C:mult}destroy{} ",
            "{C:attention}leftmost{} Joker and create a {C:dark_edition}Negative{}",
            "copy of this Joker without {C:abn_eternal}Eternal{}",
          },
          {
            "This Joker gives {X:mult,C:white}^#3#{} Mult and",
            "{X:chips,C:white}^#4#{} Chips per copy of itself",
            "{C:inactive}(Currently{} {X:mult,C:white}^#1#{} {C:inactive}Mult,{} {X:chips,C:white}^#2#{} {C:inactive}Chips){}",
          },
        }
      },
      j_abn_naneinf_joker = {
        name = "NANEINF Joker",
        text = {
          "Scaling Jokers scale {C:attention}twice{} as fast,",
          "Retrigger {C:attention}first{} scaling Joker",
        }
      },
      j_abn_noneuclidean_joker = {
        name = "Non-euclidean Joker",
        text = {
          "When another Joker gains {C:chips}Chips{} or {C:mult}Mult{},",
          "this Joker gains {C:attention}double{} that amount",
          "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips,{} {C:mult}+#2#{} {C:inactive}Mult){}",
        }
      },
      j_abn_aseprite_joker = {
        name = "Aseprite Joker",
        text = {
          "The {C:attention}First{} played {C:spades}Dark{} Suit card becomes {C:dark_edition}Negative{}",
          "Gain {C:chips}+#6#{} Chips and {C:mult}+#5#{} Mult per {C:dark_edition}Negative{} {C:spades}Dark{} Suit played",
          "If this Joker has {C:dark_edition}Negative{} gain {X:mult,C:white}X#4#{} Mult per played {C:dark_edition}Negative{} card",
          "{C:inactive}(Currently {C:chips}+#3#{} {C:inactive}Chips,{} {C:mult}+#2#{} {C:inactive}Mult,{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}"
        }
      },
      j_abn_cupon_joker = {
        name = "Coupon Joker",
        text = {
          "Consumables that only select {C:attention}1{} target can select {C:attention}2{}"
        }
      },
      j_abn_entropic_spades = {
        name = "Entropic Spades",
        text = {
          "Destroy all {C:spades}Spades{} scored,",
          "this Joker gains their {C:chips}Chips{}",
          "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips)",
        }
      },
      j_abn_entropic_hearts = {
        name = "Entropic Hearts",
        text = {
          "Destroy all {C:hearts}Hearts{} scored,",
          "this Joker gains their {C:chips}Chips{}",
          "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips)",
        }
      },
      j_abn_entropic_clubs = {
        name = "Entropic Clubs",
        text = {
          "Destroy all {C:clubs}Clubs{} scored,",
          "this Joker gains their {C:chips}Chips{}",
          "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips)",
        }
      },
      j_abn_entropic_diamonds = {
        name = "Entropic Diamonds",
        text = {
          "Destroy all {C:diamonds}Diamonds{} scored,",
          "this Joker gains their {C:chips}Chips{}",
          "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips)",
        }
      },
      j_abn_joker_in_hiding = {
        name = "Joker In Hiding",
        text = {
          "Whenever you select a {C:attention}Joker{} from a {C:attention}Pack{},",
          "it gains {C:attention}Flipped{} and {C:dark_edition}Holographic{}",
          "Flipped Jokers and Cards give {C:money}$#1#{}",
        }
      },
      j_abn_joker_family = {
        name = "Joker & Family",
        text = {
          "If you own {C:common}Common{} {C:uncommon}Uncommon{} {C:rare}Rare{} and {C:attention}Comedian{} Jokers",
          "Lower all {C:attention}blind requirements{} by {C:attention}50%{} and give {X:mult,C:white}X#2#{} Mult for each {C:attention}unique{} Joker {C:attention}rarity{}",
          "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
        }
      },
      j_abn_jolly_roger = {
        name = "Jolly Roger",
        text = {
          "Can {C:attention}select{} an {C:attention}extra{} card when selecting {C:attention}consumables{} from {C:attention}packs{}",
          "{C:money}Selling{} consumables gives different effects:",
          "#1#",
          "#2#",
          "#3#",
          "#4#",
          "#5#",
          "#6#",
          "#7#"
        }
      },
      j_abn_dreamstalker_joker = {
        name = "Dreamstalker Joker",
        text = {
          "If you have an {C:attention}Even{} number of {C:mult}Discards{}",
          "{C:diamonds}Light{} suits give {C:mult}+#1# Mult{} when scored for every {C:spades}Dark{} suit card scored before",
          "If you have an {C:attention}Odd{} number of {C:mult}Discards{}",
          "{C:spades}Dark{} suits give {C:mult}+#1# Mult{} when scored for every {C:diamonds}Light{} suit card scored before",
        }
      },
      j_abn_carnaval_joker = {
        name = "Carnaval Joker",
        text = {
          --"If scoring hand contains a {C:abn_penumbra}Penumbra{} Suit and another {C:spades}Dark{} Suit and {C:diamonds}Light{} Suit",
          "All scoring cards gain {C:mult}+#1#{} Mult",
          "if scoring hand contains a",
          "{C:abn_penumbra}Penumbra{} card, another",
          "{C:spades}Dark{} Suit and a {C:diamonds}Light{} Suit",
        }
      },
      j_abn_painyatta = {
        name = "Painyatta",
        text = {
          "When a {C:attention}Voucher{} is purchased,",
          "redeem {C:attention}#1#{} random Vouchers for {C:money}free{}"
        }
      },
      j_abn_puddles = {
        name = "Puddles",
        text = {
          "{X:mult,C:white}X#2#{} Mult per Joker to the {C:attention}right{}",
          "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
        }
      },
      j_abn_talstaff = {
        name = "Talstaff",
        text = {
          "{X:mult,C:white}X#2#{} Mult per Joker to the {C:attention}left{}",
          "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
        }
      },
      j_abn_m_earl = {
        name = "M. Earl",
        text = {
          "Lower all {C:attention}Blind requirements{} by {C:attention}90%{}",
        }
      },
      j_abn_loki = {
        name = "Loki",
        text = {
          "When a {C:attention}Comedian{} Joker triggers,",
          "all other {C:attention}non-Comedian{} Jokers",
          "permanently gain {C:mult}+#1#{} Mult",
        }
      },
      j_abn_arkham = {
        name = "Arkham",
        text = {
          {
            "Scoring {C:attention}Even{} cards level up",
            "their {C:planet}planet{} {C:attention}rank{} equal to the",
            "number of {C:attention}Odd{} scoring cards",
          },
          {
            "Scoring {C:attention}Odd{} cards level up",
            "their {C:planet}planet{} {C:attention}rank{} equal to the",
            "number of {C:attention}Even{} scoring cards",
          }
        }
      },
      j_abn_edition_anonymous = {
        name = "Edition Anonymous",
        text = {
          "When a card with an {C:dark_edition}Edition{} scores randomize its {C:dark_edition}Edition{}",
          "Each card that changes {C:dark_edition}Editions{} gains {C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips",
          "When {C:attention}Blind defeated{} randomize the Editions of all owned Jokers",
          "Each Joker that changes {C:dark_edition}Editions{} gains {C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips",
        }
      },
      j_abn_pedro_joker = {
        name = "Pedro Joker",
        text = {
          "When {C:attention}Blind{} is defeated,",
          "{C:mult}destroy{} lowest {C:money}sell value{} Joker and",
          "add {C:attention}8X{} its {C:money}value{} to this Joker",
          "as {C:chips}Chips{} and {C:mult}Mult{}",
          "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult,{} {C:chips}+#2#{} {C:inactive}Chips){}",
        }
      },
      j_abn_example_joker = {
        name = "Example Joker",
        text = {
          "Creates the {C:abn_sigil}Sigil{} card for",
          "final played {C:attention}poker hand{}",
          "of round",
        }
      },
      j_abn_minimalist_joker = {
        name = "Minimalist Joker",
        text = {
          "All {C:common}Common{} Jokers give {X:mult,C:white}X#1#{} Mult",
          "{C:mult}self-destructs{} when a Joker is {C:money}sold{}",
          "{C:attention}Consumables{} sell for {C:money}$0{}",
        }
      },
      j_abn_clowns_soul = {
        name = "Clowns Soul",
        text = {
          "Pay {C:money}$#1#{} to {C:green}Reroll{} selected joker",
          "keeping its {C:dark_edition}Editions{}, {C:attention}Stickers{}, etc",
        }
      },
      j_abn_confirm_joker = {
        name = "Confirm Joker",
        text = {
          "Gain a random {C:attention}tag{} at end of round,",
          "Earn {C:money}$#1#{} if a {C:abn_hazard}Hazard Tag{} is obtained",
        }
      },
      j_abn_illegal_ante = {
        name = "Illegal Ante",
        text = {
          "During {C:attention}Even{} Antes {C:attention}double{} all {C:green}probabilities",
          "During {C:attention}Odd{} Antes {C:attention}double{} all {C:money}money{} obtained",
        }
      },
      j_abn_enigma_comedian = {
        name = "Enigma Comedian",
        text = {
          {
            "When {C:attention}Blind{} is selected,",
            "create {C:attention}1{} {C:dark_edition}Pearlescent{}",
            "{C:planet}Vanilla{} {C:attention}Joker",
            "{C:inactive}(Must have room)",
          },
          {
            "{X:mult,C:white}^#1#{} Mult and {X:chips,C:white}^#2#{} Chips",
            "for every {C:planet}Vanilla{} {C:attention}Joker{}";
            "triggered"

          }
        }
      
      },
      j_abn_golden_apple = {
        name = "Golden Apple",
        text = {
          {
            "When {C:attention}Blind{} is selected,",
            "remove all {C:enhanced}Perishable{} stickers",
          },
          {
            "{C:enhanced}Eternal{} Jokers can",
            "be sold"
          }
        }
      
      },
      j_abn_spare_overall = {
        name = "Spare Overall",
        text = {
          {
            "Gain {C:red}+#1#{} Mult when playing",
            "a {C:attention}#2#{}",
            "{C:inactive}(Currently {C:red}+#3#{C:inactive} Mult)",
          },
          {
            "{C:attention}Odd {C:enhanced}Bonus Cards{} gain {C:chips}+#4#{} Chips",
            "{C:attention}Even {C:enhanced}Mult Cards{} gain {C:mult}+#5#{} Mult"
          }
        }
      
      },
      j_abn_boulevard_of_alters = {
        name = "Boulevard of Alters",
        text = {
          {
            "Whenever a {C:rare}Rare{} Joker triggers,",
            "all {C:common}Common{} Jokers gain {C:chips}+10{} Chips"
          },
          {
            "Whenever a {C:uncommon}Uncommon{} Joker triggers,",
            "all {C:rare}Rare{} Jokers gain {X:mult,C:white}x0.1{} Mult"
          },
          {
            "Whenever a {C:common}Common{} Joker triggers,",
            "all {C:uncommon}Uncommon{} Jokers gain {X:chips,C:white}x0.1{} Chips"
          },
        }
      
      },
      j_abn_memory_dump_joker = {
        name = "Memory Dump Joker",
        text = {
          {
            "Each Joker gains {X:mult,C:white}X#1#{} Mult",
            "every scored hand"
          },
          {
            "Scored hand size must be",
            "larger than {C:attention}#2#{}",
            "{C:inactive}(Changes to highest played hand size)",
            "{C:inactive}(Resets when defeating a blind)"
          },
        }
      
      },
      j_abn_palindromic_beetle = {
        name = "Palindromic Beetle",
        text = {
          {
            "If the {C:attention}full hand{} is a {C:attention}palindromic sequence",
            "and is composed of {C:attention}both {C:diamonds}Light{} and {C:spades}Dark{} suits,",
            "level up the {C:planet}Planet Rank{} of each {C:attention}scoring{} card by",
            "the amount of times the {C:attention}rank{} has been {C:attention}repeated{} in hand",
          },
        }
      
      },
      j_abn_ppe_joker = {
        name = "PPE Joker",
        text = {
          {
            "{X:mult,C:white}X#1#{} Mult",
            "for every {C:red}Debuffed{} Joker"
          },
          {
            "Scored hand size must be",
            "larger than {C:attention}#2#{}",
            "{C:inactive}(Changes to highest played hand size)",
            "{C:inactive}(Resets when defeating a blind)"
          },
        }
      
      },
    },


    Spectral = {
      c_abn_apotheosis = {
        name = "Apotheosis",
        text = {
          "{C:red}Sacrifice{} {C:attention}1{} {C:dark_edition}Negative{} Joker",
          "to give all cards in hand random",
          "{C:dark_edition}Editions{} and {C:attention}seals{}"
        }
      },
      c_abn_paradigm = {
        name = "Paradigm",
        text = {
          "{C:red}Sacrifice{} {C:attention}1{} {C:dark_edition}Polychrome{} Joker",
          "to give all cards in hand random",
          "{C:dark_edition}Editions{} and {C:attention}seals{}"
        }
      },
      c_abn_ascend = {
        name = "Ascend",
        text = {
          "Add {C:dark_edition}Glosss{}, {C:dark_edition}Iridescent{},",
          "or {C:dark_edition}Pearlescent{} effect to",
          "{C:attention}#1#{} selected card in hand",
        },
      },
      c_abn_distortion = {
        name = "Distortion",
        text = {
          "Add {C:dark_edition}Pearlescent{} to a",
          "random {C:attention}Joker{}, destroy",
          "all other Jokers",
        },
      },
      c_abn_exile = {
        name = "Exile",
        text = {
          "Add {C:dark_edition}Negative{} effect to",
          "{C:attention}#1#{} selected card in hand",
        },
      },
      c_abn_make = {
        name = "Make",
        text = {
          "Add a {C:abn_brass_seal}Brass Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand",
        },
      },
      c_abn_door = {
        name = "Door",
        text = {
          "Add a {C:abn_skyblue_seal}Skyblue Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand",
        },
      },
      c_abn_silver = {
        name = "Silver",
        text = {
          "Add a {C:abn_silver_seal}Silver Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand",
        },
      },
      c_abn_copper = {
        name = "Copper",
        text = {
          "Add a {C:abn_copper_seal}Copper Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand",
        },
      },
      c_abn_transform = {
        name = "Transform",
        text = {
          "Creates the last",
          "{C:spectral}Spectral{} card",
          "used during this run",
          "{s:0.8,C:spectral}Soul{s:0.8} excluded",
        },
      },
      c_abn_impure = {
        name = "Impure",
        text = {
          "Add a {C:abn_oxidized_seal}Oxidised Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand",
        }
      },
      c_abn_instrument = {
        name = "Instrument",
        text = {
          "Add a {C:abn_lime_seal}Lime Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand",
        }
      },
      c_abn_whitehole = {
        name = "White Hole",
        text = {
          "Upgrade every {C:dark_edition,E:1}rank",
          "by {C:attention}1{} level",
        },
      },
      c_abn_deja_vecu = {
        name = "Deja Vecu",
        text = {
          "Add a {C:abn_pink_seal}Pink Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand",
        },
      },

      c_abn_deja_reve = {
        name = "Deja Reve",
        text = {
          "Add an {C:abn_orange_seal}Orange Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand",
        },
      },

      c_abn_entendu = {
        name = "Entendu",
        text = {
          "Add a {C:abn_grey_seal}Grey Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand",
        },
      },

      c_abn_paramenal = {
        name = "Paramenal",
        text = {
          "Add a {C:abn_black_seal}Black Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand",
        },
      },

      c_abn_sapience = {
        name = "Sapience",
        text = {
          "Add a {C:abn_teal_seal}Teal Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand",
        },
      },

      c_abn_jamais_vu = {
        name = "Jamais Vu",
        text = {
          "Add a {C:abn_white_seal}White Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand",
        },
      },

      c_abn_presque_vu = {
        name = "Presque Vu",
        text = {
          "Add a {C:abn_brown_seal}Brown Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand",
        },
      },

      c_abn_super_id = {
        name = "Super ID",
        text = {
          "Add a {C:abn_violet_seal}Violet Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand",
        },
      },

      c_abn_spiral = {
        name = "Spiral",
        text = {
          "Add a {C:abn_lavender_seal}Lavender Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand",
        },
      },

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
          "Add {C:dark_edition}#2#{} effect to",
          "{C:attention}#1#{} selected card in hand",
        }
      },
      c_abn_body = {
        name = "The Body",
        text = {
          "Creates a",
          "{C:attention,E:1}Comedian{} Joker",
          "{C:inactive}(Must have room)",
        }
      },

      c_abn_mind = {
        name = "The Mind",
        text = {
          "Creates a",
          "{C:legendary,E:1}Parallel Rare{} Joker",
          "{C:inactive}(Must have room)",
        }
      },

      c_abn_baphomet = {
        name = "Baphomet",
        text = {
          "Create a {C:abn_sigil}Sigil{} for",
          "your {C:attention}most played{} hand",
        }
      },
    },
    abn_credit_card = {
      credit_abn_cloudzXIII = {
        name = "",
        text = {
          "Started developing",
          "Abandonia in the first place",
          "Check out {C:gold}Final Mix!",
        }
      },
      credit_abn_bunnet = {
        name = "",
        text = {
          "Founder of the mod!",
          "came up with all the ideas",
        }
      },
      credit_abn_coderevo = {
        name = "",
        text = {
          "Added a bunch of things!",
          "Namely {C:attention}Vouchers{}",
          "and {C:attention}Boss Blinds{}",
          "Check out {C:purple}Revo's Vault{}!",
        }
      },
      credit_abn_ericthetoon = {
        name = "",
        text = {
          "Added a bunch of things!",
          "Check out {C:purple}Fortlatro{}!",
        }
      },
      credit_abn_deleteduser = {
        name = "",
        text = {
          "Added some {C:attention}Jokers{}",
        }
      },
      credit_abn_vega = {
        name = "",
        text = {
          "Helped with atlases",
          "and made so much",
          "cool {C:green}Art{}!",
        }
      },
      credit_abn_j8bit = {
        name = "",
        text = {
          "Added some {C:attention}Jokers{}",
          "Check out",
          "{C:blue}Forager's Nonessentials{}!",
        }
      },
      credit_abn_marffe = {
        name = "",
        text = {
          "Added some {C:attention}Jokers{}",
        }
      },
      credit_abn_mills = {
        name = "",
        text = {
          "Added some {C:attention}Jokers{}",
        }
      },
      credit_abn_rkart = {
        name = "",
        text = {
          "Composed some {C:red}music{}",
          "Namely the {C:attention}Main Menu{}",
          "{C:attention}Boss Blind{}, {C:attention}Jokers{}",
          "and {C:attention}Pack{} themes!",
        }
      },
      credit_abn_firch = {
        name = "",
        text = {
          "Composed some cool",
          "{C:red}soundtracks{}!",
          "Check out {C:attention}Bunco{}!",
        }
      },
      credit_abn_doggfly = {
        name = "",
        text = {
          "Made some cool",
          "{C:green}Art{}!",
        }
      }
    },
    Other = {
      abn_palindromic_sequence = {
        name = "Palindromic Sequence",
        text = {
          "Is the same sequence",
          "even reversed",
          "{C:inactive}(e.g. A,K,10,K,A)",
        }
      },
      abn_suitless = {
        text = {
          "Has no suit",
        },
      },
      p_abn_weather_normal = {
        name = 'Forecast Pack',
        text = {
          'Choose {C:attention}#1#{} of up to',
          '{C:attention}#2#{} {C:weather_report}Weather{} cards',
        }
      },
      p_abn_weather_jumbo = {
        name = 'Jumbo Forecast Pack',
        text = {
          'Choose {C:attention}#1#{} of up to',
          '{C:attention}#2#{} {C:weather_report}Weather{} cards',
        }
      },
      p_abn_weather_mega = {
        name = 'Mega Forecast Pack',
        text = {
          'Choose {C:attention}#1#{} of up to',
          '{C:attention}#2#{} {C:weather_report}Weather{} cards',
        }
      },
      p_abn_lexica_normal = {
        name = 'Lexica Pack',
        text = {
          'Choose {C:attention}#1#{} of up to',
          '{C:attention}#2#{} {C:lexica}Lexica{} cards'
        }
      },
      p_abn_lexica_jumbo = {
        name = 'Jumbo Lexica Pack',
        text = {
          'Choose {C:attention}#1#{} of up to',
          '{C:attention}#2#{} {C:lexica}Lexica{} cards'
        }
      },
      p_abn_lexica_mega = {
        name = 'Mega Lexica Pack',
        text = {
          'Choose {C:attention}#1#{} of up to',
          '{C:attention}#2#{} {C:lexica}Lexica{} cards'
        }
      },
      undiscovered_continent = {
        name = "Not Discovered",
        text = {
          "Purchase or use",
          "this card in an",
          "unseeded run to",
          "learn what it does"
        }
      },
      undiscovered_lexica = {
        name = "Not Discovered",
        text = {
          "Purchase or activate",
          "this card in an",
          "unseeded run to",
          "learn what it does"
        }
      },
      undiscovered_program_pack = {
        name = "Not Discovered",
        text = {
          "Purchase or use",
          "this card in an",
          "unseeded run to",
          "learn what it does"
        }
      },
      undiscovered_weather_report = {
        name = "Not Discovered",
        text = {
          "Purchase or use",
          "this card in an",
          "unseeded run to",
          "learn what it does"
        }
      },
      undiscovered_calamity_cards = {
        name = "Not Discovered",
        text = {
          "Purchase or use",
          "this card in an",
          "unseeded run to",
          "learn what it does"
        }
      },
      undiscovered_nightshift_cards = {
        name = "Not Discovered",
        text = {
          "Purchase or use",
          "this card in an",
          "unseeded run to",
          "learn what it does"
        }
      },
      undiscovered_sigils = {
        name = "Not Discovered",
        text = {
          "Purchase or use",
          "this card in an",
          "unseeded run to",
          "learn what it does"
        }
      },
      undiscovered_astro_cards = {
        name = "Not Discovered",
        text = {
          "Purchase or use",
          "this card in an",
          "unseeded run to",
          "learn what it does"
        }
      },

      abn_silver_seal = {
        name = "Silver Seal",
        text = {
          "Creates a {C:weather_report}Weather Report{}",
          "when {C:attention}discarded",
          "{C:inactive}(Must have room)",
        },
      },
      abn_copper_seal = {
        name = "Copper Seal",
        text = {
          "Creates a {C:program_pack}Program{} card",
          "when {C:attention}discarded",
          "{C:inactive}(Must have room)",
        },
      },
      abn_duality_seal = {
        name = "Duality Seal",
        text = {
          "Creates a {C:lexica}Lexica{} card",
          "when {C:attention}discarded",
          "{C:inactive}(Must have room)",
        },
      },
      abn_skyblue_seal = {
        name = "Skyblue Seal",
        text = {
          "Counts in scoring when",
          "{C:attention}held{} in hand"
        }
      },
      abn_lime_seal = {
        name = "Lime Seal",
        text = {
          "Gains {C:chips}+#2#{} chips",
          "when {C:attention}discarded",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
        }
      },
      abn_oxidized_seal = {
        name = "Oxidised Seal",
        text = {
          "Creates a {C:abn_nightshift}Nightshift{} card",
          "when {C:red}destroyed",
          "{C:inactive}(Must have room)",
        }
      },
      abn_brass_seal = {
        name = "Brass Seal",
        text = {
          "Retrigger {C:attention}playing card{}",
          "to the {C:attention}right{} when scored"
        }
      },
      abn_lavender_seal = {
        name = "Lavender Seal",
        text = {
          "Retrigger {C:attention}playing card{}",
          "to the {C:attention}left{} when scored"
        }
      },
      abn_violet_seal = {
        name = "Violet Seal",
        text = {
          "{C:white,X:chips}X#1#{} Chips"
        }
      },
      abn_brown_seal = {
        name = "Brown Seal",
        text = {
          "{C:white,X:mult}X#1#{} Mult"
        }
      },
      abn_white_seal = {
        name = "White Seal",
        text = {
          "Does not count",
          "towards {C:red}discard{}"
        }
      },
      abn_teal_seal = {
        name = "Teal Seal",
        text = {
          "Creates a {C:abn_calamity}Calamity{} card",
          "if {C:attention}held{} in hand",
          "at end of round",
          "{C:inactive}(Must have room)",
        }
      },
      abn_black_seal = {
        name = "Black Seal",
        text = {
          "Creates a {C:abn_sigil}Sigil{} card",
          "when {C:attention}discarded",
          "{C:inactive}(Must have room)",
        },
      },
      abn_orange_seal = {
        name = "Orange Seal",
        text = {
          "Creates the {C:planet}Planet{} card",
          "for this card's {C:attention}rank{}",
          "if {C:attention}held{} in hand",
          "at end of round",
          "{C:inactive}(Must have room)",
        }
      },
      abn_pink_seal = {
        name = "Pink Seal",
        text = {
          "Creates a {C:abn_astro}Astro{} card",
          "when {C:attention}discarded",
          "{C:inactive}(Must have room)",
        },
      },
      abn_grey_seal = {
        name = "Grey Seal",
        text = {
          "Earn {C:money}$#1#{}",
          "when {C:attention}discarded",
        }
      },

      p_abn_calamitybooster = {
        name = 'Calamity Pack',
        text = {
          'Choose {C:attention}#1#{} of up to',
          '{C:attention}#2#{} {C:abn_calamity}Calamity{} cards to',
          'be used immediately'
        }
      },
      p_abn_calamitybooster2 = {
        name = 'Calamity Pack',
        text = {
          'Choose {C:attention}#1#{} of up to',
          '{C:attention}#2#{} {C:abn_calamity}Calamity{} cards to',
          'be used immediately'
        }
      },
      p_abn_calamitybooster_j = {
        name = 'Jumbo Calamity Pack',
        text = {
          'Choose {C:attention}#1#{} of up to',
          '{C:attention}#2#{} {C:abn_calamity}Calamity{} cards to',
          'be used immediately'
        }
      },
      p_abn_calamitybooster_m = {
        name = 'Mega Calamity Pack',
        text = {
          'Choose {C:attention}#1#{} of up to',
          '{C:attention}#2#{} {C:abn_calamity}Calamity{} cards to',
          'be used immediately'
        }
      },
      p_abn_sigil_normal = {
        name = 'Sigil Pack',
        text = {
          'Select {C:attention}#1#{} of',
          '{C:attention}#2#{} {C:abn_sigil}Sigil{} cards to',
          'be used immediately',
          '{C:inactive}(cannot be skipped)'
        }
      },
      p_abn_sigil_jumbo = {
        name = 'Jumbo Sigil Pack',
        text = {
          'Select {C:attention}#1#{} of',
          '{C:attention}#2#{} {C:abn_sigil}Sigil{} cards to',
          'be used immediately',
          '{C:inactive}(cannot be skipped)'
        }
      },
      p_abn_sigil_mega = {
        name = 'Mega Sigil Pack',
        text = {
          'Select {C:attention}#1#{} of',
          '{C:attention}#2#{} {C:abn_sigil}Sigil{} cards to',
          'be used immediately',
          '{C:inactive}(cannot be skipped)'
        }
      },
      p_abn_astro_normal = {
        name = 'Astro Pack',
        text = {
          'Choose {C:attention}#1#{} of up to',
          '{C:attention}#2#{} {C:abn_astro}Astro{} cards to',
          'be used immediately'
        }
      },
      p_abn_astro_jumbo = {
        name = 'Jumbo Astro Pack',
        text = {
          'Choose {C:attention}#1#{} of up to',
          '{C:attention}#2#{} {C:abn_astro}Astro{} cards to',
          'be used immediately'
        }
      },
      p_abn_astro_mega = {
        name = 'Mega Astro Pack',
        text = {
          'Choose {C:attention}#1#{} of up to',
          '{C:attention}#2#{} {C:abn_astro}Astro{} cards to',
          'be used immediately'
        }
      },
      card_abn_rank_chips = {
        text = {
          "{C:planet}#1#{} chips",
        },
      },
      card_abn_rank_mult = {
        text = {
          "{C:planet}#1#{} Mult",
        },
      },
      --#region stickers
      abn_pump_up = {
        name = "Pump Up",
        text = {
          "{C:mult}+#1#{} Mult"
        }
      },
      abn_bullseye = {
        name = "Bullseye",
        text = {
          "{C:chips}+#1#{} Chips"
        }
      },
      abn_immortal = {
        name = "Immortal",
        text = {
          "This Joker cannot be",
          "{C:red}destroyed{} or",
          "{C:red}debuffed{}"
        }
      },
      abn_shovel = {
        name = "Shovel",
        text = {
          "If {C:attention}first hand{} of round,",
          "{C:white,X:chips}X#1#{} Chips"
        }
      },
      abn_downgrade = {
        name = "Downgrade",
        text = {
          "{C:mult}#1#{} Mult"
        }
      },
      abn_violet = {
        name = "Violet",
        text = {
          "Increase {C:attention}blind requirements",
          " by {C:attention}#1#%{}",
          "when scored"
        }
      },
      abn_weight = {
        name = "Weight",
        text = {
          "{C:white,X:chips}X#1#{} Chips",
          "{C:red,E:1}cannot be moved{}"
        }
      },
      abn_crown = {
        name = "Crown",
        text = {
          "{C:dark_edition}Editions{} cannot change",
        }
      },
      abn_flip = {
        name = "Flip",
        text = {
          "{C:attention}Flip{} this card",
          "after scoring"
        }
      },
      abn_fragile = {
        name = "Fragile",
        text = {
          "{C:green}#1# in #2#{} chance",
          "this card is {C:red}destroyed",
          "when scored"
        }
      },
      abn_possibility = {
        name = "Possibility",
        text = {
          "Doubles all {C:attention}listed",
          "{C:green,E:1,S:1.1}probabilities",
          "if {C:attention}first hand{} of round",
          "{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}2 in 3{C:inactive})",
        }
      },
      abn_question_mark = {
        name = "Question Mark?",
        text = {
          "{C:attention}1{} scoring card",
          "becomes {C:attention}Rankless{}"
        }
      },
      abn_square = {
        name = "Square",
        text = {
          "{C:attention}first{} played card",
          "used in scoring gives",
          "{C:white,X:chips}X#1#{} Chips",
        }
      },
      abn_cat_eye = {
        name = "Cat Eye",
        text = {
          "Retrigger {C:attention}first{} played",
          "{C:attention}Ace{} used in scoring",
        }
      },
      abn_lightning_bolt = {
        name = "Lightning Bolt",
        text = {
          "Retrigger {C:attention}first{} played",
          "{C:attention}numbered card{} used in scoring",
        }
      },
      abn_top_hat = {
        name = "Top Hat",
        text = {
          "Retrigger {C:attention}first{} played",
          "{C:attention}Enhanced card{} used in scoring",
        }
      },
      abn_negative_plus = {
        name = "Negative Plus",
        text = {
          "Add {C:dark_edition}Negative{} to a",
          "random card in {C:attention}final",
          "{C:attention}hand{} of round",
        }
      },
      abn_eraser = {
        name = "Eraser",
        text = {
          "Remove all {C:attention}Enhancements{} from",
          "{C:attention}leftmost{} scoring card",
          "before scoring"
        }
      },
      abn_lucky = {
        name = "Lucky",
        text = {
          "{C:green}#1# in #2#{} chance",
          "for scoring cards to",
          "give {C:mult}+#3#{} Mult",
        }
      },
      abn_glove_hand = {
        name = "Glove Hand",
        text = {
          "{C:mult}+#1#{} Discard",
        }
      },
      abn_spicy = {
        name = "Spicy",
        text = {
          "If the {C:attention}Score{} catches {C:mult}fire{}",
          "permanently doubles this Jokers {C:mult}Mult{}/{C:chips}Chips{}",
        }
      },
      abn_x = {
        name = "X",
        text = {
          "{C:mult}Debuffed{} cards give",
          "{X:mult,C:white}X#1#{} Mult when scored"
        }
      },
      abn_honor_sticker = {
        name = "Honor Jimbo",
        text = {
          "Used this Joker",
          "to win on {C:attention}Honor",
          "{C:attention}Stake{} difficulty",
        }
      },
      abn_menacing_sticker = {
        name = "Menacing Jimbo",
        text = {
          "Used this Joker",
          "to win on {C:attention}Menacing",
          "{C:attention}Stake{} difficulty",
        }
      },

      abn_toxic_sticker = {
        name = "Toxic Jimbo",
        text = {
          "Used this Joker",
          "to win on {C:attention}Toxic",
          "{C:attention}Stake{} difficulty",
        }
      },

      --#endregion
      abn_dark_suit = {
        name = "Dark Suit",
        text = {
          "{C:spades}Spades{}, {C:clubs}Clubs{},",
          "{C:abn_penumbra}Penumbras{}",
        }
      },

      abn_light_suit = {
        name = "Light Suit",
        text = {
          "{C:hearts}Hearts{}, {C:diamonds}Diamonds{},",
          "{C:abn_snow}Snows{}",
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
          "{C:green,s:1.5}Art{s:1.5} by people from the Balatro {C:blue,s:1.5}Discord{}{s:1.5}!",
          "{C:inactive,s:1.3}(look under the Jokers :>)"
        }
      }
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
        name = "Chthonian",
        text = {
          "{C:attention}X2{} Values*,",
          "{C:attention}+2%{} blind requirements",
          "{C:inactive,s:0.7}*where possible"
        },
      },
      e_abn_iridescent = {
        name = "Iridescent",
        text = {
          "{C:white,X:mult}X#1#{} Mult,",
          "Earn {C:money}$#2#{}",
          "when triggered"
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
      },
      e_abn_gloss = {
        name = "Gloss",
        text = {
          "{C:white,X:chips}X#1#{} Chips,",
          "Earn {C:money}$#2#{}",
          "when triggered"
        }
      },
      e_abn_pearlescent = {
        name = "Pearlescent",
        text = {
          "{C:mult}+#1#{} Mult,",
          "{C:chips}+#2#{} Chips,",
        }
      }
    },
    Planet = {
      c_abn_itea = {
        name = "Itea",
        text = {
          "({V:1}lvl.#1#{}) Level up",
          "{C:attention}#2#",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips",
        },
      },
      c_abn_zakerna = {
        name = "Zakerna",
        text = {
          "({V:1}lvl.#1#{}) Level up",
          "{C:attention}#2#",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips",
        },
      },
      c_abn_veuv = {
        name = "Veuv",
        text = {
          "({V:1}lvl.#1#{}) Level up",
          "{C:attention}#2#",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips",
        },
      },
      c_abn_korim = {
        name = "Korim",
        text = {
          "({V:1}lvl.#1#{}) Level up",
          "{C:attention}#2#",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips",
        },
      },
      c_abn_malin = {
        name = "Malin",
        text = {
          "({V:1}lvl.#1#{}) Level up",
          "{C:attention}#2#",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips",
        },
      },
      c_abn_muroth = {
        name = "Muroth",
        text = {
          "({V:1}lvl.#1#{}) Level up",
          "{C:attention}#2#",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips",
        },
      },
      c_abn_thaeton = {
        name = "Thaeton",
        text = {
          "({V:1}lvl.#1#{}) Level up",
          "{C:attention}#2#",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips",
        },
      },
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
        name = "Grand Cross",
        text = {
          "({V:1}lvl.#1#{}) Level up",
          "{C:attention}#2#",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips",
        },
      },
      -- Rank Planets
      c_abn_lauto = {
        name = "Lauto",
        text = {
          "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
          "{C:attention}#2#s",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips"
        }
      },

      c_abn_urcurme = {
        name = "Urcurme",
        text = {
          "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
          "{C:attention}#2#s",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips"
        }
      },

      c_abn_nevus = {
        name = "Nevus",
        text = {
          "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
          "{C:attention}#2#s",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips"
        }
      },

      c_abn_aerth = {
        name = "Aerth",
        text = {
          "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
          "{C:attention}#2#s",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips"
        }
      },

      c_abn_sarh = {
        name = "Sarh",
        text = {
          "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
          "{C:attention}#2#s",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips"
        }
      },

      c_abn_unpter = {
        name = "Unpter",
        text = {
          "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
          "{C:attention}#2#s",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips"
        }
      },

      c_abn_urno = {
        name = "Urno",
        text = {
          "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
          "{C:attention}#2#s",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips"
        }
      },

      c_abn_ranu = {
        name = "Ranu",
        text = {
          "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
          "{C:attention}#2#s",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips"
        }
      },

      c_abn_etnup = {
        name = "Etnup",
        text = {
          "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
          "{C:attention}#2#s",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips"
        }
      },

      c_abn_zabures = {
        name = "Zabures",
        text = {
          "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
          "{C:attention}#2#s",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips"
        }
      },

      c_abn_pergus = {
        name = "Pergus",
        text = {
          "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
          "{C:attention}#2#s",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips"
        }
      },

      c_abn_vugmado = {
        name = "Vugmado",
        text = {
          "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
          "{C:attention}#2#s",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips"
        }
      },

      c_abn_abandia = {
        name = "Abandia",
        text = {
          "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
          "{C:attention}#2#s",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips"
        }
      },
      c_abn_queaor = {
        name = "Queaor",
        text = {
          "({V:1}lvl.#1#{}) Level up",
          "{C:attention}#2#",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips",
        },
      },
    },
    Tarot = {
      c_abn_wheel_of_fate = {
        name = "Wheel of Fate",
        text = {
          "{C:green}#1# in #2#{} chance to apply",
          "a random {C:attention}Sticker{}",
          "to a random {C:attention}Joker",
        }
      },
      c_abn_crown = {
        name = "Crown",
        text = {
          "Select {C:attention}1{} number card and",
          "{C:red}destroy{} all held {C:attention}face{} cards,",
          "selected card gains {C:chips}Chips{} equal",
          "to the {C:attention}value{} of destroyed cards",
        }
      },
      c_abn_eon = {
        name = "Eon",
        text = {
          "Apply {C:attention}Immortal{} to",
          "the {C:attention}rightmost{} Joker,",
          "{C:attention}Leftmost{} Joker gains",
          "gains a random {C:abn_perishable}sticker",
        }
      },
      c_abn_snowflake = {
        name = "Snowflake",
        text = {
          "Converts up to",
          "{C:attention}#1#{} selected cards",
          "to {V:1}#2#{}",
        },
      },
      c_abn_masquerade = {
        name = "Masquerade",
        text = {
          "Enhances {C:attention}#1#{} selected",
          "card into a",
          "{C:attention}#2#",
        },
      },
      c_abn_orbit = {
        name = "Orbit",
        text = {
          "Converts up to",
          "{C:attention}#1#{} selected cards",
          "to {V:1}#2#{}",
        },
      },
      c_abn_toxin = {
        name = "Toxin",
        text = {
          "Enhances {C:attention}#1#",
          "selected cards to",
          "{C:attention}#2#s",
        },
      },
      c_abn_anvil = {
        name = "Anvil",
        text = {
          "Enhances {C:attention}#1#",
          "selected cards to",
          "{C:attention}#2#s",
        },
      },
      c_abn_strike = {
        name = "Strike",
        text = {
          "Enhances {C:attention}#1#",
          "selected cards to",
          "{C:attention}#2#s",
        },
      },
      c_abn_merchant = {
        name = "Merchant",
        text = {
          "Enhances {C:attention}#1#",
          "selected cards to",
          "{C:attention}#2#s",
        },
      },
      c_abn_shovel = {
        name = "Shovel",
        text = {
          "Enhances {C:attention}#1#{} selected",
          "card into a",
          "{C:attention}#2#",
        }
      },
      c_abn_needlework = {
        name = "Needlework",
        text = {
          "Enhances {C:attention}#1#{} selected",
          "card into a",
          "{C:attention}#2#",
        },
      },
      c_abn_teaset = {
        name = "Tea Set",
        text = {
          "Enhances {C:attention}#1#{} selected",
          "cards into a",
          "{C:attention}#2#",
        },
      },
      c_abn_easel = {
        name = "Easel",
        text = {
          "Enhances {C:attention}#1#",
          "selected cards to",
          "{C:attention}#2#",
        },
      },
      c_abn_terminal = {
        name = "Terminal",
        text = {
          "Enhances {C:attention}#1#{} selected",
          "card into a",
          "{C:attention}#2#",
        },
      },
      c_abn_pillow = {
        name = "Pillow",
        text = {
          "Enhances {C:attention}#1#",
          "selected cards to",
          "{C:attention}#2#",
        },
      },
      c_abn_unmake = {
        name = "Unmake",
        text = {
          "Converts up to",
          "{C:attention}#1#{} selected cards",
          "to {V:1}#2#{}",
        },
      },
    },
    calamity_cards = {
      c_abn_cyclone = {
        name = "Cyclone",
        text = {
          "Doubles money,",
          "{C:red}Destroy{} all {C:attention}Jokers{} and",
          "{C:attention}playing cards{} with {C:dark_edition}Editions{}",
        }
      },
      c_abn_eruption = {
        name = "Eruption",
        text = {
          "{C:red}Destroy{} all cards in your {C:attention}full deck{},",
          "Add {C:attention}#1#{} {C:attention}numbered{} {C:attention}Fossil Cards{}",
          "with {C:dark_edition}Sunscourge{} edition to your hand",
        }
      },
      c_abn_avalanche = {
        name = "Avalanche",
        text = {
          "Add {C:attention}#1#{} {C:abn_snow}Snow{} cards with",
          "random {C:dark_edition}Editions{} to your deck",
        }
      },
      c_abn_flood = {
        name = "Flood",
        text = {
          "{C:attention}Copy{} all cards in your {C:attention}full deck{}",
          "Gain {C:attention}#1#{} random {C:abn_hazard}Hazard Tags{}",
        }
      },
      c_abn_tsunami = {
        name = "Tsunami",
        text = {
          "Create {C:attention}#1#{} random {C:abn_hazard}Hazard Tag{},",
          "All cards in your {C:attention}full deck{}",
          "become {C:attention}flipped{}",
        }
      },
      c_abn_drought = {
        name = "Drought",
        text = {
          "{C:mult}Debuff{} all Jokers,",
          "sets money to {C:money}$0{}",
          "Summon {C:attention}#1#{} {C:abn_superrare}Super Rare{} {C:attention}Joker",
          "and {C:attention}#1#{} {C:abn_parallelrare}Parallel Rare{} {C:attention}Joker",
          "{C:inactive}(Must have room)",
        }
      },
      c_abn_heatwave = {
        name = "Heatwave",
        text = {
          {
            "{C:mult}Debuff{} all {C:spades}Spades{},",
            "{C:clubs}Clubs{}, and {C:abn_snow}Snows{}",
          },
          {
            "{C:diamonds}Diamonds{} and {C:hearts}Hearts{} gain",
            "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
          },
        }
      },
      c_abn_blizzard = {
        name = "Blizzard",
        text = {
          {
            "{C:mult}Debuff{} all {C:diamonds}Diamonds{} and {C:hearts}Hearts{}",
          },
          {
            "{C:spades}Spades{}, {C:clubs}Clubs{}, and {C:abn_snow}Snows{} gain",
            "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
          },
        }
      },
      c_abn_plague = {
        name = "Plague",
        text = {
          "Add {C:abn_perishable}Perishable{} to all Jokers,",
          "Summon {C:attention}#1#{} {C:abn_superrare}Super Rare{} {C:attention}Joker{}",
          "with a random {C:dark_edition}Edition{}",
          "{C:inactive}(Must have room)",
        }
      },
      c_abn_humans = {
        name = "Humans",
        text = {
          "{C:red}Destroy{} all Jokers,",
          "sets money to {C:money}$-20{}",
          "{C:attention}#1#{} Joker Slot",
        }
      },
      c_abn_rapture = {
        name = "Rapture",
        text = {
          "All Jokers gain random {C:dark_edition}Editions{}",
          "and {C:abn_perishable}stickers{}",
        }
      },
      c_abn_heatdeath = {
        name = "Heat Death",
        text = {
          "Reduce all hands levels to {C:attention}1{}",
          "All cards in your {C:attention}full deck{}",
          "gain {C:mult}+#1#{} Mult and double {C:chips}Chips{}",
        }
      },
      c_abn_tremor = {
        name = "Tremor",
        text = {
          "{C:mult}Destroy{} all {C:common}Common{} and {C:uncommon}Uncommon{} Jokers,",
          "{C:rare}Rare{} Jokers gain {C:mult}+#1#{} Mult",
          "for each destroyed Joker",
        }
      },
    },
    sigils = {
      c_abn_bael = {
        name = "Bael",
        text = {
          {
            "Next eligible hand is",
            "transformed into",
            "{C:attention}High Card{}",
          },
          {
            "{C:attention}High Card{} gains {C:attention}1{} level",
          },
        }
      },
      c_abn_botis = {
        name = "Botis",
        text = {
          {
            "Next eligible hand is",
            "transformed into",
            "{C:attention}Pair{}",
          },
          {
            "{C:attention}Pair{} gains {C:attention}1{} level",
          },
        }
      },
      c_abn_vinea = {
        name = "Vinea",
        text = {
          {
            "Next eligible hand is",
            "transformed into",
            "{C:attention}Two Pair{}",
          },
          {
            "{C:attention}Two Pair{} gains {C:attention}1{} level",
          },
        }
      },
      c_abn_morax = {
        name = "Morax",
        text = {
          {
            "Next eligible hand is",
            "transformed into",
            "{C:attention}Three Of A Kind{}",
          },
          {
            "{C:attention}Three Of A Kind{} gains {C:attention}1{} level",
          },
        }
      },
      c_abn_bune = {
        name = "Bune",
        text = {
          {
            "Next eligible hand is",
            "transformed into",
            "{C:attention}Four Of A Kind{}",
          },
          {
            "{C:attention}Four Of A Kind{} gains {C:attention}1{} level",
          },
        }
      },
      c_abn_furfur = {
        name = "Furfur",
        text = {
          {
            "Next eligible hand is",
            "transformed into",
            "{C:attention}Straight{}",
          },
          {
            "{C:attention}Straight{} gains {C:attention}1{} level",
          },
        }
      },
      c_abn_bifrons = {
        name = "Bifrons",
        text = {
          {
            "Next eligible hand is",
            "transformed into",
            "{C:attention}Flush{}",
          },
          {
            "{C:attention}Flush{} gains {C:attention}1{} level",
          },
        }
      },
      c_abn_crocell = {
        name = "Crocell",
        text = {
          {
            "Next eligible hand is",
            "transformed into",
            "{C:attention}Full House{}",
          },
          {
            "{C:attention}Full House{} gains {C:attention}1{} level",
          },
        }
      },
      c_abn_belial = {
        name = "Belial",
        text = {
          {
            "Next eligible hand is",
            "transformed into",
            "{C:attention}Straight Flush{}",
          },
          {
            "{C:attention}Straight Flush{} gains {C:attention}1{} level",
          },
        }
      },
      c_abn_astaroth = {
        name = "Astaroth",
        text = {
          {
            "Next eligible hand is",
            "transformed into",
            "{C:attention}Five Of A Kind{}",
          },
          {
            "{C:attention}Five Of A Kind{} gains {C:attention}1{} level",
          },
        }
      },
      c_abn_asmodeus = {
        name = "Asmodeus",
        text = {
          {
            "Next eligible hand is",
            "transformed into",
            "{C:attention}Flush House{}",
          },
          {
            "{C:attention}Flush House{} gains {C:attention}1{} level",
          },
        }
      },
      c_abn_camio = {
        name = "Camio",
        text = {
          {
            "Next eligible hand is",
            "transformed into",
            "{C:attention}Flush Five{}",
          },
          {
            "{C:attention}Flush Five{} gains {C:attention}1{} level",
          },
        }
      },
    },
    nightshift_cards = {
      c_abn_furtive = {
        name = "Furtive",
        text = {
          "Create a {C:dark_edition}Negative{}",
          "{C:legendary}Legendary{} {C:attention}Flipped{} Joker",
        }
      },
      c_abn_intrusion = {
        name = "Intrusion",
        text = {
          "All Jokers become {C:attention}Flipped{} and",
          "gain {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
        }
      },
      c_abn_aparition = {
        name = "Aparition",
        text = {
          "Fill consumable slots",
          "with {C:spectral}Spectral{} cards,",
          "{C:green}#1# in #2#{} chance to add",
          "{C:attention}+1{} Joker slot"
        }
      },
      c_abn_smirk = {
        name = "Smirk",
        text = {
          "Create an {C:abn_eternal}Eternal{}, {C:purple}Violet{},",
          "{C:dark_edition}Chthonian{} {C:attention}Comedian{}",
          "{C:inactive}(Must have room)"
        }
      },
      c_abn_observer = {
        name = "Observer",
        text = {
          {
            "Flip all {C:attention}face down{} cards",
            "and Jokers {C:attention}face up{}",
          },
          {
            "{C:red}Remove{} all stickers",
          },
          {
            "{C:abn_superrare}Super Rare{} Jokers",
            "gain {C:chips}+#2#{} Chips {C:mult}+#1#{} Mult",
          },
        }
      },
      c_abn_tunnel = {
        name = "Tunnel",
        text = {
          "Increase the {C:planet}Planet{} {C:attention}Rank{} of all owned cards by {C:attention}#1#{}",
          "Lower your {C:attention}most played{} poker hand to level {C:attention}1{}",
        }
      },
      c_abn_sepulture = {
        name = "Sepulture",
        text = {
          "Destroy all non-Plagued Jokers",
          "Create a {C:abn_superrare}Super Rare{} {C:dark_edition}Negative{} {C:green}Plagued Joker{}",
        }
      },
      c_abn_hostile = {
        name = "Hostile",
        text = {
          "Put {C:mult}Fragile{} and {C:money}Rental{} on all non-Plagued Jokers",
          "Create a {C:abn_black_seal}Virus Rare{} Joker",
        }
      },
    },
    astro_cards = {
      c_abn_aquar = {
        name = "Aquar",
        text = {
          "{C:green}#1# in #2#{} chance to retrigger",
          "{C:attention}next{} {C:planet}Planet{} card",
        }
      },
      c_abn_aries = {
        name = "Aries",
        text = {
          "{C:green}#1# in #2#{} chance to gain",
          "{C:red}+1{} discard until next blind",
        }
      },
      c_abn_cancer = {
        name = "Cancer",
        text = {
          "{C:green}#1# in #2#{} chance to",
          "triple money",
        }
      },
      c_abn_capri = {
        name = "Capri",
        text = {
          "{C:green}#1# in #2#{} chance to add",
          "{C:chips}+#3#{} Chips to all {C:attention}Jokers{}",
        }
      },
      c_abn_gemini = {
        name = "Gemini",
        text = {
          "{C:green}#1# in #2#{} chance to",
          "copy selected {C:attention}Joker",
        }
      },
      c_abn_leo = {
        name = "Leo",
        text = {
          "{C:green}#1# in #2#{} chance to gain",
          "a {C:attention}Double Tag{}",
        }
      },
      c_abn_libra = {
        name = "Libra",
        text = {
          "{C:green}#1# in #2#{} chance to add",
          "{C:chips}+#3#{} Chips and {C:mult}+#4#{} Mult to",
          "all cards in your {C:attention}full deck{}",
        }
      },
      c_abn_pisces = {
        name = "Pisces",
        text = {
          "{C:green}#1# in #2#{} chance to gain",
          "{C:blue}+1{} hand until next blind",
        }
      },
      c_abn_sagitt = {
        name = "Sagitt",
        text = {
          "{C:green}#1# in #2#{} chance to add",
          "{C:attention}+1{} Joker slot",
        }
      },
      c_abn_scorpio = {
        name = "Scorpio",
        text = {
          "{C:green}#1# in #2#{} chance to create",
          "a {C:dark_edition}Negative{} copy",
          "of all held consumables",
        }
      },
      c_abn_taurus = {
        name = "Taurus",
        text = {
          "{C:green}#1# in #2#{} chance to redeem",
          "{C:attention}#3#{} random {C:attention}vouchers",
        }
      },
      c_abn_virgo = {
        name = "Virgo",
        text = {
          "{C:green}#1# in #2#{} chance to create",
          "a {C:dark_edition}Negative{} {C:attention}Black Hole{}",
        }
      },
    },
    Enhanced = {
      m_abn_teabag = {
        name = "Tea Tag Card",
        text = {
          "Gives {C:chips}+#1#{} chips per",
          "{C:attention,s:0.85}Tea Tag Card{} in your {C:attention}full deck{}",
          "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)",
          "{C:inactive}({C:attention}#2#{C:inactive} hands left)"
        }
      },
      m_abn_teastain = {
        name = "Tea Stain",
        text = {
          "{C:white,X:mult}X#1#{} Mult, gives an",
          "additional {C:white,X:mult}X#2#{} per",
          "{C:attention,s:0.85}Tea Stain{} in your {C:attention}full deck{}"
        }
      },
      m_abn_polkadot = {
        name = "Polkadot Card",
        text = {
          "{C:chips}+#1#{} Chips, gains",
          "{C:chips}+#2#{} Chips when scored",
          "no rank or suit"
        }
      },
      m_abn_petroleum = {
        name = "Petroleum Card",
        text = {
          "{C:chips}+#1#{} Chips",
          "{C:money}+$#2#{}",
          "Turns into {C:attention}Oilfire{}",
          "if the score catches fire",
          "no rank or suit"
        },
      },
      m_abn_oilfire = {
        name = "Oilfire Card",
        text = {
          "{C:mult}+#1#{} Mult",
          "{C:red}-$#2#{}",
          "{C:green}#3# in #4#{} Chance",
          "to {C:red}self-destruct{}",
          "no rank or suit",
        },
      },
      m_abn_fossil = {
        name = "Fossil Card",
        text = {
          "{X:mult,C:white}X#1#{} Mult",
          "{C:money}+$#2#{}",
          "has a {C:green}#3# in #4#{} chance",
          "to {C:red}self-destruct{}"
        },
      },
      m_abn_mercurial = {
        name = "Mercurial Card",
        text = {
          "Gains {C:chips}+#2#{} Chips",
          "for each unique suit",
          "in scoring hand.",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
        },
      },
      m_abn_hot_iron = {
        name = "Hot Iron Card",
        text = {
          "{X:mult,C:white}X#2#{} Mult if held in hand",
          "{C:green}#4# in #5#{} chance to give {C:chips}+#1#{} Chips",
          "{C:green}#6# in #7#{} chance to gain {X:mult,C:white}X#3#{} Mult",
          "{C:inactive}Does not score when played{}"
        },
      },
      m_abn_infra = {
        name = "Infra Card",
        text = {
          "Gain {C:mult}+#2#{} Mult and {C:chips}+#4#{} Chips per scoring card",
          "{C:mult}Self-destruct{} if played with {C:attention}3{} or less scoring cards",
          "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult{} {C:chips}+#3# {C:inactive}Chips)",
        },
      },
      m_abn_hazard = {
        name = "Hazard Card",
        text = {
          "{X:mult,C:white}X#1#{} Mult",
          "Add {X:mult,C:white}+X#2#{} Mult for each other scoring Hazard card",
          "{C:green}#3# in #4#{} chance to {C:attention}retrigger{}",
          "Increase {C:attention}blind requirement{} by {C:attention}10%{}",
        },
      },
      m_abn_contagion_seal = {
        name = "Contagion Seal",
        text = {
          "Whenever {X:mult,C:white}Xmult{} triggers,",
          "this card gains {X:mult,C:white}^#2#{}",
          "{C:inactive}(Currently {X:mult,C:white}^#1#{} {C:inactive}Mult){}",
        },
      },
      m_abn_contagion_bonus = {
        name = "Contagion Bonus",
        text = {
          "Give {X:spectral,C:white}^Chips{} {C:attention}equal{} to the number played cards",
        },
      },
      m_abn_contagion_mult = {
        name = "Contagion Mult",
        text = {
          "{X:mult,C:white}^#1#{} Mult",
        },
      },
      m_abn_monitor = {
        name = "Monitor Card",
        text = {
          "Gives {X:mult,C:white}^Mult{} equal to",
          "number of scoring {C:attention}#1#{} Suit cards",
          "{s:0.8}Suit changes every round",
          "no rank or suit",
        },
      },
      m_abn_cotton = {
        name = "Cotton Card",
        text = {
          "Double the {C:planet}Planet{} {C:attention}ranks{} of {C:inactive}non-cotton{} {C:attention}held{} cards when this is played",
        },
      },
      m_abn_sew = {
        name = "Sew Card",
        text = {
          "Each time this card triggers it gains {C:chips}+#4#{} Chips and {C:mult}+#3#{} Mult",
          "Retrigger each Sew card for each played Sew card",
          "{C:inactive}(Currently {C:chips}+#2#{} {C:inactive}Chips,{} {C:mult}+#1#{} {C:inactive}Mult){}",
        },
      },
    },
    Voucher = {
      v_abn_overstock_maximum = {
        name = "Overstock Maximum",
        text = {
          "{C:attention}+#1#{} card slot",
          "available in shop"
        }
      },
      v_abn_tarot_master = {
        name = "Tarot Master",
        text = {
          "{C:green}1 in 6{} chance for",
          "used {C:tarot}Tarots{} to",
          "not get consumed"
        }
      },
      v_abn_planet_master = {
        name = "Planet Master",
        text = {
          "{C:green}1 in 6{} chance for",
          "used {C:planet}Planets{} to",
          "not get consumed"
        }
      },
      v_abn_money_master = {
        name = "Money Master",
        text = {
          "All cards and packs in",
          "shop are {C:attention}#1#%{} off"
        }
      },
      v_abn_glow_master = {
        name = "Glow Master",
        text = {
          "All {C:attention}Jokers",
          "have editions"
        }
      },
      v_abn_food_master = {
        name = "Food Master",
        text = {
          "{C:blue}+#1#{} hand selection"
        }
      },
      v_abn_recycle_master = {
        name = "Recycle Master",
        text = {
          "{C:red}+#1#{} discard selection"
        }
      },
      v_abn_negative_master = {
        name = "Negative Master",
        text = {
          "{C:dark_edition}+#1#{} Joker slots"
        }
      },
      v_abn_reroll_master = {
        name = "Reroll Master",
        text = {
          "Reroll cost",
          "does not increase"
        }
      },
      v_abn_gold_tree = {
        name = "Gold Tree",
        text = {
          "Raise the cap on",
          "interest earned in",
          "each round to {C:money}$#1#{}"
        }
      },
      v_abn_cataclysm_globe = {
        name = "Cataclysm Globe",
        text = {
          "{C:dark_edition}Spectral{} cards always",
          "show up in {C:tarot}Tarot{} packs"
        }
      },
      v_abn_satelite = {
        name = "Satellite",
        text = {
          "{C:planet}Planet{} cards in possession",
          "turn {C:dark_edition}Negative{} at",
          "the end of the round"
        }
      },
      v_abn_illusion_master = {
        name = "Illusion Master",
        text = {
          "{C:attention}Playing cards{} in shop",
          "are guaranteed to spawn",
          "with either an {C:dark_edition}Edition{} and a {C:attention}Seal{}",
          "or with an {C:dark_edition}Edition{} and an {C:dark_edition}Enhancement{}"
        }
      },
      v_abn_forget_fossil = {
        name = "Forget Fossil",
        text = {
          "{C:attention}-#1#{} antes"
        }
      },
      v_abn_fan_edit = {
        name = "Fan Edit",
        text = {
          "Boss Rerolls",
          "cost {C:money}$#1#{}"
        }
      },
      v_abn_industrial_brush = {
        name = "Industrial Brush",
        text = {
          "{C:attention}+#1#{} hand size"
        }
      },
      v_abn_chaos = {
        name = "Pendulum of Chaos",
        text = {
          "{C:abn_sigil}Sigil{}, {C:abn_astro}Astro{}, {C:abn_calamity}Calamity{} and {C:abn_nightshift}Nightshift{}",
          "cards can appear in {C:tarot}Tarot{} packs",
        }
      },
      v_abn_invasion = {
        name = "Parallel Invasion",
        text = {
          "{C:abn_sigil}Sigil{}, {C:abn_astro}Astro{}, {C:abn_calamity}Calamity{} and {C:abn_nightshift}Nightshift{}",
          "cards can appear in the shop",
        }
      },
    },
    Stake = {
      stake_abn_honor = {
        name = "Honor Jimbo",
        text = {
          "Finish at Ante {C:attention}9{}",
          "Antes {C:attention}4, 8, and 9{} are",
          "{C:abn_hazard}Hazard{} blinds",
        },
      },
      stake_abn_menacing = {
        name = "Menacing Jimbo",
        text = {
          "Finish at Ante {C:attention}10{}",
          "Antes {C:attention}5 and 10{} are",
          "{C:abn_hazard}Hazard{} blinds",
        },
      },
      stake_abn_toxic = {
        name = "Toxic Jimbo",
        text = {
          "Finish at Ante {C:attention}11{}",
          "Antes {C:attention}6 and 11{} are",
          "{C:abn_hazard}Hazard{} blinds",
          "Jokers can be {C:attention}flipped{}",
          "Jokers can have {C:attention}stickers{}"
        },
      },
    },
  },
  misc = {
    quips = {
    },
    challenge_names = {
    },
    dictionary = {
      -- Config options
      k_abn_config_show_credits = "Artist Credits",
      abn_show_credits = "Shows credits under mod badge when enabled",
      k_abn_config_toggle_music = "Toggle Music",
      abn_toggle_music = "Uses custom title screen music when enabled",

      -- Mod badges for credits
      k_abn_artist = "Artist",
      k_abn_founder = "Founder",
      k_abn_coder = "Coder",
      k_abn_music = "Music",
      k_abn_superrare = "Super Rare",
      k_abn_parallelrare = "Parallel Rare",
      k_abn_virusrare = "Virus Rare",
      k_abn_destroyed = "Destroyed!",
      k_abn_unflipped = "Unflipped!",
      k_abn_rental = "Rental!",
      k_abn_oneshot = "Fire!",
      k_abn_comedian = "Comedian",
      k_abn_plagued = "Plagued",
      k_abn_polychrome = "Polychrome!",
      k_abn_onfire = "On Fire!",
      abn_hazard_tags = "Hazard Tags",
      abn_kept = "Kept!",
      k_abn_even = "Even",
      k_abn_odd = "Odd",
      k_abn_rankless = "Rankless",
      k_abn_numbered = "numbered",
      abn_calamitybooster = "Calamity Pack",
      abn_calamitybooster_j = "Jumbo Calamity Pack",
      abn_calamitybooster_m = "Mega Calamity Pack",
      abn_sigilbooster = "Sigil Booster",
      abn_astrobooster = "Astro Booster",
      abn_joker_chip = "extra Chips",
      abn_joker_mult = "extra Mult",
      abn_joker_xmult = "extra Mult",
      abn_joker_xchips = "extra Chips",
      abn_joker_dollars = "extra Dollars",
      abn_joker_rep = "extra Repetitions",
      k_abn_increased = "Increased!",
      b_abn_ranks = "Ranks",
      k_abn_merged = "Merged!",
      k_abn_holo = "Holographic!",
      k_abn_plus_astro = "+1 Astro",
      k_abn_plus_sigil = "+1 Sigil",
      k_abn_plus_calamity = "+1 Calamity",
      k_abn_plus_weather = "+1 Weather",
      k_abn_plus_program = "+1 Program",
      k_abn_plus_lexica = "+1 Lexica",
      k_abn_plus_continent = "+1 Continent",
      k_abn_activated_ex = "Activated!",
      k_lexica_pack = "Lexica Pack",
      k_weather_pack = "Forecast Pack",
      k_green_horn = "Not Allowed!",
      k_abn_chthonian = "Chthonian!",
      k_abn_brewed_ex = "Brewed!",

      -- Consumable Types
      b_weather_report_cards = "Weather Reports",
      k_weather_report = "Weather Report",

      b_calamity_cards_cards = "Calamity Cards",
      k_calamity_cards = "Calamity",

      b_astro_cards_cards = "Astro Cards",
      k_astro_cards = "Astro",

      b_sigils_cards = "Sigil Cards",
      k_sigils = "Sigil",

      b_nightshift_cards_cards = "Nightshift Cards",
      k_nightshift_cards = "Nightshift",

      b_program_pack_cards = "Program Cards",
      k_program_pack = "Program",

      b_lexica_cards = "Lexica Cards",
      k_lexica = "Lexica",

      b_continent_cards = "Continent Cards",
      k_continent = "Continent"
    },
    labels = {
      -- Consumable Types
      weather_report = "Weather Report",
      calamity_cards = "Calamity",
      astro_cards = "Astro",
      sigils = "Sigil",
      nightshift_cards = "Nightshift",
      program_pack = "Program",
      lexica = "Lexica",
      continent = "Continent",
      -- Editions
      abn_chthonian = "Chthonian",
      abn_iridescent = "Iridescent",
      abn_abandond = "Abandoned",
      abn_sunscourge = "Sunscourge",
      abn_gloss = "Gloss",
      abn_pearlescent = "Pearlescent",
      -- STICKERS
      abn_pump_up = "Pump Up",
      abn_immortal = "Immortal",
      abn_bullseye = "Bullseye",
      abn_shovel = "Shovel",
      abn_downgrade = "Downgrade",
      abn_violet = "Violet",
      abn_weight = "Weight",
      abn_crown = "Crown",
      abn_flip = "Flip",
      abn_fragile = "Fragile",
      abn_possibility = "Possibility",
      abn_question_mark = "Question Mark?",
      abn_square = "Square",
      abn_lightning_bolt = "Lightning Bolt",
      abn_top_hat = "Top Hat",
      abn_cat_eye = "Cat Eye",
      abn_eraser = "Eraser",
      abn_lucky = "Lucky",
      abn_negative_plus = "Negative+",
      abn_glove_hand = "Glove Hand",
      abn_spicy = "Spicy",
      abn_x = "X",
      -- Seals
      abn_orange_seal = "Orange Seal",
      abn_grey_seal = "Grey Seal",
      abn_pink_seal = "Pink Seal",
      abn_black_seal = "Black Seal",
      abn_teal_seal = "Teal Seal",
      abn_white_seal = "White Seal",
      abn_brown_seal = "Brown Seal",
      abn_violet_seal = "Violet Seal",
      abn_lavender_seal = "Lavender Seal",
      abn_skyblue_seal = "Skyblue Seal",
      abn_lime_seal = "Lime Seal",
      abn_oxidized_seal = "Oxidised Seal",
      abn_brass_seal = "Brass Seal",
      abn_copper_seal = "Copper Seal",
      abn_silver_seal = "Silver Seal",
      abn_duality_seal = "Duality Seal"
    },
    ranks = {
      ["abn_11"] = "11",
      ["abn_12"] = "12",
      ["abn_13"] = "13",
      ["abn_14"] = "14",
    },
    v_text = {
    },
    suits_singular = {
      abn_Snow = "Snow",
      abn_Penumbra = "Penumbra",
      abn_suitless = "Null"
    },

    suits_plural = {
      abn_Snow = "Snows",
      abn_Penumbra = "Penumbras",
      abn_suitless = "Nulls"
    },
    poker_hands = {
      ['abn_Spectrum'] = "Spectrum",
      ['abn_Straight Spectrum'] = "Straight Spectrum",
      ['abn_Straight Spectrum (Royal)'] = "Royal Spectrum",
      ['abn_Spectrum House'] = "Spectrum House",
      ['abn_Spectrum Five'] = "Spectrum Five",
      ['abn_Spectrum Six'] = "Spectrum Six",

      ["abn_Specflush"] = "Specflush",
      ["abn_Specflush Five"] = "Specflush Five",
      ["abn_Specflush Six"] = "Specflush Six",
      ["abn_Straight Specflush_2"] = "Royal Specflush",
      ["abn_Specflush House"] = "Specflush House",
      ["abn_Straight Specflush"] = "Straight Specflush",

      ["abn_triple_pair"] = "Triple Pair",
      ["abn_double_triple"] = "Double Triple",
      ["abn_6oak"] = "Six of a Kind",


      ['abn_Abyss'] = "Abyss",
      ['abn_Haunted House'] = "Haunted House",
      ['abn_Empty Throne'] = "Empty Throne",
      ['abn_Empty Throne (Royal)'] = "Royal Throne",
      ['abn_Void Space'] = "Void Space",

      ['abn_Inverse Spectrum'] = "Inverse Spectrum",
      ['abn_Divider Conquered'] = "Divider Conquered",
      ['abn_Twilight Distillation'] = "Twilight Distillation",
    },
    poker_hand_descriptions = {
      ['abn_Spectrum'] = {
        "5 cards with different suits"
      },
      ['abn_Straight Spectrum'] = {
        "5 cards in a row (consecutive ranks),",
        "each with a different suit"
      },
      ['abn_Spectrum House'] = {
        "A Three of a Kind and a Pair with",
        "each card having a different suit"
      },
      ['abn_Spectrum Five'] = {
        "5 cards with the same rank,",
        "each with a different suit"
      },
      ['abn_Spectrum Six'] = {
        "6 cards with the same rank,",
        "each with a different suit"
      },

      ["abn_Specflush"] = {
        "A hand containing both",
        "a Spectrum and a Flush",
      },
      ["abn_Specflush Five"] = {
        "A hand containing a Spectrum,",
        "a Flush, and a Five of a Kind"
      },
      ["abn_Specflush Six"] = {
        "A hand containing a Spectrum,",
        "a Flush, and a Six of a Kind"
      },
      ["abn_Straight Specflush"] = {
        "A hand containing a Spectrum,",
        "a Flush, and a Straight"
      },
      ["abn_Specflush House"] = {
        "A hand containing all of a Spectrum,",
        "a Flush, a Pair, and a Three of a Kind"
      },

      ["abn_triple_pair"] = { "3 pairs of cards with different ranks", },
      ["abn_double_triple"] = { "2 pairs of 3 cards with the same rank.", },
      ["abn_6oak"] = { "6 cards with the same rank", },


      ['abn_Abyss'] = {
        "5 cards with no suit"
      },
      ['abn_Haunted House'] = {
        "A Three of a Kind with suits and",
        "a Three of a Kind with no suits"
      },
      ['abn_Empty Throne'] = {
        "5 suitless cards in a row (consecutive ranks)",
      },
      ['abn_Void Space'] = {
        "2 rankless cards and 3 suitless cards"
      },


      ['abn_Inverse Spectrum'] = {
        "5 cards with different suits",
        "and 1 suitless card"
      },
      ['abn_Divider Conquered'] = {
        "2 Light suit cards, 2 Dark suit cards,",
        "and 2 suitless cards"
      },
      ['abn_Twilight Distillation'] = {
        "A Straight containing 2 Light suit cards,",
        "2 Dark suit cards, and 2 suitless cards"
      },
    },
  }
}
