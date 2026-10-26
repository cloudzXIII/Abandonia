return {
  descriptions = {
    Other = {
      --#region Auras
      abn_globetrotter_aura = {
        name = "Globetrotter Aura",
        text = {
          "{C:gold}+#1#{} Asc. Power per {C:attention}unique{} Blind defeated this {C:attention}run{}",
          "{C:inactive}Currently:{} {C:gold}+#2#{} {C:inactive}Asc. Power",
        }
      },
      abn_mitama_aura = {
        name = "Mitama Aura",
        text = {
          "{C:chips}+#1#{} Chips per destroyed {C:attention}playing card",
          "{C:mult}+#2#{} Mult per destroyed {C:attention}joker",
          "{C:gold}+#3#{} Ascension Power per destroyed {C:attention}consumable",
          "{C:abn_amperage}+#4#{} Amperage per destroyed {C:ruinous_power}ruinous power card",
          "{C:inactive}(Currently: {C:chips}+#5# {C:inactive}Chips, {C:mult}+#6# {C:inactive}Mult, {C:gold}+#7# {C:inactive}Asc, {C:abn_amperage}+#8# {C:inactive}Amp)"
        }
      },
      abn_medieval_aura = {
        name = "Medieval Aura",
        text = {
          "{C:red}Played hands cannot contain face cards",
          "Each scoring {C:attention}number card{} provides",
          "{C:abn_modulate}+#1#{} Modulate per {C:attention}number card{} held in hand,",
          "Increases by {C:abn_modulate}#2#{} when {C:attention}Ante{} is beaten"
        }
      },
      abn_hellenic_aura = {
        name = "Hellenic Aura",
        text = {
          "+0.5 Amperage per triggered +Chips effect,",
          "Increases by 0.5 when Blind is defeated"
        }
      },
      abn_tulum_aura = {
        name = "Tulum Aura",
        text = {
          "+0.5 Amperage per triggered +Mult effect,",
          "Increases by 0.5 when Blind is defeated"
        }
      },
      --#endregion
    },
  },
  misc = {
    labels = {
      --#region Aura Labels
      abn_globetrotter_aura = "Globetrotter Aura",
      abn_mitama_aura = "Mitama Aura",
      abn_medieval_aura = "Medieval Aura",
      abn_hellenic_aura = "Hellenic Aura",
      abn_tulum_aura = "Tulum Aura",
      --#endregion
    }
  }
}
