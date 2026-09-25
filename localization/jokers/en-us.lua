return {
  descriptions = {
    Joker = {
      j_abn_1_2_joker_even = {
        name = "1, 2 Joker",
        text = {
          "When an {C:red}even{} card is discarded,",
          "destroy it, and permanently add",
          "its {C:attention}rank{} to this Joker's {C:chips}Chips{}",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
          "{C:inactive,s:0.8}(Changes to {C:blue,s:0.8}Odd{C:inactive,s:0.8} next round)",
        }
      },
      j_abn_1_2_joker_odd = {
        name = "1, 2 Joker",
        text = {
          "When an {C:blue}odd{} card is discarded,",
          "destroy it, and permanently add",
          "its {C:attention}rank{} to this {C:chips}Chips{}",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
          "{C:inactive,s:0.8}(Changes to {C:red,s:0.8}Even{C:inactive,s:0.8} next round)",
        }
      },

      j_abn_10_4_joker = {
        name = "10-4 Joker",
        text = {
          "Each played {C:attention}10{} gains {C:mult}+#1#{} Mult",
          "Each played {C:attention}4{} gains {C:chips}+#2#{} Chips"
        },
      },

      j_abn_7_slot = {
        name = "7 Slot",
        text = {
          {
            "Scoring {C:attention}7s{} level up their {C:planet}planet{} {C:attention}rank{}",
            "once for every other scoring {C:attention}7",
          },
          {
            "If you have exactly {C:attention}7 Jokers{},",
            "each scoring {C:attention}7{} permanently gains",
            "{C:mult}+#1#{} Mult per scoring {C:attention}7",
          },
        }
      },

      j_abn_a_jesters_hat = {
        name = "A Jester's Hat",
        text = {
          {
            "If played hand contains {C:attention}2 {C:inactive}Vanilla{} suits",
            "and {C:attention}2 {C:dark_edition}Modded{} suits, this Joker",
            "gains double their {C:attention}ranks{} as {C:mult}Mult",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
          },
          {
            "If this Joker has {C:dark_edition}Vintage{} edition,",
            "Retrigger all scoring cards",
          }
        }
      },

      j_abn_abandonia = {
        name = "Abandonia",
        text = {
          {
            "Played cards give {C:white,X:mult}X#1#{} Mult",
            "and {C:white,X:chips}X#2#{} Chips when scored",
          },
          {
            "If this Joker has {C:dark_edition}Abandoned{} edition,",
            "all scoring cards permanently",
            "gain {C:mult}+#3#{} Mult and {C:chips}+#4#{} Chips",
          },
          {
            "If this Joker has {C:dark_edition}Vintage{} edition,",
            "all Jokers permanently gain",
            "{C:mult}+#3#{} Mult and {C:chips}+#4#{} Chips",
          }
        },
      },

      j_abn_abysmal_joker = {
        name = "Abysmal Joker",
        text = {
          {
            "{C:dark_edition}Chthonian{} cards have {C:attention}X#1#",
            "values while being scored"
          },
          {
            "If played hand contains only {C:edition}Chthonian{}",
            "cards and score {C:attention}catches on fire{},",
            "create a number of {C:dark_edition}Negative {C:attention}modded",
            "consumable cards equal to the",
            "number of scoring cards"
          },
          {
            "If this Joker has {C:dark_edition}Chthonian{} edition,",
            "played {C:attention}6{}s increase their level of",
            "{C:green}Planet Rank{} by {C:attention}#2#{} when scored"
          }
        }
      },


      j_abn_advertisement_joker = {
        name = "Advertisement Joker",
        text = {
          {
            "This Joker gains",
            "{X:mult,C:white}X#3#{} Mult every time",
            "a {C:solid_state}Solid State{} card is used",
          },
          {
            "This Joker gains",
            "{C:chips}+#4#{} Chips every time",
            "a {C:program_pack}Program Card{} is used",
            "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult,{} {C:chips}+#2#{} {C:inactive}Chips){}",
          },
        },
      },

      j_abn_aesthetic_joker = {
        name = "Aesthetic Joker",
        text = {
          {
            "{C:chips}+#1#{} Chips for every {C:attention}unique{}",
            "{C:attention}enhancement{} scored this run",
            "{C:inactive}(Currently{} {C:chips}+#2#{} {C:inactive}Chips){}",
          },
          {
            "If this Joker has an {C:dark_edition}edition{},",
            "{C:enhanced}Enhanced{} cards give {C:red}Mult",
            "equal to their {C:attention}rank{} when scored"
          }
        }
      },


      j_abn_agent_jimbo = {
        name = "Agent Jimbo",
        text = {
          {
            "All {C:attention}Consumables{} cost twice as much",
            "but gain {C:attention}random{} {C:dark_edition}Editions{} upon purchase",
          },
          {
            "When a {C:attention}6{} is scored, this Joker",
            "gains {X:chips,C:white}X#2#{} Chips per",
            "unique {C:dark_edition}editioned{} consumable type held",
            "{C:inactive}(Currently{} {X:chips,C:white}X#1#{} {C:inactive}Chips){}",
          }
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

      j_abn_aliasing_joker = {
        name = "Aliasing Joker",
        text = {
          { "Adds {C:dark_edition}Gloss{}, {C:dark_edition}Pearlescent{},",
            "or {C:dark_edition}Iridescendent{} edition to",
            "first scoring {C:attention}numbered{} card",
            "of {C:attention}first{} and {C:attention}final{} hand",
          },
          {
            "Played {C:dark_edition}Editioned{} cards",
            "give {C:money}$#1#{} when scored",
          },
        }
      },

      j_abn_alter_suits = {
        name = "Alter Suits",
        text = {
          {
            "If scoring hand contains a {C:abn_snow}Snow{},",
            "{C:abn_penumbra}Penumbra{}, {C:abn_tie}Tie{}, and {C:abn_bow}Bow{},",
            "this Joker gains {C:mult}Mult{} equal to",
            "the combined {C:attention}rank{} of all cards",
          },
          {
            "If scoring hand contains no {C:inactive}Vanilla{}",
            "suits, this Joker gains {C:chips}+#3#{} Chips",
            "{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult{} {C:chips}+#1#{} {C:inactive}Chips){}",
          },
        }
      },

      j_abn_alternate_outfit = {
        name = "Alternate Outfit",
        text = {
          {
            "This Joker gains {C:mult}+#2#{} Mult if",
            "played hand contains a {C:attention}#4#{}",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
          },
          {
            "If played hand is a",
            "{C:attention,s:0.8}#4#{s:0.8} of {C:abn_chalice,s:0.8}Chalices{s:0.8}, scoring cards gain {C:mult,s:0.8}+#3#{s:0.8} Mult",
            "{C:attention,s:0.8}#4#{s:0.8} of {C:abn_coin,s:0.8}Coins{s:0.8}, scoring cards gain {C:money,s:0.8}$#3#{}",
            "{C:attention,s:0.8}#4#{s:0.8} of {C:abn_baton,s:0.8}Batons{s:0.8}, scoring cards gain {C:white,X:mult,s:0.8}X#6#{s:0.8} Mult",
            "{C:attention,s:0.8}#4#{s:0.8} of {C:abn_sword,s:0.8}Swords{s:0.8}, scoring cards gain {C:chips,s:0.8}+#5#{s:0.8} Chips",
          }
        }
      },

      j_abn_amateur_artist = {
        name = "Amateur Artist",
        text = {
          {
            "When a hand is played,",
            "add a permanent copy of {C:attention}first{}",
            "scoring {C:attention}Kinship Card{} to deck",
            "and draw it to {C:attention}hand",
          },
          {
            "If scoring hand contains",
            "only {C:attention}Kinship Cards{}, convert",
            "that many cards in your deck",
            "into {C:attention}copies{} of scored cards",
            "{C:attention,s:0.8}High Card{s:0.8} excluded"
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

      j_abn_amplifier = {
        name = "Amplifier",
        text = {
          "{C:inactive}Vanilla{} Suits with {C:dark_edition}Modded{} {C:attention}Enhancements{}",
          "give {C:attention}50%{} more {C:chips}Chips{} and {C:mult}Mult{},",
          "{C:attention}100%{} if they're {C:dark_edition}Modded{} Suits"
        }
      },

      j_abn_ancient_prophet = {
        name = "Ancient Prophet",
        text = {
          {
            "Retrigger all played",
            "{C:red}Debuffed{} and {C:attention}Flipped{} cards",
          },
          {
            "{C:red}Debuffed{} and {C:attention}Flipped{} cards give",
            "{C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips when scored",
          }
        }
      },

      j_abn_ancient_tapestry = {
        name = "Ancient Tapestry",
        text = {
          {
            "{C:attention}Wallpaper Cards{} get shuffled",
            "to the top of the deck",
          },
          {
            "If {C:attention}scoring hand{} is composed",
            "of only {C:inactive}Vanilla{} Seals, gain",
            "{V:1}#3#{} equal to the amount",
            "of {C:attention}scoring cards{}"
          },
          {
            "If {C:attention}scoring hand{} is composed",
            "of only {C:dark_edition}Modded{} Seals, gain",
            "{B:1,C:white}x#3#{} equal to the amount",
            "of {C:attention}scoring cards{} then",
            "{C:attention}flip{} this Joker",
            "{C:inactive}(Currently {V:1}+#1#{C:inactive} #3#,{} {B:1,C:white}X#2#{C:inactive} #3#){}",
          },
        }
      },

      j_abn_annihilated_joker = {
        name = "Annihilated Joker",
        text = {
          "Every {C:attention}#1#{} {C:inactive}[#2#]{} {C:attention}Jokers{} destroyed,",
          "Create a random {C:calamity_cards}Calamity{} Card",
          "{C:inactive}(Must have room)",
        }
      },

      j_abn_ansatz_joker = {
        name = "Ansatz Joker",
        text = {
          "This Joker gains {C:chips}+#2#{} Chips",
          "per {C:attention}odd{} and {C:mult}+#4#{} Mult per",
          "{C:attention}even{} card in a {C:attention}#5#{}",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, {C:mult}+#3#{C:inactive} Mult)"
        }
      },

      j_abn_answer_sheet = {
        name = "Answer Sheet",
        text = {
          "This Joker gains {C:mult}+#2#{} Mult when",
          "a {C:green}probability{} on a {C:attention}Consumable{}",
          "successfully triggers, gains",
          "{C:chips}+#1#{} Chips if the successful",
          "trigger is on a {C:attention}Joker{}",
          "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips, {C:mult}+#4#{C:inactive} Mult)"
        }
      },

      j_abn_ante_up = {
        name = "Ante Up!",
        text = {
          {
            "Cards {C:attention}held in hand{} give",
            "{C:attention}double{} their ranks as {C:red}Mult{}",
          },
          {
            "{C:attention}+2{} Win Ante",
          }
        }
      },

      j_abn_antikythera_mechanism = {
        name = "Antikythera Mechanism",
        text = {
          {
            "This Joker gains",
            "{X:mult,C:white}X#2#{} Mult every time",
            "a {C:program_pack}Program{} card is used",
            "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult)",
          },
          {
            "{C:attention}Fossil{} card and {C:attention}Steel{} cards",
            "cannot be {C:red}debuffed{} or {C:red}destroyed{}",
          },
        }
      },

      j_abn_anxious_gimbo = {
        name = "Anxious Gimbo",
        text = {
          "Each played {C:attention}2{}, {C:attention}3{},",
          "{C:attention}5{}, {C:attention}7{}, {C:attention}11{}, or {C:attention}13{}",
          "gives {X:chips,C:white}X#1#{} Chips and",
          "{C:mult}+#2#{} Mult when scored",
        },
      },

      j_abn_apprentice_wizard = {
        name = "Apprentice Wizard",
        text = {
          {
            "This Joker gains {X:mult,C:white}X#1#{} Mult when a",
            "{C:dark_edition}Modded{} {C:spectral}Spectral{} card is used, resets",
            "when a {C:inactive}Vanilla{} {C:spectral}Spectral{} card is used",
            "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
          },
        },
      },

      j_abn_archaic_joker = {
        name = "Archaic Joker",
        text = {
          "This Joker gains {C:chips}+#1#{} Chips and",
          "{C:mult}+#2#{} Mult when {C:attention}Blind{} is defeated",
          "with an {C:attention}odd{} number of cards",
          "{C:inactive}(Currently {C:chips}+#3#{} {C:inactive}Chips,{} {C:mult}+#4#{} {C:inactive}Mult{}{C:inactive})",
        }
      },

      j_abn_archibald = {
        name = "Archibald",
        text = {
          "This Joker gains {X:chips,C:white}X#2#{} Chips",
          "if played hand contains",
          "scoring {C:attention}even{} cards",
          "{C:inactive}(Currently {C:white,X:chips}X#1#{C:inactive} Chips){}"
        }
      },

      j_abn_arkham = {
        name = "Arkham",
        text = {
          {
            "Scored {V:1}#5#{} give {X:chips,C:white}X#1#{} Chips",
            "and {C:white,X:mult}X#7#{} Mult, increases by",
            "{X:chips,C:white}X#2#{} Chips and {C:white,X:mult}X#8#{} Mult",
            "when a {V:1}#6#{} is scored",
            "{s:0.8}suit changes every hand",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "{V:1}#5#{} permanently gain",
            "{C:chips}+#4#{} Chips and {C:mult}+#3#{} Mult",
            "per card {C:attention}held{} in hand",
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
            "{C:weather_report}Report{} for every one destroyed"
          },
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

      j_abn_artistic_interpretation = { -- I did this art :D (cloudzXIII)
        name = "Artistic Interpretation",
        text = {
          "This Joker gains {C:chips}+#2#{} Chips",
          "per {C:attention}consecutive{} hand played",
          "with the same {C:attention}poker hand{}",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
        }
      },

      j_abn_ascended_joker = {
        name = "Ascended Joker",
        text = {
          {
            "{C:gold}+#1#{} Ascension Power",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "scored cards give",
            "{C:gold}+#2#{} Asc. Power",
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

      j_abn_astro_joker = {
        name = "Astro Joker",
        text = {
          {
            "{C:astro_cards}Astro{} cards always",
            "{C:green}succeed"
          },
          {
            "{C:green}#1# in #2# chance{} this {C:attention}Joker{}",
            "is {C:red}destroyed{} at end of round.",
          }
        }
      },

      j_abn_asylum_joker = {
        name = "Asylum Joker",
        text = {
          {
            "Forces {C:attention}#2#{} cards to",
            "always be selected",
          },
          {
            "{C:attention}Force-selected{} cards",
            "give {X:chips,C:white}^#1#{} Chips",
            "when scored"
          }
        }
      },

      j_abn_attack_777 = {
        name = "Attack 777",
        text = {
          {
            "{X:mult,C:white}X#3#{} Mult if played hand contains",
            "only {C:hearts}Hearts{} and {C:diamonds}Diamonds{}",
          },
          {
            "{C:green}#1# in #2#{} chance to retrigger",
            "each {C:attention}played{} card",
          }
        }
      },

      j_abn_authenticated_graded_joker = {
        name = "Authenticated Graded Joker",
        text = {
          {
            "Scoring {C:dark_edition}Vintage{} cards give {C:chips}+Chips{} and {C:mult}+Mult",
            "equal to your highest level {C:attention}poker hand",
            "{C:inactive}(Currently: {C:attention}#1#{C:inactive}, {C:chips}+#2# {C:inactive}Chips, {C:mult}+#3# {C:inactive}Mult)"
          },
          {
            "If this joker is {C:dark_edition}Vintage{}, all {C:dark_edition}Vintage{} playing",
            "cards are moved to the top of your deck"
          }
        }
      },

      j_abn_autostereogram_joker = {
        name = "Autostereogram Joker",
        text = {
          {
            "Gains {X:red,C:white}X#1#{} Mult per scored",
            "{C:attention}odd{} card with matching {C:dark_edition}editions{}",
          },
          {
            "Gains {X:chips,C:white}X#2#{} Chips per scored",
            "{C:attention}even{} card with {C:attention}matching{} {C:dark_edition}editions{}",
            "{C:inactive}(Currently {X:red,C:white}X#3#{C:inactive} Mult, {X:blue,C:white}X#4#{C:inactive} Chips)",
          }
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

      j_abn_avatar_of_luck = {
        name = "Avatar of Luck",
        text = {
          {
            "You may play and discard",
            "up to {C:attention}6{} cards",
          },
          {
            "If played hand contains only {C:attention}Lucky{} cards,",
            "they each gain {C:gold}+#3#{} Asc. Power for every",
            "time a {C:attention}Lucky{} card has scored this round"
          },
          {
            "After playing {C:attention}#2#{} {C:inactive}[#1#]{} hands containing",
            "{C:attention}#2# Lucky{} cards, destroy this Joker and",
            "{C:attention}double{} the level of all {C:attention}poker hands{}"
          },
        },
      },

      j_abn_aviator = {
        name = 'Aviator',
        text = {
          "This Joker gains {X:mult,C:white}X#2#{} Mult",
          "if played {C:planet}hand level{} is {C:attention}#3#{} or over",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
        },
      },

      j_abn_awakening_oopart = {
        name = "Awakening Oopart",
        text = {
          {
            "{C:planet}Planet{} and {C:program_pack}Program{} cards",
            "become {C:dark_edition}Negative{} when purchased",
          },
          {
            "Using {C:planet}Planet{} and {C:program_pack}Program{} cards",
            "give held {C:attention}Steel{} cards",
            "{C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips",
          },
        }
      },

      j_abn_baba_joker = {
        name = "Baba is Joker",
        text = {
          {
            "{C:blue}+#1#{} Chips and {C:red}+#2#{} Mult",
            "per {C:weather_report}Weather Report{}",
            "used this run",
            "{C:inactive}(Currently {C:blue}+#3#{C:inactive} and {C:red}+#4#{C:inactive})",
          },
          {
            "{C:weather_report}Weather Reports{}",
            "now sell for {C:gold}$5"
          },
        }
      },

      j_abn_backrooms_joker = {
        name = "Backrooms Joker",
        text = {
          {
            "Blinds are {C:attention}obscured{},",
            "When {C:attention}Blind{} is defeated, create",
            "a {C:purple}Parallel Rare{} Joker with",
            "{C:abn_perishable}Perishable{} and {C:money}Rental{}",
          },
          {
            "If this Joker has an {C:dark_edition}edition{},",
            "{C:purple}Parallel Rare{} Jokers each give {X:mult,C:white}X#1#{} Mult",
          }
        }
      },

      j_abn_bad_director = {
        name = "Bad Director",
        text = {
          {
            "{C:attention}Boss Blinds{} can be rerolled",
            "at the base cost of {C:money}$#1#{},",
            "increase cost by {C:money}$1{} per reroll"
          },
        }
      },

      j_abn_badformat_joker = {
        name = "Badformat Joker",
        text = {
          "{C:diamonds}Light Suits{} give {X:chips,C:white}^#1#{} Chips",
          "and {X:mult,C:white}^#2#{} Mult when scored",
        }
      },

      j_abn_balakiren = {
        name = "Balakiren",
        text = {
          {
            "Scored {C:attention}odd{} cards give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#3#{} Mult",
            "when an {C:attention}odd{} card is scored",
          },
          {
            "Scored {C:attention}even{} cards give {X:chips,C:white}X#2#{} Chips,",
            "increases by {X:chips,C:white}X#4#{} Chips",
            "when an {C:attention}even{} card is scored",
          },
        }
      },

      j_abn_balance_brandon = {
        name = "Balance Brandon",
        text = {
          {
            "Converts {C:mult}+Mult{} effects of all cards",
            "into {X:mult,C:white}XMult{} at a rate of {X:mult,C:white}X#1#"
          },
          {
            "If this is a {C:attention}Mult Joker{},",
            "{C:attention}Mult{} enhancements will also",
            "trigger when held in hand"
          }
        }
      },

      j_abn_balatro_64 = {
        name = "Balatro 64",
        text = {
          {
            "If {C:attention}winning hand{} is only {C:spades}Dark Suits{},",
            "gain {X:mult,C:white}X#5#{} Mult per scoring card,",
            "If {C:attention}winning hand{} is only {C:diamonds}Light Suits{},",
            "gain {X:chips,C:white}X#6#{} Chips per scoring card",
            "{C:inactive}(Currently{} {X:mult,C:white}X#3#{} {C:inactive}Mult,{} {X:chips,C:white}X#4#{} {C:inactive}Chips){}"
          },
          {
            "If {C:attention}winning hand{} is composed of {C:attention}both{},",
            "all Jokers gain {C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips",
          },
        }
      },

      j_abn_balatro_mod_manager = {
        name = "Balatro Mod Manager",
        text = {
          {
            "When {C:attention}Boss Blind{} is defeated,",
            "each Joker gains a random {C:attention}Enhancement{}"
          },
          {
            "Whenever a Joker changes",
            "{C:attention}Enhancement{}, it gains",
            "{C:gold}+#1#{} Ascension Power"
          },
        }
      },

      j_abn_balatro_the_movie = {
        name = "Balatro: The Movie",
        text = {
          {
            "Increase {C:attention}blind requirement{} by {X:attention,C:white}X#10#{}",
            "per {C:attention}Blind{} defeated this run",
          },
          {
            "Gains {X:mult,C:white}X#6#{} Mult per unique {C:attention}poker hand{} played,",
            "Gains {X:chips,C:white}X#7#{} Chips per {C:attention}repeating{} hand,",
            "Gains {C:mult}+#8#{} Mult and {C:chips}+#9#{} Chips per",
            "unique {C:attention}enhancement{} in scoring hand",
            "{C:inactive}(Currently {X:attention,C:white}X#5#{}{C:inactive}, {X:mult,C:white}X#1#{}{C:inactive}, {X:chips,C:white}X#2#{}{C:inactive}, {C:mult}+#3#{C:inactive}, {C:chips}+#4#{C:inactive})"
          },
          {
            "If played hand contains at least one of",
            "each {C:inactive}Vanilla{} suit, level up the {C:planet}planet{} {C:attention}rank{}",
            "of all cards scored by {C:attention}4{}",
          }
        }
      },

      j_abn_balatro_university = {
        name = "Balatro University",
        text = {
          {
            "All Jokers gain {C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips",
            "when {C:money}${} is earned during a {C:attention}Blind",
          },
          {
            "If you own {C:attention}Lucrative Joker{},",
            "{C:attention}level up{} hands with {C:attention}Gold{} cards",
          },
          {
            "If you own {C:attention}Slot Machine{},",
            "retrigger played {C:gold}Gold Seals{}",
          },
        }
      },

      j_abn_ballistic_glass_joker = {
        name = "Ballistic Glass Joker",
        text = {
          {
            "{C:attention}Glass{} cards don't {C:attention}shatter{}",
          },
          {
            "Each {C:attention}Glass{} card {C:attention}held{} in",
            "hand gives {X:mult,C:white}X#1#{} Mult",
          },
          {
            "{C:attention}Glass{} cards give {X:chips,C:white}X#2#{} Chips",
            "and {C:money}-$#3#{} when scored",
          },
        },
      },

      j_abn_barb_wire_joker = {
        name = "Barbwire Joker",
        text = {
          {
            "First scoring {C:attention}4",
            "gains a {C:abn_black_seal}Black Seal{}",
          },
          {
            "{C:green}#1# in #2#{} chance to",
            "destroy discarded cards",
          }
        },
      },

      j_abn_bark_joker = {
        name = "Bark Joker",
        text = {
          "This Joker gains {X:mult,C:white}X#2#{} Mult and",
          "{C:gold}+#4#{} Ascension Power when",
          "a {C:attention}Plank{} card is scored",
          "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult,{} {C:gold}+#3#{} {C:inactive}Asc. Power){}",
        }
      },

      j_abn_basiquat_joker = {
        name = "Basiquat Joker",
        text = {
          {
            "If hand contains an {C:attention}even{} number",
            "of scoring cards, gain {C:chips}Chips{} equal to",
            "{C:attention}2X{} the {C:money}sell value{} of current Jokers",
          },
          {
            "If hand contains an {C:attention}odd{} number",
            "of scoring cards, gain {C:mult}Mult{} equal to",
            "{C:attention}2X{} the {C:money}sell value{} of current Jokers",
          }
        }
      },

      j_abn_bellman_joker = {
        name = "Bellman Joker",
        text = {
          {
            "Gives {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
            "if {C:attention}Consumable{} slots are full",
          },
          {
            "If any {C:attention}Blind{} is defeated",
            "with full {C:attention}Consumable{} slots,",
            "gains {C:chips}+#3#{} Chips and {C:mult}+#4#{} Mult",
          }
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

      j_abn_bestfriend_photograph = {
        name = "Bestfriend's Photograph",
        text = {
          "First played {C:attention}numbered{}",
          "card gives {X:chips,C:white}X#1#{} Chips",
          "when scored"
        },
      },

      j_abn_beyond_the_rainbow = {
        name = "Beyond The Rainbow",
        text = {
          {
            "This Joker gains {X:mult,C:white}X#2#{} Mult per",
            "unique {C:attention}suit{} in hands",
            "containing a {C:attention}Spectrum{}",
            "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}"
          },
          {
            "If this Joker has an {C:dark_edition}edition{},",
            "{C:green}#3# in #4#{} chance for scoring",
            "cards to create {C:attention}Double Tags{}",
          }
        }
      },

      j_abn_bibliophile = {
        name = "Bibliophile",
        text = {
          "{C:attention}+2{} Consumable Slots",
          "When a {C:attention}Boss Blind{} is defeated,",
          "Gains {X:mult,C:white}X#5#{} Mult if a {C:lexica}Lexica{} Card is {C:attention}held{}",
          "Gains {C:mult}+#6#{} Mult if a {C:program_pack}Program{} Card is {C:attention}held{}",
          "Gains {C:chips}+#8#{} Chips if a {C:weather_report}Weather Report{} is {C:attention}held{}",
          "Gains {X:chips,C:white}X#7#{} Chips if a {C:calamity_cards}Calamity{} Card is {C:attention}held{}",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive},{} {C:mult}+#2#{} {C:inactive},{} {X:chips,C:white}X#3#{} {C:inactive},{} {C:chips}+#4#{} {C:inactive}){}"
        }
      },

      j_abn_big_baffoon = {
        name = "Big Baffoon", -- this is an intentional misspelling of "Buffoon", kinda like Sanic (Big Sonic)
        text = {
          "This Joker gains {C:chips}+#2#{} Chips",
          "if {C:attention}Blind{} is defeated",
          "on {C:attention}final hand{} of round",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
        }
      },

      j_abn_big_otis = {
        name = "Big Otis",
        text = {
          "If {C:attention}scored hand{} has more than",
          "{C:attention}#3#{} card and",
          "is only made of",
          "modded ranks,",
          "{C:mult}+#2#{} Mult and {C:chips}+#1#{} Chips"
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

      j_abn_billiard_14 = {
        name = "Billiard 14",
        text = {
          "{C:green}#1# in #2#{} chance for each",
          "played {C:attention}14{} to create a",
          "{C:solid_state}Solid State{} card when scored",
          "{C:inactive}(Must have room)",
        },
      },

      j_abn_bio_blueprint = {
        name = "Bio Blueprint",
        text = {
          {
            "{C:attention}Playing Cards{} may be moved from",
            "your hand to {C:attention}consumable slots{}",
          },
          {
            "Cards with the same {C:attention}rank{}",
            "as stored card can give",
            "{C:dark_edition}special effects{} when scored",
            "{C:inactive}(Currently {C:red}+#1# {C:inactive}Mult, {C:chips}+#2# {C:inactive}Chips)",
          },
        }
      },

      j_abn_bios_joker = {
        name = "BIOS JOKER",
        text = {
          "{C:planet}Planet{} cards retrigger",
          "once when used"
        }
      },

      j_abn_bitcoin_joker = {
        name = "Bitcoin Joker",
        text = {
          "When an {C:astro_cards}Astro{} card {C:red}fails{},",
          "this Joker gains {C:chips}+#4#{} Chips",
          "and {C:money}$#2#{} of {C:attention}sell value{},",
          "When an {C:astro_cards}Astro{} card {C:green}succeeds{},",
          "this Joker gains {C:mult}+#3#{} Mult",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, {C:mult}+#5#{C:inactive} Mult)",
        },
      },

      j_abn_black_forest = {
        name = "Black Forest",
        text = {
          "Played cards with {C:dark_edition}Modded{}",
          "{C:spades}Dark{} Suits give {C:mult}+#1#{} Mult",
          "when scored"
        }
      },

      j_abn_blackhat_joker = {
        name = "Blackhat Joker",
        text = {
          "Every played card gives",
          "{C:chips}+#1#{} Chips when scored if",
          "a {C:program_pack}Program{} card is {C:attention}held{}",
          "and {C:mult}+#2#{} Mult per {C:solid_state}Solid State{} card {C:attention}held",
        }
      },

      j_abn_blessed_joker = {
        name = "Blessed Joker",
        text = {
          "Add {C:abn_violet_seal}Violet Seal{} to",
          "{C:attention}first scoring{} {C:dark_edition}Foil{} card,",
          "{C:abn_brown_seal}Brown Seal{} to {C:attention}first",
          "{C:attention}scoring{} {C:dark_edition}Holographic{} card,",
          "{C:red}Red Seal{} to {C:attention}first",
          "{C:attention}scoring{} {C:dark_edition}Polychrome{} card,",
        }
      },

      j_abn_bloke_joker = {
        name = "Bloke Joker",
        text = {
          "Retrigger {C:attention}#1#s",
          "and {C:attention}#2#s",
          "{C:attention}#3#{} additional times"
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

      j_abn_bodyguard_joker = {
        name = "Bodyguard Joker",
        text = {
          {
            "Add {C:attention}Flipped{} to played cards",
            "that are not scored"
          },
          {
            "When a {C:attention}Flipped{} card is",
            "scored, {C:attention}unflip{} it and this",
            "Joker gains {C:mult}+#2#{} Mult",
            "{C:inactive}(Currently {C:mult}+#1#{} {C:inactive}Mult){}",
          },
        }
      },

      j_abn_bokeh_joker = {
        name = "Bokeh Joker",
        text = {
          {
            "Before scoring, destroy all",
            "played and {C:attention}unscoring{} cards",
          },
          {
            "This Joker gains {C:chips}+#2#{} Chips",
            "per {C:attention}odd{} and {C:mult}+#4#{} Mult",
            "per {C:attention}even{} card destroyed",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, {C:mult}+#3#{C:inactive} Mult)"
          }
        }
      },

      j_abn_mult_to_chips = {
        name = 'Bonus Bradly',
        text = {
          "When another Joker gives {C:mult}Mult{}, this",
          "Joker gives this Mult as {C:chips}Chips{}",
          --"{s:0.7,C:inactive}(Does not affect Jokers that give Mult after another Joker triggers){}"
        }
      },

      j_abn_bonus_buffoon = {
        name = "Bonus Buffoon",
        text = {
          "{C:attention}Enhanced{} cards give {X:mult,C:white}X#4#{} Mult",
          "for each {C:attention}Comedian{} you own,",
          "{C:green}#1# in #2#{} chance this Joker is",
          "destroyed at end of round",
          "{C:inactive}(Currently{} {X:mult,C:white}X#3#{} {C:inactive}Mult){}",
        }
      },

      j_abn_bonus_power_joker = {
        name = "Bonus Power Joker",
        text = {
          "Played {C:attention}Bonus Cards{} give {C:money}$#1#{},",
          "{C:chips}+#3#{} Chips and {C:mult}+#2#{} Mult",
          "when scored"
        },
      },

      j_abn_bootleg_joker = {
        name = "Bootleg Joker",
        text = {
          "Gives {X:chips,C:white}X#2#{} Chips, if played",
          "hand is a {C:attention}#1#{} with",
          "only {C:dark_edition}modded{} suits",
        }
      },

      j_abn_boozy_joker = {
        name = "Boozy Joker",
        text = {
          {
            "You may play and discard",
            "up to {C:attention}6{} cards",
          },
          {
            "{C:attention}6{} card hands",
            "give {C:money}$#1#{}"
          }
        }
      },

      j_abn_bouba_joker = {
        name = "Bouba Joker",
        text = {
          "This Joker gains {C:chips}+#2#{} Chips",
          "per scoring {C:attention}Odd{} card,",
          "increases by {C:chips}+#3#{} Chips per",
          "{C:lexica}Lexica{} card held when",
          "{C:attention}Boss Blind{} is defeated",
          "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips)",
        }
      },

      j_abn_boulevard_of_alters = {
        name = "Boulevard of Alters",
        text = {
          {
            "When a {C:rare}Rare{} Joker triggers, all",
            "{C:common}Common{} Jokers gain {C:chips}+#1#{} Chips"
          },
          {
            "When an {C:uncommon}Uncommon{} Joker triggers, all",
            "{C:rare}Rare{} Jokers gain {X:mult,C:white}x#2#{} Mult"
          },
          {
            "When a {C:common}Common{} Joker triggers, all",
            "{C:uncommon}Uncommon{} Jokers gain {X:chips,C:white}x#3#{} Chips"
          },
        }
      },

      j_abn_bowie = {
        name = "Bowie",
        text = {
          "Jokers with {C:dark_edition}Editions{}",
          "each give {X:mult,C:white}X#1#{} Mult",
        }
      },

      j_abn_braile_joker = {
        name = "Braile Joker",
        text = {
          {
            "{C:green}#1# in #2#{} chance for cards",
            "to be drawn {C:attention}face down{}",
          },
          {
            "Face down cards give",
            "{X:mult,C:white}X#3#{} Mult when scored"
          }
        }
      },

      j_abn_bravais_joker = {
        name = "Bravais Joker",
        text = {
          {
            "If played hand contains a {C:attention}Spectrum{},",
            "gains {C:chips}+#3#{} Chips per {C:attention}Wild{} Card scored,",
            "gains {C:mult}+#4#{} Mult per {C:attention}Mercurial{} Card scored",
            "{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult,{} {C:chips}+#1#{} {C:inactive}Chips)",
          },
          {
            "If this Joker has an {C:dark_edition}edition{},",
            "{C:attention}Wild{} cards gain {C:chips}+#3#{} Chips",
            "and {C:attention}Mercurial{} Cards gain {C:mult}+#4#{} Mult",
          }
        }
      },

      j_abn_brothers_memento = {
        name = "Brother's Memento",
        text = {
          "First played {C:attention}Ace",
          "card gives {X:mult,C:white} X#1# {} Mult",
          "when scored",
        },
      },

      j_abn_brulio_buffoon = {
        name = "Brulio Buffoon",
        text = {
          {
            "Scored {C:abn_chalice}Chalices{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:abn_chalice}Chalice{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "played {C:abn_chalice}Chalices{} permanently gain",
            "{C:mult}+#3#{} Mult for every {C:planet}planet{} {C:attention}rank{}",
            "level on scoring card"
          }
        }
      },

      j_abn_bubbly_comedian = {
        name = "Bubbly Comedian",
        text = {
          "This Joker gains {C:mult}+#4#{} Mult,",
          "{C:chips}+#5#{} Chips and {C:money}+$#6#{} when",
          "a {C:attention}Comedian{} Joker is triggered",
          "{s:0.8,C:attention}Bubbly Comedian{s:0.8} excluded",
          "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive}, {C:chips}+#2#{}{C:inactive}, {C:money}$#3#{}{C:inactive})"
        }
      },

      j_abn_bubbly_joker = {
        name = "Bubbly Joker",
        text = {
          "This Joker gains {X:mult,C:white}X#1#{} Mult",
          "when a {C:attention}Bubble{} card is {C:attention}added{},",
          "gains {X:chips,C:white}X#2#{} Chips when a",
          "{C:attention}Bubble{} card is {C:mult}destroyed{}",
          "{C:inactive}(Currently{} {X:mult,C:white}X#3#{} {C:inactive}Mult,{} {X:chips,C:white}X#4#{} {C:inactive}Chips){}",
        }
      },

      j_abn_buccaneer_joker = {
        name = "Buccaneer Joker",
        text = {
          {
            "Scoring {C:abn_anchor}Anchors{} have a",
            "{C:green}#1# in #2#{} chance to give {C:gold}$#3#{},",
            "{C:green}#4# in #5#{} chance to give {C:red}+#6#{} Mult",
          },
          {
            "Selected {C:abn_anchor}Anchors{} cannot be",
            "unselected until {C:red}discarded{} or {C:blue}played"
          },
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

      j_abn_caesar = {
        name = "Caesar Joker",
        text = {
          {
            "Scoring {C:abn_crown}Crowns{} permanently",
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

      j_abn_caffeinated_joker = { -- slightly relocalise 2nd bit
        name = "Caffeinated Joker",
        text = {
          {
            "{C:mult}Debuff{} all cards after first hand,",
            "Retrigger played {C:red}Red Seals{} once",
            "for each {C:mult}Red Seal{} played",
          },
          {
            "Each scored {C:attention}Tea Stain{} card is {C:mult}destroyed{}",
            "and this Joker gains {X:mult,C:white}X#2#{} Mult",
            "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult)",
          },
        },
      },

      j_abn_calendar = {
        name = "Calendar",
        text = {
          "{C:astro_cards}Astro{} cards always",
          "{C:green}succeed{} during round"
        }
      },

      j_abn_camorrista = {
        name = "Camorrista",
        text = {
          "When {C:attention}Blind{} is selected, steal {C:money}$#3#{}",
          "of {C:attention}sell value{} from other Jokers,",
          "this Joker gains {X:mult,C:white}X#2#{} Mult",
          "for every {C:money}$#3#{} stolen",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
        }
      },

      j_abn_canvas_joker = {
        name = "Canvas Joker",
        text = {
          "Played cards with {C:dark_edition}Modded{}",
          "Suits give {C:chips}+#1#{} Chips and",
          "{C:mult}+#2#{} Mult when scored"
        }
      },

      j_abn_carnaval_joker = {
        name = "Carnaval Joker",
        text = {
          "All scoring cards gain {C:mult}+#1#{} Mult",
          "if scoring hand contains a",
          "{C:abn_penumbra}Penumbra{} card, another",
          "{C:spades}Dark Suit{} and a {C:diamonds}Light Suit{}",
        }
      },

      j_abn_carnival_comedian = {
        name = "Carnival Comedian",
        text = {
          "{C:abn_superrare}Super Rare{} Jokers may appear in the shop",
          "This Joker gains {X:mult,C:white}X#2#{} Mult each time",
          "you purchase a {C:abn_superrare}Super Rare{} Joker",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
        }
      },

      j_abn_castle_jester = {
        name = "Castle Jester",
        text = {
          "If a {C:continent}Continent{} card is held after scoring,",
          "adds the {C:attention}rank{} of all {C:attention}face{} cards in hand",
          "to this Joker's {C:mult}Mult{}, and the {C:attention}rank{} of all",
          "{C:attention}numbered{} cards in hand to this Joker's {C:chips}Chips{}",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult, {C:chips}+#2#{C:inactive} Chips)"
        }
      },

      j_abn_cataract_joker = {
        name = "Cataract Joker",
        text = {
          "When playing a {C:attention}#1#{}:",
          "{X:chips,C:white}X#2#{} Chips if {C:abn_snow}Snows{}",
          "{X:mult,C:white}X#3#{} Mult if {C:abn_penumbra}Penumbras{}",
          "Balance {C:chips}Chips{} and {C:mult}Mult{} if {C:abn_tie}Ties{}",
          "Swap {C:chips}Chips{} and {C:mult}Mult{} if {C:abn_bow}Bows{}",
        },
      },

      j_abn_cenobite_joker = {
        name = "Cenobite Joker",
        text = {
          "If played hand is a {C:attention}#1#{},",
          "add {C:dark_edition}Chthonian{} effect to",
          "first and last scoring {C:diamonds}Light Suits{}"
        },
      },

      j_abn_certified_joker = {
        name = "Certified Joker",
        text = {
          "Each played {C:attention}#1#{} gives {X:mult,C:white}X#2#{} Mult",
          "and {X:chips,C:white}X#3#{} Chips when scored"
        }
      },

      j_abn_cheerful_joker = {
        name = "Cheerful Joker",
        text = {
          "This Joker gains {C:gold}+#2#{}",
          "Asc. Power if a {C:attention}6 card{}",
          "hand is played",
          "{C:inactive}(Currently {C:gold}+#1#{C:inactive} Asc. Power)"
        }
      },

      j_abn_child_drawing = {
        name = "Child Drawing",
        text = {
          "Scored {C:attention}numbered{} cards",
          "give {C:white,X:mult}X#1#{} Mult",
        }
      },

      j_abn_chip_stone = {
        name = "Chip Stone",
        text = {
          "Played {C:attention}Stone{} cards",
          "gain {C:chips}+#1#{} Chips and",
          "{C:dark_edition}Foil{} effect when scored",
        }
      },

      j_abn_chocolate_coin = {
        name = 'Chocolate Coin',
        text = {
          {
            "If played hand contains only {C:attention}Gold{} {C:abn_coin}Coins{},",
            "gives the base {C:mult}Mult{} of played hand as {C:money}${}",
          },
          {
            "Scoring {C:abn_coin}Coin{} {C:attention}Honey{} cards",
            "give their {C:chips}Chips{} as {C:mult}Mult{}",
          }
        },
      },

      j_abn_chubby_joker = {
        name = "Chubby Joker",
        text = {
          "Gains {C:chips}+#3#{} Chips and {C:mult}+#4#{} Mult",
          "when {C:attention}Blind{} is selected with all",
          "{C:attention}consumable slots{} are filled",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips and {C:mult}+#2#{C:inactive} Mult)"
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

      j_abn_claus = {
        name = "Claus",
        text = {
          "Retrigger {C:attention}first{} scoring card",
          "once per remaining {C:attention}hand",
        }
      },

      j_abn_cloten = {
        name = "Cloten",
        text = {
          "Scored {C:attention}Bonus{} cards give",
          "{X:chips,C:white}XChips{} equal to their {C:attention}rank",
          "{C:attention}Retrigger{} all {C:attention}Bonus{} cards",
        }
      },

      j_abn_cloud_screamer = {
        name = "Cloud Screamer",
        text = {
          "First played card",
          "permanently gains",
          "{C:mult}+#1#{} Mult when scored",
        }
      },

      j_abn_clown_degree = {
        name = "Clown Degree",
        text = {
          {
            "Cards with {C:attention}seals{} are shuffled",
            "to the top of the deck",
          },
          {
            "If card with a {C:attention}seal{} is {C:mult}destroyed{}, apply",
            "that {C:attention}seal{} to another card without a {C:attention}seal{}",
          }
        }
      },

      j_abn_clown_funk = {
        name = "Clown Funk",
        text = {
          {
            "If the {C:attention}first hand{} of a round is a",
            "{C:attention,s:0.8}Flush{s:0.8} of {C:abn_chalice,s:0.8}Chalices{s:0.8}, add {C:dark_edition,s:0.8}Gloss{s:0.8} to {C:attention,s:0.8}leftmost{s:0.8} Joker",
            "{C:attention,s:0.8}Straight{s:0.8} of {C:abn_coin,s:0.8}Coins{s:0.8}, add {C:dark_edition,s:0.8}Pearlescent{s:0.8} to {C:attention,s:0.8}leftmost{s:0.8} Joker",
            "{C:attention,s:0.8}Full House{s:0.8} of {C:abn_baton,s:0.8}Batons{s:0.8}, add {C:dark_edition,s:0.8}Iridescent{s:0.8} to {C:attention,s:0.8}leftmost{s:0.8} Joker ",
            "{C:attention,s:0.8}Five of a Kind{s:0.8} of {C:abn_sword,s:0.8}Swords{s:0.8}, add {C:dark_edition,s:0.8}Chromatic{s:0.8} to {C:attention,s:0.8}leftmost{s:0.8} Joker",
          },
          {
            "If this Joker has an {C:dark_edition}edition{},",
            "Jokers with {C:dark_edition}Editions{} cannot be destroyed",
          },
        },
      },

      j_abn_clown_vision = {
        name = "Clown Vision",
        text = {
          {
            "This Joker gains {C:mult}+#2#{} Mult if",
            "played hand contains a {C:attention}#4#{}",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
          },
          {
            "If played hand is a",
            "{C:attention,s:0.8}#4#{s:0.8} containing  a {C:abn_chalice,s:0.8}Chalice{s:0.8}, all {C:attention,s:0.8}Jokers{s:0.8} gain {C:mult,s:0.8}+#3#{s:0.8} Mult",
            "{C:attention,s:0.8}#4#{s:0.8} containing a {C:abn_coin,s:0.8}Coin{s:0.8}, all {C:attention,s:0.8}Jokers{s:0.8} gain {C:money,s:0.8}$#3#{s:0.8} of sell value",
            "{C:attention,s:0.8}#4#{s:0.8} containing a {C:abn_baton,s:0.8}Baton{s:0.8}, {C:green,s:0.8}#6# in #7#{s:0.8} chance to",
            "{s:0.8}create a random {C:attention,s:0.8}consumable{}",
            "{C:attention,s:0.8}#4#{s:0.8} containing a {C:abn_sword,s:0.8}Sword{s:0.8}, all {C:attention,s:0.8}Jokers{s:0.8} gain {C:chips,s:0.8}+#5#{s:0.8} Chips",
          }
        }
      },

      j_abn_clowns_soul = {
        name = "Clowns Soul",
        text = {
          "Pay {C:money}$#1#{} to {C:green}reroll{} selected Joker",
          "{C:inactive,s:0.8}({C:attention,s:0.8}Stickers{C:inactive,s:0.8} and {C:dark_edition,s:0.8}Editions{C:inactive,s:0.8} are retained){}"
        }
      },


      j_abn_codding_error_even = {
        name = "Coding Error",
        text = {
          "Retrigger all played",
          "cards with {C:red}even{} ranks",
          "{C:inactive,s:0.8}(Changes to {C:blue,s:0.8}Odd{C:inactive,s:0.8} next round)",
        }
      },
      j_abn_codding_error_odd = {
        name = "Coding Error",
        text = {
          "Retrigger all played",
          "cards with {C:blue}odd{} ranks",
          "{C:inactive,s:0.8}(Changes to {C:red,s:0.8}Even{C:inactive,s:0.8} next round)",
        }
      },

      j_abn_coercive_comedian = {
        name = "Coercive Comedian",
        text = {
          {
            "You may play and discard",
            "up to {C:attention}6{} cards",
          },
          {
            "This Joker gains {X:mult,C:white}X#2#{} Mult",
            "per unique {C:attention}numbered{} card scored,",
            "gains {C:chips}+#4#{} Chips per hand played",
            "{C:inactive}(Currently {C:chips}+#3# {C:inactive}Chips, {X:mult,C:white}X#1#{} {C:inactive}Mult)",
          }
        }
      },

      j_abn_collectible_joker = {
        name = "Collectible Joker",
        text = {
          "This Joker gains {C:chips}+#8#{} Chips per unique",
          "{C:common}Common{} Joker, {C:mult}+#7#{} Mult per unique",
          "{C:uncommon}Uncommon{} Joker, {X:mult,C:white}X#5#{} Mult per unique",
          "{C:rare}Rare{} Joker and {X:chips,C:white}X#6#{} Chips per unique",
          "{C:legendary}Legendary{} Joker obtained this run",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive},{} {C:mult}+#3#{C:inactive},{} {X:chips,C:white}X#2#{C:inactive}, {C:chips}+#4#{C:inactive}){}"
        }
      },

      j_abn_color_anomia = {
        name = "Colour Anomia",
        text = {
          {
            "{C:program_pack}Program{} cards are {C:attention}free{}",
          },
          {
            "If played hand contains a {C:attention}Spectrum{}",
            "with only {C:attention}numbered{} cards, level up",
            "{C:planet}planet{} {C:attention}rank{} of each played card",
          },
          {
            "If this Joker has an {C:dark_edition}edition{}, gains",
            "{C:chips}+#2#{} Chips per {C:program_pack}Program{} card used",
            "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips){}"
          },
          --[[unlock = {
              "Enhance an {C:attention}even-ranked{} card",
              "into a {C:mult}Mult card{}"
            }--]]
        }
      },

      j_abn_color_cascade = {
        name = "Colour Cascade",
        text = {
          "All hands are considered",
          "to be a {C:attention}Flush{}",
        }
      },

      j_abn_colour_vortex = {
        name = "Colour Vortex",
        text = {
          "{C:white,X:mult}X#1#{} Mult if {C:attention}first poker{}",
          "{C:attention}hand{} of round is a {C:attention}#2#{},",
        }
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

      j_abn_comedic_audience = {
        name = "Comedic Audience",
        text = {
          "When {C:attention}Blind{} is selected,",
          "destroy {C:attention}leftmost{} Joker, create",
          "a Joker based on its {C:attention}rarity{}",
        }
      },

      j_abn_comedy_gold = { -- to relocalise
        name = 'Comedy Gold',
        text = {
          "{C:attention}+1{} {C:chips}Play{} Limit",
          "If your hand is Composed of Only {C:attention}Gold{} cards",
          "Double your current {C:money}${} and each {C:attention}Gold{} card gains",
          "{X:mult,C:white}X#3#{} Mult and {C:gold}+#4#{} Asc. Power for each {C:money}$20{} you have",
          "After playing {C:attention}#2#{} hands of {C:attention}6{} Gold cards",
          "{C:mult}destroy{} this Joker and {C:attention}double{} your Joker slots",
          "{C:attention}#1#{}{C:inactive}/{}{C:attention}#2#{}",
        },
      },

      j_abn_communist_bear = {
        name = "Communist Bear",
        text = {
          "Retrigger all",
          "played {C:attention}face{} cards",
          "and destroy them",
          "{C:attention}after{} scoring",
        },
      },

      j_abn_composite_charles = {
        name = "Composite Charles",
        text = {
          "Each played {C:attention}#1#{}, {C:attention}#2#{}, {C:attention}#3#{}, {C:attention}#4#{} or {C:attention}#5#{}",
          "gives {X:chips,C:white}X#6#{} Chips when scored"
        }
      },

      j_abn_composite_creechie = {
        name = "Composite Creechie",
        text = {
          "{C:attention}Enhanced{} or {C:dark_edition}Editioned{} cards give",
          "{X:mult,C:white}X#4#{} Mult for each {C:attention}Comedian{} you own,",
          "{C:green}#1# in #2#{} chance this Joker is",
          "destroyed at end of round",
          "{C:inactive}(Currently{} {X:mult,C:white}X#3#{} {C:inactive}Mult){}",
        }
      },

      j_abn_computerworm_joker = {
        name = "Computerworm Joker",
        text = {
          {
            "When {C:attention}Blind{} is selected, {C:red}destroy{} ",
            "{C:attention}leftmost{} Joker and create a {C:dark_edition}Negative{}",
            "copy of this Joker without {C:abn_eternal}Eternal{}",
          },
          {
            "This Joker gains {X:mult,C:white}^#3#{} Mult and",
            "{X:chips,C:white}^#4#{} Chips per copy of itself",
            "{C:inactive}(Currently{} {X:mult,C:white}^#1#{} {C:inactive}Mult,{} {X:chips,C:white}^#2#{} {C:inactive}Chips){}",
          },
          {
            "{C:red,E:1}Lose the run{} if you own {C:attention}3{}",
            "or more copies of this Joker",
          },
        }
      },

      j_abn_confirm_joker = {
        name = "Confirm Joker",
        text = {
          {
            "Create a random {C:attention}Tag{}",
            "at end of round",
          },
          {
            "Earn {C:money}$#1#{} if a ",
            "{C:abn_hazard}Hazard Tag{} is obtained",
          },
        }
      },

      j_abn_conrad_joker = {
        name = "Conrad Joker",
        text = {
          {
            "Scored {C:abn_tie}Ties{} give {X:chips,C:white}X#1#{} Chips,",
            "increases by {X:chips,C:white}X#2#{} Chips",
            "when a {C:abn_tie}Tie{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "played {C:abn_tie}Ties{} permanently",
            "gain {C:money}$#3#{} when scored"
          }
        }
      },

      j_abn_conspiracy_joker = {
        name = "Conspiracy Joker",
        text = {
          {
            "On {C:attention}Even{} hands, flip all and shuffle all Jokers",
            "If a Joker triggers while {C:attention}flipped{} gain {C:mult}+#3#{} Mult",
          },
          {
            "On {C:attention}Odd{} hands, flip all Jokers face up",
            "If a Joker triggers while {C:attention}face up{} gain {C:chips}+#4#{} Chips",
            "{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult, {C:chips}+#1# {C:inactive}Chips)",
          },
        }
      },

      j_abn_construction_joker = {
        name = "Construction Joker",
        text = {
          "Scoring {C:attention}Steel{} cards give",
          "{C:chips}+#1#{} Chips, {C:attention}Stone{} cards",
          "give {X:mult,C:white}X#2#{} Mult",
        }
      },

      j_abn_consumable_tag = {
        name = "Consumable Tag",
        text = {
          {
            "When a {C:attention}Tag{} is obtained,",
            "create a {C:inactive}Vanilla{} Consumable Tag",
          },
          {
            "This Joker gains {X:mult,C:white}X#2#{} Mult",
            "when a {C:attention}Tag{} gives",
            "a {C:attention}Consumable{} Pack",
            "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
          }
        }
      },

      j_abn_contagion_joker = {
        name = "Contagion Joker",
        text = {
          {
            "{C:green}#1# in #2#{} chance to convert {C:attention}Sealed{}",
            "cards into {C:purple}Contagion Seals{},",
            "{C:green}#3# in #4#{} chance to convert {C:attention}Enhanced{}",
            "cards into {C:purple}Contagion Bonus Cards{},",
            "{C:green}#5# in #6#{} chance to convert {C:dark_edition}Editioned{}",
            "cards into {C:purple}Contagion Mult{}",
          },
          {
            "Other {C:abn_plagued}Plagued{} Jokers",
            "each give {X:mult,C:white}^#7#{} Mult",
          },
        }
      },

      j_abn_contract_from_below = {
        name = "Contract From Below",
        text = {
          {
            "{C:nightshift_cards}Nightshift{} cards always",
            "appear in {C:spectral}Spectral{} packs",
          },
          {
            "When {C:attention}Blind{} is selected,",
            "Apply {C:purple}Vessel{}, {C:abn_perishable}Perishable{} and {C:dark_edition}Chthonian{}",
            "to the {C:attention}leftmost{} Joker",
          }
        }
      },

      j_abn_cookie_joker = {
        name = 'Cookie Joker',
        text = {
          {
            "When a {C:attention}Honey{} card is added to a hand by it own effect",
            "Gain {C:gold}+#1#{} Asc. Power per added {C:attention}Honey{} card",
          },
          {
            "If hand has both a {C:attention}Tea Stain{} and",
            "{C:attention}Honey{} card this Joker gains {C:mult}Mult{}",
            "equal to {C:attention}twice{} the {C:attention}rank{} of the scoring cards",
            "{C:inactive}(Currently{} {C:gold}+#2#{} {C:inactive}Asc. Power, {C:mult}+#3#{} {C:inactive}Mult{C:inactive})",
          }
        },
      },

      j_abn_corbin_clown = {
        name = "Corbin Clown",
        text = {
          {
            "Scored {C:abn_sword}Swords{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:abn_sword}Sword{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "all cards {C:attention}held{} in hand",
            "permanently gain {C:chips}+#3#{} Chips",
            "when a {C:abn_sword}Sword{} is scored"
          }
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

      j_abn_corrupted_virtue = {
        name = "Corrupted Virtue",
        text = {
          "If {C:attention}first hand{} of round is",
          "a single {C:attention}13{}, destroy it and",
          "create a {C:nightshift_cards}Nightshift{} card",
          "{C:inactive}(Must have room)",
        }
      },

      j_abn_cosmic_light = {
        name = "Cosmic Light",
        text = {
          "Played cards with {C:dark_edition}Modded{}",
          "{C:diamonds}Light Suits{} give {C:mult}+#1#{} Mult",
          "when scored"
        }
      },

      j_abn_costard = {
        name = "Costard",
        text = {
          {
            "This Joker gains",
            "{X:chips,C:white}^#2#{} Chips every time",
            "a {C:planet}Planet{} card is used",
            "{C:inactive}(Currently {X:chips,C:white}^#1#{} {C:inactive}Chips)",

          },
          {
            "Each {C:attention}shop{} always contains",
            "a {C:attention}Mega Celestial Pack"
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

      j_abn_cowboy_poker = {
        name = "Cowboy Poker",
        text = {
          {
            "When {C:attention}Big Blind{} is defeated, add",
            "a different {C:dark_edition}Edition{} to",
            "each held {C:attention}consumable{}",
          },
          {
            "Earn {C:money}$#1#{} at end of round",
            "Payout increases by {C:money}$#2#{} per",
            "unique {C:dark_edition}Edition{} on held {C:attention}consumables{}",
            "{C:inactive}(Currently{} {C:money}$#1#{C:inactive})",
          },
        },
      },

      j_abn_crass_joker = {
        name = "Crass Joker",
        text = {
          {
            "If an {C:dark_edition}Editioned{} {C:attention}Joker{} is purchased,",
            "this Joker gains {C:chips}+#1#{} Chip",
            "per {C:money}${} of its {C:attention}cost",

          },
          {
            "If a {C:attention}free{} {C:attention}Joker{} is purchased,",
            "this Joker gains {C:chips}+#1#{} Chip",
            "per {C:money}${} of its {C:attention}original cost",
            "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
          }
        }
      },

      j_abn_crease_joker = {
        name = "Crease Joker",
        text = {
          "{X:attention,C:white}X#1#{} hand size,",
          "Discard selection size",
          "reduced to {C:red}#2#{}",
        }
      },

      j_abn_creechie_buffoon = {
        name = "Creechie Buffoon",
        text = {
          "{C:dark_edition}Editioned{} cards give {X:mult,C:white}X#4#{} Mult",
          "for each {C:attention}Comedian{} you own,",
          "{C:green}#1# in #2#{} chance this Joker is",
          "destroyed at end of round",
          "{C:inactive}(Currently{} {X:mult,C:white}X#3#{} {C:inactive}Mult){}",
        }
      },

      j_abn_crimson_neko = {
        name = "Crimson Neko",
        text = {
          "{C:attention}Lucky{} cards cannot be debuffed,",
          "This Joker gains {X:chips,C:white}X#2#{} Chips",
          "every time a {C:attention}Lucky{} card",
          "{C:green}successfully{} triggers",
          "{C:inactive}(Currently {X:chips,C:white}X#1#{C:inactive} Chips)",
        },
      },

      j_abn_crossword_puzzle = {
        name = "Crossword Puzzle",
        text = {
          "This Joker gains",
          "{X:chips,C:white}X#2#{} Chips every time",
          "a {C:lexica}Lexica{} card is activated",
          "{C:red}Resets{} if a {C:lexica}Lexica{} card is sold",
          "{C:inactive}(Currently {X:chips,C:white}X#1#{C:inactive} Chips)",
        },
      },

      j_abn_crybaby = {
        name = "Crybaby",
        text = {
          "Playing cards permanently",
          "gain {C:mult}+#1#{} Mult",
          "when {C:attention}discarded",
        }
      },

      j_abn_cupon_joker = {
        name = "Coupon Joker",
        text = {
          "{C:attention}Consumables{} that only",
          "select {C:attention}1{} target may",
          "now select {C:attention}2{}"
        }
      },

      j_abn_curtis_clown = {
        name = "Curtis Clown",
        text = {
          {
            "Scored {C:abn_sword}Swords{} give {X:chips,C:white}X#1#{} Chips,",
            "increases by {X:chips,C:white}X#2#{} Chips",
            "when a {C:abn_sword}Sword{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "all cards {C:attention}held{} in hand",
            "permanently gain {C:mult}+#3#{} Mult",
            "when a {C:abn_sword}Sword{} is scored"
          }
        }
      },

      j_abn_cyber_half = {
        name = "Cyber Half",
        text = {
          "{C:attention}Steel Cards{} give",
          "{C:attention}twice{} their rank as",
          "{C:chips}Chips{} when held in hand",
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

      j_abn_dagonet = {
        name = "Dagonet",
        text = {
          "{C:attention}Steel{} cards held in hand",
          "give {C:gold}+#1#{} Ascension Power"
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

      j_abn_daredevil = {
        name = "Daredevil",
        text = {
          {
            "Every {C:attention}played card",
            "counts in scoring",
          },
          {
            "Retrigger {C:attention}face down{} cards",
            "once for each {C:attention}face down{}",
            "card in scoring hand"
          },
          {
            "If {C:attention}Stunt Double{} is owned,",
            "level up {C:planet}planet{} {C:attention}rank{} of",
            "all {C:attention}face down{} cards scored",
          }
        }
      },

      j_abn_dark_magokert = {
        name = "Dark Magoker", -- note for localisers: this is Magician + Joker or something
        text = {
          "Cards with a {C:spades}Dark Suit{}",
          "are moved to the top",
          "of your {C:attention}deck{}",
        }
      },

      j_abn_dark_stallion = {
        name = "Dark Stallion",
        text = {
          "This Joker gains {C:chips}+#4#{} Chips",
          "and {C:mult}+#2#{} Mult when another",
          "{C:attention}Joker{} is triggered",
          "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips, {C:mult}+#1#{C:inactive} Mult)"
        }
      },

      j_abn_dark_tie = {
        name = "Dark Tie",
        text = {
          {
            "This Joker gains {C:money}$#6#{} and",
            "{C:mult}+#2#{} Mult if played hand",
            "contains a {C:attention}#3#{}",
            "{C:inactive}(Currently {C:money}$#5#{C:inactive}, {C:mult}+#1#{C:inactive})"
          },
          {
            "If hand containing a",
            "{C:attention}#3#{} has at least",
            "one {C:abn_tie}Tie{}, scoring {C:abn_tie}Ties{} each",
            "gain {C:money}+$#4#{} and {C:mult}+#4#{} Mult per",
            "{C:spades}Dark Suit{} in scoring hand"
          }
        }
      },

      j_abn_darkest_joker = {
        name = "Darkest Joker",
        text = {
          "This Joker gains {C:mult}+#3#{} Mult per",
          "scoring {C:dark_edition}Editioned{} {C:spades}Dark Suit{},",
          "gains {C:chips}+#4#{} Chips per scoring",
          "{C:attention}Enhanced{} {C:spades}Dark Suit{}",
          "{C:inactive}(Currently {C:mult}+#1#{} {C:inactive}Mult,{} {C:chips}+#2#{} {C:inactive}Chips){}",
        }
      },

      j_abn_darknet_joker = { -- prolly based off of the dark web
        name = "Darknet Joker",
        text = {
          {
            "If played hand is a {C:attention}Divider Conquered{}",
            "containing only {C:attention}numbered{} cards,",
            "They all gain {C:dark_edition}Bit Rot{} edition",
          },
          {
            "This Joker gains {X:mult,C:white}X#1#{} Mult per",
            "scoring card in a {C:attention}Divider Conquered{}",
            "{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult)",
          },
        },
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

      j_abn_dead_or_alive = {
        name = "Dead or Alive",
        text = {
          "When a {C:attention}#1#{} of {V:1}#2#{} is played,",
          "permanently {C:attention}double{} its {C:chips}chips{}",
          "and gain {C:money}${} equal to its rank",
          "{s:0.8}Card changes every round",
        },
      },

      j_abn_deceitful_joker = {
        name = "Deceitful Joker",
        text = {
          "{X:mult,C:white}X#1#{} Mult",
          "When {C:attention}Boss Blind{} is defeated,",
          "add {C:attention}Flipped{} to all cards",
          "of a {C:attention}random{} owned suit",
        }
      },

      j_abn_deck_o_cards = {
        name = "Deck of Cards",
        text = {
          "When a {C:attention}playing card{} is",
          "added to your deck, this Joker",
          "gains {C:chips}Chips{} equal to its {C:attention}rank{}",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
        }
      },

      j_abn_decollage_joker = {
        name = "Decollage Joker",
        text = {
          {
            "Give {X:mult,C:white}XMult{} equal to the number",
            "of {C:attention}unique{} suits in scoring hand",
          },
          {
            "If this Joker has {C:dark_edition}Holographic{} edition,",
            "all scoring cards gain {C:mult}+#1#{} Mult",
          }
        },
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

      j_abn_degraded_data_joker = {
        name = "Degraded Data Joker",
        text = {
          "Gain {C:mult}+#4#{} Mult when {C:purple}Contagion Bonus{} cards score",
          "Gain {X:mult,C:white}X#5#{} Mult when {C:purple}Contagion Seal{} cards score",
          "Gain {X:mult,C:white}^#6#{} Mult when {C:purple}Contagion Mult{} cards score",
          "{C:inactive}(Currently{} {C:mult}#1#{} {C:inactive}Mult,{} {X:mult,C:white}X#2#{} {C:inactive}Mult,{} {X:mult,C:white}^#3#{} {C:inactive}Mult)",
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

      j_abn_demon_sphere = {
        name = "Demon Sphere",
        text = {
          {
            "Played cards with {C:dark_edition}Modded{}",
            "{C:attention}ranks{} give {C:gold}+#1#{} Asc.",
            "Power when scored",
          },
          {
            "Played cards have a",
            "{C:green}#2# in #3#{} chance to be",
            "{C:red}destroyed{} after scoring"
          }
        }
      },

      j_abn_depresor_joker = {
        name = "Depressor Joker",
        text = {
          {
            "{C:attention}First{} played {C:spades}Dark Suit{}",
            "becomes {C:dark_edition}Negative{}",
          },
          {
            "This Joker gains {C:chips}+#6#{} Chips and",
            "{C:mult}+#5#{} Mult per {C:dark_edition}Negative{} {C:spades}Dark Suit{} played",
          },
          {
            "If this Joker has {C:dark_edition}Negative{} edition,",
            "gain {X:mult,C:white}X#4#{} Mult per {C:dark_edition}Negative{} card played",
            "{C:inactive}(Currently {C:chips}+#3#{} {C:inactive}Chips,{} {C:mult}+#2#{} {C:inactive}Mult,{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}"
          },
        }
      },

      j_abn_deranged_imposter = {
        name = "Deranged Imposter",
        text = {
          {
            "Gains {C:red}+#1#{} Mult per scored card with",
            "matching {C:attention}ranks {}and {C:enhanced}enhancements{}",
            "but different {C:planet}suits",
          },
          {
            "Gains {C:blue}+#2#{} Chips per scored card with",
            "matching {C:attention}suits{} and {C:enhanced}enhancements{}",
            "but different {C:attention}ranks",
            "{C:inactive}(Currently {C:red}+#3#{C:inactive} Mult, {C:blue}+#4#{C:inactive} Chips)",
          }
        },
      },

      j_abn_destination_unknown = {
        name = "Destination Unknown",
        text = {
          {
            "When {C:attention}Blind{} is selected,",
            "this Joker gains {C:chips}+#3#{} Chips",
            "per missing {C:attention}rank{} in your full deck",
          },
          {
            "If this Joker has {C:dark_edition}Abandoned{} edition,",
            "gains an additional {X:chips,C:white}X#4#{} Chips",
            "per missing {C:attention}rank{}",
            "{C:inactive}(Currently {X:chips,C:white}X#1#{} {C:inactive}Chips,{} {C:chips}+#2#{} {C:inactive}Chips){}",
          },
        }
      },

      j_abn_detonation_button = {
        name = "Detonation Button",
        text = {
          {
            "Played {C:attention}Bonus{}, {C:attention}Mult{}",
            "{C:attention}Wild{}, and {C:attention}Steel{} cards",
            "permanently gain {C:white,X:mult}X#1#{} Mult",
            "when scored",
          },
          {
            "{C:red}self-destructs{} if hand",
            "contains none of these cards",
          }
        },
      },

      j_abn_device_joker = {
        name = "#1#",
        text = {
          {
            "{C:attention}#2#{} cards are not",
            "destroyed by their own {C:attention}effect{}",
          },
          {
            "If {C:attention}first hand{} of round",
            "has only {V:1}#3# Suits{}, enhance",
            "them into {C:attention}#2#{} cards",
          },
          {
            "If they all are {C:attention}#2#{} cards,",
            "add {C:dark_edition}#4#{} edition to them",
            "and {C:attention}flip{} this Joker",
          }
        }
      },

      j_abn_devil_fruit = {
        name = "Devil Fruit",
        text = {
          {
            "When {C:attention}Blind{} is selected,",
            "add {C:dark_edition}#3#{} edition",
            "to {C:attention}rightmost{} Joker",
          },
          {
            "{C:green}#1# in #2#{} chance this",
            "card is destroyed",
            "at end of round",
          },
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

      j_abn_dimitri_jester = {
        name = "Dimitri Jester",
        text = {
          {
            "Scored {C:diamonds}Diamonds{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:diamonds}Diamond{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned, scoring",
            "{C:diamonds}Diamonds{} add {C:money}$#3#{} of {C:attention}sell value{}",
            "to every {C:attention}Joker{}"
          }
        }
      },

      j_abn_dirac = {
        name = "Dirac",
        text = {
          {
            "{C:dark_edition}Modded{} {C:dark_edition}Negative{} Jokers and",
            "cards cannot be {C:red}debuffed{}",
          },
          {
            "If this Joker has {C:dark_edition}Negative{}",
            "edition, {C:attention}+#5#{} hand size",
          },
          {
            "This Joker gains {X:chips,C:white}X#2#{} Chips per",
            "scoring {C:dark_edition}Modded{} {C:dark_edition}Negative{} card,",
            "gains {X:mult,C:white}X#4#{} Mult when a {C:dark_edition}Modded{}",
            "{C:dark_edition}Negative{} Joker is triggered",
            "{C:inactive}(Currently{} {X:chips,C:white}X#1#{} {C:inactive}Chips{} {X:mult,C:white}X#3#{} {C:inactive}Mult){}",
          },
        }
      },

      j_abn_forsake_joker = {
        name = "Disrepaired Joker",
        text = {
          "Earn {C:money}$#1#{} when {C:dark_edition}Abandoned{} edition triggers,",
          "If triggered on a {C:attention}Playing Card{},",
          "gain Chips equal to {C:attention}double{} its rank",
          "Gain {C:mult}+#4#{} Mult if triggered on a {C:attention}Joker{}",
          "{C:inactive}(Currently{} {C:mult}+#3#{} {C:inactive}Mult, {C:chips}+#2# {C:inactive}Chips)",
        }
      },

      j_abn_discontinued_joker = {
        name = "Discontinued Joker",
        text = {
          {
            "When {C:attention}Blind{} is skipped,",
            "create a random {C:attention}Tag{}",
          },
          {
            "Played {C:attention}Discontinued{} cards",
            "permanently gain {C:mult}+#1#{} Mult per",
            "unique {C:attention}Tag{} obtained this run",
            "{C:inactive}(Will gain {C:mult}+#2#{C:inactive})"
          }
        }
      },

      j_abn_dnr_joker = {
        name = "DNR Joker",
        text = {
          "When an {C:attention}Enhanced{} card is scored,",
          "{C:mult}destroy{} them, each {C:attention}Joker",
          "permanently gains {X:mult,C:white}X#1#{} Mult",
        }
      },

      j_abn_dorcelessness = {
        name = "Dorcelessness",
        text = {
          "Retrigger {C:attention}adjacent{}",
          "{C:attention}Flipped{} Jokers"
        }
      },

      j_abn_double_dip = {
        name = 'Double Dip',
        text = {
          "Gives the {C:attention}base{} {C:chips}Chips{} and",
          "{C:red}Mult{} of played {C:attention}poker hand",
        }
      },

      j_abn_double_entendre = {
        name = "Double Entendre",
        text = {
          "{C:white,X:mult}X#1#{} Mult on {C:attention}even hands{},",
          "{C:white,X:chips}X#2#{} Chips on {C:attention}odd hands{}",
        }
      },

      j_abn_double_hubble = {
        name = 'Double Hubble',
        text = {
          '{C:mult}+#1#{} Mult if {C:attention}poker hand{}',
          'has been played an',
          '{C:attention}even{} number of times'
        }
      },

      j_abn_double_king = {
        name = "Double King",
        text = {
          {
            "No {C:chips}chip{} gain on {C:attention}Kings{},",
            "When a {C:attention}King{} is scored, {C:mult}destroy{} it",
            "and gain {C:attention}double{} its {C:attention}rank{} as {C:chips}Chips{}",
            "{C:inactive}(Currently {C:chips}+#1#{} {C:inactive}Chips)",
          },
          {
            "If {C:attention}Mr. Bones{} is owned, it becomes",
            "{C:dark_edition}Negative{} at end of round and",
            "gives {C:mult}+#2#{} Mult per scoring card",
          },
        }
      },

      j_abn_drawcia = {
        name = "Drawcia",
        text = {
          {
            "Hands containing only {C:dark_edition}Modded{}",
            "suits {C:attention}always score{}",
          },
          {
            "This Joker gains {X:mult,C:white}X#2#{} Mult",
            "per {C:attention}unique{} suit in scoring hand",
            "if no {C:inactive}Vanilla{} suits are played",
            "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
          }
        }
      },

      j_abn_dreamstalker_joker = {
        name = "Dreamstalker Joker",
        text = {
          {
            "If you have an {C:attention}Even{} number of {C:red}discards{},",
            "{C:diamonds}Light Suits{} give {C:mult}+#1#{} Mult when scored",
            "for every {C:spades}Dark Suit{} scored before",
          },
          {
            "If you have an {C:attention}Odd{} number of {C:red}discards{},",
            "{C:spades}Dark Suits{} give {C:mult}+#1#{} Mult when scored",
            "for every {C:diamonds}Light Suit{} scored before",
          },
        }
      },

      j_abn_dreamtime_sphinx = {
        name = "Dreamtime Sphinx",
        text = {
          {
            "This Joker gains {C:chips}+#2#{} Chips",
            "when a {C:attention}Fossil Card{} is scored",
            "level up their {C:planet}planet{} {C:attention}rank{} if",
            "it has {C:dark_edition}Opaque{} edition"
          },
          {
            "If a {C:attention}Fossil Card{} is {C:mult}destroyed{},",
            "give its {C:attention}rank{} as {C:mult}Mult",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, {C:mult}+#3#{} {C:inactive}Mult{})"
          },
        }
      },

      j_abn_drifter_joker = {
        name = "Drifter Joker",
        text = {
          {
            "If {C:attention}first discard{} of round,",
            "discarded cards become {C:attention}Fossil Cards{}",
          },
          {
            "{C:attention}Rankless{} cards {C:attention}return{} to hand",
            "when played for the first time"
          }
        }
      },

      j_abn_dryeraser_board = {
        name = "Dryeraser Board J",
        text = {
          "{X:red,C:white}X#1#{} Mult if all cards",
          "played and held in hand",
          "are {C:spades}#2#{}",
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

      j_abn_dungeon_crawler = {
        name = "Dungeon Crawler",
        text = {
          {
            "Pay {C:money}$#1#{} to add {C:attention}+1{} Joker slot,",
            "increase finishing {C:attention}Ante{} by {C:attention}+1{}",
            "for every Joker above {C:attention}5{}",
          },
          {
            "Jokers and cards with {C:inactive}Vanilla{}",
            "{C:dark_edition}Editions{} give {C:gold}+#2#{} Asc. Power",
          },
          {
            "If a card with a {C:inactive}Vanilla{} suit and {C:dark_edition}Edition{}",
            "matches a held {C:attention}Joker{}'s {C:dark_edition}Edition{},",
            "this Joker gains {C:gold}+#4#{} Asc. Power",
            "{C:inactive}(Currently{} {C:gold}+#5#{} {C:inactive}Ascension Power){}",
          }
        }
      },

      j_abn_early_sketch = {
        name = "Early Sketch",
        text = {
          {
            "If {C:attention}first hand{} of round has",
            "only {C:dark_edition}Vintage {C:attention}Kinship Cards{},",
            "hand will score as if it",
            "were {C:attention}#1#{} levels higher",
          },
          {
            "Hands containing only",
            "{C:dark_edition}Vintage{} {C:attention}Kinship Cards{}",
            "cannot {C:red}level down{}"
          }
        }
      },

      j_abn_eccentric_artist = {
        name = "Eccentric Artist",
        text = {
          {
            "Scoring {C:attention}Kinship{} cards with both",
            "a {C:inactive}Vanilla {C:attention}suit{} and {C:attention}Edition{}",
            "give {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
          },
          {
            "Scoring {C:attention}Kinship{} cards with both",
            "a {C:dark_edition}Modded {C:attention}suit{} and {C:attention}Edition{}",
            "give {C:chips}+#3#{} Chips and {C:mult}+#4#{} Mult",
          },
          {
            "Gives {C:chips}+#5#{} Chips and {C:mult}+#6#{} Mult if your",
            "{C:attention}full deck{} contains only {C:attention}Kinship{} Cards"
          }
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

      j_abn_edition_anonymous = {
        name = "Edition Anonymous",
        text = {
          {
            "When an {C:dark_edition}Editioned{}",
            "card scores, {C:attention}randomise{}",
            "its {C:dark_edition}Edition{}",
          },
          {
            "When {C:attention}Blind{} is defeated,",
            "{C:attention}randomise{} the {C:dark_edition}Edition{}",
            "of all owned Jokers"
          },
          {
            "Each Card or Joker that changes",
            "{C:dark_edition}Edition{} gains {C:mult}+#1#{} Mult",
            "and {C:chips}+#2#{} Chips"
          }
        }
      },

      j_abn_edition_design_joker = {
        name = "Edition & Design Joker",
        text = {
          {
            "When an {C:dark_edition}editioned{} {C:attention}Joker{},",
            "is purchased, gains {C:mult}Mult{}",
            "based on its {C:legendary}rarity",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
          },
          {
            "{C:common,s:0.8}Common{s:0.8}: {C:red,s:0.8}+#2#{s:0.8} Mult",
            "{C:uncommon,s:0.8}Uncommon{s:0.8}: {C:red,s:0.8}+#3#{s:0.8} Mult",
            "{C:rare,s:0.8}Rare{s:0.8}: {C:red,s:0.8}+#4#{s:0.8} Mult",
            "{C:abn_superrare,s:0.8}Super Rare{s:0.8}: {C:red,s:0.8}+#5#{s:0.8} Mult",
            "{C:abn_parallelrare,s:0.8}Parallel Rare{s:0.8}: {C:red,s:0.8}+#6#{s:0.8} Mult",
            "{C:legendary,s:0.8}Legendary{s:0.8}: {C:red,s:0.8}+#7#{s:0.8} Mult",
            "{C:abn_virusrare,s:0.8}Virus Rare{s:0.8}: {C:red,s:0.8}+#8#{s:0.8} Mult",
          },
        }
      },

      j_abn_editional_tag = {
        name = "Editional Tag",
        text = {
          {
            "This Joker gains {X:mult,C:white}X#2#{} Mult when",
            "a {C:attention}Tag{} is obtained, if its a",
            "{C:dark_edition}Modded{} Tag, {C:attention}Discontinued Cards{}",
            "permanently gain {C:money}$#4#{} and {C:mult}+#3#{} Mult",
          },
          {
            "If this Joker has an {C:dark_edition}Edition{},",
            "when a Joker gets an {C:dark_edition}Edition{}",
            "from a {C:attention}tag{}, add the same {C:dark_edition}Edition{}",
            "to a random {C:attention}Discontinued Card",
            "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult){}"
          },
        }
      },

      j_abn_efo_joker = {
        name = "EFO Joker",
        text = {
          {
            "{C:green}#1# in #2#{} chance to copy first played",
            "{C:attention}Stamped{} card into your hand",
          },
          {
            "Played cards with {C:attention}Stamps{} give",
            "{C:gold}+#3#{} Asc. Power when scored",
          },
          {
            "If played hand has {C:attention}5{} or more {C:attention}Stamps{},",
            "this Joker gains {X:mult,C:white}X#4#{} Mult and",
            "{C:gold}+#5#{} Asc. Power per card scored",
            "{C:inactive}(Currently {X:mult,C:white}X#6#{} {C:inactive}Mult,{} {C:gold}+#7#{} {C:inactive}Ascension Power){}",
          }
        }
      },

      j_abn_egg_arrival = {
        name = "Egg Arrival",
        text = {
          {
            "Add {C:money}$#1#{} of {C:attention}sell value",
            "to every {C:attention}Joker{} when",
            "a {C:weather_report}Weather Report{} is used",
          },
          {
            "Retrigger all {C:attention}Jokers{}",
            "with at least {C:money}$#2#{} sell value",
          },
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
            "{C:attention}Inverse Spectrum{}, level up",
            "{C:planet}planet{} {C:attention}rank{} of all cards scored"
          }
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

      j_abn_emergency_contact = {
        name = "Emergency Contact",
        text = {
          "After {C:attention}#1#{} rounds,",
          "{C:attention}sell{} this Joker to create",
          "a discovered {C:rare}Rare{} {C:abn_perishable}Perishable{}",
          "Joker from your collection",
          "{C:inactive}(Currently {C:attention}#2#{C:inactive}/{C:inactive}#1#)"
        },
      },

      j_abn_ena_joker = {
        name = "ENA Joker",
        text = {
          {
            "Played cards with {C:inactive}Vanilla{} suits",
            "and {C:dark_edition}Modded {C:enhanced}Enhancements{} give",
            "{C:white,X:chips}X#1#{} Chips when scored"
          },
          {
            "This Joker gains {C:chips}+#3#{}",
            "Chips per unique {C:dark_edition}Modded{}",
            "{C:enhanced}Enhancement{} in scoring hand",
            "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
          }
        }
      },

      j_abn_enchanted_night = {
        name = "Enchanted Night",
        text = {
          "Retrigger all played",
          "{C:dark_edition}Editioned{} {C:spades}Dark Suits{}",
        }
      },

      j_abn_enigma_comedian = {
        name = "Enigma Comedian",
        text = {
          {
            "When {C:attention}Blind{} is selected,",
            "create {C:attention}1{} {C:dark_edition}Pearlescent{}",
            "{C:inactive}Vanilla{} Joker",
            "{C:inactive}(Must have room)",
          },
          {
            "{X:mult,C:white}^#1#{} Mult and {X:chips,C:white}^#2#{} Chips",
            "for every {C:inactive}Vanilla{} Joker",
            "triggered"
          }
        }
      },

      j_abn_enrage_joker = {
        name = "Enrage Joker",
        text = {
          "{C:white,X:chips}X#1#{} Chips,",
          "Forces {C:attention}#2#{} cards to",
          "always be selected",
        },
      },

      j_abn_entitled_fool = {
        name = "Entitled Fool",
        text = {
          "This Joker gains {X:chips,C:white}X#1#{} Chips",
          "or {X:mult,C:white}X#2#{} Mult every time you",
          "score the exact same number",
          "of {C:chips}odd{} or {C:mult}even{} {C:attention}Tile{} cards,",
          "respectively, more than once",
          "during a round",
          "{C:inactive}(Currently {X:chips,C:white}X#3#{C:inactive} Chips, {X:mult,C:white}X#4#{C:inactive} Mult)"
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

      j_abn_entropic_hearts = {
        name = "Entropic Hearts",
        text = {
          "Destroy all {C:hearts}Hearts{} scored,",
          "this Joker gains their {C:chips}Chips{}",
          "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips)",
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

      j_abn_envy = {
        name = "Envy",
        text = {
          {
            "All eligible {C:attention}Jokers{} become",
            "{C:abn_eternal}Eternal{} upon purchase"
          },
          {
            "{X:mult,C:white}X#1#{} Mult on {C:attention}second hand{}",
            "of round, increases by {X:mult,C:white}X#2#{}",
            "every time you don't play your",
            "{C:attention}highest level poker hand{}",
          },
        },
      },

      j_abn_epic_joker = {
        name = "Epic Joker",
        text = {
          "This Joker gains {X:mult,C:white}X#2#{} Mult per",
          "{C:attention}numbered{} card above {C:attention}10{}",
          "played in a {C:attention}Flush{}",
          "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult)",
        },
      },


      j_abn_equationerror = {
        name = "Equation Error",
        text = {
          {
            "Each scored card has a {C:green}#3# in #4#{} chance to",
            "add {C:chips}+#5#{} Chip and {C:mult}+#6#{} Mult to this Joker",
            "{C:inactive}(Currently {C:chips}+#1# {C:inactive}Chips, {C:mult}+#2# {C:inactive}Mult)",
          },
          {
            "When a hand is played, {C:green}#3# in #4#{}",
            "chance to {C:attention}double{} this Joker's {C:chips}Chips",
            "{C:attention,s:0.8}High Card{C:inactive,s:0.8} Excluded"
          },
          {
            "Double this Joker's {C:chips}Chips{} and {C:mult}Mult{}",
            "when a {C:attention}Joker{} is {C:red}destroyed{}",
          },
        },
      },


      j_abn_erratic_joker = {
        name = "Erratic Joker",
        text = {
          "{C:attention}Before scoring{}, each played",
          "card changes to a {C:attention}random{} suit",
          "and this Joker gains {C:chips}+#1#{} Chips",
          "whenever a card changes suit",
          "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
        }
      },

      j_abn_erwyd = {
        name = "Erwyd",
        text = {
          {
            "This Joker gains",
            "{X:chips,C:white}^#2#{} Chips every time",
            "a {C:tarot}Tarot{} card is used",
            "{C:inactive}(Currently {X:chips,C:white}^#1#{} {C:inactive}Chips)",
          },
          {
            "Each {C:attention}shop{} always contains",
            "a {C:attention}Mega Arcana Pack"
          }
        }
      },

      j_abn_escuderia_joker = {
        name = "Escuderia Joker",
        text = {
          "Gives {C:mult}+#1#{} Mult",
          "for each {C:attention}unique sticker{}",
          "among your {C:attention}Jokers{}",
          "{C:inactive}(Currently {C:mult}+#2#{} {C:inactive} Mult)",
        }
      },

      j_abn_eternian_joker = {
        name = "Eternian Joker",
        text = {
          "{C:gold}+#1#{} Asc. Power for each",
          "unique type of {C:attention}consumable{} held",
          "{C:inactive}(Currently {C:gold}+#2#{C:inactive} Ascension Power)",
        }
      },

      j_abn_even_stephen = {
        name = "Even Stephen",
        text = {
          "Played cards with",
          "{C:attention}even{} rank give",
          "{C:mult}+#1#{} Mult when scored",
        },
      },

      j_abn_evenly_steven = {
        name = "Evenly Steven",
        text = {
          "Every played {C:attention}card{}",
          "with an {C:attention}even{} rank",
          "permanently gains",
          "{C:chips}+#1#{} Chips when scored",
        }
      },

      j_abn_example_joker = {
        name = "Example Joker",
        text = {
          "Creates the {C:sigils}Sigil{} card for",
          "final played {C:attention}poker hand{}",
          "of round",
        }
      },

      j_abn_executioner = {
        name = "Executioner",
        text = {
          "Cards {C:attention}held{} in hand",
          "permanently gain",
          "{C:chips}+#1#{} Chips",
          "when a {C:attention}playing card{}",
          "is destroyed",
        }
      },

      j_abn_explorer_joker = {
        name = "Explorer Joker",
        text = {
          {
            "Scoring {C:abn_shield}Shields,{} {C:abn_crown}Crowns{}, {C:abn_coin}Coins{},",
            "{C:diamonds}Diamonds{} and {C:abn_talon}Talons{} gain",
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

      j_abn_eye_exam = {
        name = "Eye Exam",
        text = {
          "Pay {C:money}$#1#{} to unflip all",
          "{C:attention}flipped{} cards in hand",
        }
      },

      j_abn_exciton_event = {
        name = "Exciton Event",
        text = {
          "When a {C:planet}Planet{} card is used,",
          "upgrade level of a random",
          "{C:attention}poker hand{} by {C:attention}#3#{},",
          "{C:green}#1# in #2#{} chance to destroy",
          "{C:attention}75%{} of your {C:attention}full deck"
        }
      },

      j_abn_facial_recognition = {
        name = "Facial Recognition",
        text = {
          {

            "This Joker gains {X:red,C:white}X#1#{} Mult",
            "for each {C:attention}unique rank{}",
            "of scored {C:attention}flipped{} cards",
          },
          {
            "If this {C:attention}Joker{} is {C:attention}flipped{}",
            "gain {C:blue}Chips{} equal to the",
            "{C:blue}Chip{} value of {C:attention}scored",
            "{C:attention}flipped{} cards instead",
            "{C:inactive}(Currently {X:red,C:white}X#2#{C:inactive} Mult {C:blue}+#3#{C:inactive} Chips)",
          },
        }
      },

      j_abn_faded_graffiti = {
        name = "Faded Graffiti",
        text = {
          "When a hand is {C:attention}levelled up{},",
          "also level up {C:attention}Flush{}",
        }
      },

      j_abn_failed_test = {
        name = "Failed Test",
        text = {
          "If played hand is a {C:attention}#1#{},",
          "all scoring cards give",
          "their {C:chips}Chips{} as {C:white,X:mult}XMult{}",
          "{C:inactive,s:0.8}({C:attention,s:0.8}poker hand{s:0.8,C:inactive} changes every hand)"
        }
      },

      j_abn_fairytale_book = {
        name = "Fairytale Book",
        text = {
          "{C:legendary,E:1}Legendary{} Jokers may",
          "appear in the {C:attention}Shop",
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

      j_abn_fanfiction_comedian = {
        name = "Fanfiction Comedian",
        text = {
          {
            "This Joker gains {X:mult,C:white}X#2#{} Mult",
            "per {C:attention}unique{} {C:attention}Suitless{} card Scored",
            "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
          },
          {
            "{C:attention}Suitless{} Cards each gain {C:mult}+#4#{} Mult",
            "and {C:chips}+#3#{} Chips per {C:attention}unique{}",
            "{C:attention}Suitless{} card scored",
          },
          {
            "{C:attention}Retrigger{} each {C:attention}Suitless{} card once",
            "for each {C:attention}unique{} {C:attention}Suitless{} card scored",
          },
        }
      },

      j_abn_faruk_jester = {
        name = "Faruk Jester",
        text = {
          {
            "Scored {C:spades}Spades{} give {X:chips,C:white}X#1#{} Chips,",
            "increases by {X:chips,C:white}X#2#{} Chips",
            "when a {C:spades}Spade{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "{C:spades}Spades{} permanently gain",
            "{C:mult}+#3#{} Mult per card {C:attention}held{} in hand"
          }
        }
      },

      j_abn_fatal_silhouette = {
        name = "Fatal Silhouette",
        text = {
          "First played {C:diamonds}Light Suit{}",
          "with a {C:abn_silver_seal}Silver Seal{} gives",
          "{C:white,X:chips}X#1#{} Chips when scored",
        }
      },

      j_abn_feline_joker = {
        name = "Feline Joker",
        text = {
          "Randomly gives {C:chips}+#2#{} Chips,",
          "{C:white,X:mult}X#1#{} Mult, or {C:money}$#3#{}"
        }
      },

      j_abn_felix_joker = {
        name = 'Felix Joker',
        text = {
          "When {C:attention}Blind{} is defeated,",
          "turn held {C:attention}consumables{}",
          "into {C:spectral}Spectral{} cards",
        }
      },

      j_abn_feste = {
        name = "Fester",
        text = {
          "Create a {C:dark_edition}Negative{}",
          "{C:nightshift_cards}Nightshift{} card when",
          "{C:attention}Blind{} is selected",
        }
      },

      j_abn_feste2 = {
        name = "Feste the Fool",
        text = {
          "Played {C:attention}Wild{} cards give",
          "{X:mult,C:white}^#1#{} Mult or {X:chips,C:white}^#2#{} Chips",
          "when scored"
        }
      },

      j_abn_figurehead = {
        name = "Figurehead",
        text = {
          "Retrigger all",
          "{C:legendary,E:1}Legendary{} Jokers"
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

      j_abn_finalmix = {
        name = "Final Mix",
        text = {
          "This Joker gains {C:white,X:mult}X#2#{} Mult",
          "per unique {C:attention}Card Modifier{}",
          "on scoring {C:hearts}Hearts{}",
          "{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult)"
        }
      },

      j_abn_fit_to_shape = {
        name = "Fit To Shape",
        text = {
          "{C:attention}4 card{} hands give",
          "{X:chips,C:white}^#1#{} Chips and {X:mult,C:white}^#2#{} Mult",
        }
      },

      j_abn_flawed_imitation = {
        name = "Flawed Imitation",
        text = {
          {
            "{C:attention}Jokers{} may appear multiple times",
          },
          {
            "{C:attention}Jokers{} each give {X:mult,C:white}X#1#{} Mult",
            "per copy of that Joker",
          },
        }
      },

      j_abn_flotsam_joker = {
        name = "Flotsam Joker",
        text = {
          "If played hand contains a {C:attention}Flush{},",
          "cards {C:attention}held in hand{} with the",
          "same {C:attention}suit{} count in scoring"
        }
      },

      j_abn_for_sale_joker = {
        name = "For Sale",
        text = {
          "When a hand is played,",
          "gain {C:chips}Chips{} equal to",
          "the total {C:attention}sell value{}",
          "of all current {C:attention}Jokers",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
        }
      },

      j_abn_force_encounter = {
        name = "Forced Encounter",
        text = {
          {
            "Gives {C:chips}+#1#{} Chips when",
            "a {C:mult}+Mult{} effect from",
            "another {C:attention}Joker{} scores"
          },
          {
            "Chips increases by {C:chips}+#2#{}",
            "when {C:attention}Blind{} is defeated"
          }
        }
      },

      j_abn_foreign_advert = {
        name = "Foreign Advertisement",
        text = {
          "When a hand is played, this",
          "Joker gains {C:white,X:mult}X#2#{} Mult per",
          "{C:inactive}Vanilla{} {C:attention}enhancement{}, {C:white,X:chips}X#4#{}",
          "Chips per {C:dark_edition}Modded{} {C:attention}enhancement{}",
          "in scoring hand",
          "{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult, {C:white,X:chips}X#3#{C:inactive} Chips)"
        }
      },

      j_abn_foreign_id = {
        name = "Foreign ID",
        text = {
          "This Joker gains the {C:attention}rank{}",
          "of scoring cards with",
          "{C:dark_edition}Modded{} suits as {C:mult}Mult{}",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
        }
      },

      j_abn_foreign_license = {
        name = "Foreign License",
        text = {
          "{X:chips,C:white}X#1#{} Chips if you have",
          "at least {C:attention}#2#{} Enhanced",
          "cards in your full deck",
          "{C:inactive}(Currently {C:attention}#3#{C:inactive})",
        },
      },

      j_abn_foreign_thunk = {
        name = "ForeignThunk",
        text = {
          {
            "If the {C:attention}first scored{} card has",
            "a {C:inactive}Vanilla {C:enhanced}Enhancement{},",
            "apply its equivalent {C:enhanced}Sticker",
            "to the {C:attention}rightmost{} Joker"
          },
          {
            "If a {C:attention}Joker{}'s {C:enhanced}Sticker{} matches",
            "a scored card's {C:enhanced}Vanilla Enhancement{},",
            "{C:attention}it{} gains {C:purple}+#1#{} Score"
          }
        }
      },

      j_abn_forgemaster_joker = {
        name = "Forgemaster Joker",
        text = {
          {
            "Played and {C:attention}unscoring{} cards",
            "turn into {C:attention}Hot Iron{} cards",
          },
          {
            "Every played {C:attention}Hot Iron{}",
            "card counts in scoring"
          },
        }
      },

      j_abn_forgotten_joker = {
        name = "Forgotten Joker",
        text = {
          {
            "{C:attention}Ante{} scaling is {C:attention}twice{} as fast",
          },
          {
            "When upgrading a {C:inactive}Vanilla{} hand, create",
            "a random {C:dark_edition}Negative{} {C:inactive}Vanilla{} consumable",
            "When upgrading a {C:dark_edition}Modded{} hand, create",
            "a random {C:dark_edition}Negative{} {C:dark_edition}Modded{} consumable",
          },
          {
            "When a level {C:attention}2+{} {C:inactive}Vanilla{} hand is played,",
            "{C:mult}level down{} and gain {C:attention}triple{} the {C:chips}Chips{} lost,",
            "When a level {C:attention}2+{} {C:dark_edition}Modded{} hand is played,",
            "{C:mult}level down{} and gain {C:attention}triple{} the {C:mult}Mult{} lost,",
            "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips,{} {C:mult}+#2#{} {C:inactive}Mult){}",
          },
        }
      },

      j_abn_fortlatro = {
        name = "Fortlatro",
        text = {
          {
            "{C:inactive}Vanilla{} consumables and",
            "Jokers {C:attention}do not{} appear"
          },
          {
            "When a {C:chips}Small Blind{} is selected create",
            "a random {C:dark_edition}Modded{} consumable",
            "When a {C:attention}Big Blind{} is selected create",
            "a random {C:dark_edition}Modded{} Joker"
          },
          {
            "Gain {X:chips,C:white}X#2#{} Chips per {C:attention}unique",
            "{C:dark_edition}Modded{} Consumable used this Run",
            "Gain {X:mult,C:white}X#4#{} Mult per {C:attention}unique",
            "{C:dark_edition}Modded{} Joker obtained this Run",
            "{C:inactive}(Currently{} {X:chips,C:white}X#1#{} {C:inactive}Chips{} {X:mult,C:white}X#3#{} {C:inactive}Mult)",
          }
        }
      },


      j_abn_fortune_joker = {
        name = "Fortune Joker",
        text = {
          {
            "Level up {C:planet}planet{} {C:attention}rank{}",
            "of all {C:attention}Lucky{} cards scored",
          },
          {
            "Retrigger scoring {C:attention}Lucky{} cards",
            "when they {C:green}successfully{} trigger",
          }
        }
      },

      j_abn_fractured_identity_joker = {
        name = "Fractured Identity Joker",
        text = {
          "Scoring {C:attention}Mult{} or {C:attention}Gold{} cards",
          "give {X:chips,C:white}^#1#{} Chips, scoring",
          "{C:attention}Glass{} or {C:attention}Stone{} cards",
          "give {X:mult,C:white}^#2#{} Mult",
        }
      },

      j_abn_fraser_jester = {
        name = "Fraser Jester",
        text = {
          "{C:attention}+#1#{} hand size",
        },
      },

      j_abn_fraud_soul = { -- to relocalise
        name = "Fraud Soul",
        text = {
          "When {C:attention}Blind{} is selected,",
          "Held {C:tarot}Tarots{} give the {C:attention}rightmost{} Joker {C:chips}+#1#{} Chips",
          "Held {C:planet}Planets{} give the {C:attention}rightmost{} Joker {C:mult}+#2#{} Mult",
          "Held {C:spectral}Spectrals{} give the {C:attention}rightmost{} Joker {X:mult,C:white}+X#3#{} Mult",
          "Held {C:sigils}Sigils{} give the {C:attention}rightmost{} Joker {X:chips,C:white}+X#4#{} Chips",
          "Held {C:astro_cards}Astros{} give the {C:attention}rightmost{} Joker {C:money}$#5#{}",
          "Held {C:abn_calamity}Calamitys{} double all values on this Joker",
          "Held {C:nightshift_cards}Nightshifts{} give a {C:attention}random{} card in hand {C:attention}+#6#{} Retriggers",
        }
      },

      j_abn_fraudulent_mod_joker = {
        name = "Fraudulent Mod Joker",
        text = {
          {
            "This Joker gains {C:mult}+#1#{} Mult per",
            "scoring {C:abn_tie}Tie{} or {C:abn_bow}Bow{} {C:attention}Sew{} card",
          },
          {
            "This Joker gains {C:chips}+#2#{} Chips per",
            "scoring {C:abn_tie}Tie{} or {C:abn_bow}Bow{} {C:attention}Cotton{} card",
            "{C:inactive}(Currently{} {C:mult}+#3#{} {C:inactive}Mult,{} {C:chips}+#4#{} {C:inactive}Chips){}"
          }
        }
      },

      j_abn_freddy_jester = {
        name = "Freddy Jester",
        text = {
          {
            "Scored {C:abn_penumbra}Penumbras{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:abn_penumbra}Penumbra{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "played {C:abn_penumbra}Penumbras{} permanently",
            "gain {C:chips}+#3#{} Chips when scored"
          }
        }
      },

      j_abn_frenemy_joker = { -- to relocalise
        name = "Frenemy Joker",
        text = {
          {
            "Scoring {C:attention}Even{} cards give",
            "{X:mult,C:white}X#1#{} Mult per {C:common}Common{} Joker",
            "{X:mult,C:white}X#2#{} Mult per {C:uncommon}Uncommon{} Joker",
            "{X:mult,C:white}X#3#{} Mult per {C:rare}Rare{} Joker",
            "{X:mult,C:white}X#4#{} Mult per {C:abn_superrare}Super Rare{} Joker",
            "{X:mult,C:white}X#5#{} Mult per {C:legendary}Legendary{} Joker",
            "{X:mult,C:white}X#6#{} Mult per {C:abn_parallelrare}Parallel Rare{} Joker",
          },
          {
            "Scoring {C:attention}Odd{} cards give",
            "{X:chips,C:white}X#7#{} Chips per {C:common}Common{} Joker",
            "{X:chips,C:white}X#8#{} Chips per {C:uncommon}Uncommon{} Joker",
            "{X:chips,C:white}X#9#{} Chips per {C:rare}Rare{} Joker",
            "{X:chips,C:white}X#10#{} Chips per {C:abn_superrare}Super Rare{} Joker",
            "{X:chips,C:white}X#11#{} Chips per {C:legendary}Legendary{} Joker",
            "{X:chips,C:white}X#12#{} Chips per {C:abn_parallelrare}Parallel Rare{} Joker",
          },
          {
            "If you own {C:attention}6{} different {C:attention}rarities{} of Jokers",
            "reduce all {C:attention}blind requirements{} by {C:attention}98%{}",
          }
        }
      },

      j_abn_friend_jimbo = {
        name = "Friend Jimbo",
        text = {
          {
            "When a {C:spades}Dark suit{} is {C:mult}destroyed{},",
            "create a {C:attention}Stone{} card",
          },
          {
            "If destroyed card was {C:abn_black_seal}Darkner{},",
            "gain {C:chips}Chips{} equal to its {C:attention}rank",
            "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips){}",
          }
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

      j_abn_from_pixel_to_dust = {
        name = "From Pixel to Dust",
        text = {
          "Played {C:attention}unscored{} cards each",
          "give {C:attention}double{} their {C:attention}rank{} as {C:mult}Mult{}",
          "then {C:mult}self-destruct{}",
        }
      },

      j_abn_front_to_cover = {
        name = "Front to Cover",
        text = {
          {
            "Unscored {C:attention}flipped{} cards",
            "return to the deck",
          },
          {
            "When {C:attention}flipped{} cards score,",
            "gain {C:blue}Chips{} equal to its rank"
          }
        },
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

      j_abn_full_jester = {
        name = "Full Jester",
        text = {
          {
            "If played hand is composed of",
            "{C:attention}6{} or more suits, this Joker gains",
            "{C:white,X:mult}X#2#{} Mult per scoring suit"
          },
          {
            "If played hand is composed of {C:attention}5{} suits",
            "and a {C:attention}rankless{} card, this Joker",
            "gains {C:white,X:chips}X#4#{} Chips per scoring suit",
            "{C:inactive}(Currently {C:white,X:chips}X#3#{C:inactive} Chips, {C:white,X:mult}X#1#{C:inactive} Mult)"
          }
        }
      },

      j_abn_funambulist = {
        name = "Funambulist",
        text = {
          "{C:mult}+#1#{} Mult per {C:attention}Joker{} to the {C:attention}left{}",
          "{C:chips}+#2#{} Chips per {C:attention}Joker{} to the {C:attention}right{}",
          "{C:inactive}(Currently {C:mult}+#3#{C:inactive}, {C:chips}+#4#{C:inactive})"
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

      j_abn_gambit = {
        name = "Gambit",
        text = {
          {
            "Swaps current {C:chips}Chips{} with",
            "current {C:attention}Score{} and",
            "multiplies both by {X:black,C:white}X#1#"
          },
          {
            "Each scoring card has a",
            "{C:green}#2# in #3#{} chance to be destroyed"
          },
          {
            "Each destroyed card will",
            "increase this joker's multiplier",
            "by {X:black,C:white}#4#X{} and draw a copy",
            "of the destroyed card to hand"
          }
        }
      },

      j_abn_garth = {
        name = "Garth",
        text = {
          {
            "Scored {C:abn_arrow}Arrows{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:abn_arrow}Arrow{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "played {C:abn_arrow}Arrows{} permanently",
            "gain {C:purple}+#3#{} Score when scored"
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

      j_abn_gagman_joker = {
        name = "Gagman Joker",
        text = {
          "{C:attention}Polkadot Cards{} retain",
          "their {C:attention}rank{} and {C:attention}suit{}",
        },
      },

      j_abn_galactic_consciousness = {
        name = "Galactic Consciousness",
        text = {
          {
            "{C:dark_edition}Editioned{} Jokers and cards give",
            "different {C:attention}effects{} when triggered:"
          },
          {
            "{C:dark_edition}Gloss{} cards give {C:mult}+#1#{} Mult,",
            "{C:dark_edition}Pearlescent{} cards give {X:chips,C:white}X#2#{} Chips,",
            "{C:dark_edition}Iridescent{} cards give {X:mult,C:white}X#3#{} Mult,",
            "{C:dark_edition}Chromatic{} cards give {X:chips,C:white}^#4#{} Chips",
          },
        },
      },

      j_abn_galactic_night = {
        name = "Galactic Night",
        text = {
          "Gives {X:mult,C:white}XMult{} equal to",
          "played {C:attention}poker hand{} level"
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

      j_abn_garden_gnome = {
        name = "Garden Gnome",
        text = {
          "{C:attention}Scored{} {C:spades}Spades{} and {C:clubs}Clubs",
          "have a {C:green}#1# in #2#{} chance",
          "to become {C:dark_edition}Negative",
        }
      },

      j_abn_geiger_joker = {
        name = "Geiger Joker",
        text = {
          "Each scored {C:attention}numbered{} {C:attention}Hazard{} card",
          "gives {C:gold}+#1#{} Ascension Power for each time",
          "its {C:attention}rank{} has scored this hand",
        }
      },

      j_abn_genetically_modified_food = {
        name = "Genetically Modified Food",
        text = {
          "When a Joker is {C:attention}purchased{} or {C:attention}sold{},",
          "this Joker gains {C:chips}Chips{} equal to the",
          "{C:money}price{} of {C:dark_edition}Modded{} {C:attention}Food Jokers{}, {C:mult}Mult{}",
          "equal to the {C:money}price{} of {C:inactive}Vanilla{} {C:attention}Jokers",
          "{C:inactive}(Currently {C:chips}+#1# {C:inactive}Chips, {C:mult}+#2# {C:inactive}Mult)",
        },
      },

      j_abn_genocide_route = {
        name = "Genocide Route",
        text = {
          {
            "{C:mult}Destroy{} all Jokers on purchase,",
            "gains {X:mult,C:white}X#3#{} Mult and {X:chips,C:white}X#4#{} Chips",
            "per {C:mult}destroyed{} Joker",
            "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult,{} {X:chips,C:white}X#2#{} {C:inactive}Chips){}",
          },
          {
            "{C:attention}Restart{} this process when a",
            "{C:abn_superrare}Super Rare{} {C:attention}Joker{} is obtained",
          },
          {
            "When {C:attention}Blind{} is selected, create a",
            "random {C:dark_edition}#6#{} {V:1}#5#{} Joker",
          },
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

      j_abn_getter_robo = {
        name = "Getter Robo!",
        text = {
          {
            "{X:mult,C:white}X#1#{} Mult, {X:chips,C:white}X#2#{} Chips,",
            "{X:attention,C:white}X#3#{} {C:attention}Boss Blind{} requirements",
          },
          {
            "When {C:attention}Boss Blind{} is defeated,",
            "{C:attention}Double{} these values",
          }
        },
      },

      j_abn_ghost_in_the_machine = {
        name = "Ghost In The Machine",
        text = {
          "Create a random {C:dark_edition}Negative{}",
          "{C:spectral}Spectral{} card every time",
          "a {C:solid_state}Solid State{} card is used",
        },
      },

      j_abn_giacomo_king = {
        name = "Giacomo King of Jesters",
        text = {
          "Played {C:attention}11s{}, {C:attention}12s{}, {C:attention}13s{}",
          "and {C:attention}14s{} of {C:diamonds}Diamonds{} and {C:clubs}Clubs{} ",
          "give {C:white,X:mult}^#1#{} Mult when scored",
          "{s:0.8}Flip this Joker when triggered{}"
        }
      },
      j_abn_giacomo_hidden = {
        name = "Giacomo Hidden Scoundral",
        text = {
          "Played {C:attention}11s{}, {C:attention}12s{}, {C:attention}13s{}",
          "and {C:attention}14s{} of {C:hearts}Hearts{} and {C:spades}Spades{} ",
          "give {C:white,X:mult}^#1#{} Mult when scored",
          "{s:0.8}Flip this Joker when triggered{}"
        }
      },

      j_abn_gimbo = {
        name = "Gimbo",
        text = {
          "This Joker gains {C:mult}+#2#{} Mult",
          "when a {C:attention}2{}, {C:attention}3{},",
          "{C:attention}5{} or {C:attention}7{} is scored",
          "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult)"
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

      j_abn_glass_bonus = {
        name = "Glass Bonus",
        text = {
          {
            "If played hand contains both a {C:attention}Glass{}",
            "and {C:attention}Bonus{} card, they each gain",
            "{C:gold}+#1#{} Asc. Power and {C:purple}+#2#{} Score",
          },
          {
            "{C:enhanced}Glass{} {C:attention}Jokers{} gain {X:mult,C:white}X#3#{} Mult, {C:enhanced}Bonus{}",
            "{C:attention}Jokers{} gain {X:chips,C:white}X#4#{} Chips when triggered"
          },
          {
            "When {C:attention}Big Blind{} is selected, create",
            "the last {C:crepuscular}Crepuscular{} card used this run",
            "{C:inactive}(Currently{} {C:crepuscular}#5#{C:inactive})"
          }
        }
      },

      j_abn_glass_gold = {
        name = "Glass Gold",
        text = {
          {
            "If played hand contains both a {C:attention}Glass{}",
            "and {C:attention}Gold{} card, they each gain",
            "{C:gold}+#1#{} Asc. Power and {C:purple}+#2#{} Score",
          },
          {
            "{C:enhanced}Glass{} {C:attention}Jokers{} gain {X:mult,C:white}X#3#{} Mult, {C:enhanced}Gold{}",
            "{C:attention}Jokers{} gain {X:chips,C:white}X#4#{} Chips when triggered"
          },
          {
            "When {C:attention}Big Blind{} is selected, create",
            "the last {C:weather_report}Weather Report{} used this run",
            "{C:inactive}Currently:{} {C:weather_report}#5#{}"
          }
        }
      },

      j_abn_glass_stone = {
        name = "Glass Stone",
        text = {
          {
            "If played hand contains both a {C:attention}Stone{}",
            "and {C:attention}Glass{} card, they each gain",
            "{C:gold}+#1#{} Asc. Power and {C:purple}+#2#{} Score",
          },
          {
            "{C:enhanced}Stone{} {C:attention}Jokers{} gain {X:mult,C:white}X#3#{} Mult, {C:enhanced}Glass{}",
            "{C:attention}Jokers{} gain {X:chips,C:white}X#4#{} Chips when triggered"
          },
          {
            "When {C:attention}Big Blind{} is selected, create",
            "the last {C:calligraphy}Calligraphy{} card used this run",
            "{C:inactive}Currently:{} {C:calligraphy}#5#{}"
          }
        }
      },

      j_abn_globalist_joker = {
        name = "Globalist Joker",
        text = {
          {
            "When a {C:continent}Continent{} card is used,",
            "create a {C:attention}random{} {C:dark_edition}Negative{} consumable",
          },
          {
            "After using {C:attention}#4#{} {C:inactive}[#1#]{} {C:continent}Continent{} cards,",
            "add a {C:attention}Stamp{} to every scoring",
            "card in next played {C:attention}Spectrum{}",
          },
          {
            "This Joker gains {X:mult,C:white}X#2#{} Mult for every",
            "{C:attention}unique{} {C:continent}Continent{} card used this run",
            "{C:inactive}(Currently {X:mult,C:white}X#3#{} {C:inactive}Mult){}",
          }
        }
      },

      j_abn_glossy_joker = {
        name = "Glossy Joker",
        text = {
          {
            "{X:mult,C:white}X#1#{} Mult when",
            "{C:dark_edition}Gloss{} edition scores",
          },
          {
            "If this Joker has {C:dark_edition}Gloss{} edition,",
            "gains {C:mult}+#3#{} Mult when a",
            "{C:dark_edition}Gloss{} card is scored",
            "{C:inactive}(Currently {C:mult}+#2#{} {C:inactive}Mult){}",
          }
        }
      },

      j_abn_gluttony = {
        name = "Gluttony",
        text = {
          {
            "All eligible {C:attention}Jokers{} become",
            "{C:abn_eternal}Eternal{} upon purchase"
          },
          {

            "{X:mult,C:white}X#1#{} Mult on {C:attention}first hand{} of round,",
            "then destroy all held {C:attention}consumables{},",
            "increases by {X:mult,C:white}X#2#{} Mult for",
            "each unique {C:attention}consumable{} destroyed",
          },
        },
      },

      j_abn_gold_7 = {
        name = "Gold 7",
        text = {
          {
            "Played {C:attention}7s{} become",
            "{C:attention}Gold{} cards when scored",
          },
          {
            "Played {C:attention}Gold{} cards{}",
            "give {C:attention}double{} their ranks",
            "as {C:mult}Mult{} when scored",
          },
        },
      },

      j_abn_gold_lucky = {
        name = "Gold Lucky",
        text = {
          {
            "If played hand contains both a {C:attention}Gold{}",
            "and {C:attention}Lucky{} card, they each gain",
            "{C:gold}+#1#{} Asc. Power and {C:purple}+#2#{} Score",
          },
          {
            "{C:enhanced}Gold{} {C:attention}Jokers{} gain {X:mult,C:white}X#3#{} Mult, {C:enhanced}Lucky{}",
            "{C:attention}Jokers{} gain {X:chips,C:white}X#4#{} Chips when triggered"
          },
          {
            "When {C:attention}Big Blind{} is selected, create",
            "the last {C:continent}Continent{} card used this run",
            "{C:inactive}Currently:{} {C:continent}#5#{}"
          }
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

      j_abn_golden_apple = {
        name = "Golden Apple",
        text = {
          {
            "When {C:attention}Blind{} is selected,",
            "remove all {C:abn_perishable}Perishable{} stickers",
          },
          {
            "{C:abn_eternal}Eternal{} Jokers can be sold"
          }
        }
      },

      j_abn_gone_on_vacation = {
        name = "Gone On Vacation",
        text = {
          "Played cards permanently gain",
          "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
          "per {C:attention}empty{} Joker Slot",
          "when scored",
        }
      },

      j_abn_goody_two_shoes = {
        name = "Goody Two Shoes",
        text = {
          {
            "When {C:attention}Blind{} is selected,",
            "{C:attention}lose all discards{} and",
            "gain amount lost as {C:blue}Hands{}",
          },
          {
            "{C:red}Debuffed{} cards each",
            "give {C:money}$#1#{} when played",
          }
        },
      },

      j_abn_goth_gabe = {
        name = "Goth Gabe",
        text = {
          "This Joker gains {X:red,C:white}X#2#{} Mult if",
          "played hand contains only {C:spades}Dark Suits{}",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
        }
      },

      j_abn_grampa_joker = {
        name = "Grampa Joker",
        text = {
          "Add {C:dark_edition}Vintage{} edition",
          "to first scoring card",
          "on {C:attention}last hand{} of round",
        }
      },

      j_abn_grapheme_joker = {
        name = "Grapheme Joker",
        text = {
          {
            "Add {C:dark_edition}Negative{} edition to",
            "{C:attention}first{} scoring {C:diamonds}Light Suit{}",
          },
          {
            "This Joker gains {C:chips}+#6#{} Chips and {C:mult}+#5#{} Mult",
            " per {C:dark_edition}Negative{} {C:diamonds}Light Suit{} scored",
          },
          {
            "If this Joker has {C:dark_edition}Negative{} edition,",
            "gain {X:mult,C:white}X#4#{} Mult per played {C:dark_edition}Negative{} card",
            "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult,{} {C:mult}+#2#{} {C:inactive}Mult,{} {C:chips}+#3#{} {C:inactive}Chips){}",
          }
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

      j_abn_greygoo_joker = {
        name = "Grey Goo Joker",
        text = {
          "If {C:attention}first hand{} of round",
          "has only {C:abn_suitless}Null{} cards, add",
          "permanent copies to deck",
          "and draw them to {C:attention}hand",
        }
      },

      j_abn_gris_gris_joker = {
        name = 'Gris Gris Joker',
        text = {
          "{C:blue}Blue{} and {C:purple}Purple{} {C:attention}seals{}",
          "can {C:attention}activate{} when played"
        }
      },

      j_abn_gtp_joker = {
        name = "GTP Joker",
        text = {
          "{X:mult,C:white}X#1#{} {C:attention}base{} {C:mult}Mult{} and {X:chips,C:white}X#2#{} {C:attention}base{} {C:chips}Chips{}",
          "for each consecutive hand played in a round",
          "{s:0.8,C:attention}High Card{s:0.8} excluded"
        }
      },
      j_abn_gtp_joker_after = {
        name = "GTP Joker",
        text = {
          "{X:mult,C:white}X#1#{} base hand Mult and {X:chips,C:white}X#2#{} base hand Chips",
          "for each consecutive hand played in a",
          "round, except for {C:attention}High Card",
          "{C:inactive}(Previous hand: {C:attention}#3#{C:inactive})"
        }
      },

      j_abn_hammerspace_joker = { -- to relocalise
        name = "Hammerspace Joker",
        text = {
          "{C:attention}+2{} Consumable Slots",
          "When a {C:attention}Boss Blind{} is defeated,",
          "Gains {X:mult,C:white}X#5#{} Mult if a {C:sigils}Sigil{} Card is {C:attention}held{}",
          "Gains {C:mult}+#6#{} Mult if an {C:astro_cards}Astro{} Card is {C:attention}held{}",
          "Gains {C:chips}+#8#{} Chips if a {C:tarot}Tarot{} Card is {C:attention}held{}",
          "Gains {X:chips,C:white}X#7#{} Chips if a {C:spectral}Spectral{} Card is {C:attention}held{}",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult,{} {C:mult}+#2#{} {C:inactive}Mult,{} {X:chips,C:white}X#3#{} {C:inactive}Chips,{} {C:chips}+#4#{} {C:inactive}Chips){}"
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

      j_abn_handbook_of_a_conman = {
        name = "Handbook Of A Conman",
        text = {
          {
            "Doubles {C:attention}base{} {C:chips}Chips{} and {C:mult}Mult{}",
            "for all {C:attention}poker hands{}",
          },
          {
            "{C:mult}Debuff{} all non-{C:abn_plagued}Plagued{} Jokers",
          },
        }
      },

      j_abn_haphazard_joker = {
        name = "Haphazard Joker",
        text = {
          {
            "Played {C:attention}Enhanced{} {C:attention}even{} cards",
            "give {X:mult,C:white}X#4#{} Mult when scored,",
            "increases by {X:mult,C:white}X#3#{} when",
            "a card is scored"
          },
          {
            "Played {C:attention}Even{} cards have a",
            "{C:green}#1# in #2#{} chance to create",
            "a {C:abn_hazard}Hazard Tag{} when scored",
          },
        }
      },

      j_abn_hard_and_dry = {
        name = "Hard and Dry",
        text = {
          "Blinds are {C:attention}obscured{},",
          "{C:attention}Double{} values of {C:attention}leftmost{} Joker",
          "when {C:attention}Blind{} is defeated",
        }
      },

      j_abn_harlequin_joker = {
        name = "Harlequin Joker",
        text = {
          {
            "If {C:attention}first{} scoring card is {C:attention}even{}",
            "and {C:attention}last{} scoring card is {C:attention}odd{}:"
          },
          {
            "Create a {C:dark_edition}Negative{} {C:sigils}Sigil{} card",
            "if they have matching {C:enhanced}Enhancements",
          },
          {
            "Create a {C:dark_edition}Negative{} {C:solid_state}Solid State{} card",
            "if they have matching {C:dark_edition}Editions",
          },
          {
            "Create a {C:dark_edition}Negative{} {C:lexica}Lexica{} card",
            "if they have matching {C:attention}Seals",
          },
        },
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

      j_abn_hawk = {
        name = "Hawk",
        text = {
          {
            "{C:mult}Destroy{} the first scoring card, if",
            "its {C:attention}even{}, all scoring cards gain {C:mult}+#5#{}",
            "Mult and this Joker gains {X:mult,C:white}X#3#{} Mult,",
            "if its {C:attention}odd{}, cards gain {C:chips}+#6#{} Chips",
            "and this Joker gains {X:chips,C:white}X#4#{} Chips",
            "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult{} {X:chips,C:white}X#2#{} {C:inactive}Chips){}",
          },
          {
            "If {C:attention}winning hand{} has both",
            "{C:attention}odd{} and {C:attention}even{} cards, level up the",
            "{C:planet}planet{} {C:attention}rank{} of all scoring cards",
          },
        }
      },

      j_abn_hazard_cryptid = {
        name = "Hazard Cryptid",
        text = {
          "This Joker gains {C:mult}+#4#{} Mult if",
          "played hand contains a {C:abn_hazard}Hazard{}",
          "card and an {C:attention}unenhanced{} card,",
          "{C:green}#1# in #2#{} chance to {C:mult}destroy{}",
          "all scored cards and this Joker",
          "{C:inactive}(Currently{} {C:mult}+#3#{} {C:inactive}Mult)"
        }
      },

      j_abn_hd_joker = {
        name = "HD Joker",
        text = {
          {
            "{C:common}Common{} Jokers without {C:dark_edition}Editions{}",
            "cannot be {C:red}debuffed{} or {C:red}destroyed{}",
          },
          {
            "{C:uncommon}Uncommon{} and {C:rare}Rare{} Jokers",
            "no longer appear in the {C:green}shop{}"
          }
        }
      },

      j_abn_health_stickers = {
        name = "Health Stickers",
        text = {
          "When {C:attention}Blind{} is defeated,",
          "apply a random {C:green}Beneficial{}",
          "{C:attention}Sticker{} on {C:attention}leftmost{} Joker",
        }
      },

      j_abn_heart_of_glass = {
        name = "Heart of Glass",
        text = {
          {
            "{C:attention}Glass Cards{} give {C:white,X:chips}X#1#{} Chips",
            "when scored, and always {C:attention}shatter",
          },
          {
            "This Joker gains {C:chips}+#2#{} Chips for",
            "every {C:hearts}Heart{} {C:attention}Glass Card{} destroyed",
            "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)"
          }
        }
      },

      j_abn_hieroglyph = {
        name = "Hieroglyph",
        text = {
          "{C:attention}Unscored{} cards become",
          "{C:attention}Fossil Cards{} when played"
        }
      },

      j_abn_hipster = {
        name = "Hipster",
        text = {
          "Scored {C:attention}cards{} with",
          "a {C:dark_edition}Modded{} {C:attention}rank{}",
          "permanently gains",
          "{C:mult}+#1#{} Mult"
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
            "When a {C:attention}non-negative{} {C:weather_report}Weather Report{}",
            "is destroyed, create a {C:dark_edition}Negative{} copy of it"
          }
        }
      },

      j_abn_hot_mult_in_your_area = {
        name = "Hot Mult In Your Area",
        text = {
          {
            "Held {C:dark_edition}Modded{} consumables",
            "each give {X:mult,C:white}X#1#{} Mult",
          },
          {
            "When a hand is played,",
            "{C:green}#2# in #3#{} chance to {C:red}destroy{}",
            "held {C:dark_edition}Modded{} consumables",
          }
        }
      },

      j_abn_housing_crisis = {
        name = "Housing Crisis",
        text = {
          {
            "If {C:attention}first{} played hand is a {C:attention}#1#{}",
            "composed of {C:attention}2 even{} and {C:attention}3 odd{} cards,",
            "earn {C:gold}$#2#{} and gain {C:red}+#3#{} Mult and {C:blue}+#4#{} Chips",
          },
          {
            "If {C:attention}second{} played hand is a {C:attention}#1#{}",
            "composed of {C:attention}2 odd{} and {C:attention}3 even{} cards,",
            "earn {C:gold}$#5#{} and gain {C:red}+#6#{} Mult and {C:blue}+#7#{} Chips",
          },
          {
            "If {C:attention}third{} played hand is a {C:attention}#1#{}",
            "composed of {C:attention}2{} {C:diamonds}Light Suits{} and {C:attention}3{} {C:spades}Dark Suits{},",
            "{C:planet}level up{} the {C:attention}poker hand{}",
          },
          {
            "{C:inactive}(Currently {C:red}+#8#{C:inactive} Mult, {C:blue}+#9#{C:inactive} Chips)",
          },
        },
      },

      j_abn_hunter_license = {
        name = "Hunter License",
        text = {
          "Earn {C:money}$#1#{} on purchase",
          "{C:mult}self-destructs{} if money reaches {C:money}$0{}",
        }
      },

      j_abn_hustler_joker = {
        name = "Hustler Joker",
        text = {
          "{C:money}+$#1#{}, {C:chips}+#3#{} Chips, and",
          "{C:mult}+#2#{} Mult if played hand",
          "contains {C:abn_bow}Bows{} and {C:abn_tie}Ties{}",
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

      j_abn_ichor = {
        name = "Ichor Joker",
        text = {
          "{C:dark_edition}#2#{} Jokers",
          "give {C:white,X:mult}X#1#{} Mult"
        }
      },

      j_abn_id_staff = {
        name = "ID Staff",
        text = {
          "When a {C:attention}face{} card is {C:mult}destroyed{},",
          "Enhance {C:attention}leftmost{} card in hand",
          "into a {C:attention}Hazard{} card"
        }
      },

      j_abn_identigram_joker = {
        name = "Identigram Joker",
        text = {
          {
            "Gains {X:red,C:white}X#1#{} Mult per scored",
            "{C:attention}odd{} card with different {C:dark_edition}editions{}",
          },
          {
            "Gains {X:chips,C:white}X#2#{} Chips per scored",
            "{C:attention}even{} card with {C:attention}different{} {C:dark_edition}editions{}",
            "{C:inactive}(Currently {X:red,C:white}X#3#{C:inactive} Mult, {X:blue,C:white}X#4#{C:inactive} Chips)",
          }
        },
      },

      j_abn_ill_gotten_gains = {
        name = "Ill-gotten Gains",
        text = {
          "Scoring {C:abn_tie}Ties{} give {C:money}$#1#{},",
          "gives {C:money}$#2#{} its {C:attention}Enhanced{}",
        }
      },

      j_abn_illegal_ante = {
        name = "Illegal Ante",
        text = {
          {
            "During {C:attention}Even{} Antes,",
            "{C:attention}double{} all {C:green,E:1}probabilities",
          },
          {
            "During {C:attention}Odd{} Antes,",
            "{C:attention}double{} all {C:money}money{} earned",
          }
        }
      },

      j_abn_immolation_joker = {
        name = "Immolation Joker",
        text = {
          "{C:attention}Oilfire{} cards are not",
          "{C:mult}destroyed{} when triggered",
        }
      },

      j_abn_improved_joker = {
        name = "Improved Joker",
        text = {
          {
            "{X:mult,C:white}X#1#{} Mult {C:attention}before{} scoring",
            "if {C:attention}scoring hand{} contains",
            "exactly {C:attention}5{} cards"
          },
          {
            "If {C:attention}Joker{} is owned,",
            "scored cards give",
            "{C:gold}+#2#{} Asc. Power",
          }
        }
      },

      j_abn_inescapable_encounter = {
        name = "Inescapable Encounter",
        text = {
          {
            "Scored cards gain {C:chips}Chips{}",
            "equal to their {C:attention}ranks{}",
          },
          {
            "{C:mult}Skips{} are disabled",
          },
        }
      },

      j_abn_inferno_comedian = {
        name = "Inferno Comedian",
        text = {
          {
            "Scoring cards give {C:white,X:mult}X#1#{} Mult",
          },
          {
            "If score {C:attention}catches on fire{},",
            "add {C:dark_edition}Sunscourge{} edition to a random",
            "Joker and {C:attention}enhance{} all cards in hand",
            "into {C:dark_edition}Sunscourge{} {C:attention}Oilfire{} cards",
          },
          {
            "{C:attention}Oilfire{} cards give {C:white,X:mult}X#1#{} Mult,",
            "{C:attention}Oilfire{} cards retain their {C:attention}ranks{},",
            "this Joker gains their {C:attention}ranks{} as",
            "{C:mult}Mult{} when they are {C:mult}destroyed{}",
            "{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult)",
          }
        }
      },

      j_abn_ink_depleted_joker = {
        name = "Ink Depleted Joker",
        text = {
          "If {C:attention}first hand{} of round is a {C:attention}Full House{},",
          "add {C:dark_edition}Foil{} and {C:abn_orange_seal}Orange Seal{}",
          "to scoring {C:diamonds}Light Suits{},",
          "add {C:dark_edition}Foil{} and {C:abn_pink_seal}Pink Seal",
          "to scoring {C:spades}Dark Suits{}",
        },
      },

      j_abn_inkblot_test = { -- potentially rework?
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

      j_abn_insomniac_joker = {
        name = "Insomniac Joker",
        text = {
          "This Joker gains",
          "{C:chips}+#2#{} Chips every time",
          "a {C:planet}Planet{} card is used",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
        }
      },

      j_abn_intergalactic_joker = {
        name = "Intergalactic Joker",
        text = {
          "Upgrade {C:attention}every{} poker hand",
          "in played hand's Asc. Power",
          "by {C:gold}+#1#{} when holding their",
          "{C:attention}respective{} {C:planet}Planet{} card"
        },
      },

      j_abn_interminable_joker = {
        name = "Interminable Joker",
        text = {
          "If you have {C:attention}6{} or more {C:attention}Jokers{},",
          "each one gives {X:mult,C:white}X#1#{} Mult",
        }
      },

      j_abn_inventory_joker = {
        name = "Inventory Joker",
        text = {
          "When {C:attention}Blind{} is selected,",
          "gain {C:chips}+#2#{} Chips for",
          "each consumable {C:attention}held{}",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
        },
      },

      j_abn_invisible_ink_joker = {
        name = "Invisible Ink Joker",
        text = {
          "If played hand contains a {C:attention}Spectrum{}",
          "with only {C:attention}Lucky{} cards",
          "This Joker gains {C:mult}+#3#{} Mult per unique {C:attention}suit{}",
          "and {X:chips,C:white}X#4#{} Chips per card scored",
          "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult,{} {X:chips,C:white}X#2#{} {C:inactive}Chips){}",
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

      j_abn_ishihara_joker = {
        name = "Ishihara Joker",
        text = {
          "This Joker gains {C:chips}Chips{} {C:attention}equal{}",
          "to the {C:attention}ranks{} of",
          "scoring {C:dark_edition}Negative{} {C:diamonds}Light Suits{}",
          "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips)",
        },
      },

      j_abn_isocromatic_joker = {
        name = "Isocromatic Joker",
        text = {
          "Scoring {C:dark_edition}Foil{} cards gain {C:attention}+#2#{} Retrigger,",
          "Scoring {C:dark_edition}Holographic{} cards have their",
          "{C:planet}planet{} {C:attention}rank{} increased by {C:attention}#3#{},",
          "Scoring {C:dark_edition}Polychrome{} cards gain {C:chips}+#1#{} Chips",
        }
      },

      j_abn_j_for_joker = {
        name = "J is for Joker",
        text = {
          "{X:mult,C:white}X#1#{} Mult if ",
          "Joker slots are {C:attention}full",
        },
      },

      j_abn_j_jimbob = {
        name = "J'Jimbob",
        text = {
          {
            "Scoring {C:attention}Stone{}, {C:attention}Glass{}, {C:attention}Lucky{}",
            "and {C:attention}Mult{} cards give {X:chips,C:white}X#2#{} Chips",
          },
          {
            "Scoring {C:attention}Steel{}, {C:attention}Bonus{}, {C:attention}Gold{}",
            "and {C:attention}Wild{} cards give {X:mult,C:white}X#1#{} Mult",
          }
        }
      },

      j_abn_jack_of_all_trades = {
        name = "Jack of All Trades",
        text = {
          {
            "Non-{C:attention}#3#s{} give {C:white,X:mult}X#1#{} Mult",
            "per unique {C:attention}suit{} of {C:attention}#3#{}",
            "discarded this run when",
            "played and not {C:attention}scored{}",
            "{C:inactive}(Will give {C:white,X:mult}X#4#{C:inactive})",
          },
          {
            "{C:red,E:1}Self-destructs{} after scoring",
            "if played hand contains no {C:attention}#3#s{}",
          }
        }
      },

      j_abn_jakdos = {
        name = "Jakdos",
        text = {
          "{X:mult,C:white}X#1#{} Mult",
          "Scoring cards without",
          "{C:dark_edition}Chthonian{} are {C:mult}Debuffed{}"
        }
      },

      j_abn_jamie = {
        name = "Jamie",
        text = {
          "Upgrade level of",
          "played {C:attention}poker hand{}",
        }
      },

      j_abn_jenga_joker = {
        name = "Jenga Joker",
        text = {
          {
            "When this Joker is {C:red}destroyed{}, create",
            "a copy with an additional {X:mult,C:white}X#2#{} Mult",
            "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
          },
          {
            "{C:red}Self destructs{} if hand scores over",
            "{C:attention}twice{} the blind requirement"
          }
        }
      },

      j_abn_jenna_jester_girl = {
        name = "Jenna the Jester Girl",
        text = {
          {
            "If an {C:attention}odd{} number of {C:inactive}Vanilla{} Jokers",
            "is owned, they each give {C:chips}+#1#{} Chips",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "scoring {C:inactive}Vanilla{} suits",
            "give {C:mult}+#2#{} Mult when scored",
          },
          {
            "If {C:attention}Jinxie{} is owned,",
            "this Joker gains {C:gold}+#4#{} Asc. Power",
            "when a {C:inactive}Vanilla{} Joker is triggered",
            "{C:inactive}(Currently {C:gold}+#3#{C:inactive} Asc. Power)"
          }
        }
      },

      j_abn_jennia = {
        name = "Jennia",
        text = {
          {
            "Scored {C:abn_rose}Roses{} give {X:chips,C:white}X#1#{} Chips,",
            "increases by {X:chips,C:white}X#2#{} Chips",
            "when a {C:abn_rose}Rose{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "scoring {C:abn_rose}Roses{} permanently gain",
            "{C:mult}+#3#{} Mult for every {C:abn_rose}Rose{}",
            "{C:abn_rose}Rose{} scored this Blind"
          }
        }
      },

      j_abn_jenson = {
        name = "Jenson",
        text = {
          {
            "Scored {C:abn_suitless}Nulls{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:abn_suitless}Null{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "played {C:abn_suitless}Nulls{} permanently",
            "gain {C:mult}+#3#{} Mult per remaining",
            "hand when scored"
          }
        }
      },

      j_abn_jerry_jester = {
        name = "Jerry Jester",
        text = {
          {
            "Scored {C:abn_leaf}Leaves{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:abn_leaf}Leaf{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "all cards {C:attention}held{} in hand",
            "gain {C:chips}Chips{} equal to the highest rank of {C:abn_leaf}Leaf{} scored",
            "when a {C:abn_leaf}Leaf{} is scored"
          }
        }
      },

      j_abn_jester_vs_jester = {
        name = "Jester vs Jester",
        text = {
          {
            "If you have an {C:attention}even{} number of {C:inactive}(rarity){} Jokers,",
            "scoring {C:attention}even{} cards give {C:inactive}(reward 1)",
            "If you have an {C:attention}odd{} number of {C:inactivee}(rarity){} Jokers,",
            "scoring {C:attention}odd{} cards give {C:inactivee(reward 2)",
          },
          {
            "{C:inactive,s:0.8}(ex: Rarity: reward 1 or reward 2)",
            "{C:common}Common{}: {C:chips}+#1#{} or {C:chips}+#2#{} Chips",
            "{C:uncommon}Uncommon{}: {X:mult,C:white}X#3#{} or {X:mult,C:white}X#4#{} Mult",
            "{C:rare}Rare{}: {X:chips,C:white}X#5#{} or {X:chips,C:white}X#6#{} Chips",
          },
        },
      },

      -- for localisers, this a Joker based on Jevil from Deltarune, and it has a random effect based on the number of unique suits in played hand
      -- The effects are in misc.dictionary and are abn_unique_suit_1, abn_unique_suit_2 etc.
      j_abn_jevil = {
        name = "{C:abn_j}J{C:abn_e}e{C:abn_v}v{C:abn_i}i{C:abn_l}l{} the Mad Jester",
        text = {
          "Play a {C:blue}hand{}, any hand!",
          "{E:1,s:0.8,C:purple}\"I CAN DO ANYTHING!\"",
        }
      },

      j_abn_jfool = {
        name = "J'Fool",
        text = {
          {
            "Played {C:attention}Odd{} cards give {C:white,X:mult}XMult{} equal to",
            "the number of {C:attention}Odd{} cards played",
          },
          {
            "Played {C:attention}Even{} cards give {C:white,X:mult}XMult{} equal to",
            "the number of {C:attention}Even{} cards played",
          },
        }
      },

      j_abn_jimbo = {
        name = "Jimbo",
        text = {
          {
            "Scored {C:hearts}Hearts{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:hearts}Heart{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "{C:hearts}Hearts{} permanently gain",
            "{C:mult}+#3#{} Mult before scoring"
          }
        }
      },

      j_abn_jimbo_10 = {
        name = "Jimbo 10",
        text = {
          {
            "This Joker gains {C:chips}+#4#{} Chips and",
            "{C:white,X:mult}X#2#{} Mult when a {C:attention}10{} is scored",
            "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips, {X:mult,C:white}X#1#{C:inactive} Mult)",
          },
          {
            "Earn {C:money}$#5#{} for each {C:attention}10{} in your",
            "{C:attention}full deck{} at end of round",
            "{C:inactive}(Currently {C:money}$#6#{}{C:inactive})",
          }
        }
      },

      j_abn_jimbo_inscryption = {
        name = "Jimbo Inscryption",
        text = {
          "Each {C:attention}9{} and {C:attention}3{}",
          "held in hand",
          "give {C:white,X:mult}X#1#{} Mult"
        }
      },

      j_abn_jimbos_love_letter = {
        name = "Jimbo's Love Letter",
        text = {
          "{C:hearts}Hearts{} held in hand count in scoring",
          "Once per round, if played hand",
          "contains a {C:attention}Flush{} of {C:hearts}Hearts{},",
          "level up {C:planet}planet{} {C:attention}rank{} of all scoring cards"
        }
      },

      j_abn_jinxie = {
        name = "Jinxie",
        text = {
          {
            "Scored {C:abn_rose}Roses{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:abn_rose}Rose{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "scoring {C:abn_rose}Roses{} permanently gain",
            "{C:mult}+#3#{} Mult for every {C:abn_rose}Rose{}",
            "{C:abn_rose}Rose{} scored this Blind"
          }
        }
      },

      j_abn_jinxie_clown_girl = {
        name = "Jinxie the Clown Girl",
        text = {
          {
            "If an {C:attention}even{} number of {C:inactive}Vanilla{} Jokers",
            "is owned, they each give {C:mult}+#2#{} Mult",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "scoring {C:inactive}Vanilla{} suits",
            "give {C:chips}+#1#{} Chips when scored",
          },
          {
            "If {C:attention}Jenna{} is owned,",
            "this Joker gains {C:gold}+#4#{} Asc. Power",
            "when a {C:inactive}Vanilla{} Joker is triggered",
            "{C:inactive}(Currently {C:gold}+#3#{C:inactive} Asc. Power)"
          }
        }
      },

      j_abn_jjjokea = {
        name = "J.J.Jokea",
        text = {
          {
            "If {V:1}first played hand{} is a",
            "{C:attention}#1#{}, copy the {C:attention}Enhancement{},",
            "{C:dark_edition}Edition{}, and {C:red}Seal{} of the",
            "{C:attention}right{} card to the {C:attention}left{} card"
          },
          {
            "If {V:2}second played hand{} is a {C:attention}#2#{},",
            "each card gains a new {C:tarot}Stamp"
          },
          {
            "If {V:3}third played hand{} is a",
            "{C:attention}#3#{}, each scoring",
            "card gains {C:attention}Plank{}, {C:dark_edition}Chromatic{},",
            "and {C:red}Red Seal"
          },
        }
      },

      j_abn_joe_kert = {
        name = "Joe Kert",
        text = {
          "Scored {C:attention}unenhanced{}",
          "cards give {C:mult}+#1#{} Mult"
        },
      },

      j_abn_joerror = {
        name = "Joeerror",
        text = {
          "Jokers each give {X:mult,C:white} X#1# {} Mult,",
          "{C:red,E:1}self-destructs after scoring{}"
        }
      },

      j_abn_joke_22 = {
        name = "Joke 22",
        text = {
          {
            "If {C:attention}poker hand{} is {C:dark_edition}Vanilla{},",
            "gain {C:red}Mult{} equal to the sum of",
            "{C:attention}scored{} ranks with {C:dark_edition}Modded{} suits",
          },
          {
            "If {C:attention}poker hand{} is {C:dark_edition}Modded{},",
            "gain {C:blue}Chips{} equal to the sum of",
            "{C:attention}scored{} ranks with {C:dark_edition}Vanilla{} suits",
            "{C:inactive}(Currently {C:red}+#1#{C:inactive} Mult,{} {C:blue}+#2#{C:inactive} Chips){}",
          },
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

      j_abn_joker_besties = {
        name = "Joker Besties",
        text = {
          {
            "Matching numbers of {C:attention}Vanilla{} and {C:attention}Modded{}",
            "{C:dark_edition}Foil{}, {C:dark_edition}Holo{}, and {C:dark_edition}Polychrome{} give",
            "{X:chips,C:white}X#1#{}, {X:chips,C:white}X#2#{}, and {X:chips,C:white}X#3#{} Chips respectively",
          },
          {
            "Matching sets of {C:attention}Vanilla{} and {C:attention}Modded{}",
            "Jokers with editions give",
            "{X:mult,C:white}X#4#{}, {X:mult,C:white} X#5# {}, and {X:mult,C:white}X#6#{} Mult respectively",
          },
          {
            "If this Joker is {C:dark_edition}Foil{}, scoring cards",
            "and Jokers upgrade their {C:dark_edition}edition{} and",
            "gain {C:chips}+#7#{} Chips and {C:mult}+#8#{} Mult",
          },
          {
            "{C:inactive}(Foil -> Holo -> Poly -> Chromatic)",
          }
        },
      },

      j_abn_joker_blast = {
        name = "Joker Blast",
        text = {
          "This Joker gains {C:chips}+#1#{} Chips",
          "and {C:mult}+#2#{} Mult for each",
          "{C:attention}consecutive {C:attention}Blind{} beaten",
          "in a {C:attention}single{} hand",
          "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips, {C:mult}+#4#{C:inactive} Mult){}"
        },
      },

      j_abn_joker_collector = {
        name = "Joker Collector",
        text = {
          "This Joker gains {C:chips}+#1#{} Chips for",
          "every unique Joker {C:attention}purchased{} this run,",
          "Gives {C:white,X:mult}X#3#{} Mult if you have",
          "purchased {C:attention}10{} or more Jokers ",
          "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
        }
      },

      j_abn_joker_deck = {
        name = "Joker Deck",
        text = {
          "Gives {C:mult}+#2#{} Mult per",
          "even card and",
          "{C:chips}+#1#{} Chips{} per",
          "odd card in remaining deck",
          "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult & {C:chips}+#4#{C:inactive} Chips)"
        }
      },

      j_abn_joker_ena = {
        name = "Joker ENA",
        text = {
          {
            "Played cards with {C:inactive}Vanilla{} suits",
            "and {C:attention}Modded Enhancements{} give",
            "{C:white,X:mult}X#1#{} Mult when scored"
          },
          {
            "This Joker gains {C:mult}+#3#{}",
            "Mult per unique {C:dark_edition}Modded{}",
            "{C:enhanced}Enhancement{} in scoring hand",
            "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
          }
        }
      },

      j_abn_joker_family = {
        name = "Joker & Family",
        text = {
          "If you have {C:common}Common{}, {C:uncommon}Uncommon{},",
          "{C:rare}Rare{} and {C:attention}Comedian{} Jokers:",
          "Lower {C:attention}blind requirements{} by {C:attention}50%{}",
          "and give {X:mult,C:white}X#2#{} Mult per {C:attention}unique{}",
          "{C:attention}rarity{} among your {C:attention}Jokers{}",
          "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
        }
      },

      j_abn_joker_forge = {
        name = "Joker Forge",
        text = {
          "{C:attention}Scoring{} cards give total",
          "{C:attention}sell value{} of all current",
          "Jokers as {C:red}Mult{}",
          "{C:inactive}(Currently {C:red}+#1# {C:inactive}Mult)"
        }
      },

      j_abn_joker_form = {
        name = "Joker Form",
        text = {
          "Each played {C:attention}8{} or {C:attention}2",
          "gives {C:chips}+#1#{} Chips and",
          "{C:mult}+#2#{} Mult when scored",
        },
      },

      j_abn_joker_in_hiding = {
        name = "Joker In Hiding",
        text = {
          {
            "Add {C:attention}Flipped{} and {C:dark_edition}Holographic{} edition",
            "to {C:attention}Jokers{} selected from {C:attention}Booster Packs{}",
          },
          {
            "{C:attention}Flipped{} Jokers and Cards",
            "each give {C:money}$#1#{}",
          },
        }
      },

      j_abn_joker_invoice = {
        name = "Joker Invoice",
        text = {
          "{C:mult}+#1#{} Mult if",
          "hand is played",
          "with {C:money}$#2#{} or less"
        }
      },

      j_abn_jokers_knight = {
        name = "Jokers Knight",
        text = {
          {
            "Played {C:attention}Straights{} are considered {C:attention}Straight Flushes{}",
            "Played {C:attention}Straight Flushes{} are considered {C:attention}Emperium Flushes{}",
          },
          {
            "If this Joker has {C:attention}Wild{} {C:dark_edition}Enhancement{},",
            "gain {C:chips}+#5#{} Chips and {C:mult}+#6#{} Mult per",
            "suit {C:attention}Wild{} cards count as"
          },
          {
            "If this Joker has {C:attention}Kinship{} {C:dark_edition}Enhancement{},",
            "gain {X:chips,C:white}X0.025{} Chips and {X:mult,C:white}X0.025{} Mult per",
            "card sharing the same {C:attention}suit{} and {C:dark_edition}edition{} in played hand",
            "{C:inactive}(Currently {C:chips}+#1#{} {C:inactive}Chips{} {C:mult}+#2#{} {C:inactive}Mult{} {X:chips,C:white}X#3#{} {C:inactive}Chips{} {X:mult,C:white}X#4#{} {C:inactive}Mult{C:inactive})",
          }
        }
      },

      j_abn_joker_midnight = {
        name = "Joker by Midnight",
        text = {
          {
            "Debuff all {C:diamonds}Light Suits{}"
          },
          { "When {C:attention}Blind{} is selected,",
            "add {C:dark_edition}#3#{} to",
            "leftmost Joker"
          },
          {
            "Gives {C:mult}+#1#{} Mult for",
            "each {C:dark_edition}#3#{} Joker or",
            "card in your {C:attention}full deck{}",
            "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
          }
        }
      },

      j_abn_joker_note = {
        name = "Joker Note",
        text = {
          "When a {C:attention}sealed{} card is scored,",
          "this Joker gains {C:mult}+#1#{} Mult",
          "if the card is {C:attention}even{},",
          "{C:blue}+#2#{} Chips if its {C:attention}odd{}",
          "{C:inactive}(Currently {C:red}+#3#{C:inactive} Mult, {C:blue}+#4#{C:inactive} Chips)",
        }
      },

      j_abn_joker_of_destruction = {
        name = "Joker Of Destruction",
        text = {
          "If {C:attention}first hand{} of round",
          "has {C:attention}4{} cards, destroy them and",
          "create a {C:dark_edition}summoning{} {C:spectral}Spectral{} card",
        }
      },

      j_abn_joker_of_recca = {
        name = "Joker of Recca",
        text = {
          {
            "{C:spades}Darkner{}/{C:diamonds}Lightner{} enhanced Jokers will",
            "not be destroyed by hands that have",
            "too many of the opposite suit type"
          },
          {
            "{C:dark_edition}Reversal {C:spades}Darkner{} cards give {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
            "{C:dark_edition}Reversal {C:diamonds}Lightner{} cards give {C:chips}+#3#{} Chips and {C:mult}+#4#{} Mult"
          },
          {
            "If this Joker has {C:dark_edition}Abandoned{} edition, it",
            "gains {X:mult,C:white}X#5#{} Mult for each scoring",
            "{C:spades}Darkner{} card and {X:chips,C:white}X#6#{} Chips for",
            "each scoring {C:diamonds}Lightner{} card",
            "{C:inactive}(Currently {X:mult,C:white}X#7#{C:inactive} Mult, {X:chips,C:white}X#8#{C:inactive} Chips)"
          }
        },
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

      j_abn_joker_once_again = {
        name = "Joker Once Again",
        text = {
          "Add a {C:abn_white_seal}White Seal{}",
          "to first scoring {C:attention}card{}",
        },
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
            "gains {C:mult}+#4#{} Mult when a",
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

      j_abn_joker_reloaded = {
        name = "Joker Reloaded",
        text = {
          "At end of round,",
          "all Jokers gain {C:mult}+#1#{} Mult",
          "and {C:chips}+#2#{} Chip per unique",
          "{C:dark_edition}Edition{} in held {C:attention}consumables{}",
        },
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

      j_abn_joker_scroll = { -- to rleocalise
        name = "Joker Scroll",
        text = {
          {
            "If you have an {C:attention}Even{} number of Jokers",
            "with the same {C:money}sell value{}, add {C:dark_edition}Vintage{}",
            "edition to scoring {C:attention}Even{} cards in a {C:attention}Full House{}",
          },
          {
            "If you have an {C:attention}Odd{} number of Jokers",
            "with the same {C:money}sell value{} add {C:dark_edition}Vintage{}",
            "edition to scoring {C:attention}Odd{} cards in a {C:attention}Full House{}",
          },
          {
            "If this card has {C:dark_edition}Abandoned{} edition,",
            "it gains {X:mult,C:white}X#2#{} Mult per scored {C:dark_edition}Vintage{} card",
            "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}"
          },
        }
      },

      j_abn_joker_tile = {
        name = "Joker Tile",
        text = {
          "This Joker gains {X:chips,C:white}X#2#{} Chips",
          "per {C:attention}consecutive{} hand with",
          "{C:attention}equal{} scoring cards and held Jokers",
          "{C:inactive}(Currently{} {X:chips,C:white}X#1#{} {C:inactive}Chips)",
        }
      },

      j_abn_joker_totebag = {
        name = "Joker Totebag",
        text = {
          {
            "When {C:attention}Blind{} is selected,",
            "gain {C:mult}+#2#{} Mult and {C:chips}+#1#{} Chips for each",
            "consumable that shares a name",
          },
          {
            "If each consumable has a",
            "{C:attention}different{} {C:dark_edition}Edition{}, double",
            "this Joker's {C:chips}Chips{} and {C:mult}Mult{}",
            "{C:inactive}(Currently {C:mult}+#4#{} {C:inactive}Mult,{} {C:chips}+#3#{} {C:inactive}Chips){}"
          },
        },
      },

      j_abn_joker_tv = {
        name = "Joker TV",
        text = {
          {
            "When a {C:program_pack}Program{} card is used,",
            "add {C:money}$#1#{} of {C:attention}sell value{} to all {C:attention}Jokers{}",
            "and {C:diamonds}Light Suits{} permanently gain {C:mult}+#2#{} Mult",
          },
          {
            "When a {C:planet}Rank Planet{} card is used,",
            "all {C:spades}Dark Suits{} permanently gain {C:mult}+#2#{} Mult"
          }
        }
      },

      j_abn_joker_unlimited = {
        name = "Joker Unlimited",
        text = {
          {
            "This Joker gains {X:red,C:white}X#1#{} Mult",
            "per hand played",
            "during a {C:attention}Boss Blind",
            "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
          },
          {
            "When {C:attention}Boss Blind{} is defeated,",
            "{C:attention}copy{} all cards in",
            "your {C:attention}full deck{}",
          }
        },
      },

      j_abn_jokerge = {
        name = "Jokerge",
        text = {
          "{C:attention}Double{} all Joker values",
        }
      },

      j_abn_jokerian_dogma = {
        name = "Jokerian Dogma",
        text = {
          "Played {C:attention}Enhanced{} cards with a",
          "{C:dark_edition}Modded{} {C:dark_edition}Edition{} give",
          "{C:gold}+#1#{} Asc. Power when scored"
        }
      },

      j_abn_jokers_mixtape_grey = {
        name = "Joker's Mixtape",
        text = {
          "Give {C:chips}+10{} chips per {C:attention}Joker{} owned",
          "{s:0.8}Effect changes with certain editions",
        }
      },
      j_abn_jokers_mixtape_black = {
        name = "Joker's Mixtape",
        text = {
          "Give {C:white,X:mult}X1{} Mult per Joker owned",
          "{s:0.8}Effect changes with certain editions",
        }
      },
      j_abn_jokers_mixtape_red = {
        name = "Joker's Mixtape",
        text = {
          "Retrigger All Jokers",
          "{s:0.8}Effect changes with certain editions",
        }
      },
      j_abn_jokers_mixtape_blue = {
        name = "Joker's Mixtape",
        text = {
          "{C:white,X:chips}X3{} Chips",
          "{s:0.8}Effect changes with certain editions",
        }
      },
      j_abn_jokers_mixtape_yellow = {
        name = "Joker's Mixtape",
        text = {
          "Give {C:white,X:mult}XMult{} equal to the number of scoring cards",
          "{s:0.8}Effect changes with certain editions",
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

      j_abn_jokester = {
        name = "Jokester",
        text = {
          {
            "{s:0.8}Scoring {C:hearts,s:0.8}Hearts{s:0.8} become {C:abn_leaf,s:0.8}Leaves{}",
            "{s:0.8}Scoring {C:spades,s:0.8}Spades{s:0.8} become {C:abn_bell,s:0.8}Bells{}",
            "{s:0.8}Scoring {C:diamonds,s:0.8}Diamonds{s:0.8} become {C:abn_acorn,s:0.8}Acorns{}",
            "{s:0.8}Scoring {C:clubs,s:0.8}Clubs{s:0.8} become {C:abn_florette,s:0.8}Florettes{}",
          },
          {
            "If this Joker has {C:dark_edition}Collodion{} edition,",
            "gain {C:mult}+#2#{} Mult and {C:money}$#2#{} of",
            "{C:attention}sell value{} when a suit changes",
            "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult)",
          },
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

      j_abn_jolly_voxel_joker = {
        name = "Jolly Voxel Joker",
        text = {
          "{X:chips,C:white}X#1#{} Chips if {C:attention}poker hand{}",
          "is a {C:attention}#2#"
        }
      },

      j_abn_jorg = {
        name = "Jorg",
        text = {
          "{C:mult}Discarded{} cards give {X:mult,C:white}X#1#{} Mult",
          "on {C:attention}next{} played hand",
        }
      },

      j_abn_jorick = {
        name = "Jorik",
        text = {
          "{X:mult,C:white}X#1#{} Mult and {X:chips,C:white}X#2#{} Chips",
          "when {C:attention}0{} discards",
          "remaining",
        },
      },

      j_abn_july_jester = {
        name = "July Jester",
        text = {
          {
            "Scored {C:abn_suitless}Nulls{} give {X:chips,C:white}X#1#{} Chips,",
            "increases by {X:chips,C:white}X#2#{} Chips",
            "when a {C:abn_suitless}Null{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "played {C:abn_suitless}Nulls{} permanently",
            "gain {C:money}$#3#{} per remaining",
            "hand when scored"
          }
        }
      },

      j_abn_jurian = {
        name = "Jurian",
        text = {
          "{C:mult}Discarded{} cards give {X:chips,C:white}X#1#{} Chips",
          "on {C:attention}next{} played hand",
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

      j_abn_khonsu_joker = {
        name = "Khonsu Joker",
        text = {
          {
            "If {C:attention}first hand{} of round is a {C:attention}Pair{}",
            "containing {C:diamonds}Light{} and {C:spades}Dark{} suits,",
            "add {C:dark_edition}Bright{} and {C:dark_edition}Opaque{} edition",
            "respectively to each card scored",
          },
          {
            "If this Joker has {C:dark_edition}Bright{} edition,",
            "scoring {C:diamonds}Light{} suits give",
            "double their {C:attention}rank{} as {C:mult}Mult{}",
          },
          {
            "If this Joker has {C:dark_edition}Opaque{} edition,",
            "scoring {C:spades}Dark{} suits give",
            "double their {C:attention}rank{} as {C:mult}Mult{}",
          }
        }
      },

      j_abn_kiki_joker = {
        name = "Kiki Joker",
        text = {
          {
            "This Joker gains {C:mult}+#2#{} Mult",
            "per scoring {C:attention}Even{} card",
          },
          {
            "Increase this by {C:mult}+#3#{} Mult",
            "per {C:lexica}Lexica{} card held",
            "when {C:attention}Boss Blind{} is defeated",
            "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult)",
          }
        }
      },

      j_abn_king_of_games = {
        name = "King Of Games",
        text = {
          "Once per {C:attention}ante{}, create",
          "a card with chosen {C:attention}rank{},",
          "{C:attention}suit{}, and {C:dark_edition}enhancement{}",
          "and add it to your hand",
        }
      },

      j_abn_klyde_clown = {
        name = "Klyde Clown",
        text = {
          {
            "Scored {C:abn_coin}Coins{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:abn_coin}Coin{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "played {C:abn_coin}Coins{} permanently",
            "gain {C:money}$#3#{} per {C:abn_coin}Coin{}",
            "in scoring hand"
          }
        }
      },

      j_abn_la_bete_noire = {
        name = "{f:abn_m6x11}La  Bête  Noire",
        text = {
          {
            "Your {C:purple}score{} is hidden",
          },
          {
            "Adds {C:attention}+#1#{} to finish ante",
            "per {C:attention}Calamity{} card used this run",
          },
          {
            "Gains {C:gold}+#2#{} Ascension",
            "when a hand is played while",
            "holding a {C:attention}Calamity{} card",
            "{C:inactive}(Currently {C:gold}+#3#{C:inactive} Asc. Power)"
          },
          {
            "When you sell a {C:spectral}Spectral{} card,",
            "create a random {C:attention}Calamity{} card"
          }
        }
      },

      j_abn_late_pass = {
        name = "Late pass",
        text = {
          "{C:chips}+#1#{} Chips but always trigger {C:attention}last{}",
        }
      },

      j_abn_lawn_joker = {
        name = "Lawn Joker",
        text = {
          {
            "Scoring {C:abn_rose}Roses,{} {C:clubs}Clubs,{} {C:abn_leaf}Leaves{} and {C:abn_florette}Florettes{} permanently",
            "gain {C:chips}+#5#{} Chips and {C:mult}+#6#{} Mult",
            "per {C:continent}Continent{} card held",
          },
          {
            "This Joker gains {C:chips}+#2#{} Chips and",
            "{C:mult}+#4#{} Mult per {C:weather_report}Weather Report{} used",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, {C:mult}+#3#{C:inactive} Mult)",
          },
        }
      },

      j_abn_legends_remade = {
        name = "Legends Remade",
        text = {
          "If you own a {C:legendary}Legendary{} Joker,",
          "{C:money}sell{} this {C:attention}Joker{} to create any",
          "{C:legendary}Legendary{} Joker from your collection",
        }
      },

      j_abn_light_collage = {
        name = "Light Collage",
        text = {
          {
            "This Joker gains {C:chips}+#1#{} Chips when",
            "a {C:dark_edition}Foil{} card scores, {C:mult}+#2#{} Mult",
            "when a {C:dark_edition}Gloss{} card scores",
            "{C:inactive}(Currently {C:chips}+#7#{C:inactive} Chips, {C:mult}+#8#{C:inactive} Mult)"
          },
          {
            "When a {C:sigils}Sigil{} card is used,",
            "{C:green}#5# in #6#{} chance to convert",
            "a random {C:attention}non-editioned{} card",
            "in your deck into a {C:dark_edition}Foil{} card,",
            "{C:green}#5# in #6#{} chance to a {C:dark_edition}Gloss{} card",
          },
        },
      },

      j_abn_livestream_joker = {
        name = "Livestream Joker",
        text = {
          "{C:dark_edition}Modded{} ranks {C:attention}held in hand",
          "give {C:attention}X#1#{} their {C:chips}Chips{} value"
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

      j_abn_loki = {
        name = "Loki",
        text = {
          "When a {C:attention}Comedian{} Joker triggers,",
          "all other {C:attention}non-Comedian{} Jokers",
          "permanently gain {C:mult}+#1#{} Mult",
        }
      },

      j_abn_losers_dice = {
        name = "Loser's Dice",
        text = {
          "Played and scored {C:attention}2s{} give {C:mult}+#2#{} Mult",
          "for each owned {C:common}Common{} Joker",
          "{C:inactive}(Will give {C:mult}+#1#{C:inactive} Mult)"
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

      j_abn_lotion_joker = {
        name = "Lotion Joker",
        text = {
          "Remove {C:attention}enhancements{} from played and",
          "discarded {C:attention}Petroleum{} and {C:attention}Stone{} cards,",
          "gains {C:chips}+#2#{} Chips per card restored this way",
          "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips)",
        }
      },

      j_abn_lucky_glass = {
        name = "Lucky Glass",
        text = {
          {
            "If played hand contains both a {C:attention}Lucky{}",
            "and {C:attention}Glass{} card, they each gain",
            "{C:gold}+#1#{} Asc. Power and {C:purple}+#2#{} Score",
          },
          {
            "{C:enhanced}Lucky{} {C:attention}Jokers{} gain {X:mult,C:white}X#3#{} Mult, {C:enhanced}Glass{}",
            "{C:attention}Jokers{} gain {X:chips,C:white}X#4#{} Chips when triggered"
          },
          {
            "When {C:attention}Big Blind{} is selected, create",
            "the last {C:glyphs}Glyph{} card used this run",
            "{C:inactive}Currently:{} {C:glyphs}#5#{}"
          }
        }
      },

      j_abn_lorenz = {
        name = "Lorenz",
        text = {
          {
            "Scored {C:abn_acorn}Acorns{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when an {C:abn_acorn}Acorn{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "scoring {C:abn_acorn}Acorns{} permanently",
            "gain {C:chips}+#3#{} Chips per unique {C:attention}rarity{}",
            "among your Jokers"
          },
        }
      },

      j_abn_liam = {
        name = "Liam",
        text = {
          {
            "Scored {C:abn_acorn}Acorns{} give {X:chips,C:white}X#1#{} Chips,",
            "increases by {X:chips,C:white}X#2#{} Chips",
            "when an {C:abn_acorn}Acorn{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "scoring {C:abn_acorn}Acorns{} permanently",
            "gain {C:purple}+#3#{} Score per unique {C:attention}rarity{}",
            "among your Jokers"
          },
        }
      },

      j_abn_lucky_mult = {
        name = "Lucky Mult",
        text = {
          {
            "If played hand contains both a {C:attention}Lucky{}",
            "and {C:attention}Mult{} card, they each gain",
            "{C:gold}+#1#{} Asc. Power and {C:purple}+#2#{} Score",
          },
          {
            "{C:enhanced}Lucky{} {C:attention}Jokers{} gain {X:mult,C:white}X#3#{} Mult, {C:enhanced}Mult{}",
            "{C:attention}Jokers{} gain {X:chips,C:white}X#4#{} Chips when triggered"
          },
          {
            "When {C:attention}Big Blind{} is selected, create",
            "the last {C:paradox}Paradox{} card used this run",
            "{C:inactive}Currently:{} {C:paradox}#5#{}"
          }
        }
      },

      j_abn_lucky_socks = {
        name = "Lucky Socks",
        text = {
          {
            "This Joker gains {C:mult}+#1#{} Mult if",
            "played hand contains a {C:attention}Pair{}",
          },
          {
            "{C:attention}Pairs{} of {C:attention}Lucky{} cards",
            "are guaranteed to {C:green}succeed",
            "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
          }
        },
      },

      j_abn_lucky_stone = {
        name = "Lucky Stone",
        text = {
          {
            "If played hand contains both a {C:attention}Stone{}",
            "and {C:attention}Lucky{} card, they each gain",
            "{C:gold}+#1#{} Asc. Power and {C:purple}+#2#{} Score",
          },
          {
            "{C:enhanced}Stone{} {C:attention}Jokers{} gain {X:mult,C:white}X#3#{} Mult, {C:enhanced}Lucky{}",
            "{C:attention}Jokers{} gain {X:chips,C:white}X#4#{} Chips when triggered"
          },
          {
            "When {C:attention}Big Blind{} is selected, create",
            "the last {C:artistry_cards}Artistry{} card used this run",
            "{C:inactive}Currently:{} {C:artistry_cards}#5#{}"
          }
        }
      },

      j_abn_lucrative_joker = {
        name = "Lucrative Joker",
        text = {
          {
            "No limit on {C:money}interest{} and {C:tarot}doubling{}",
          },
          {
            "{C:attention}Gold{} cards and cards with {C:gold}Gold Seals{}",
            "are shuffled to the top of the deck",
          },
          {
            "If {C:attention}Slot Machine{} is owned, double",
            "earnings from {C:attention}Gold{} cards and {C:attention}seals",
          }
        }
      },

      j_abn_luftballon_joker = {
        name = "Luftballon Joker",
        text = {
          {
            "When a {C:attention}9{} triggers,",
            "gain {C:red}+#1#{} Mult for each {C:attention}9",
            "in your {C:attention}entire deck",
            "{C:inactive}(Currently {C:red}+#3#{C:inactive} Mult)"
          },
          {
            "If you play a {C:attention}#2#",
            "with only {C:attention}9s{}, level up",
            "hand {C:attention}9{} times"
          },
        }
      },

      j_abn_lunar_conspiracy = {
        name = "Lunar Conspiracy",
        text = {
          {
            "Gain {C:chips}+#3#{} Chips and {C:red}+#4#{} Mult",
            "whenever you play a {C:attention}hand",
            "associated with any",
            "held {C:planet}Planet{} card",
            "{C:inactive}(Currently {C:blue}+#1#{C:inactive} Chips and {C:red}+#2#{C:inactive} Mult)",
          },
        }
      },

      j_abn_m_earl = {
        name = "M. Earl",
        text = {
          "Lower all {C:attention}Blind requirements{} by {C:attention}90%{}",
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

      j_abn_mad_professor = {
        name = "Mad Professor",
        text = {
          {
            "Each played {C:attention}card{}",
            "permanently gains",
            "{C:blue}+#1#{} Chips for",
            "each time its {C:attention}rank",
            "has {C:attention}scored{} this {C:attention}hand",
            "{C:inactive}ex: \"2\",\"4\",\"2\",\"4\"",
            "{C:inactive}= {C:chips}+1{C:inactive},{C:chips}+1{C:inactive},{C:chips}+2{C:inactive},{C:chips}+2{C:inactive}"
          },
        }
      },

      j_abn_magician_tag = {
        name = "Magician Tag",
        text = {
          "When you {C:green}reroll{} the shop",
          "{C:green}Reroll{} all held {C:attention}Tags{}",
        }
      },

      j_abn_mainframe_joker = {
        name = "Mainframe Joker",
        text = {
          "This Joker gains {C:mult}+#4#{} Mult",
          "when a {C:solid_state}Solid State{} card is used,",
          "gains {C:chips}+#2#{} Chips when a",
          "{C:program_pack}Program{} card is used",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, {C:mult}+#3#{C:inactive} Mult)"
        }
      },

      j_abn_malefactor_comedian = {
        name = "Malefactor Comedian",
        text = {
          "This Joker gains the",
          "{C:attention}ranks{} of all scoring",
          "{C:diamonds}Light Suits{} as {C:chips}Chips{}, ",
          "{C:spades}Dark Suits{} as {C:mult}Mult{}",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive}, {C:chips}+#2#{C:inactive})",
        }
      },

      j_abn_malicious_code_joker = {
        name = "Malicious Code Joker",
        text = {
          {
            "{C:green}#1# in #2#{} chance to convert",
            "scoring {C:attention}Mult{} cards ",
            "into {C:purple}Contagion Mult{}",
          },
          {
            "{C:green}#1# in #2#{} chance to convert",
            "scoring {C:attention}Bonus{} cards ",
            "into {C:purple}Contagion Bonus{}",
          },
        }
      },

      j_abn_malicious_entity = {
        name = "Malicious Entity",
        text = {
          "If {C:attention}first hand{} of round,",
          "destroy {C:attention}leftmost{} scoring",
          "card and gain {C:white,X:mult}X#2#{} Mult",
          "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
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

      j_abn_mana = {
        name = "Mana",
        text = {
          "If {C:attention}first hand{} of round,",
          "add {C:dark_edition}Sunscourge{} to first",
          "scoring {C:attention}Ace{} and {C:attention}2",
        }
      },

      j_abn_manga_panel_joker = {
        name = "Manga Panel Joker",
        text = {
          "Scoring {C:spades}Dark Suits{} give",
          "{X:chips,C:white}^#1#{} Chips and {X:mult,C:white}^#2#{} Mult ",
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

      j_abn_mardi_gras = {
        name = "Mardi Gras Joker",
        text = {
          "Choose {C:attention}1{} additional",
          "card from {C:tarot}Arcana{} Packs",
        }
      },

      j_abn_mariner_joker = {
        name = "Mariner Joker",
        text = {
          "Create a random {C:attention}Rank{}",
          "{C:planet}Planet{} card every time",
          "a {C:continent}Continent{} card is used",
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

      j_abn_market_crash = {
        name = "Market Crash",
        text = {
          {
            "When {C:money}${} is earned, reduce",
            "amount earned to {C:money}$1{} and gain",
            "{C:attention}double{} the {C:money}${} lost as {C:mult}Mult{}",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
          },
          {
            "When {C:attention}sold{}, earn all {C:money}${} lost",
            "{C:inactive}(Will earn {C:money}$#2#{C:inactive})"
          }
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

      j_abn_marmalize_joker = {
        name = "Marmalize Joker",
        text = {
          {
            "When {C:attention}Blind{} is selected,",
            "all {C:attention}Jokers{} permanently gain",
            "{C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips",
          },
          {
            "Jokers cannot be {C:mult}debuffed{}",
            "or have {C:abn_perishable}stickers{}",
          },
        }
      },

      j_abn_marques_the_joker = {
        name = "Marques the Joker",
        text = {
          {
            "Played {C:attention}Gold Cards{} permanently",
            "gain {X:mult,C:white}X#1#{} Mult and",
            "{C:chips}+#2#{} chips when scored",
          },
          {
            "Played Non-{C:attention}Gold{} cards",
            "get {C:red}debuffed{} when scored",
          }
        },
      },

      j_abn_mateo_mime = {
        name = "Mateo Mime",
        text = {
          {
            "Scored {C:abn_coin}Coins{} give {X:chips,C:white}X#1#{} Chips,",
            "increases by {X:chips,C:white}X#2#{} Chips",
            "when a {C:abn_coin}Coin{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "level up {C:planet}planet{} {C:attention}rank{}",
            "of all {C:abn_coin}Coins{} scored",
          }
        }
      },

      j_abn_maurice_jester = {
        name = "Maurice Jester",
        text = {
          {
            "Scored {C:hearts}Hearts{} give {X:chips,C:white}X#1#{} Chips,",
            "increases by {X:chips,C:white}X#2#{} Chips",
            "when a {C:hearts}Heart{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "played {C:hearts}Hearts{} permanently",
            "gain {C:white,X:mult}X#3#{} Mult when scored"
          }
        }
      },

      j_abn_maxwell_joker = {
        name = "Maxwell Joker",
        text = {
          "{C:dark_edition}#2#{} cards and",
          "Jokers give {X:chips,C:white}X#1#{} Chips"
        }
      },

      j_abn_meatkin = {
        name = 'Meatkin Joker',
        text = {
          "When a {C:attention}Steel{} card scores,",
          "each scoring non-{C:attention}Steel{} card",
          "permenantly gains {X:mult,C:white}+X#1#{} Mult"
        },
        --[[unlock = {
        "Have at least {C:attention}one-fourth{}",
        "of your deck be {C:attention}Steel{} cards"
        }--]]
      },

      j_abn_meddlesome_naidemoc = {
        name = "Meddlesome Naidemoc",
        text = {
          {
            "Before scoring, cards change {C:attention}suits{}:",
            "{C:diamonds,s:0.8}Diamonds{s:0.8} -> {C:spades,s:0.8}Spades{s:0.8} -> {C:hearts,s:0.8}Hearts{s:0.8} -> {C:clubs,s:0.8}Clubs",
            "{s:0.8} -> {C:abn_arrow,s:0.8}Arrows{s:0.8} -> {C:abn_anchor,s:0.8}Anchors{s:0.8} -> {C:abn_rose,s:0.8}Roses{s:0.8} -> {C:abn_shield,s:0.8}Shields{}",
          },
          {
            "This Joker gains {C:chips}+#3#{} Chips and",
            "{C:mult}+#4#{} Mult when a card changes {C:attention}suit{}",
            "{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult,{} {C:chips}+#1#{} {C:inactive}Chips){}"
          },
        }
      },

      j_abn_melnibone_comedian = {
        name = "Melnibone Comedian",
        text = {
          {
            "This Joker gains {X:mult,C:white}X#3#{} Mult",
            "when a Joker is {C:attention}sold{}, gains",
            "{C:chips}+#4#{} Chips when a Joker is {C:mult}destroyed{}",
            "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult,{} {C:chips}+#2#{} {C:inactive}Chips){}",
          },
          {
            "{C:attention}Sold{} and {C:mult}destroyed{}",
            "Jokers cannot reappear",
          },
        }
      },

      j_abn_melted_joker = {
        name = "Melted Joker",
        text = {
          {
            "When {C:attention}Blind{} is selected,",
            "apply {C:money}Rental{} sticker",
            "to leftmost Joker",
          },
          {
            "{C:money}Rental{} Jokers each give",
            "{X:mult,C:white}X#2#{} Mult and {C:money}$#1#{}"
          }
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

      j_abn_memory_dump_joker = {
        name = "Memory Dump Joker",
        text = {
          {
            "Each Joker gains {X:mult,C:white}X#1#{}",
            "Mult every hand played"
          },
          {
            "Played hand must contain",
            "more than {C:attention}#2#{} cards",
            "{C:inactive,s:0.8}(Changes to highest played hand size)",
            "{s:0.8}(Resets when {C:attention,s:0.8}Blind{s:0.8} is defeated)"
          },
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

      j_abn_meta_joker = {
        name = "Meta Joker",
        text = {
          "Gives {C:white,X:mult}X#1#{} Mult",
          "for each {C:attention}unique rarity{}",
          "among your {C:attention}Jokers{}",
          "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
        }
      },

      j_abn_metalizing_joker = { -- to relocalise
        name = 'Metalizing Joker',
        text = {
          "{C:attention}+1{} {C:chips}Play{} Limit",
          "If your hand is Composed of Only {C:attention}Steel{} cards",
          "Each {C:attention}Steel{} card gains {C:gold}+#3#{} Asc. Power per scoring card",
          "After playing {C:attention}#2#{} hands of {C:attention}6{} Steel cards",
          "{C:mult}destroy{} this Joker and {C:attention}double{} your Handsize",
          "{C:attention}#1#{}{C:inactive}/{}{C:attention}#2#{}",
        },
      },

      j_abn_metallic_upgrade = {
        name = "Metallic Upgrade",
        text = {
          {
            "First scoring {C:inactive}Vanilla{} {C:attention}Enhanced{} card",
            "in a {C:attention}Spectrum{} hand enhances the",
            "{C:attention}leftmost{} Joker into its {C:enhanced}Enhancement{}",
          },
          {
            "If a {C:attention}Spectrum{} hand is played with",
            "{C:attention}5{} {C:inactive}Vanilla{} {C:enhanced}Enhancements{}, all scoring",
            "cards gain {C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult,",
            "and all {C:attention}Jokers{} gain {C:purple}+#3#{} Score",
          },
        }
      },

      j_abn_metropolitan_joker = {
        name = "Metropolitan Joker",
        text = {
          "{X:mult,C:white}X#1#{} Mult for each {C:attention}#2#{}",
          "card in your {C:attention}full deck{}",
          "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
        }
      },

      j_abn_mike_jester = {
        name = "Mike Jester",
        text = {
          {
            "Scored {C:abn_bow}Bows{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:abn_bow}Bow{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "scoring {C:abn_bow}Bows{} balance",
            "{C:chips}Chips{} and {C:mult}Mult{} by {C:white,X:abn_plasma}#3#%{}"
          }
        }
      },

      j_abn_mikhail_jester = {
        name = "Mikhail Jester",
        text = {
          {
            "Scored {C:abn_bow}Bows{} give {X:chips,C:white}X#1#{} Chips,",
            "increases by {X:chips,C:white}X#2#{} Chips",
            "when a {C:abn_bow}Bow{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "scoring {C:abn_bow}Bows{} permanently gain",
            "{C:mult}+#3#{} Mult per consumable {C:attention}held{}",
          }
        },
      },

      j_abn_mindflayer = {
        name = "Mindflayer",
        text = {
          "Every played {C:attention}flipped card{}",
          "permanently gains",
          "{C:mult}+#1#{} Mult when scored",
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

      j_abn_minimus = {
        name = "Minimus",
        text = {
          "Scoring {C:attention}numbered{} cards",
          "below {C:attention}5{} give",
          "{X:mult,C:white}X#1#{} Mult and {X:chips,C:white}X#2#{} Chips",
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
          "Converts every scored",
          "card into an {C:attention}Ace{}",
          "before scoring"
        },
      },

      j_abn_mitch_jester = {
        name = "Mitch Jester",
        text = {
          {
            "Scored {C:abn_tie}Ties{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:abn_tie}Tie{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "scoring {C:abn_tie}Ties{} permanently gain",
            "{C:attention}+#3#{} Retrigger per consumable {C:attention}held{}",
          }
        },
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

      j_abn_moe_joker = {
        name = "Moe Joker",
        text = {
          "{C:attention}Polkadot{} cards {C:attention}held",
          "in hand count in scoring,",
          "{C:attention}Polkadot{} cards permanently",
          "gain {C:mult}+#1#{} Mult when scored"
        }
      },

      j_abn_moirologist_joker = { -- slight relocalising
        name = "Moirologist Joker",
        text = {
          {
            "When a {C:blind}Blind{} is selected,",
            "turn a random Joker {C:enhanced}Fragile{}"
          },
          {
            "When a Joker is destroyed, earn {C:gold}$#1#",
            "and a bonus relative to the Joker's rarity:",
            "{C:common}Common{}: {C:blue}+#9#{C:inactive}[+#2#]{} Chips",
            "{C:uncommon}Uncommon{}: {C:red}+#10#{C:inactive}[+#3#]{} Mult",
            "{C:rare}Rare{}: {X:chips,C:white}X#11#{C:inactive}[X#4#]{} Chips",
            "{C:abn_superrare}Super Rare{}: {X:red,C:white}X#12#{C:inactive}[X#5#]{} Mult",
            "{C:legendary}Legendary{}: {C:gold}+#13#{C:inactive}[+#6#]{} Ascension Power",
            "{C:abn_parallelrare}Parallel Rare{}: {C:attention}+#14#{C:inactive}[+#7#]{} retrigger",
            "{s:0.8}Dollars earned after destruction increase by {C:gold,s:0.8}+$#8#{s:0.8}",
            "{s:0.8}after beating a {C:attention,s:0.8}boss blind"
          },
        }
      },

      j_abn_money_talk = {
        name = "Money Talk",
        text = {
          {
            "When {C:attention}Boss Blind{} is defeated,",
            "add {C:money}$#2#{} of {C:attention}sell value",
            "to each held {C:attention}consumable{}",
          },
          {
            "Amount increases by {C:money}$#1#{}",
            "when {C:attention}Boss Blind{} is defeated",
          }
        }
      },

      j_abn_monitor_joker = {
        name = "Monitor Joker",
        text = {
          {
            "You may play and discard",
            "up to {C:attention}6{} cards",
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

      j_abn_monkey_buisness = {
        name = "Monkey Business",
        text = {
          "{C:attention}Consumables{} can have different {C:dark_edition}editions",
        },
      },

      j_abn_monocromator_joker = {
        name = "Monocromator Joker",
        text = {
          {
            "If played hand contains a {C:attention}Straight{},",
            "this Joker gains {C:chips}+#3#{} Chips",
            "per unique {C:attention}suit{} scored",
          },
          {
            "If played hand is a {C:attention}Straight Spectrum{},",
            "this Joker gains the {C:attention}rank{} of",
            "all scoring {C:dark_edition}Modded{} suits as {C:mult}Mult{}",
            "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult,{} {C:chips}+#2#{} {C:inactive}Chips){}",
          },
          {
            "If played hand is a {C:attention}Straight Spectrum{},",
            "with no {C:inactive}Vanilla{} suits, add {C:dark_edition}Opaque{}",
            "edition to all scoring {C:spades}Dark Suits{}",
          }
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

      j_abn_motocross_joker = {
        name = "Motocross Joker",
        text = {
          {
            "Gains {X:red,C:white}X#1#{} Mult",
            "each {C:attention}#2#{} scored",
            "{C:inactive}(Suit changes after",
            "{C:inactive}playing a hand)",
            "{C:inactive}(Currently {X:red,C:white}X#3#{C:inactive} Mult)",
          },
          {
            "Scoring {C:attention}Wild Cards{} gain",
            "{C:gold}+$#4#{} and {C:chips}+#5#{} Chips",
            "for every {C:attention}Wild Card{}",
            "in your entire deck",
          },
        }
      },

      j_abn_movie_poster = {
        name = "Movie Poster",
        text = {
          "Gives {C:attention}+1{} hand size per every",
          "{C:attention}Steel{} card held in hand"
        }
      },

      j_abn_mult_disco = {
        name = "Mult Disco",
        text = {
          {
            "{X:mult,C:white}X#1#{} Mult for every",
            "{C:dark_edition}Negative {C:attention}Mult{} card scored",
          },
          {
            "Gains {C:mult}+#2#{} Mult per scored",
            "{C:spades}Dark{} suited {C:attention}Mult Card{}",
            "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)"
          }
        }
      },

      j_abn_mult_glass = {
        name = "Mult Glass",
        text = {
          {
            "If played hand contains both a {C:attention}Mult{}",
            "and {C:attention}Glass{} card, they each gain",
            "{C:gold}+#1#{} Asc. Power and {C:purple}+#2#{} Score",
          },
          {
            "{C:enhanced}Mult{} {C:attention}Jokers{} gain {X:chips,C:white}X#3#{} Chips, {C:enhanced}Glass{}",
            "{C:attention}Jokers{} gain {X:chips,C:white}X#4#{} Chips when triggered"
          },
          {
            "When {C:attention}Big Blind{} is selected, create",
            "the last {C:program_pack}Program{} card used this run",
            "{C:inactive}Currently:{} {C:program_pack}#5#{}"
          }
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

      j_abn_mult_speed = {
        name = 'Mult Speed',
        text = {
          "All scoring cards permanently gain",
          "{C:mult}+#1#{} Mult if you have an {C:attention}even{}",
          "number of hands remaining,",
          "{C:chips}+#2#{} Chips if {C:attention}odd{}, and {C:money}$#3#{}",
          "if {C:attention}final hand{} of round",
        }
      },

      j_abn_mult_stone = {
        name = "Mult Stone",
        text = {
          "Played {C:attention}Stone{} cards",
          "gain {C:chips}+#1#{} Chips and",
          "a {C:red}Red Seal{}  when scored",
        }
      },

      j_abn_mutually_assured_destruction = {
        name = "Mutually Assured Destruction",
        text = {
          {
            "All {C:legendary}rarities{} can",
            "appear in {C:attention}shop",
          },
          {
            "{C:red}Destroy{} every {C:attention}Joker{} held",
            "if no {C:attention}Joker{} was",
            "bought in the {C:attention}shop",
            "{C:inactive}(Can destroy {C:abn_eternal}Eternal{C:inactive})",
            "{C:inactive}Joker Safety: {B:1,C:white}#1#"
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

      j_abn_napping_joker = {
        name = "Napping Joker",
        text = {
          "{C:planet}Planet{} Cards provide",
          "{C:chips}%#1#{} more Chips",
          "Transforms into {C:attention}Snoozing Joker{}",
          "after {C:attention}9{C:inactive} [#2#]{} {C:planet}Planet{} Cards",
          "used"
        }
      },

      j_abn_nasreddin = {
        name = "Nasreddin",
        text = {
          "Scored {C:attention}Lucky{} cards",
          "give {X:mult,C:white}^#1#{} Mult, {X:chips,C:white}^#2#{} Chips",
          "or {C:gold}+#3#{} Ascension Power"
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

      j_abn_nerd_joker = {
        name = "Nerd Joker",
        text = {
          {
            "If your {C:attention}scoring hand{} is an even",
            "amount of odd ranked cards,",
            "gain {C:chips}Chips{} equal to {X:blue,C:white}X#1#{}",
            "the {C:attention}sum{} of ranks",
            "{C:inactive}(Currently {C:blue}+#2#{C:inactive} Chips)",
          },
        },
      },

      j_abn_newestia = {
        name = "Newestia",
        text = {
          {
            "Scored cards give",
            "{X:chips,C:white}X#1#{} Chips, {X:mult,C:white}X#2#{} Mult",
            "and {X:gold,C:white}X#3#{} Asc. Power",
          },
          {
            "If {C:attention}Abandonia{} is owned,",
            "scored cards give", "{C:gold}+#4#{} Asc. Power",
          }
        }
      },

      j_abn_newground_joker = {
        name = "Newground Joker",
        text = {
          "This Joker gains {C:mult}+#3#{} Mult",
          "and {C:chips}+#4#{} Chips when",
          "{C:attention}Blind{} is selected",
          "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult, {C:chips}+#2#{} {C:inactive}Chips)"
        }
      },

      j_abn_nicotine_joker = {
        name = "Nicotine Joker",
        text = {
          "{C:chips}+#1#{} Chips",
          "{C:inactive}(Doubles if score catches fire)"
        }
      },

      j_abn_night_comedian = {
        name = "Night Comedian",
        text = {
          {
            "Scoring {C:attention}Enhanced{} cards gain {C:chips}+#5#{} Chips and",
            "{C:mult}+#6#{} Mult per card with the same {C:attention}Enhancement{}",
            "Scoring {C:dark_edition}Editioned{} cards gain {C:chips}+#6#{} Chips and",
            "{C:mult}+#5#{} Mult per card with the same {C:dark_edition}Edition{}",
          },
          {
            "This Joker gains {C:chips}+#4#{} Chips per scoring",
            "{C:attention}Enhanced{} card, {X:mult,C:white}X#3#{} Mult per scoring {C:dark_edition}Edition{}",
            "{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult, {C:chips}+#1# {C:inactive}Chips)",
          }
        }
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
            "Gives {X:mult,C:white} X#1# {} Mult for",
            "each {C:dark_edition}#3#{} card",
            "in your {C:attention}full deck",
            "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
          },
        },
      },

      j_abn_noir_joker = {
        name = "Noir Joker",
        text = {
          {
            "Add {C:attention}Flipped{} to all {C:spades}Dark{} suits",
            "in hand when a {C:diamonds}Light{} suit is scored",
          },
          {
            "This Joker gains {C:mult}+#3#{} Mult and",
            "{C:chips}+#4#{} Chips per scoring {C:attention}Flipped{} card",
            "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult, {C:chips}+#2#{} {C:inactive}Chips)",
          }
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

      j_abn_number_44 = {
        name = "Number 44",
        text = {
          "When {C:attention}Blind{} is selected,",
          "Create {C:attention}#1#{} Joker slots and",
          "fill them with random {C:attention}Jokers",
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

      j_abn_obmij = {
        name = "Obmij",
        text = {
          "Give {C:white,X:mult}XMult{} equal to",
          "the number of {C:attention}Jokers{} owned",
        }
      },

      j_abn_obra_dinn = {
        name = "Obra Dinn",
        text = {
          {
            "{C:diamonds}Light Suits{} give {C:mult}+1{} Mult per",
            "{C:spades}Dark Suit{} destroyed this run",
            "{C:inactive}(Currently{} {C:mult}+#1#{C:inactive})",
          },
          {
            "{C:spades}Dark Suits{} give {C:mult}+1{} Mult per",
            "{C:diamonds}Light Suit{} destroyed this run",
            "{C:inactive}(Currently{} {C:mult}+#2#{C:inactive})",
          }
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

      j_abn_oddball_todd = {
        name = "Oddball Todd",
        text = {
          "Played cards with",
          "{C:attention}odd{} rank give",
          "{C:chips}+#1#{} Chips when scored",
        },
      },

      j_abn_oddly_thomas = {
        name = "Oddly Thomas",
        text = {
          "Every played {C:attention}card{}",
          "with an {C:attention}odd{} rank",
          "permanently gains",
          "{C:chips}+#1#{} Chips when scored",
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

      j_abn_old_as_dirt = {
        name = 'Old as Dirt',
        text = {
          "This Joker gains {C:white,X:mult}X#1# {} Mult",
          "for each {C:money}$1{} below {C:red}$0{}",
          "{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)"
        }
      },

      j_abn_old_growth_joker = {
        name = "Old Growth Joker",
        text = {
          "This Joker gains {C:mult}Mult{} equal to",
          "{C:attention}triple{} the {C:attention}rank{} of scoring",
          "{C:attention}numbered{} {C:attention}Plank{} cards",
          "and {C:gold}+#3#{} Ascension Power",
          "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult,{} {C:gold}+#2#{} {C:inactive}Asc. Power){}",
        }
      },

      j_abn_old_scratch = {
        name = "Old Scratch",
        text = {
          {
            "First scoring {C:attention}#1#{} gains",
            "{C:dark_edition}Chthonian{} edition"
          },
          {
            "Scoring {C:attention}#1#s{} with {C:dark_edition}Chthonian{}",
            "edition becomes {C:attention}Darkner{} card"
          },
          {
            "{C:attention}#2#{} made of {C:attention}#1#s{}",
            "gives triple its {C:chips}Chips{} and {C:mult{}Mult"
          }
        }
      },

      j_abn_omaha_joker = {
        name = "Omaha Poker",
        text = {
          "This Joker gains {C:mult}+#2#{} Mult",
          "for {C:attention}every{} poker hand in a",
          "hand containing {C:attention}5{} scoring cards",
          "{C:inactive}(Currently {C:mult}+#1#{} {C:inactive}Mult)"
        },
      },

      j_abn_oopsy_daisy = {
        name = "Oopsy Daisy",
        text = {
          {
            "{C:attention}+#1#{} Consumable Slots, this Joker",
            "and all future Jokers are placed",
            "into your {C:attention}consumable slots{}",
          },
          {
            "If this Joker is {C:attention}sold{}",
            "or {C:attention}destroyed{}, {C:mult}destroy{} all",
            "{C:attention}Jokers{} in your {C:attention}consumable slots{}",
          },
        }
      },

      j_abn_origiri_triplets = {
        name = "Origiri Triplets",
        text = {
          "This Joker gains {C:chips}+#4#{} Chips, {C:mult}+#3#{} Mult",
          "and {C:money}$#5#{} of {C:attention}sell value{} if combined {C:attention}ranks{}",
          "in scoring hand are divisible by {C:attention}3{}",
          "{C:inactive}(ex: {C:attention}3{C:inactive}, {C:attention}6{C:inactive}, {C:attention}9{C:inactive}, {C:attention}12{C:inactive})",
          "{C:inactive}(Currently {C:chips}+#2#{} {C:inactive}Chips, {C:mult}+#1#{} {C:inactive}Mult{C:inactive}){}",
        }
      },

      j_abn_orphic_joker = {
        name = "Orphic Joker",
        text = {
          {
            "If played hand is a {C:attention}#1#{}",
            "with {C:hearts}Hearts{}, {C:diamonds}Diamonds{}, {C:spades}Spades{}, and",
            "{C:clubs}Clubs{}, upgrade level of played",
            "{C:attention}poker hand{} and gain {C:mult}+#2#{} Mult",
          },
          {
            "If played hand is a {C:attention}#1#{}",
            "with {C:abn_star}Stars{}, {C:abn_moon}Moons{}, {C:abn_crown}Crowns{}, and",
            "{C:abn_talon}Talons{}, level up the {C:planet}planet{} {C:attention}rank{} of",
            "each scoring card and gain {C:chips}+#3#{} Chips",
            "{C:inactive}(Currently {C:mult}+#4#{C:inactive} Mult, {C:chips}+#5#{C:inactive} Chips)",
          },
        }
      },

      j_abn_outdated_joker = {
        name = "Outdated Joker",
        text = {
          "This Joker gains {C:chips}+#1#{} Chips and",
          "{C:mult}+#2#{} Mult when {C:attention}Blind{} is defeated",
          "with an {C:attention}even{} number of cards",
          "{C:inactive}(Currently {C:chips}+#3#{} {C:inactive}Chips,{} {C:mult}+#4#{} {C:inactive}Mult){}",
        }
      },

      j_abn_owen = {
        name = "Owen",
        text = {
          {
            "Scored {C:abn_arrow}Arrows{} give {X:chips,C:white}X#1#{} Chips,",
            "increases by {X:chips,C:white}X#2#{} Chips",
            "when a {C:abn_arrow}Arrow{} is scored",
          },
          {
            "Scoring {C:abn_arrow}Arrows{} permanently",
            "gain {C:mult}Mult{} equal to the total",
            "{C:attention}sell value{} of all Jokers",
            "{C:inactive}(Wil gain {C:mult}+#3#{C:inactive} Mult)"
          }
        }
      },

      j_abn_paint_by_numbers = {
        name = "Paint by Numbers",
        text = {
          {
            "If the {C:attention}first hand{} is composed of",
            "only {C:attention}numbered {C:abn_suitless}Null{} cards",
            "{C:attention}retrigger{} all cards",
            "and {C:attention}level up{} the hand"
          },
          {
            "If the {C:attention}second hand{} is composed of",
            "only {C:attention}numbered{} {C:attention}non-Null{} cards",
            "{C:attention}retrigger{} all cards",
            "and {C:attention}level up{} the hand"
          },
        }
      },

      j_abn_painyatta = {
        name = "Painyatta",
        text = {
          "When a {C:attention}Voucher{} is purchased,",
          "redeem {C:attention}#1#{} random Vouchers for {C:money}free{}"
        }
      },

      j_abn_palindromic_beetle = {
        name = "Palindromic Beetle",
        text = {
          "If the {C:attention}full hand{} is a {C:attention}palindromic sequence",
          "and is composed of {C:attention}both {C:diamonds}Light{} and {C:spades}Dark{} suits,",
          "level up the {C:planet}planet{} {C:attnention}Rank{} of each {C:attention}scoring{} card by",
          "the amount of times the {C:attention}rank{} has been {C:attention}repeated{} in hand",
        }
      },

      j_abn_pandemonium_jester = {
        name = "Pandemonium Jester",
        text = {
          "Upon purchase give {C:attention}Oilfire{} {C:dark_edition}Enhancement{} to all Jokers",
          "When Blind is defeated each Joker with {C:attention}Oilfire{} {C:dark_edition}Enhancements{}",
          "gains {X:mult,C:white}X#1#{} Mult per round held",
        }
      },

      j_abn_pankert = {
        name = "Pankert",
        text = {
          "{C:white,X:chips}^#1#{} Chips",
          "if you have {C:attention}4{} or more",
          "consumables {C:attention}held{}",
        }
      },

      j_abn_paradox_chip = {
        name = "Paradox Chip",
        text = {
          "Scored {C:attention}numbered{} cards",
          "above rank {C:attention}10{}",
          "give their rank as {C:red}Mult",
        }
      },

      j_abn_parkateo = {
        name = "Parkateo",
        text = {
          "Held {C:attention}consumables{}",
          "each give {X:mult,C:white}X#1#{} Mult",
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

      j_abn_patient_zero = {
        name = "Patient Zero",
        text = {
          "When {C:attention}Blind{} is selected,",
          "apply a {C:green}beneficial{} sticker",
          "to {C:attention}rightmost{} Joker",
        }
      },

      j_abn_paywall_joker = {
        name = "Paywall Joker",
        text = {
          "{C:attention}Retrigger{} a random {C:attention}Joker{} and",
          "lose {C:money}${} equal to its {C:attention}sell value{},",
          "{C:mult}self-destructs{} if money",
          "reaches {C:money}$0{} or less",
        }
      },

      j_abn_pearls_of_worlds = {
        name = "Pearls of Worlds",
        text = {
          "Gains {C:chips}Chips{} equal to",
          "the {C:attention}sum{} of all digits",
          "in the description",
          "of the triggered {C:attention}Joker{}",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
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

      j_abn_pentomino_joker = {
        name = "Pentomino Joker",
        text = {
          {
            "Held {C:diamonds}Light{} Suit cards gain {C:chips}+#1#{} Chips",
            "when a {C:program_pack}Program{} card is used",
          },
          {
            "{C:attention}Level up{} {C:planet}planet{} {C:attention}rank{} of cards in",
            "{C:attention}first{} scoring {C:diamonds}Light Suit{} {C:attention}Straight{}",
          }
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

      j_abn_percy = {
        name = "Percy",
        text = {
          {
            "This Joker is always {C:attention}pinned{}",
            "to the {C:attention}left{} of your Jokers",
            "When a Joker {C:attention}triggers{} gain {C:chips}chips{}",
            "depending on its {C:attention}rarity{}",
            "{C:common}Common{} {C:chips}+#1#{} Chips",
            "{C:uncommon}Uncommon{} {C:chips}+#2#{} Chips",
            "{C:rare}Rare{} {C:chips}+#3#{} Chips",
            "{C:legendary}Legendary{} {C:chips}+#4#{} Chips",
          },
          {
            "If you own {C:attention}Pierre{},",
            "{C:attention}retrigger{} every Joker",
            "per owned {C:attention}rarity{}",
            "{C:inactive}(Currently{} {C:chips}+#5#{} {C:inactive}Chips)",
          }
        }
      },

      j_abn_perfidious_comedian = {
        name = "Perfidious Comedian",
        text = {
          {
            "{C:attention}Sealed{} {C:attention}even{} and {C:attention}odd{} cards",
            "{C:attention}held in hand{} count in scoring",
          },
          {
            "When a {C:attention}Sealed{} {C:attention}even{} card scores,",
            "gain its {C:attention}rank{} as {C:mult}Mult{}, if its",
            "{C:attention}odd{} gain its {C:attention}rank{} as {C:chips}Chips{}",
            "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult,{} {C:chips}+#2#{} {C:inactive}Chips){}"
          }
        }
      },

      j_abn_periodic_table = {
        name = "Periodic Table",
        text = {
          "Creates the {C:periodic}Periodic{} card",
          "for played {C:attention}poker hand{}",
          "if score {C:attention}catches on fire{}",
        }
      },

      j_abn_perrrkeo = {
        name = "Perrrkeo",
        text = {
          "Balances {C:white,X:abn_plasma}#3#%{C:inactive}",
          "of {C:mult}Mult{} and {C:chips}Chips{},",
          "Adds {C:white,X:abn_plasma}#2#%{} for every",
          "consumable {C:attention}held",
        }
      },

      j_abn_phasetransfer_joker = {
        name = "Phasetransfer Joker",
        text = {
          "Converts {C:mult}+Mult{} effects",
          "of Jokers into {C:gold}Ascension{}",
          "{C:gold}Power{} at a rate of {C:gold}X#1#"
        }
      },

      j_abn_phonechat_joker = {
        name = "Phonechat Joker",
        text = {
          "Gains {C:chips}+#3#{} Chips when Joker",
          "to the {C:attention}left{} triggers,",
          "Gains {C:mult}+#4#{} Mult when Joker",
          "to the {C:attention}right{} triggers",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, {C:mult}+#2#{C:inactive} Mult)",
        }
      },

      j_abn_photoalbum = {
        name = "Photoalbum Joker",
        text = {
          "This Joker gains {C:chips}+#2#{} Chips",
          "per {C:attention}face{} card held in hand",
          "when a {C:attention}numbered{} card scores,",
          "{s:0.8}Resets if played hand contains a {C:attention,s:0.8}face{s:0.8} card",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips){}"
        }
      },

      j_abn_photodegradation = {
        name = "Photodegredation",
        text = {
          {
            "If played hand contains a {C:attention}Spectrum{},",
            "this Joker gains {C:chips}+#4#{} Chips and {C:mult}+#5#{} Mult",
            "for each card {C:attention}held{} in hand",
            "with {C:attention}matching suits",
          },
          {
            "If this Joker has an {C:dark_edition}edition{},",
            "gain {X:mult,C:white}X#6#{} Mult for matching suits",
            "{C:inactive}(Currently{} {X:mult,C:white}X#3#{} {C:inactive}Mult,{} {C:mult}+#2#{} {C:inactive}Mult,{} {C:chips}+#1#{} {C:inactive}Chips){}"
          },
        }
      },

      j_abn_pierre = {
        name = "Pierre",
        text = {
          {
            "This Joker is always {C:attention}pinned{}",
            "to the {C:attention}right{} of your Jokers",
            "When a Joker {C:attention}triggers{} gain {C:mult}mult{}",
            "depending on its {C:attention}rarity{}:",
            "{C:common}Common{} {C:mult}+#1#{} Mult",
            "{C:uncommon}Uncommon{} {C:mult}+#2#{} Mult",
            "{C:rare}Rare{} {C:mult}+#3#{} Mult",
            "{C:legendary}Legendary{} {C:mult}+#4#{} Mult",
          },
          {
            "If you own {C:attention}Percy{},",
            "{C:attention}retrigger{} every scoring card",
            "per owned {C:attention}rarity{}",
            "{C:inactive}(Currently{} {C:mult}+#5#{} {C:inactive}Mult)",
          }
        }
      },

      j_abn_pincushion_joker = {
        name = "Pincushion Joker",
        text = {
          {
            "Retrigger the Joker to the {C:attention}left{}",
          },
          {
            "This Joker gains {X:mult,C:white}X#2#{} Mult",
            "when a {C:attention}Joker{} is retriggered",
            "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult)",
          },
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

      j_abn_planet_joker = {
        name = "Planet Joker",
        text = {
          "If {C:attention}Boss Blind{} is defeated",
          "in a {C:attention}single{} hand, upgrade",
          "every {C:legendary,E:1}poker hand",
          "by {C:attention}#1#{} level",
        }
      },

      j_abn_planet_rejok = {
        name = "Planet Rekoj",
        text = {
          "Gives {C:mult}Mult{} and {C:chips}Chips",
          "of all {C:attention}hand types{} contained",
          "within played hand"
        }
      },

      j_abn_planetarian_joker = {
        name = "Planetarian Joker",
        text = {
          {
            "When using a {C:planet}Planet{} Card,",
            "gain its Chips and Mult value",
            "{C:inactive}(Currently {C:blue}+#1#{C:inactive} and {C:red}+#2#{C:inactive})",
          },
          {
            "After using {C:attention}#3# {C:inactive}[#4#]{} unique",
            "{C:abn_tie}Rank Planet{} Cards,",
            "create a {C:spectral}Black Hole{}",
            "{C:inactive}(Must have room)",
          }
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

      j_abn_planetoid_joker = {
        name = "Planetoid Joker",
        text = {
          "Place an {C:abn_orange_seal}Orange Seal{}",
          "on leftmost scoring card",
          "on your first played {C:attention}Straight"
        },
      },

      j_abn_plank_joker = {
        name = "Plank Joker",
        text = {
          "Scoring {C:attention}Plank{} cards",
          "gain {C:gold}+#1#{} Ascension Power",
        }
      },

      j_abn_plastic_joker = {
        name = "Plastic Joker",
        text = {
          "When {C:attention}Petroleum{} cards are",
          "converted into {C:attention}Oilfire{} cards,",
          "{C:attention}level up{} the {C:planet}planet{} {C:attention}rank{}",
          "of {C:attention}lowest{} rank {C:attention}held{} in hand",
        }
      },

      j_abn_plug_in_joker = {
        name = "Plug In Joker",
        text = {
          "This Joker gains {C:mult}+#4#{} Mult when",
          "a {C:attention}Mult{} card scores, {C:chips}+#5#{} Chips",
          "when a {C:attention}Bonus{} card scores, {C:gold}+#6#{} Asc.",
          "Power when a {C:attention}Plank{} card scores",
          "{C:inactive}(Currently{} {C:mult}+#1#{C:inactive}, {C:chips}+#2#{C:inactive}, {C:gold}+#3#{} {C:inactive})",
        }
      },

      j_abn_polychameleon = {
        name = "Polychameleon",
        text = {
          {
            "{C:dark_edition}Holographic{} Jokers give {X:mult,C:white}X#1#{} Mult",
            "{C:dark_edition}Polychrome{} Jokers give {C:mult}+#2#{} Mult",
          },
          {
            "If this Joker has {C:dark_edition}Holographic{} edition,",
            "gains {X:chips,C:white}X#3#{} Chips when a {C:dark_edition}Holographic/",
            "{C:dark_edition}Polychrome{} Joker triggers",
          },
          {
            "If this Joker has {C:dark_edition}Polychrome{} edition,",
            "gains {C:chips}+#4#{} Chips when a {C:dark_edition}Polychrome/",
            "{C:dark_edition}Holographic{} Joker triggers",
            "{C:inactive}(Currently{} {X:chips,C:white}X#6#{} {C:inactive}Chips,{} {C:chips}+#5#{} {C:inactive}Chips){} ",
          },
        }
      },

      j_abn_polyolic_joker = {
        name = "Polyolic Joker",
        text = {
          {
            "All played {C:diamonds}Light Suits{}",
            "become {C:dark_edition}#3#{}",
            "when scored",
          },
          {
            "Gives {X:mult,C:white} X#1# {} Mult for",
            "each {C:dark_edition}#3#{} card",
            "in your {C:attention}full deck",
            "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
          }
        }
      },

      j_abn_pong_joker = { -- I dont know who write this way but u scare me. with love, Marffe
        name = "Pong Joker",
        text = {
          "If played {C:attention}Straight{} has only",
          "{C:spades}Dark Suits{}, this Joker gains",
          "{X:chips,C:white}X#4#{} Chips, gains {X:mult,C:white}X#3#{} Mult",
          "if {C:attention}Straight{} has only {C:diamonds}Light Suits{}",
          "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult,{} {X:chips,C:white}X#2#{} {C:inactive}Chips){}",
        }
      },

      j_abn_ponzi = {
        name = "Ponzi",
        text = {
          "Lose {C:money}$#1#{} per card played,",
          "each scoring card gains {C:mult}Mult{}",
          "equal to money {C:attention}lost{}"
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

      j_abn_portal_joker = {
        name = "Portal Joker",
        text = {
          "{C:attention}Straights{} can wrap around",
          "{C:inactive}(ex: {C:attention}Q K A 2 3{C:inactive})",
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

      j_abn_ppe_joker = {
        name = "PPE Joker",
        text = {
          "{X:mult,C:white}X#1#{} Mult for",
          "every {C:red}debuffed{} Joker",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
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

      j_abn_prehistoric_joker = {
        name = "Prehistoric Joker",
        text = {
          "This Joker gains {C:white,X:mult}X#2#{} Mult",
          "when a {C:attention}Stone Card{} scores, {C:white,X:chips}X#4#{}",
          "Chips when a {C:attention}Fossil Card{} scores",
          "{C:inactive}(Currently {C:white,X:chips}X#3#{C:inactive} Chips, {C:white,X:mult}X#1#{C:inactive} Mult)",
        }
      },

      j_abn_prenatural_joker = {
        name = "Prenatural Joker",
        text = {
          {
            "Played {C:attention}Enhanced{} {C:attention}odd{} cards",
            "give {X:chips,C:white}X#4#{} Chips when scored,",
            "increases by {X:chips,C:white}X#3#{} when",
            "a card is scored"
          },
          {
            "Played {C:attention}Odd{} cards have a",
            "{C:green}#1# in #2#{} chance to create",
            "a {C:attention}Voucher{} when scored",
          },
        }
      },

      j_abn_prime_paul = {
        name = "Prime Paul",
        text = {
          "Each played {C:attention}#1#{}, {C:attention}#2#{}, {C:attention}#3#{},",
          "{C:attention}#4#{}, {C:attention}#5#{}, or {C:attention}#6#{} gives",
          "{X:mult,C:white}X#7#{} Mult when scored"
        }
      },

      j_abn_primogeniture_joker = {
        name = "Primogeniture Joker",
        text = {
          {
            "{C:common}Common{} Jokers are {C:money}free{}",
            "and each give {X:mult,C:white} X#1# {} Mult",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "this Joker gains {C:chips}+#2#{} Chips",
            "when a {C:common}Common{} Joker triggers",
            "{C:inactive}(Currently{} {C:chips}+#3#{} {C:inactive}Chips){} ",
          }
        }
      },

      j_abn_prizefighter_inferno = {
        name = "Prizefighter Inferno",
        text = {
          "Gains {X:chips,C:white}X#3#{} Chips when a",
          "{C:attention}Tag{} triggers, gains {X:mult,C:white}X#4#{} Mult",
          "if that was {C:abn_hazard}Hazard Tag",
          "{C:inactive}(Currently {X:chips,C:white}X#1#{C:inactive} Chips, {X:mult,C:white}X#2#{C:inactive} Mult)"
        }
      },

      j_abn_prizefighter_joker = {
        name = "Prizefighter Joker",
        text = {
          {
            "If the played {C:attention}hand size{} is bigger than {C:attention}#1#{},",
            "gain {C:chips}+#2#{} Chips and {C:mult}+#3#{} Mult",
            "{C:inactive}(Currently {C:chips}+#4#{C:inactive} Chips and {C:mult}+#5#{C:inactive} Mult)"

          },
          {
            "If the played {C:attention}hand size{} is double of {C:attention}#1#{},",
            "{C:attention}double{} this Joker's {C:chips}Chips{} and {C:mult}Mult",
            "{C:inactive}(Hand size resets when beating a blind)"
          },
        }
      },

      j_abn_propagator_joker = {
        name = "Propagator Joker",
        text = {
          "Scoring cards give {X:mult,C:white}^#3#{} Mult per",
          "card with the same {C:attention}rank{} and {C:attention}suit{},",
          "{C:green}#1# in #2#{} chance to create a",
          "copy of the {C:attention}first{} scoring card",
        }
      },

      j_abn_proxy_joker = {
        name = 'Proxy Joker',
        text = {
          "If all owned Jokers are {C:dark_edition}Modded{}",
          "and a {C:dark_edition}Modded{} {C:attention}poker hand{}",
          "with only {C:dark_edition}Modded{} suits, this",
          "Joker gains {C:gold}+#1#{} Asc. Power per scoring card",
          "{C:inactive}(Currently {C:gold}+#2#{C:inactive} Asc. Power)",
        },
      },

      j_abn_psychokinesis_joker = {
        name = "Psychokinesis Joker",
        text = {
          {
            "When your {C:attention}first hand{} scores,",
            "add {C:dark_edition}Reversal{} edition",
            "to all {C:attention}Steel{} and {C:attention}Gold{}",
            "held in hand",
          },
          {
            "Played {C:dark_edition}Reversal{} cards",
            "give {C:gold}$#1#{} when scored"
          },
        }
      },

      j_abn_puddles = {
        name = "Puddles",
        text = {
          "{X:mult,C:white}X#2#{} Mult per {C:attention}Joker{} to the {C:attention}right{}",
          "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
        }
      },

      j_abn_punk_joker = {
        name = "Punk Joker",
        text = {
          {
            "Add {C:dark_edition}Negative{} edition to",
            "first scoring {C:abn_suitless}Null{} card,",
          },
          {
            "This Joker gains {C:white,X:chips}X#2#{} Mult when",
            "a {C:dark_edition}Negative{} {C:abn_suitless}Null{} card is scored",
            "{C:inactive}(Currently {C:white,X:chips}X#1#{C:inactive} Chips)",
          }
        }
      },

      j_abn_qrcode_joker = {
        name = "QR Code",
        text = {
          "Create a {C:program_pack}Program{} card",
          "when {C:attention}Blind{} is selected",
          "{C:inactive}(Must have room)",
        },
      },

      j_abn_quadratic_joker = {
        name = "Quadratic Joker",
        text = {
          {
            "{C:attention}Straights{} containing {C:attention}4{} suits gain",
            "{C:dark_edition}Editions{} from {C:attention}lowest{} to {C:attention}highest{} rank",
            "{C:inactive,s:0.8}({C:dark_edition,s:0.8}Gloss{C:inactive,s:0.8}, {C:dark_edition,s:0.8}Iridescent{C:inactive,s:0.8}, {C:dark_edition,s:0.8}Pearlescent{C:inactive,s:0.8}, {C:dark_edition,s:0.8}Chromatic{C:inactive,s:0.8})",
          },
          {
            "Cards {C:attention}held{} in hand with",
            "the same {C:attention}rank{} or {C:attention}suit{} as",
            "scoring cards count in scoring",
          },
        },
      },

      j_abn_rage_baiter = {
        name = "Rage Baiter",
        text = {
          "Decrease level of played {C:attention}poker hand{}",
          "then gain {C:chips}+#3#{} Chips and {C:red}+#4#{} Mult",
          "{C:inactive}(Currently {C:blue}+#1#{C:inactive} Chips and {C:red}+#2#{C:inactive} Mult)",
        }
      },

      j_abn_ram_joker = {
        name = "RAM Joker",
        text = {
          {
            "This Joker gains {C:white,X:mult}X#4#{} Chips",
            "when a {C:dark_edition}Modded{} consumable is sold,",
            "gains {C:white,X:mult}X#2#{} Mult when a",
            "{C:inactive}Vanilla{} consumable is sold",
            "{C:inactive}(Currently {C:white,X:mult}X#1#{} Chips, {C:white,X:mult}X#3#{C:inactive} Mult)"
          },
          {
            "When {C:attention}Big Blind{} is selected, create",
            "the last {C:ram}RAM{} card used this run",
            "{C:inactive}(Currently{} {C:ram}#5#{C:inactive})"
          }
        }
      },

      j_abn_rampegous_jester = {
        name = "Rampegous Jester",
        text = {
          {
            "If you have an {C:attention}even{} number of {C:rare}Rare{} Jokers",
            "and score an {C:attention}even{} number of cards,",
            "this Joker and all other {C:rare}Rare{} Jokers",
            "gain {X:mult,C:white}X#2#{} Mult per scoring card",
          },
          {
            "If you have an {C:attention}odd{} number of {C:common}Common{} Jokers",
            "and score an {C:attention}odd{} number of cards,",
            "this Joker and all other {C:common}Common{} Jokers",
            "gain {C:chips}+#1#{} Chips per scoring card",
          },
        },
      },

      j_abn_rando_jester = {
        name = "Rando Jester",
        text = {
          {
            "Scored {C:clubs}Clubs{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:clubs}Club{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "scoring {C:clubs}Clubs{} increase",
            "the next {C:green}probability{} by {C:attention}#3#{}",
            "{C:inactive,s:0.8}(ex: {C:green,s:0.8}1 in 4{C:inactive,s:0.8} -> {C:green,s:0.8}2 in 4{C:inactive,s:0.8} -> {C:green,s:0.8}3 in 4{C:inactive,s:0.8})",
          }
        }
      },

      j_abn_random_encounter = {
        name = "Random Encounter",
        text = {
          {
            "Gives {C:mult}+#1#{} Mult when",
            "a {C:chips}+Chips{} effect from",
            "another {C:attention}Joker{} scores"
          },
          {
            "Mult increases by {C:mult}+#2#{}",
            "when {C:attention}Blind{} is defeated"
          }
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

      j_abn_ransomware_joker = { -- to relocalise
        name = "Ransomware Joker",
        text = {
          "When certain {C:attention}consumables{} are used apply the following effects:",
          "{C:tarot}Tarot{} all Jokers gain {C:chips}+#1#{} Chips and you lose {C:money}$#2#",
          "{C:spectral}Spectral{} all Jokers gain {C:chips}+#3#{} Chips and you lose {C:money}$#4#",
          "{C:abn_calamity}Calamity{} all Jokers Chips values are multiplied by {X:chips,C:white}^#5#{} and you lose {C:money}$#6#",
          "{C:abn_snow}Weather Report{} all Jokers gain {C:mult}+#7#{} Mult and you lose {C:money}$#8#",
          "{C:astro_cards}Astro{} all Jokers gain {C:mult}+#9#{} Mult and you lose {C:money}$#10#",
          "{C:nightshift_cards}Nightshift{} all Jokers Mult values are multiplied by {X:mult,C:white}^#11#{}",
        }
      },

      j_abn_rectangular_joker = {
        name = "Rectangular Joker",
        text = {
          "This Joker gains {C:gold}+#2#{} Asc. Power",
          "if played hand has",
          "exactly {C:attention}6{} scoring cards",
          "{C:inactive}(Currently {C:gold}+#1#{C:inactive} Ascension Power)"
        }
      },

      j_abn_recycled_joker = {
        name = "Recycled Joker",
        text = {
          "{C:attention}Discarded{} cards",
          "are returned to deck"
        }
      },

      j_abn_regalia_joker = {
        name = "Regalia Joker",
        text = {
          {
            "Earn {C:money}$#1#{} if {C:attention}poker hand{} is a",
            "{C:attention}#2#{} or an {C:attention}#3#{}",
          },
          {
            "If {C:attention}poker hand{} is a {C:attention}#3#{},",
            "level up {C:planet}planet{} {C:attention}rank{} of all cards scored"
          }
        }
      },

      j_abn_reggy_jester = {
        name = "Reggy Jester",
        text = {
          {
            "Scored {C:abn_snow}Snows{} give {X:mult,C:white}X#1#{} Mult,",
            "increases by {X:mult,C:white}X#2#{} Mult",
            "when a {C:abn_snow}Snow{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "scoring {C:abn_snow}Snows{} lower",
            "{C:attention}blind requirements{} by {C:attention}#3#%{}"
          }
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

      j_abn_rereleased_special_collector_edition = {
        name = "Re-Released Special Collector Edition",
        text = {
          "If played hand contains only {C:dark_edition}Editioned{} cards,",
          "has an {C:attention}even{} number of {C:inactive}Vanilla{} and an {C:attention}odd{}",
          "number of {C:dark_edition}Modded Editions{} or vice versa,",
          "this Joker gains {C:gold}+#2#{} Asc. Power multiplied",
          "by whichever {C:dark_edition}Edition{} count is {C:attention}even{}",
          "{C:inactive}(Currently {C:gold}+#1# {C:inactive}Ascension Power)"
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

      j_abn_reversecard_joker = {
        name = "Reversecard Joker",
        text = {
          {
            "If played hand contains both",
            "{C:attention}flipped{} and {C:attention}face up{} cards,",
            "flip all scoring cards,",
          },
          {
            "Gains the {C:attention}rank{} of cards {C:attention}flipped up{} as {C:chips}Chips{},",
            "gain {C:mult}Mult{} instead for cards {C:attention}flipped over{}",
            "{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult,{} {C:chips}+#1#{} {C:inactive}Chips){}",
          },
          {
            "If this Joker is {C:attention}Flipped{},",
            "{C:attention}Flipped{} cards give double the",
            "amount of {C:chips}Chips{} and {C:mult}Mult{}",
          },
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

      j_abn_ridiculous_joker = {
        name = "Ridiculous Joker",
        text = {
          {
            "If all cards in {C:attention}played{} hand are {C:attention}even{}",
            "and all cards {C:attention}held{} in hand",
            "are {C:attention}odd{}, gain {C:mult}Mult{} equal",
            "to the rank sum of all cards"
          },
          {
            "If all cards in {C:attention}played{} hand are {C:attention}odd{}",
            "and all cards {C:attention}held{} in hand",
            "are {C:attention}even{}, gain {C:chips}Chips{} equal",
            "to the rank sum of all cards",
            "{C:inactive}(Currently {C:red}+#1#{C:inactive} Mult, {C:blue}+#2#{C:inactive} Chips)",
          },
        },
      },

      j_abn_rival_photograph = {
        name = "Rival's Photograph",
        text = {
          "First played {C:attention}numbered{}",
          "card gives {X:mult,C:white}X#1#{} Mult",
          "when scored",
        },
      },

      j_abn_robert_jester = {
        name = "Robert Jester",
        text = {
          {
            "Scored {C:clubs}Clubs{} give {X:chips,C:white}X#1#{} Chips,",
            "increases by {X:chips,C:white}X#2#{} Chips",
            "when a {C:clubs}Club{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "played {C:clubs}Clubs{} permanently",
            "gain {C:money}$#3#{} per remaining",
            "discard when scored"
          }
        }
      },

      j_abn_rom_hack_balatro = {
        name = "ROM Hack Balatro",
        text = {
          "{C:inactive}Vanilla{} Jokers each give",
          "{X:mult,C:white}X#1#{} Mult, {X:chips,C:white}X#2#{} Chips, and {C:money}$#3#{}",
        }
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
      },

      j_abn_rough_draft_joker = {
        name = "Rough Draft Joker",
        text = {
          "Scoring {C:attention}Lucky{} {C:abn_suitless}Null{} cards have a:",
          "{C:green}#1# in #2#{} chance to gain {C:chips}+#5#{} Chips,",
          "{C:green}#1# in #3#{} chance to gain {C:chips}+#6#{} Chips,",
          "{C:green}#1# in #4#{} chance to {C:attention}double{}",
          "the {C:chips}chips{} of all scoring cards",
        }
      },

      j_abn_royal_order = {
        name = "Royal Order",
        text = {
          "If scoring cards are in the following order",
          "{C:hearts}Heart{}, {C:diamonds}Diamond{}, {C:clubs}Club{}, {C:spades}Spade{}",
          "upgrade level of played hand by",
          "{C:attention}#1#{} and give {X:mult,C:white}X#2#{} Mult",
        }
      },

      j_abn_rubicante = {
        name = "Rubicante",
        text = {
          "{C:attention}Even{} scoring cards give {C:mult}Mult{}",
          "equal to {C:attention}triple{} their rank",
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

      j_abn_ruinous_joker = {
        name = "Ruinous Joker",
        text = {
          {
            "{C:attention}+#1#{} Ruinous Power slot",
          },
          {
            "If a {C:ruinous_power}Ruinous Power{} would",
            "cause you to {C:red}lose a run{},",
            "{C:mult}Destroy{} this Joker instead",
          }
        }
      },
      j_abn_runedelta = {
        name = "Runedelta",
        text = {
          "This Joker gains {C:mult}+#3#{} Mult if",
          "{C:attention}winning hand{} only contains {C:spades}Dark Suits{},",
          "gains {C:chips}+#4#{} Chips if it only contains {C:diamonds}Light Suits{}",
          "{C:red,s:0.8}self-destructs if hand contains light and dark suits ",
          "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult,{} {C:chips}+#2#{} {C:inactive}Chips){}",
        }
      },

      j_abn_runedelta_disc2 = {
        name = "Runedelta Disc 2",
        text = {
          {
            "The first scoring {C:dark_edition}Editioned{} {C:inactive}(rank){} card",
            "retriggers once for each Joker",
            "with the same {C:dark_edition}Edition{}, this Joker",
            "gains {C:inactive}(reward){} per retrigger",
          },
          {
            "{C:inactive}(ex: rank: reward)",
            "{C:attention}Even{}: {X:mult,C:white}X#3#{} Mult",
            "{C:attention}Odd{}: {X:chips,C:white}X#4#{} Chips",
            "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult, {X:chips,C:white}X#2#{} {C:inactive}Chips){}"
          },
          {
            "If this Joker has an {C:dark_edition}Edition{},",
            "{C:dark_edition}Editioned{} {C:attention}Jokers{} cannot be {C:red}debuffed{}",
          }
        }
      },

      j_abn_russian_roulette = {
        name = "Russian Roulette",
        text = {
          {
            "All {C:attention}Booster Packs{} cost {C:money}$1{}",
            "but {C:attention}consumables{} have a",
            "{C:green}#1# in #2#{} chance to {C:mult}fail{}",
          },
          {
            "All {C:attention}Jokers{} cost {C:money}$1{}, and",
            "become {C:mult}Fragile{} upon purchase",
          },
          {
            "When a {C:green}probability{}",
            "{C:attention}succeeds{}, earn {C:money}$#3#{}",
          }
        }
      },

      j_abn_sacred_bleu = {
        name = 'Sacred Bleu',
        text = {
          "This Joker gains {C:white,X:chips}X#2#{} Chips",
          "per unique {C:attention}suit{}, {C:chips}+#4#{} Chips per",
          "unique {C:attention}rank{} in played hand",
          "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips, {C:white,X:chips}X#1#{} {C:inactive}Chips)",
        },
      },

      j_abn_sacred_rouge = {
        name = 'Sacred Rouge',
        text = {
          "This Joker gains {C:white,X:mult}X#2#{} Mult",
          "per unique {C:attention}suit{}, {C:mult}+#4#{} Mult per",
          "unique {C:attention}rank{} in played hand",
          "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult, {C:white,X:mult}X#1#{} {C:inactive}Mult)",
        }
      },

      j_abn_sailor_joker = {
        name = "Sailor Joker",
        text = {
          {
            "{C:attention}Odd{} cards give",
            "{C:chips}+#1#{} Chips when",
            "played and unscored"
          },
          {
            "Retrigger all",
            "played {C:attention}Ocean{} cards",
          }
        }
      },

      j_abn_salvation_tag = {
        name = "Salvation Tag",
        text = {
          "Whenever a {C:inactive}Vanilla{} Tag is obtained",
          "Convert it into it's {C:abn_hazard}Hazard{} variant",
        }
      },

      j_abn_sanguine_treasure = {
        name = "Sanguine Treasure",
        text = {
          "Scoring {C:attention}Gold{} cards give",
          "double their {C:chips}Chips{} and {C:money}money",
        },
      },

      j_abn_saturated_joker = {
        name = "Saturated Joker",
        text = {
          {
            "Played {C:abn_coin}Coins{},{C:abn_baton} Batons{},",
            "{C:abn_chalice}Chalices{}, and {C:abn_sword}Swords{}",
            "permanently gain {C:mult}+#1#{} Mult",
            "when scored",
          },
          {
            "This Joker gains {C:chips}#2#{} Chips",
            "per scoring card",
            "with {C:dark_edition}Vintage{} edition",
            "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)",
          },
        },
      },

      j_abn_savy_joker = {
        name = "Savy Joker",
        text = {
          "{C:mult}+#1#{} Mult if played",
          "hand contains",
          "{C:attention}#2# Even{} cards",
        }
      },

      j_abn_scantron_joker = {
        name = "Scantron Joker",
        text = {
          "Scoring {C:attention}Lucky{} or {C:attention}Gold{} cards",
          "give {X:chips,C:white}^#1#{} Chips, scoring",
          "{C:attention}Bonus{} or {C:attention}Wild{} cards",
          "give {X:mult,C:white}^#2#{} Mult",
        }
      },

      j_abn_scrabble_joker = {
        name = "Scrabble Joker",
        text = {
          "This Joker gains",
          "{X:mult,C:white}X#2#{} Mult every time",
          "a {C:lexica}Lexica{} card is activated",
          "{C:red}Resets{} if a {C:lexica}Lexica{} card is sold",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
        },
      },

      j_abn_scrapbook_joker = {
        name = "Scrapbook Joker",
        text = {
          {
            "When {C:attention}Blind{} is selected,",
            "each {C:attention}Joker{} gains {C:chips}+#1#{} Chips",
            "per applied {C:attention}Sticker"
          },
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

      j_abn_seal_letter = {
        name = "Seal Letter",
        text = {
          "Retrigger all played",
          "cards with {C:red}Red Seals{}",
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

      j_abn_sherlock_joker = {
        name = "Sherlock Joker",
        text = {
          {
            "Reveals the name of a",
            "selected {C:attention}flipped{} card",
            "{C:inactive}(#1#){}",
          },
          {
            "Reveals the next card",
            "to be {C:attention}drawn",
            "{C:inactive}(#2#){}",
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

      j_abn_shrewd_joker = {
        name = "Shrewd Joker",
        text = {
          "{C:chips}+#1#{} Chips if played",
          "hand contains",
          "{C:attention}#2# Odd{} cards",
        }
      },

      j_abn_shy_gall = {
        name = "Shy Gall",
        text = {
          "If played hand contains only",
          "{C:attention}Flipped{} cards, upgrade level",
          "of played {C:attention}poker hand{}"
        }
      },

      j_abn_sigil_joker = {
        name = "Sigil Joker",
        text = {
          {
            "When {C:attention}Boss Blind{} is selected,",
            "create a {C:sigils}Sigil{} for",
            "the {C:attention}last played{} hand",
          },
          {
            "{C:sigils}Sigil Packs{} can be skipped",
          }
        }
      },

      j_abn_skinny_joker = {
        name = "Skinny Joker",
        text = {
          "Gains {C:chips}+#3#{} Chips and {C:mult}+#4#{} Mult",
          "when {C:attention}Blind{} is selected with",
          "no consumables {C:attention}held",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips and {C:mult}+#2#{C:inactive} Mult)"
        }
      },

      j_abn_slippery_joker = {
        name = "Slippery Joker",
        text = {
          {
            "When a {C:weather_report}Weather Report{} is used,",
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
            "{C:attention}#2#{}, retrigger",
            "and level up hand",
          },
        }
      },

      j_abn_sloth = {
        name = "Sloth",
        text = {
          {
            "All eligible {C:attention}Jokers{} become",
            "{C:abn_eternal}Eternal{} upon purchase"
          },
          {

            "{X:mult,C:white}X#1#{} Mult on {C:attention}final hand{} of round,",
            "increases by {X:mult,C:white}X#2#{} for every",
            "unique {C:attention}poker hand{} played this run",
          }
        },
      },

      j_abn_snoozing_joker = {
        name = "Snoozing Joker",
        text = {
          "{C:planet}Planet{} Cards provide",
          "{C:red}%#1#{} more Mult",
        }
      },

      j_abn_snow_comedian = {
        name = "Snow Comedian",
        text = {
          {
            "This Joker gains {C:mult}+#3#{} Mult if played",
            "hand contains {C:attention}Even{} {C:abn_snow}Snow{} cards,",
            "gains {C:chips}+#4#{} Chips if played hand",
            "contains {C:attention}Odd{} {C:abn_snow}Snow{} cards",
            "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult,{} {C:chips}+#2#{} {C:inactive}Chips){}"
          },
          {
            "If played hand contains a {C:attention}Flush{},",
            "containing only {C:abn_snow}Snow{} cards, level up",
            "{C:planet}planet{} {C:attention}rank{} of all scoring cards",
          },
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

      j_abn_spanish_joker = {
        name = "Spanish Joker",
        text = {
          {
            "{s:0.8}Scoring {C:hearts,s:0.8}Hearts{s:0.8} become {C:abn_coin,s:0.8}Coins{}",
            "{s:0.8}Scoring {C:diamonds,s:0.8}Diamonds{s:0.8} become {C:abn_baton,s:0.8}Batons{}",
            "{s:0.8}Scoring {C:clubs,s:0.8}Clubs{s:0.8} become {C:abn_chalice,s:0.8}Chalices{}",
            "{s:0.8}Scoring {C:spades,s:0.8}Spades{s:0.8} become {C:abn_sword,s:0.8}Swords{}",
          },
          {
            "If this Joker has {C:dark_edition}Vintage{} edition,",
            "gain {C:mult}+#2#{} Mult per scoring ",
            "{C:abn_coin}Coin{}, {C:abn_baton}Baton{}, {C:abn_chalice}Chalice{} or {C:abn_sword}Sword{}",
            "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult)",
          },
        }
      },

      j_abn_spare_bikini = {
        name = "Spare Bikini",
        text = {
          "This Joker gains {C:mult}+#2#{} Mult and",
          "{C:chips}+#7#{} Chips if played hand contains",
          "a {C:attention}#3#{}, gains {C:gold}+#5#{}",
          "Asc. Power if hand contains",
          "{C:attention}5{} unique {C:attention}suits{}",
          "{C:inactive}(Currently {C:chips}+#6#{C:inactive}, {C:mult}+#1#{C:inactive}, {C:gold}+#4#{C:inactive})"
        }
      },

      j_abn_spare_coat = {
        name = "Spare Coat",
        text = {
          {
            "This Joker gains {C:chips}+#6#{} Chips",
            "and {C:mult}+#2#{} Mult if played hand",
            "contains a {C:attention}#3#{}",
            "{C:inactive}(Currently {C:chips}+#5#{C:inactive}, {C:mult}+#1#{C:inactive})"
          },
          {
            "If hand containing a",
            "{C:attention}#3#{} has",
            "at least one {C:abn_snow}Snow{},",
            "{C:abn_snow}Snows{} held in hand",
            "each gain {C:purple}+#4#{} Score",
          }
        }
      },

      j_abn_spare_overall = {
        name = "Spare Overalls",
        text = {
          {
            "This Joker gains {C:red}+#1#{} Mult",
            "if played hand contains",
            "a {C:attention}#2#{}",
            "{C:inactive}(Currently {C:red}+#3#{C:inactive} Mult)",
          },
          {
            "{C:attention}Odd Bonus{} cards permanently",
            "gain {C:chips}+#4#{} Chips when scored,",
            "{C:attention}Even Mult{} cards permanently",
            "gain {C:mult}+#5#{} Mult when scored"
          }
        }
      },

      j_abn_spare_suit = {
        name = "Spare Suit",
        text = {
          "This Joker gains {C:mult}+#2#{} Mult if",
          "played hand contains a {C:attention}#3#{},",
          "Retrigger played {C:attention}Mercurial Cards{}",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
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
          {
            "If this Joker has {C:dark_edition}Negative{} edition",
            "and score {C:attention}catches on fire{},",
            "all cards {C:attention}held{} in hand",
            "become {C:dark_edition}Negative{}",
          }
        }
      },

      j_abn_spice_melange = {
        name = "Spice Melange",
        text = {
          "Retrigger Joker to the {C:attention}left{}",
          "for the next {C:attention}#1#{} hands"
        }
      },

      j_abn_spihcneve = {
        name = 'Spihcneve Joker',
        text = {
          {
            "When a {C:attention}Mult{} card scores,",
            "scoring non-{C:attention}Mult{} cards",
            "permanently gain {C:chips}+#1#{} Chips",
          },
          {
            "When an {C:attention}Even {C:attention}Mult{} card scores,",
            "scoring {C:attention}Odd{} non-{C:attention}Mult{} cards cards",
            "permanently gain {C:mult}+#2#{} Mult",
          }
        },
        --[[unlock = {
        "Enhance an {C:attention}even-ranked{} card",
        "into a {C:mult}Mult card{}"
        }--]]
      },

      j_abn_spilling_salt = {
        name = "Spilling Salt",
        text = {
          "Scored {C:red}debuffed{} cards",
          "increase their {C:planet}planet{} {C:attention}rank{}",
          "by {C:attention}1"
        },
      },

      j_abn_spitting_imagine = {
        name = "Spitting Imagine",
        text = {
          "Gains {C:mult}Mult{} or {C:chips}Chips{} whenever",
          "you copy a card with an {C:mult}even",
          "or {C:chips}odd{} rank, respectively",
          "{C:inactive}(Currently {C:mult}+#1# {C:inactive}Mult, {C:chips}+#2# {C:inactive}Chips)"
        }
      },

      j_abn_sponge_joker = {
        name = "Sponge Joker",
        text = {
          "Scored {C:diamonds}Light Suit{} {C:attention}Bubble{} cards gains {C:mult}+#1#{} Mult",
          "Scored {C:spades}Dark Suit{} {C:attention}Bubble{} cards gains {C:chips}+#2#{} Chips"
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

      j_abn_statue_joker = {
        name = "Statue Joker",
        text = {
          {
            "This Joker gains {C:mult}+#2#{} Mult",
            "per {C:attention}Rankless{} card scored",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
          },
          {
            "Add {C:dark_edition}Collodion{} edition to",
            "scoring {C:attention}Petroleum{} cards,",
            "{C:dark_edition}Petroleum{} to {C:attention}Stone{} cards,",
            "{C:dark_edition}Gloss{} to {C:attention}Polkadot{} cards,",
            "{C:dark_edition}Abandoned{} to {C:attention}Oilfire{} cards",
          }
        }
      },

      j_abn_steel_bonus = {
        name = "Steel Bonus",
        text = {
          {
            "If played hand contains both a {C:attention}Steel{}",
            "and {C:attention}Bonus{} card, they each gain",
            "{C:gold}+#1#{} Asc. Power and {C:purple}+#2#{} Score",
          },
          {
            "{C:enhanced}Steel{} {C:attention}Jokers{} gain {X:mult,C:white}X#3#{} Mult, {C:enhanced}Bonus{}",
            "{C:attention}Jokers{} gain {X:chips,C:white}X#4#{} Chips when triggered"
          },
          {
            "When {C:attention}Big Blind{} is selected, create",
            "the last {C:crimson}Crimson{} card used this run",
            "{C:inactive}(Currently{} {C:crimson}#5#{C:inactive})"
          }
        }
      },

      j_abn_steel_gold = {
        name = "Steel Gold",
        text = {
          {
            "If played hand contains both a {C:attention}Steel{}",
            "and {C:attention}Gold{} card, they each gain",
            "{C:gold}+#1#{} Asc. Power and {C:purple}+#2#{} Score",
          },
          {
            "{C:enhanced}Steel{} {C:attention}Jokers{} gain {X:mult,C:white}X#3#{} Mult, {C:enhanced}Gold{}",
            "{C:attention}Jokers{} gain {X:chips,C:white}X#4#{} Chips when triggered"
          },
          {
            "When {C:attention}Big Blind{} is selected, create",
            "the last {C:periodic}Periodic{} card used this run",
            "{C:inactive}(Currently{} {C:periodic}#5#{C:inactive})"
          }
        }
      },

      j_abn_stereogram = {
        name = "Stereogram",
        text = {
          "Scoring {C:attention}numbered{} cards",
          "Balance {C:white,X:abn_plasma}#1#%{} of {C:chips}Chips{} and {C:mult}Mult{}"
        }
      },

      j_abn_sticky_fingers = {
        name = "Sticky Fingers",
        text = {
          "{C:tarot}Tarot{}, {C:planet}Planet{} and {C:spectral}Spectral{} cards",
          "can be {C:attention}saved{} from {C:attention}Booster packs"
        }
      },

      j_abn_stiff_drink = {
        name = "Stiff Drink",
        text = {
          {
            "When defeating a {C:attention}Blind{} for",
            "the {C:attention}first time{}, repeat it",
            "{C:attention}instead{} of advancing to the {C:attention}next Blind{}",
          },
          {
            "All {C:chips}hands{} and {C:mult}discards{}",
            "are considered the {C:attention}first{}",
            "and {C:attention}last{} of round",
          },
        }
      },

      j_abn_stone_bonus = {
        name = "Stone Bonus",
        text = {
          {
            "If played hand contains both a {C:attention}Stone{}",
            "and {C:attention}Bonus{} card, they each gain",
            "{C:gold}+#1#{} Asc. Power and {C:purple}+#2#{} Score",
          },
          {
            "{C:enhanced}Stone{} {C:attention}Jokers{} gain {X:mult,C:white}X#3#{} Mult, {C:enhanced}Bonus{}",
            "{C:attention}Jokers{} gain {X:chips,C:white}X#4#{} Chips when triggered"
          },
          {
            "When {C:attention}Big Blind{} is selected, create",
            "the last {C:lexica}Lexica{} card used this run",
            "{C:inactive}Currently:{} {C:lexica}#5#{}"
          }
        }
      },

      j_abn_stone_calendar = {
        name = "Stone Calendar",
        text = {
          {
            "{C:attention}Stone{} and {C:attention}Petroleum Cards{}",
            "retain their ranks and suit",
          },
          {
            "If your hand is composed of {C:attention}Stone Cards{}",
            "with at least {C:attention}4{} different suits,",
            "gain {X:chips,C:white}X#1#{} Chips",
            "{C:inactive}(Currently {X:blue,C:white}X#2#{C:inactive} Chips)",
          },
          {
            "{C:attention}Petroleum Cards{} have a {C:green}#3# in #4#{} chance",
            "to create an {C:astro_cards}Astro Card{} when triggered",
            "{C:inactive}(Must have room)",
          },
          {
            "Playing at least {C:attention}2{} odd {C:attention}Stone Cards{} and",
            "{C:attention}2{} even {C:attention}Petroleum Cards{} guarantees",
            "{C:astro_cards}Astro Card{} creation until the next {C:attention}Blind",
          },
        },
      },

      j_abn_stone_gold = {
        name = "Stone Gold",
        text = {
          {
            "If played hand contains both a {C:attention}Stone{}",
            "and {C:attention}Gold{} card, they each gain",
            "{C:gold}+#1#{} Asc. Power and {C:purple}+#2#{} Score",
          },
          {
            "{C:enhanced}Stone{} {C:attention}Jokers{} gain {X:mult,C:white}X#3#{} Mult, {C:enhanced}Gold{}",
            "{C:attention}Jokers{} gain {X:chips,C:white}X#4#{} Chips when triggered"
          },
          {
            "When {C:attention}Big Blind{} is selected, create",
            "the last {C:solid_state}Solid State{} card used this run",
            "{C:inactive}Currently:{} {C:solid_state}#5#{}"
          }
        }
      },

      j_abn_stone_mult = {
        name = "Stone Mult",
        text = {
          {
            "If played hand contains both a {C:attention}Stone{}",
            "and {C:attention}Mult{} card, they each gain",
            "{C:gold}+#1#{} Asc. Power and {C:purple}+#2#{} Score",
          },
          {
            "{C:enhanced}Stone{} {C:attention}Jokers{} gain {X:mult,C:white}X#3#{} Mult, {C:enhanced}Mult{}",
            "{C:attention}Jokers{} gain {X:chips,C:white}X#4#{} Chips when triggered"
          },
          {
            "When {C:attention}Big Blind{} is selected, create",
            "the last {C:algebraic}Algebraic{} card used this run",
            "{C:inactive}Currently:{} {C:algebraic}#5#{}"
          }
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

      j_abn_streetart_joker = {
        name = "Streetart Joker",
        text = {
          "Stone Cards retain their",
          "{C:attention}rank{} and {C:attention}suit{}",
        }
      },

      j_abn_strickland_joker = {
        name = "Strickland Joker",
        text = {
          "Gain {C:red}+#1#{} Mult per card played,",
          "resets if the score {C:attention}catches fire",
          "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)"
        }
      },

      j_abn_stuntdouble = {
        name = "Stunt Double",
        text = {
          {
            "{C:mult}+#1#{} Mult,",
            "{C:attention}-#2#{} hand size",
          },
          {
            "If {C:attention}Stuntman{} is owned,",
            "gain {C:attention}+#3#{} hand size",
          },
        },
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

      j_abn_suit_eradication = {
        name = "Suit Eradication",
        text = {
          {
            "Destroy each {C:hearts}Hearts{}, {C:diamonds}Diamonds{},",
            "{C:spades}Spades{}, and {C:clubs}Clubs{} scored, gain {C:chips}Chips{}",
            "equal to the {C:attention}ranks{} of destroyed cards",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
          },
          {
            "Create a random card with the",
            "same {C:attention}rank{} as destroyed card",
            "with either {V:1}Snow{}, {V:2}Tie{},",
            "{V:3}Penumbra{} or {V:4}Bow{} suit",
          },
        }
      },

      j_abn_suit_seal_joker = {
        name = "Suit Seal Joker",
        text = {
          {
            "If played hand has {C:attention}4{} unique {C:attention}suits{},",
            "add a {C:abn_violet_seal}Violet Seal{} to all",
            "{C:spades}Dark Suits{} without seals,",
            "add a {C:abn_brown_seal}Brown Seal{} to all",
            "{C:diamonds}Light Suits{} without seals",
          },
          {
            "This Joker gains {C:chips}+#4#{} Chips and {C:mult}+#3#{} Mult",
            "per played {C:diamonds}Light Suit{} with a {C:attention}seal{},",
            "gains {C:chips}+#3#{} Chips and {C:mult}+#4#{} Mult per",
            "played {C:spades}Dark Suit{} with a {C:attention}seal{}",
            "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult,{} {C:chips}+#2#{} {C:inactive}Chips){}",
          },
        }
      },

      j_abn_super_eight = {
        name = "Super Eight",
        text = {
          {
            "{C:attention}8{}s cannot be {C:mult}debuffed{}",
            "and are considered every {C:inactive}Vanilla{} Suit",
          },
          {
            "Gain {C:mult}Mult{} equal to {C:attention}double{}",
            "the {C:attention}rank{} of Scoring {C:attention}8{}s",
            "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult){}",
          },
          {
            "If no {C:attention}8{}s score, {C:mult}destroy{} this Joker",
          }
        }
      },

      j_abn_superhero = {
        name = "Superhero",
        text = {
          {
            "Each played {C:attention}flipped numbered{} card",
            "becomes {C:attention}unflipped{} and gives",
            "their rank as {C:mult}Mult{} when scored",
          },
          {
            "If played hand contains a {C:attention}#1#{}",
            "containing only {C:attention}face down{} cards,",
            "create a {C:dark_edition}Negative{} copy of this Joker"
          }
        }
      },

      j_abn_supermember_card = {
        name = "Supermember Card",
        text = {
          "Jokers give their {C:attention}sell value{}",
          "as {C:mult}Mult",
        }
      },

      j_abn_suspicious_icon = {
        name = "Suspicious Icon",
        text = {
          "When {C:attention}Blind{} is selected,",
          "{C:mult}Destroy{} {C:attention}#1#{} non-{C:abn_plagued}Plagued{} Joker",
          "and create {C:attention}#1#{} {C:abn_plagued}Plagued{} Joker",
        }
      },

      j_abn_swag_voucher = {
        name = "Swag Voucher",
        text = {
          "Gain {X:red,C:white}X#1#{} Mult and {X:blue,C:white}X#2#{} Chips",
          "per {C:attention}Voucher{} redeemed",
          "{C:inactive}(Currently {X:red,C:white}X#3#{C:inactive} Mult,{} {X:blue,C:white}X#4#{C:inactive} Chips){}",
        }
      },
      j_abn_sweepstakes_card = {
        name = "Sweepstakes Card",
        text = {
          {
            "All items in the shop",
            "are {C:attention}#1#%{} off",
          },
          {
            "{C:dark_edition}Modded{} Jokers",
            "cost {C:money}$1{}",
          }
        }
      },

      j_abn_symbol_of_peace = {
        name = "Symbol Of Peace",
        text = {
          "{C:enhanced}+#1#{} selection limit,",
          "{C:blue}+#1#{} hand, {C:red}+#1#{} discard,",
          "{C:attention}+#1#{} Joker slot,",
          "{C:tarot}+#1#{} Consumable slot,",
          "{C:attention}+#1#{} Voucher in shop,",
          "{C:tarot}+#1#{} Booster Pack in shop,",
          "{C:red}disables{} the {C:attention}Boss Blind{}",
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

      j_abn_syntha_joker = {
        name = "Syntha Joker",
        text = {
          "{C:red}+#1#{} Mult per {C:lexica}Lexica{}",
          "card activated this run",
          "{C:inactive}(Currently {C:red}+#2#{C:inactive})",
        }
      },

      j_abn_tag_collector = {
        name = "Tag Collector",
        text = {
          "{C:attention}Tags{} can be purchased",
          "in the shop for {C:money}$#2#",
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

      j_abn_talstaff = {
        name = "Talstaff",
        text = {
          "{X:mult,C:white}X#2#{} Mult per {C:attention}Joker{} to the {C:attention}left{}",
          "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
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

      j_abn_telisyndrome_joker = {
        name = "Telisyndrome Joker",
        text = {
          {
            "{X:chips,C:white}^#1#{} Chips per unique",
            "{C:attention}Enhancement{} in scoring hand",
          },
          {
            "{C:abn_plagued}Plagued{} Jokers each give",
            "{C:mult}+#2#{} Mult per {C:attention}unique{} {C:dark_edition}Edition{}",
            "among your {C:attention}Jokers{}"
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

      j_abn_tesseract_joker = {
        name = "Tesseract Joker",
        text = {
          {
            "When {C:attention}Boss Blind{} defeated,",
            "place {C:attention}rightmost{} Joker in",
            "your {C:attention}consumable slots{}",
          },
          {
            "{C:attention}+1{} consumable slot per unique",
            "Joker rarity in {C:attention}Consumables{}",
          },
        }
      },

      j_abn_test_crash_dummy = {
        name = "Test Crash Dummy",
        text = {
          {
            "Enhance all scoring cards in",
            "first {C:attention}Pair{} of round",
            "into {C:attention}Hazard{} cards"
          },
          {
            "When a {C:attention}Hazard{} card scores,",
            "{C:mult}destroy{} it and gain its {C:attention}rank{} as {C:chips}Chips{}",
            "{C:inactive}(Currently {C:chips}+#1#{} {C:inactive}Chips){}",
          }
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

      j_abn_that_one_evenly_split = {
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

      j_abn_the_contrarian = {
        name = "The Contrarian",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult per",
          "{C:red}Debuffed{} card scored",
        },
      },

      j_abn_the_feast = {
        name = "The Feast",
        text = {
          {
            "Upon purchasing a {C:attention}Food{} Joker,",
            "create a {C:dark_edition}Negative{} copy of it",
          },
          {
            "When a {C:attention}Food{} Joker is {C:gold}sold{},",
            "gain {X:red,C:white}X#1#{} Mult per round that",
            "{C:attention}Food{} Joker has been held",
          },
          {
            "If it is destroyed instead,",
            "gain {X:blue,C:white}X#2#{} Chips per round that",
            "{C:attention}Food{} Joker has been held",
            "{C:inactive}(Currently {X:red,C:white}X#3#{C:inactive} Mult, {X:blue,C:white}X#4#{C:inactive} Chips)",
            "{C:inactive,s:0.8}(Rounds are tracked from owning this joker)"
          },
        }
      },

      j_abn_the_great_gig_in_the_sky = {
        name = "The Great Gig In The Sky",
        text = {
          {
            "If played {C:attention}Spectrum{} contains ",
            "no {C:inactive}Vanilla{} suits, this Joker",
            "gains {C:gold}+#2#{} Ascension Power",
            "{C:inactive}(Currently {C:gold}+#1#{C:inactive} Asc. Power)",
          },
          {
            "If this {C:attention}Joker{} has an {C:dark_edition}edition{},",
            "scored cards gain",
            "{C:gold}+#3#{} Asc. Power",
          }
        }
      },

      j_abn_the_joker = {
        name = "The Joker",
        text = {
          "Scored cards reduce",
          "{C:attention}blind requirement{} by {C:attention}10%{}",
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

      j_abn_the_mule = {
        name = "The Mule",
        text = {
          "{C:chips}+#1#{} Chips,",
          "{C:red}-#2#{} chips for",
          "each {C:money}$1{} you have",
          "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)",
        }
      },

      j_abn_tier_list = {
        name = "Tier List",
        text = {
          {
            "This Joker gains bonuses based on",
            "the {C:attention}rarity{} of {C:attention}last obtained{} Joker:",
            "{C:inactive}Last rarity: {C:attention}#11#{}",
            "{C:inactive,s:0.8}(Currently {C:attention,s:0.8}#5#{s:0.8} {C:inactive,s:0.8}Retriggers, {X:mult,C:white,s:0.8}X#3#{C:inactive,s:0.8}, {C:mult,s:0.8}+#2#{C:inactive,s:0.8}, {X:chips,C:white,s:0.8}X#4#{C:inactive,s:0.8}, {C:chips,s:0.8}+#1#{C:inactive,s:0.8})",
          },
          {
            "{C:common,s:0.8}Common{s:0.8}: {C:chips,s:0.8}+#6#{s:0.8} Chips",
            "{C:uncommon,s:0.8}Uncommon{s:0.8}: {C:mult,s:0.8}+#7#{s:0.8} Mult",
            "{C:rare,s:0.8}Rare{s:0.8}: {X:mult,C:white,s:0.8}+X#8#{s:0.8} Mult",
            "{C:abn_superrare,s:0.8}Super Rare: {X:chips,C:white,s:0.8}+X#9#{s:0.8} Chips ",
            "{C:purple,s:0.8}Parallel Rare: {C:attention,s:0.8}+#10#{s:0.8} Retriggers",
            "{C:legendary,s:0.8}Legendary{s:0.8}: Double all values",
          },
        }
      },

      j_abn_tiktoker_joker = {
        name = "Tiktoker Joker",
        text = {
          "Scoring {C:spades}non-Hearts{}",
          "gain {C:mult}+#1#{} Mult",
          "for each scoring {C:hearts}Hearts{}"
        }
      },

      j_abn_till_joker = {
        name = "Till Joker",
        text = {
          "Add a {C:abn_grey_seal}Grey Seal{} to first {C:attention}numbered{} card",
          "of {C:attention}first hand{} of round, add a",
          "{C:gold}Gold Seal{} to first {C:attention}numbered{} card",
          "of {C:attention}final hand{} of round",
        },
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

      j_abn_tiny_waldo = {
        name = "Tiny Waldo",
        text = {
          "{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult",
          "when scoring hand compose of",
          "{C:attention}#3#{} modded Ranks and {C:attention}#4#{} vanilla ranks"
        }
      },

      j_abn_tlumddo = {
        name = "Tlumddo Joker",
        text = {
          {
            "When a {C:attention}Bonus Card{} is scored,",
            "all non-{C:attention}Bonus{} cards in scoring",
            "hand permanently gain {C:mult}+#1#{} Mult",
          },
          {
            "When an {C:attention}odd Bonus Card{} is scored,",
            "all non-{C:attention}Bonus{} cards in scoring",
            "hand permanently gain {C:chips}+#2#{} Chips"
          }
        },
        unlock = {
          "Have the {C:attention,E:1}Bonus{} Enhancement",
          "on an odd numbered card"
        }
      },

      j_abn_tochic = { -- Chicot backwards
        name = "Tocihc",
        text = {
          "When {C:attention}Blind{} is selected,",
          "reduce {C:attention}blind requirements{} by {C:attention}#1#%{}",
          "for each {C:attention}Joker{} card",
          "{C:inactive}(Currently{} {C:attention}#2#%{C:inactive})",
        }
      },

      j_abn_tom = {
        name = "Tom",
        text = {
          "Retrigger {C:attention}last{} scoring card",
          "once per remaining {C:attention}hand",
        }
      },

      j_abn_topsy_turvy_joker = {
        name = "Topsy Turvy Joker",
        text = {
          {
            "When a {C:dark_edition}Reversal{} card scores,",
            "this joker gains {C:mult}Mult{} equal",
            "to however much {C:mult}Mult{} was",
            "gained from the swap, if any",
            "{C:inactive}(Currently {C:mult}+#1# {C:inactive}Mult)"
          },
          {
            "If this joker has {C:dark_edition}Reversal{},",
            "whenever {C:mult}Mult{} increases as a",
            "result of {C:dark_edition}Reversal{}, that",
            "increase will be boosted by {C:mult}X#2#"
          }
        }
      },

      j_abn_totally_naked = {
        name = "Totally Naked",
        text = {
          "Scored {C:attention}unenhanced{}",
          "cards give {C:mult}+#1#{} Mult",
          "and {C:chips}+#2#{} Chips"
        },
      },

      j_abn_towser = {
        name = "Towser",
        text = {
          {
            "This Joker gains",
            "{X:chips,C:white}^#2#{} Chips every time",
            "a {C:spectral}Spectral{} card is used",
            "{C:inactive}(Currently {X:chips,C:white}^#1#{} {C:inactive}Chips)",
          },
          {
            "Each {C:attention}shop{} always contains",
            "a {C:attention}Mega Spectral Pack"
          }
        }
      },

      j_abn_trans_joker = {
        name = "Trans Joker",
        text = {
          "When a card changes {C:attention}suit{},",
          "level up its {C:planet}planet{} {C:attention}rank{}",
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

      j_abn_trevulit = {
        name = "Trevulit",
        text = {
          "{C:attention}Odd{} scoring cards give {C:mult}Mult{}",
          "equal to {C:attention}triple{} their rank",
        }
      },

      j_abn_tri_tag = {
        name = "Tri Tag",
        text = {
          "Whenever a {C:inactive}Vanilla{} tag is obtained gain {X:mult,C:white}X#2#{} Mult",
          "Whenever a {C:dark_edition}Modded{} tag is obtained gain {X:chips,C:white}X#4#{} Chips",
          "Whenever a {C:abn_hazard}Hazard{} tag is obtained gain {C:money}$#5#{}",
          "{C:inactive}Currently:{} {X:mult,C:white}X#1#{} {C:inactive}Mult{} {X:chips,C:white}X#3#{} {C:inactive}Chips{}"
        }
      },

      j_abn_triple_nicole = {
        name = 'Triple Nicole',
        text = {
          '{C:chips}+#1#{} Chips if {C:attention}poker hand{}',
          'has been played an',
          '{C:attention}odd{} number of times'
        }
      },

      j_abn_triple_star_license = {
        name = "Triple Star License",
        text = {
          "{X:mult,C:white}X#1#{} Mult, {X:chips,C:white}X#2#{} Chips",
          "{C:mult}self-destructs{} if",
          "a {C:attention}Joker is {C:attention}sold{}",
        }
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

      j_abn_trojan_joker = {
        name = "Trojan Joker",
        text = {
          "When {C:attention}Blind{} is selected, {C:red}destroys{} both",
          "{C:attention}adjacent Jokers{}, and gains their",
          "accumulated {C:chips}Chips{}, {C:mult}Mult{}, and {X:mult,C:white}XMult{}",
          '{C:inactive}(Currently {C:chips}+#1#{C:inactive}/{C:mult}+#2#{C:inactive}/{X:mult,C:white}X#3#{C:inactive})',
        }
      },

      j_abn_tronie_joker = {
        name = "Tronie Joker",
        text = {
          "{C:chips}+#1#{} Joker Slots",
          "{X:mult,C:white}#2#X{} {C:attention}Blind requirement{},",
          "increases by {X:mult,C:white}#3#X{} when {C:attention}Ante{} is defeated",
        },
      },

      j_abn_turf_graffiti = {
        name = "Turf Graffiti",
        text = {
          "Played cards with",
          "{C:spades}dark{} suit give",
          "{X:mult,C:white}X#1#{} Mult when scored",
        }
      },

      j_abn_tv_evangelist = {
        name = "TV Evangelist",
        text = {
          "Gives {C:chips}+#1#{} Chips {C:mult}+#2#{} Mult and {C:money}+$#3#{}",
          "when a {C:attention}vanilla{} 5 card hand is played with {C:attention}6{} cards",
        }
      },

      j_abn_twinbo = {
        name = "Twinbo",
        text = {
          "{C:attention}+#1#{} Joker Slots,",
          "Can only play {C:attention}2{} cards at a time,",
          "Played cards give {X:mult,C:white}X#2#{} Mult",
        },
      },

      j_abn_tyches_keychain = {
        name = "Tyche\'s Keychain",
        text = {
          {
            "If a {C:attention}#1#{}",
            "is played, scored cards gain",
            "{V:1}#2#{} #3#",
            "{C:inactive}(Cycles every hand){}"
          },
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

      j_abn_ulam_joker = {
        name = "Ulam Joker",
        text = {
          {
            "This Joker gains {C:mult}Mult{} and {C:chips}Chips{} equal to",
            "the rank difference between {C:attention}first{} and",
            "{C:attention}last{} scored cards in a {C:attention}Spectrum{} hand",
            "{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult,{} {C:chips}+#1#{} {C:inactive}Chips){}"
          },
          {
            "If this Joker has an {C:dark_edition}edition{},",
            "gains {C:attention}twice{} the rank difference",
          },
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

      j_abn_underblackcloudz = {
        name = "Under Black Cloud",
        text = {
          {
            "Retrigger all {C:weather_report}Weather{} effects",
          },
          {
            "This Joker gains {C:chips}+#4#{} Chips, {C:mult}+#2#{} Mult,",
            "and {C:money}$#6#{} of {C:attention}sell value{} when a",
            "{C:weather_report}Weather{} effect {C:attention}triggers",
          },
          {
            "Earn {C:money}$#5#{} when a {C:weather_report}Weather Report{}",
            "destroys itself without triggering",
            "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips, {C:mult}+#1#{C:inactive} Mult)",
          }
        }
      },

      j_abn_under_construction = {
        name = "Under Construction",
        text = {
          "When {C:attention}Boss Blind{} is defeated,",
          "{C:attention}sell{} this Joker to create",
          "{C:attention}any{} Joker in your collection",
          "{C:inactive,s:0.8}(can only create {C:common,s:0.8}Common{C:inactive,s:0.8}, {C:uncommon,s:0.8}Uncommon{C:inactive,s:0.8}, and {C:rare,s:0.8}Rare{C:inactive,s:0.8})",
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

      j_abn_unfamiliar_joker = {
        name = "Unfamiliar Joker",
        text = {
          "{C:dark_edition}Modded {C:attention}rankless{} cards give {X:chips,C:white}2X",
          "of their {C:chips}Chips{} when scoring"
        }
      },

      j_abn_unhinged_umar = {
        name = "Unhinged Umar",
        text = {
          {
            "Converts {C:chips}+Chips{} effects of all cards",
            "into {X:chips,C:white}XChips{} at a rate of {X:chips,C:white}X#1#",
          },
          {
            "If this is a {C:attention}Bonus Joker{},",
            "{C:attention}Bonus{} enhancements will also",
            "trigger when held in hand"
          }
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

      j_abn_usury_joker = {
        name = "Usury Joker",
        text = {
          {
            "{C:abn_tie}Ties{}, {C:abn_bow}Bows{} and {C:clubs}Clubs",
            "become {C:attention}Lucky{} when {C:attention}scored",
            "Lose {C:gold}-$#1#{} when a",
            "{C:attention}Lucky Card{} triggers"
          },
          {
            "Go up to",
            "{C:red}-$#2#{} in debt",
          },
        },
      },

      j_abn_van_joker = {
        name = "Van Joker",
        text = {
          "{C:attention}+#1#{} voucher slot",
          "in {C:green}shop"
        }
      },

      j_abn_vaporwave_joker = {
        name = "Vaporwave Joker",
        text = {
          {
            "Played and discarded {C:dark_edition}#2#{} cards",
            "permanently gain {C:chips}+#1#{} Chip per card",
            "played or discarded"
          },
          {
            "If this Joker has {C:dark_edition}#2#{} edition,",
            "{C:dark_edition}#2#{} Jokers give {C:white,X:chips}X#3#{} Chips"
          }
        }
      },

      j_abn_venom_comedian = {
        name = "Venom Comedian",
        text = {
          {
            "If played hand contains a {C:attention}Spectrum{},",
            "this Joker gains {C:attention}bonuses{} per scoring {C:inactive}(suit){}",
          },
          {
            "{C:abn_tie,s:0.8}Ties{s:0.8}: {C:mult,s:0.8}+#5#{s:0.8} Mult",
            "{C:abn_bow,s:0.8}Bows{s:0.8}: {X:chips,C:white,s:0.8}X#6#{s:0.8} Chips",
            "{C:abn_snow,s:0.8}Snows{s:0.8}: {X:mult,C:white,s:0.8}X#7#{s:0.8} Mult",
            "{C:abn_penumbra,s:0.8}Penumbras{s:0.8}: {C:chips,s:0.8}+#8#{s:0.8} Chips",
            "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive}, {C:mult}+#1#{} {C:inactive},{} {X:chips,C:white}X#4#{C:inactive}, {C:chips}+#3#{} {C:inactive}){}"
          },
          {
            "If this Joker has an {C:dark_edition}edition{},",
            "level up played hands containing",
            "a {C:attention}Spectrum{} by {C:attention}2{}",
          },
        }
      },

      j_abn_vintage_joker = {
        name = "Vintage Joker",
        text = {
          {
            "Level up {C:attention}first hand{} of round",
            "if it is not a {C:attention}secret{} hand",
            "and only contains {C:inactive}Vanilla{} suits",
          },
          {
            "If this Joker has {C:dark_edition}Vintage{} edition,",
            "every time a hand {C:attention}levels up{}",
            "{C:attention}level up{} another {C:attention}random{} hand",
          }
        }
      },

      j_abn_vitamin_joker = {
        name = "Vitamin Joker",
        text = {
          {
            "Scoring cards with a {C:attention}seal",
            "permanently gain",
            "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
          },
          {
            "{C:green}#3# in #4#{} chance this card is",
            "{C:attention}eaten{} after a hand is played"
          }
        },
      },

      j_abn_void_emissary = { -- thank you Minus (they made FusionForce) and 0kronix for helping me localise this :>
        name = "Void Emissary",
        text = {
          "This Joker gains {C:chips}+#4#{} Chips",
          "and {C:mult}+#2#{} Mult for every {C:attention}two{}",
          "{C:abn_suitless}Null{} suited {C:attention}numbered{} cards",
          "that are both {C:attention}even{}",
          "or {C:attention}odd{} in played hand",
          "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips, {C:mult}+#1#{C:inactive} Mult)"
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

      j_abn_voracity_joker = {
        name = "Voracity Joker",
        text = {
          "Retrigger all {C:attention}Food{} Jokers,",
          "{C:green}#1# in #2#{} chance to {C:attention}consume{}",
          "all {C:attention}Food{} Jokers at end of round",
        }
      },

      j_abn_voucher_jimbo = {
        name = "Voucher Jimbo",
        text = {
          "Gain {C:red}+#1#{} Mult and {C:blue}+#2#{} Chips",
          "per {C:attention}Voucher{} redeemed",
          "{C:inactive}(Currently {C:red}+#3#{C:inactive} Mult,{} {C:blue}+#4#{C:inactive} Chips){}",
        }
      },

      j_abn_vjoker = { -- wip
        name = "VJoker",
        text = {
          "Hey Vsauce, Michael here"
        },
      },

      j_abn_watermelon = {
        name = "Watermelon",
        text = {
          "Jokers gain {C:mult}+#3#{} Mult when {C:attention}triggered{},",
          "{C:green}#1# in #2#{} chance to be",
          "{C:attention}consumed{} at end of round",
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

      j_abn_wee_mult = {
        name = "Wee Mult",
        text = {
          "Scored {C:attention}numbered",
          "{C:attention}Mult Cards{} permanently",
          "gain {C:white,X:mult}X#1#{} Mult"
        }
      },
      j_abn_weltschmerz_joker = {
        name = "Weltschmerz Joker",
        text = {
          "Scoring {C:inactive}Null{} cards gain {C:attention}Flipped{}",
          "Retrigger {C:attention}Flipped{} {C:inactive}Null{} cards",
        }
      },

      j_abn_wet_joker = {
        name = "Wet Joker",
        text = {
          {
            "{C:weather_report}Weather Reports{}",
            "aren't destroyed at the",
            "end of the round"
          },
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
      j_abn_whitenoise_joker = {
        name = "Whitenoise Joker",
        text = {
          "This Joker gains {X:mult,C:white}X#2#{} Mult",
          "when playing an {C:attention}even{} number",
          "of {C:diamonds}Light{} and {C:spades}Dark{} Suits",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult){}",

        }
      },

      j_abn_wicked_witch = {
        name = "Wicked Witch",
        text = {
          {
            "This Joker gains {X:mult,C:white}X#1#{} Mult when",
            "a {C:dark_edition}Modded{} {C:tarot}Tarot{} card is used",
            "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
          },
          {
            "{C:red}Self Destructs{} if a",
            "{C:weather_report}Weather Report{} is used",
          }
        },
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

      j_abn_wild_stone = {
        name = "Wild Stone",
        text = {
          {
            "If played hand contains both a {C:attention}Stone{}",
            "and {C:attention}Wild{} card, they each gain",
            "{C:gold}+#1#{} Asc. Power and {C:purple}+#2#{} Score",
          },
          {
            "{C:enhanced}Stone{} {C:attention}Jokers{} gain {X:mult,C:white}X#3#{} Mult, {C:enhanced}Wild{}",
            "{C:attention}Jokers{} gain {X:chips,C:white}X#4#{} Chips when triggered"
          },
          {
            "When {C:attention}Big Blind{} is selected, create",
            "the last {C:astro_cards}Astro{} card used this run",
            "{C:inactive}Currently:{} {C:astro_cards}#5#{}"
          }
        }
      },

      j_abn_wild_gold = {
        name = "Wild Gold",
        text = {
          {
            "If played hand contains both a {C:attention}Wild{}",
            "and {C:attention}Gold{} card, they each gain",
            "{C:gold}+#1#{} Asc. Power and {C:purple}+#2#{} Score",
          },
          {
            "{C:enhanced}Wild{} {C:attention}Jokers{} gain {X:mult,C:white}X#3#{} Mult, {C:enhanced}Gold{}",
            "{C:attention}Jokers{} gain {X:chips,C:white}X#4#{} Chips when triggered"
          },
          {
            "When {C:attention}Big Blind{} is selected, create",
            "the last {C:atomic}Atomic{} card used this run",
            "{C:inactive}Currently:{} {C:atomic}#5#{}"
          }
        }
      },

      j_abn_wild_power_joker = { -- ts doesnt exist
        name = "Wild Power Joker",
        text = {
          "When a {C:attention}Wild{} card is scored:",
          "{C:green,s:0.8}#1# in #2# chance{s:0.8} for {X:mult,C:white,s:0.8}X#7#{s:0.8} Mult",
          "{C:green,s:0.8}#3# in #4# chance{s:0.8} for {C:mult,s:0.8}+#8#{s:0.8} Mult",
          "{C:green,s:0.8}#5# in #6# chance{s:0.8} for {C:chips,s:0.8}+#9#{s:0.8} Chips",
        },
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
      j_abn_will = {
        name = "Will",
        text = {
          "This Joker gains {X:chips,C:white}X#2#{} Chips",
          "if played hand contains",
          "scoring {C:attention}odd{} cards",
          "{C:inactive}(Currently {C:white,X:chips}X#1#{C:inactive} Chips){}"
        }
      },

      j_abn_wingding_joker = {
        name = "Wingding Joker",
        text = {
          "This Joker gains {C:mult}+#4#{} Mult",
          "when a {C:lexica}Lexica{} card is sold,",
          "gains {C:chips}+#2#{} Chips when a",
          "{C:program_pack}Program{} card is sold",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, {C:mult}+#3#{C:inactive} Mult)"
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

      j_abn_witness_protection = {
        name = "Witness Protection",
        text = {
          {
            "{X:chips,C:white}X#1#{} Chips for each",
            "unique {C:attention}rarity{} among",
            "currently {C:attention}flipped{} Jokers",
            "{C:inactive}(Currently {X:chips,C:white}X#3#{C:inactive} Chips)",
          },
          {
            "If this Joker is {C:attention}flipped{},",
            "scoring cards give {C:chips}+#2#{} Chips",
            "for each {C:attention}flipped{} Joker owned",
            "{C:inactive}(Currently {C:chips}+#4#{C:inactive} Chips)",
          },
        }
      },
      j_abn_worldwind_joker = {
        name = "Worldwind Joker",
        text = {
          {
            "{C:attention}Jokers{} are shuffled",
            "when hand is played",
          },
          {
            "Retrigger {C:attention}leftmost{} Joker,",
            "{C:white,X:mult}X#1#{} Mult instead if",
            "leftmost is {C:attention}Worldwind Joker{}",
          },
        },
      },

      j_abn_xenon_joker = {
        name = "Xenon Joker",
        text = {
          "{C:dark_edition}#2#{} cards",
          "and Jokers give {X:mult,C:white}X#1#{} Mult"
        }
      },

      j_abn_yanga_joker = { -- slightly relocalise, not too sure about the second multibox (lots of repetition that prolly could be cut down)
        name = "Yanga Joker",
        text = {
          {
            "This Joker gains {C:chips}+#4#{} Chips when an",
            "{C:dark_edition}Opaque{} card scores, gains {C:mult}+#3#{} Mult",
            "when a {C:dark_edition}Chthonian{} card scores",
            "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult,{} {C:chips}+#2#{} {C:inactive}Chips)",
          },
          {
            "If {C:attention}first hand{} is {C:attention}Flush{} of {C:abn_bow}Bows{}, enhance",
            "played cards into {C:dark_edition}Chthonian{} {C:spades}Darkner{} cards",
            "If {C:attention}first hand{} is {C:attention}Flush{} of {C:spades}Spades{}, enhance",
            "played cards into {C:dark_edition}Opaque{} {C:spades}Darkner{} cards",
            "If {C:attention}first hand{} is {C:attention}Flush{} of {C:clubs}Clubs{}, enhance",
            "played cards into {C:dark_edition}Chthonian{} {C:spades}Darkner{} cards",
          },
        }
      },
      j_abn_yesman_joker = {
        name = "Yesman Joker",
        text = {
          "{C:dark_edition}Editions{} {C:attention}held in hand{} are triggered",
          "This Joker gains {C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} Chips when an {C:dark_edition}Edition{} triggers",
          "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult, {C:chips}+#2#{} {C:inactive}Chips)",
        }
      },

      j_abn_yharman_joker = {
        name = "Yharman Joker",
        text = {
          {
            "{V:1}#1# Suits{} are drawn {C:attention}face down{}",
            "{C:inactive,s:0.8}Suit changes on Blind selection",
          },
          {
            "Level up {C:planet}planet{} {C:attention}rank{} of scoring {C:attention}face up{}",
            "cards once per scoring {C:attention}Flipped{} card, add",
            "{C:dark_edition}#2#{} edition to cards levelled above {C:attention}5{} ",
          },
        }
      },

      j_abn_yorick_deluxe = {
        name = "Yorick {C:attention}Deluxe",
        text = {
          {
            "This Joker gains {C:mult}+#5#{} Mult",
            "per card discarded",
            "{C:inactive}(Currently {C:mult}+#6#{C:inactive} Mult)"
          },
          {
            "This Joker gains {X:chips,C:white}X#1#{} Chips",
            "every {C:attention}#2#{C:inactive} [#3#]{} cards discarded",
            "{C:inactive}(Currently {X:chips,C:white}X#4#{C:inactive} Chips)",
          },
          {
            "If {C:attention}Jorik{} is owned,",
            "discarded cards permanently",
            "gain {C:mult}Mult{} equal to its {C:attention}rank{}"
          }
        }
      },

      j_abn_york = {
        name = "York",
        text = {
          "Played cards give {X:mult,C:white}X#1#{} Mult",
          "when scored, {X:chips,C:white}X#1#{} Chips",
          "when held in hand",
        }
      },
      j_abn_zack_comic = {
        name = "Zack Comic",
        text = {
          {
            "Scored {C:abn_leaf}Leaves{} give {X:chips,C:white}X#1#{} Chips,",
            "increases by {X:chips,C:white}X#2#{} Chips",
            "when a {C:abn_leaf}Leaf{} is scored",
          },
          {
            "If {C:attention}Joker{} is owned,",
            "all {C:attention}scoring{} cards",
            "gain {C:mult}Mult{} equal to number of held Consumables",
            "when a {C:abn_leaf}Leaf{} is scored"
          }
        }
      },

      j_abn_zauberer_magicians = {
        name = "Zauberer Magicians",
        text = {
          {
            "After scoring, cards change {C:attention}suits{}:",
            "{C:hearts,s:0.8}Hearts{s:0.8} -> {C:abn_snow,s:0.8}Snows{s:0.8} -> {C:diamonds,s:0.8}Diamonds{s:0.8} -> {C:abn_tie,s:0.8}Ties",
            "{s:0.8} -> {C:clubs,s:0.8}Clubs{s:0.8} -> {C:abn_penumbra,s:0.8}Penumbras{s:0.8} -> {C:spades,s:0.8}Spades{s:0.8} -> {C:abn_bow,s:0.8}Bows{}",
          },
          {
            "If this Joker has {C:dark_edition}Vintage{} edition,",
            "gains {C:mult}+#2#{} Mult and {C:money}$#2#{} of {C:attention}sell value",
            "when a card changes {C:attention}suit{}",
            "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult)",
          },
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

      j_abn_zoom_in = {
        name = 'Zoom In',
        text = {
          "This Joker gains {C:mult}+#2#{} Mult",
          "if hand played contains",
          "an {C:attention}Ace{} and a {C:attention}numbered card{}",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
        },
      },
    },
  },
  misc = {
    dictionary = {
      -- Jevil effects
      abn_unique_suit_1 = {
        "{E:1}1 Suit",
        "Retrigger all cards {C:attention}#5#{} times",
        "if {C:money}${} is a {C:attention}prime{} number",
      },
      abn_unique_suit_2 = {
        "{E:1}2 Suits",
        "Scoring cards give {C:white,X:blind}X#2#{} Blind Size"
      },
      abn_unique_suit_3 = {
        "{E:1}3 Suits",
        "Scoring cards give the {C:attention}rank{}",
        "of {C:attention}adjacent{} cards as {C:chips}Chips{}"
      },
      abn_unique_suit_4 = {
        "{E:1}4 Suits",
        "Scoring cards give {C:white,X:mult}X#3#{} Mult",
      },
      abn_unique_suit_5 = {
        "{E:1}5 Suits",
        "Scoring cards permanently gain {C:gold}+#4#{} Asc. Power",
      },
      abn_unique_suit_6 = {
        "{E:1}6 Suits",
        "Destroy all {C:attention}Non-Legendary{} Jokers",
        "and replace them with {C:legendary}Legendary{} Jokers",
        "{C:abn_j,s:0.8}J{C:abn_e,s:0.8}e{C:abn_v,s:0.8}v{C:abn_i,s:0.8}i{C:abn_l,s:0.8}l{s:0.8} Excluded"
      },

      -- Bio Blueprint tooltips
      abn_bio_blueprint_incompatible_norank = {
        name = "Incompatible",
        text = {
          "Cards that do not have a rank",
          "cannot receive any bonuses"
        }
      },
      abn_bio_blueprint_incompatible_rank = {
        name = "Incompatible",
        text = {
          "Cards of rank '#1#'",
          "cannot receive any bonuses"
        }
      },
      abn_bio_blueprint_even = {
        name = "#1# of #2# (Even)",
        text = {
          "All scoring #1#s grant {C:mult}+#3#{} Mult",
          "If at least {C:attention}#1#{} #1#s are scored by the",
          "end of the round, double Mult rate",
          "{C:inactive}({C:attention}#4#{C:inactive}/#1# #1#s scored)"
        }
      },
      abn_bio_blueprint_even_edi = {
        name = "#5# #1# of #2# (Even)",
        text = {
          "All scoring #1#s grant {C:mult}+#3#{} Mult",
          "All scoring {C:dark_edition}#5#{} #1#s also grant {C:mult}+#6#{} Mult",
          "If at least {C:attention}#1#{} #1#s are scored by the",
          "end of the round, double Mult rate",
          "If at least {C:attention}#1#{} {C:dark_edition}#5#{} #1#s are scored by the",
          "end of the round, double Mult rate",
          "{C:inactive}({C:attention}#4#{C:inactive}/#1# #1#s and {C:attention}#7#{C:inactive}/#1# {C:dark_edition}#5# {C:inactive}#1#s scored)"
        }
      },
      abn_bio_blueprint_even_enh = {
        name = "#5# #1# of #2# (Even)",
        text = {
          "All scoring #1#s grant {C:mult}+#3#{} Mult",
          "All scoring {C:attention}#5#{} #1#s also grant {C:chips}+#6#{} Chips",
          "If at least {C:attention}#1#{} #1#s are scored by the",
          "end of the round, double Mult rate",
          "If at least {C:attention}#1# {C:dark_edition}#5#{} #1#s are scored by the",
          "end of the round, double Chip rate",
          "{C:inactive}({C:attention}#4#{C:inactive}/#1# #1#s and {C:attention}#7#{C:inactive}/#1# {C:attention}#5# {C:inactive}#1#s scored)"
        }
      },
      abn_bio_blueprint_even_edi_enh = {
        name = "#5# #8# #1# of #2# (Even)",
        text = {
          "All scoring #1#s grant {C:mult}+#3#{} Mult",
          "All scoring {C:dark_edition}#5#{} #1#s also grant {C:mult}+#6#{} Mult",
          "All scoring {C:attention}#8#{} #1#s also grant {C:chips}+#9#{} Chips",
          "If at least {C:attention}#1#{} #1#s are scored by the",
          "end of the round, double Mult rate",
          "If at least {C:attention}#1#{} {C:dark_edition}#5#{} #1#s are scored by the",
          "end of the round, double Mult rate",
          "If at least {C:attention}#1# #8#{} #1#s are scored by the",
          "end of the round, double Chip rate",
          "{C:inactive}({C:attention}#4#{C:inactive}/#1# #1#s, {C:attention}#7#{C:inactive}/#1# {C:dark_edition}#5# {C:inactive}#1#s, and {C:inactive}#10#/#1# {C:attention}#8# {C:inactive}#1#s scored)"
        }
      },
      abn_bio_blueprint_odd = {
        name = "#1# of #2# (Odd)",
        text = {
          "All scoring #1#s grant {C:chips}+#3#{} Chips",
          "If at least {C:attention}#1#{} #1#s are scored by the",
          "end of the round, double Chip rate",
          "{C:inactive}({C:attention}#4#{C:inactive}/#1# #1#s scored)"
        }
      },
      abn_bio_blueprint_odd_edi = {
        name = "#5# #1# of #2# (Odd)",
        text = {
          "All scoring #1#s grant {C:chips}+#3#{} Chips",
          "All scoring {C:dark_edition}#5#{} #1#s also grant {C:mult}+#6#{} Mult",
          "If at least {C:attention}#1#{} #1#s are scored by the",
          "end of the round, double Chip rate",
          "If at least {C:attention}#1#{} {C:dark_edition}#5#{} #1#s are scored by the",
          "end of the round, double Mult rate",
          "{C:inactive}({C:attention}#4#{C:inactive}/#1# #1#s and {C:attention}#7#{C:inactive}/#1# {C:dark_edition}#5# {C:inactive}#1#s scored)"
        }
      },
      abn_bio_blueprint_odd_enh = {
        name = "#5# #1# of #2# (Odd)",
        text = {
          "All scoring #1#s grant {C:chips}+#3#{} Chips",
          "All scoring {C:attention}#5#{} #1#s also grant {C:chips}+#6#{} Chips",
          "If at least {C:attention}#1#{} #1#s are scored by the",
          "end of the round, double Chip rate",
          "If at least {C:attention}#1# #5#{} #1#s are scored by the",
          "end of the round, double Chip rate",
          "{C:inactive}({C:attention}#4#{C:inactive}/#1# #1#s and {C:attention}#7#{C:inactive}/#1# {C:attention}#5# {C:inactive}#1#s scored)"
        }
      },
      abn_bio_blueprint_odd_edi_enh = {
        name = "#5# #8# #1# of #2# (Odd)",
        text = {
          "All scoring #1#s grant {C:chips}+#3#{} Chips",
          "All scoring {C:dark_edition}#5#{} #1#s also grant {C:mult}+#6#{} Mult",
          "All scoring {C:attention}#8#{} #1#s also grant {C:chips}+#9#{} Chips",
          "If at least {C:attention}#1#{} #1#s are scored by the",
          "end of the round, double Chip rate",
          "If at least {C:attention}#1#{} {C:dark_edition}#5#{} #1#s are scored by the",
          "end of the round, double Mult rate",
          "If at least {C:attention}#1# #8#{} #1#s are scored by the",
          "end of the round, double Chip rate",
          "{C:inactive}({C:attention}#4#{C:inactive}/#1# #1#s, {C:attention}#7#{C:inactive}/#1# {C:dark_edition}#5# {C:inactive}#1#s, and {C:inactive}#10#/#1# {C:attention}#8# {C:inactive}#1#s scored)"
        }
      },
    },
  },
}
