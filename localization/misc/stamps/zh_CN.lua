return {
  descriptions = {
    Other = {
            -- 印章
      abn_empty_stamp = {
                name = "空白印章",
                text = {
                    "若此牌带有{C:dark_edition}版本{}、{C:attention}蜡封{}和",
                    "{C:dark_edition}增强{}，则{C:attention}手牌上限+1{}",
                },
            },
      abn_jester_stamp = {
                name = "小丑印章",
                text = {
                    "若此牌带有{C:dark_edition}版本{}、{C:attention}蜡封{}和",
                    "{C:dark_edition}增强{}，则被{C:mult}摧毁{}时",
                    "{C:attention}小丑牌槽位+1{}{C:inactive}(上限:5){}",
                },
            },
      abn_icon_stamp = {
                name = "圣像印章",
                text = {
                    "若此牌带有{C:dark_edition}版本{}、{C:attention}蜡封{}和",
                    "{C:dark_edition}增强{}，则每有一种",
                    "{C:attention}蜡封{}/{C:dark_edition}版本{}/{C:dark_edition}增强{}",
                    "给予{X:chips,C:white}X1{}筹码",
                    "若回合在{C:attention}1{}次出牌内获胜，",
                    "则{C:mult}摧毁{}此牌",
                    "{C:inactive}当前：{X:chips,C:white}X#1#{} 筹码",
                },
            },
      abn_psychomancy_stamp = {
                name = "摄魂印章",
                text = {
                    "{C:mult}摧毁{}此牌时，按其带有的每种",
                    "{C:dark_edition}版本{}、{C:dark_edition}增强{}和{C:attention}蜡封{}，",
                    "将{C:attention}最常用的牌型{}升级",
                },
            },
      abn_membership_stamp = {
                name = "会员印章",
                text = {
                    "若此牌带有{C:dark_edition}版本{}、{C:attention}蜡封{}和",
                    "{C:dark_edition}增强{}，则计分时获得",
                    "{C:gold}+#1#{}晋升强度",
                    "{C:inactive}当前：{C:gold}#2#{} 晋升强度",
                },
            },
      abn_prehensile_stamp = {
                name = "抓握印章",
                text = {
                    "若此牌带有{C:dark_edition}版本{}、{C:attention}蜡封{}和",
                    "{C:dark_edition}增强{}，则其{C:attention}必定计分{}",
                    "并{C:attention}无视选牌上限{}",
                },
            },
    },
  },
  misc = {
    labels = {
      abn_empty_stamp = "空白印章",
      abn_jester_stamp = "小丑印章",
      abn_icon_stamp = "圣像印章",
      abn_psychomancy_stamp = "摄魂印章",
      abn_membership_stamp = "会员印章",
      abn_prehensile_stamp = "抓握印章",
    },
  },
}

