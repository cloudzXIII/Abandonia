return {
  descriptions = {
    ruinous_power = {
      c_abn_elder_sign = {
                -- 旧印，是克苏鲁神话体系中一个非常奇葩的存在，对于大多数神话生物有着奇效
                -- 因为旧印在这些神话生物的眼中其实等同于污秽之物，就如同粪便一样。
                -- 如果没有太大矛盾，就算邪神在一般情况下都不会出手攻击持有旧印的人类，因为怕脏了手……
                name = "旧印",
                text = {
                    {
                        "计分牌给予{X:mult,C:white}^#1#{}倍率",
                        "计分后将其{C:mult}摧毁{}",
                    },
                    {
                        "如果{C:attention}完整牌组{}中牌数",
                        "少于{C:attention}#2#{}张，则{C:mult}自毁{}",
                    }
                }
            },
      c_abn_yellow_sign = {
                name = "黄衣之印",
                text = {
                    {
                        "每张计分牌",
                        "降低{C:attention}盲注需求{} {C:attention}#1#%{}",
                    },
                    {
                        "从牌组中{C:mult}摧毁{}",
                        "等同于计分牌数量的牌",
                    },
                    {
                        "如果{C:attention}完整牌组{}中牌数",
                        "少于{C:attention}#2#{}张，则{C:mult}自毁{}",
                    }
                }
            },
      c_abn_sacrifice_brand = {
                name = "献祭烙印",
                text = {
                    {
                        "选择{C:attention}盲注{}时，{C:mult}摧毁{}",
                        "{C:attention}2{}张随机{C:attention}小丑牌{}并创建",
                        "一张{C:attention}小丑牌{}和一张{C:legendary}传奇{}小丑牌",
                    },
                    {
                        "所有{C:attention}小丑牌{}每张给予",
                        "{X:chips,C:white}^#1#{}筹码和{X:mult,C:white}^#2#{}倍率",
                    },
                    {
                        "如果在{C:attention}Boss盲注{}结束时",
                        "拥有少于{C:attention}5{}张小丑牌，则{C:mult}自毁{}",
                    },
                }
            },
      c_abn_hunter_rune = {
                name = "猎人符文",
                text = {
                    {
                        "{C:attention}持有{}的{C:attention}消耗牌{}给予{X:mult,C:white}^#1#{}倍率",
                        "但回合结束时会被{C:mult}摧毁{}",
                    },
                    {
                        "如果选择{C:attention}盲注{}时",
                        "没有{C:attention}消耗牌{}，则{C:mult,E:1}输掉赛局{}",
                    }
                }
            },
      c_abn_curse_mark = {
                name = "诅咒印记",
                text = {
                    {
                        "计分牌给予其{C:attention}点数{}",
                        "作为{C:gold}晋升强度{}，计分后",
                        "变为{C:attention}石头{}牌",
                    },
                    {
                        "如果{C:attention}无点数{}牌计分",
                        "则{C:mult}自毁{}并摧毁",
                        "{C:attention}完整牌组{}中所有{C:attention}无点数{}牌",
                    }
                }
            },
      c_abn_geas_mark = {
                name = "誓约印记",
                text = {
                    {
                        "如果打出的牌包含{V:1}#1#{}",
                        "每张计分牌给予",
                        "{X:mult,C:white}^#2#{}倍率和{X:chips,C:white}^#3#{}筹码",
                    },
                    {
                        "如果打出的牌{C:attention}不{}",
                        "包含{V:1}#1#{}，则{C:mult,E:1}输掉赛局{}",
                        "{s:0.8}盲注选择时花色变化",
                    }
                }
            },
    },
  },
}
