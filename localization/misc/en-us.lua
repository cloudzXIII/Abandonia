-- Decks, Vouchers, Stakes
return {
  descriptions = {
    Back = {
      b_abn_das_goodtime = {
        name = "Das Goodtime",
        text = {
          "Start with a full set of",
          "{C:abn_florette}Florettes{}, {C:abn_acorn}Acorns{},",
          "{C:abn_bell}Bells{} and {C:abn_leaf}Leaves{}",
          "{C:attention}+#1#{} hand size,",
          "{C:red}-4{} Discard limit"
        }
      },
      b_abn_glue_deck = {
        name = "Glue Deck",
        text = {
          "Start run with the",
          "{C:attention,T:v_abn_gold_tree}#1#{} voucher",
          "Cards cannot be deselected",
          "{C:attention}Jokers{} cannot move"
        }
      },
      b_abn_woebegone = {
        name = "Woebegone Deck",
        text = {
          "Start with {C:tarot,T:v_abn_tarot_master}#1#{}",
          "and a full set of",
          "{C:inactive}Vanilla{} and {C:attention}Spanish{} suits",
          "Earn no {C:attention}interest{}",
          "Earn {C:money}$2{} when {C:mult}Discarding {C:attention}5{} Cards"
        }
      },
      b_abn_calamity = {
        name = "Calamity Deck",
        text = {
          "{C:green}#1# in #2#{} chance to",
          "destroy discarded cards",
          "When {C:attention}Blind{} is selected,",
          "create a random {C:dark_edition}Negative{} {C:sigils}Sigil{} Card"
        }
      },
      b_abn_cyber = {
        name = "Cyber Deck",
        text = {
          "{C:solid_state}Solid State{} cards may",
          "appear in the shop,",
          "start with a {C:solid_state,T:c_abn_database}Database{} card",
        }
      },
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
          "Start with an additional",
          "set of {C:abn_snow}Snow{} cards",
          "and {C:spectral,T:v_omen_globe}#1#{}",
          "{C:green}#2# in #3#{} chance to convert",
          "a {C:attention}non-{C:abn_snow}Snow{} card into",
          "a {C:abn_snow}Snow{} at end of round"
        }
      },
      b_abn_PenumbraDeck = {
        name = "Penumbra Deck",
        text = {
          "Start with an additional",
          "set of {C:abn_penumbra}Penumbra{} cards",
        }
      },
      b_abn_DarkNebulaDeck = {
        name = "Dark Nebula Deck",
        text = {
          "{C:planet}Planet{} Packs don't appear in the shop",
          "{C:astro_cards}Astro{} Cards appear {C:attention}2X{} more often",
        }
      },
      b_abn_PoltergiestDeck = {
        name = "Poltergiest Deck",
        text = {
          "{C:nightshift_cards}Nightshift{} cards appear more often",
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
      },
      b_abn_ConvergenceDeck = {
        name = "Convergence Deck",
        text = {
          "Swap {C:chips}Chips{} and {C:mult}Mult{}",
          "before scoring",
          "{C:mult}X2.5 Blind size",
        }
      },
      b_abn_JugglerDeck = {
        name = "Juggler Deck",
        text = {
          "Start with {C:attention}10{} {C:chips}Hands{}",
          "{C:chips}Hands{} save between rounds",
          "Selling Jokers gives {C:chips}Hands{}"
        }
      },
      b_abn_ensnared = {
        name = "Ensnared Deck",
        text = {
          "{C:attention}#1#{} consumable slots,",
          "increases by {C:attention}+#2#{} when",
          "{C:attention}Boss Blind{} defeated",
          "Go up to {C:red}-$#3#{} in debt"
        }
      },
      b_abn_treaty = {
        name = "Treaty of Colours",
        text = {
          "Start with all {C:inactive}Vanilla{} suits,",
          "{C:abn_snow}Snows{}, {C:abn_penumbra}Penumbras{},",
          "{C:abn_tie}Ties{} and {C:abn_bow}Bows{}",
        }
      },
      b_abn_photometry = {
        name = "Photometry Deck",
        text = {
          "Start with {C:abn_snow}Snows{}, {C:abn_penumbra}Penumbras{},",
          "{C:abn_tie}Ties{}, {C:abn_bow}Bows{} and {C:inactive}Nulls{}",
          "No {C:inactive}Vanilla{} suits",
        }
      },
      b_abn_synesthic = {
        name = "Synesthetic Circle",
        text = {
          "Start with",
          "{C:abn_chalice}Chalices{}, {C:abn_baton}Batons{}, {C:abn_coin}Coins{}, {C:abn_sword}Swords{}",
          "{C:abn_bow}Bows{}, {C:abn_tie}Ties{}, {C:abn_penumbra}Penumbras{} and {C:abn_snow}Snows",
          "Without {C:attention}Face{} cards",
          "{C:attention}+1{} hand selection",
          "Increase {C:attention}blind requirements{} by {C:white,X:mult}X1.3{}",
          "when {C:attention}Boss Blind{} is defeated"
        }
      },
      b_abn_epoch = {
        name = "New Epoch",
        text = {
          "Start with a full set of",
          "{C:inactive}Vanilla{}, {C:abn_talon}Talons{},",
          "{C:abn_crown}Crowns{}, {C:abn_moon}Moons,",
          "and {C:abn_star}Stars{}",
          "{C:white,X:mult}+X1{} to all {C:attention}Blind requirements{}",
          "for each blind {C:attention}skipped{} this run",
        }
      },
      b_abn_untamed = {
        name = "Untamed Deck",
        text = {
          "Start with {C:planet,T:v_abn_satellite}#1#{}",
          "and {C:sigils,T:v_abn_chaos}#2#{}",
          "{C:chips}Small Blinds{} are now {C:attention}Big Blinds{}",
        }
      },
      b_abn_shackle = {
        name = "Shackle Maniac",
        text = {
          "Start with only {C:spades}Dark Suits",
          "with {C:dark_edition}Chthonian Editon{}",
        }
      },
      b_abn_poneglyph = {
        name = "Poneglyph",
        text = {
          "Start with a full set of",
          "{C:attention}Stone{}, {C:attention}Petroleum,",
          "{C:attention}Polkadot{} and {C:inactive}Null{} cards ",
        }
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
          "{C:spectral}Spectral{} cards {C:attention}always",
          "appear in any of",
          "the {C:attention}Arcana Packs",
        }
      },
      v_abn_satellite = {
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
          "with either an {C:dark_edition}Edition{} and",
          "{C:attention}Seal{} or {C:attention}Enhancement{}"
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
          "{C:sigils}Sigil{}, {C:astro_cards}Astro{}, {C:solid_state}Solid State{},",
          "{C:nightshift_cards}Nightshift{}, {C:calamity_cards}Calamity{}, and {C:lexica}Lexica{}",
          "cards may appear in any of",
          "the {C:attention}Arcana Packs",
        }
      },
      v_abn_invasion = {
        name = "Parallel Invasion",
        text = {
          "{C:sigils}Sigil{}, {C:astro_cards}Astro{},",
          "{C:solid_state}Solid State{}, {C:nightshift_cards}Nightshift{},",
          "and {C:calamity_cards}Calamity{} cards",
          "may appear in the shop",
        }
      },
      v_abn_athame = {
        name = "Athame",
        text = {
          "{C:sigils}Sigil{} packs always contain the {C:sigils}Sigil{} card",
          "for your {C:attention}most played poker hand{}",
        }
      },
      v_abn_ink_and_quill = {
        name = "Ink & Quill",
        text = {
          "{C:calligraphy}Calligraphy{} cards can be used during {C:attention}blinds{}",
        }
      },
      v_abn_fountain_pen = {
        name = "Fountain Pen",
        text = {
          "Pick {C:attention}+1{} more cards in {C:calligraphy}Calligraphy{} packs",
        }
      },
      v_abn_magnet = {
        name = "Magent",
        text = {
          "Your {C:attention}most played card this run{}",
          "is always drawn to hand at {C:attention}start of round{}",
        }
      },
      v_abn_electromagnet = {
        name = "Electromagent",
        text = {
          "Your {C:attention}3 most played cards this run{}",
          "are always drawn to hand at {C:attention}start of round{}",
        }
      },
      v_abn_pattern = {
        name = "Pattern",
        text = {
          "When {C:attention}blind is selected{}",
          "Spawn your all time {C:attention}most used{} {C:tarot}Tarot{}/{C:planet}Planet{} card",
          "{C:inactive}(Must have room)",
        }
      },
      v_abn_tesselation = {
        name = "Tesselation",
        text = {
          "When {C:attention}blind is selected{}",
          "Spawn your {C:attention}2{} all time {C:attention}most used{} Consumables",
          "{C:inactive}(Must have room)",
        }
      },
      v_abn_silver_spoon = {
        name = "Silver Spoon",
        text = {
          "{C:money}Refund{} {C:attention}50%{} of the {C:attention}first{} purchase each round",
        }
      },
      v_abn_heirloom = {
        name = "Heirloom",
        text = {
          "Earn {C:money}$2{} on every purchase",
        }
      },
    },

    Stake = {
      stake_abn_honor = {
        name = "Honor Jimbo",
        text = {
          "Finish at Ante {C:attention}9{}",
          "Antes {C:attention}4{}, {C:attention}8{}, and {C:attention}9{} are {C:abn_hazard}Hazard Blinds{}",
        },
      },
      stake_abn_menacing = {
        name = "Menacing Jimbo",
        text = {
          "Finish at Ante {C:attention}10{}",
          "Antes {C:attention}5{} and {C:attention}10{} are {C:abn_hazard}Hazard Blinds{}",
        },
      },
      stake_abn_toxic = {
        name = "Toxic Jimbo",
        text = {
          "Finish at Ante {C:attention}11{}",
          "{s:0.8,C:attention}Jokers {s:0.8}can be {C:attention,s:0.8}flipped{}",
          "{s:0.8,C:attention}Jokers {s:0.8}can have {C:attention,s:0.8}stickers{}",
          "Antes {C:attention}6{} and {C:attention}11{} are {C:abn_hazard}Hazard Blinds{}",
        },
      },
      stake_abn_noxious = {
        name = "Noxious Jimbo",
        text = {
          "Finish at Ante {C:attention}12{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_lethal = {
        name = "Lethal Jimbo",
        text = {
          "Finish at Ante {C:attention}13{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_baneful = {
        name = "Baneful Jimbo",
        text = {
          "Finish at Ante {C:attention}14{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_malicious = {
        name = "Malicious Jimbo",
        text = {
          "Finish at Ante {C:attention}15{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_malignant = {
        name = "Malignant Jimbo",
        text = {
          "Finish at Ante {C:attention}16{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_inhospitable = {
        name = "Inhospitable Jimbo",
        text = {
          "Finish at Ante {C:attention}17{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_unendurable = {
        name = "Unendurable Jimbo",
        text = {
          "Finish at Ante {C:attention}18{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_torturous = {
        name = "Torturous Jimbo",
        text = {
          "Finish at Ante {C:attention}19{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_wretched = {
        name = "Wretched Jimbo",
        text = {
          "Finish at Ante {C:attention}20{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_agonizing = {
        name = "Agonizing Jimbo",
        text = {
          "Finish at Ante {C:attention}21{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_deplorable = {
        name = "Deplorable Jimbo",
        text = {
          "Finish at Ante {C:attention}22{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_vile = {
        name = "Vile Jimbo",
        text = {
          "Finish at Ante {C:attention}23{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_revolting = {
        name = "Revolting Jimbo",
        text = {
          "Finish at Ante {C:attention}24{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_heinous = {
        name = "Heinous Jimbo",
        text = {
          "Finish at Ante {C:attention}25{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_abhorent = {
        name = "Abhorent Jimbo",
        text = {
          "Finish at Ante {C:attention}26{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_bloodcurdling = {
        name = "Bloodcurdling Jimbo",
        text = {
          "Finish at Ante {C:attention}27{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_repulsive = {
        name = "Repulsive Jimbo",
        text = {
          "Finish at Ante {C:attention}28{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
      stake_abn_hazard = {
        name = "Hazard Jimbo",
        text = {
          "Finish at Ante {C:attention}29{}",
          "{s:0.8}Applies {C:attention,s:0.8}Toxic Jimbo",
        },
      },
    },
  },
}
