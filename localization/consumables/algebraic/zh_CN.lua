return {
  descriptions = {
    algebraic = {
      c_abn_euler = {
                name = "欧拉",
                text = {
                    "下一次计分的{C:attention}顺子{}",
                    "若{C:attention}点数{}均不高于{C:attention}6{}",
                    "则给予{C:white,X:chips}X#1#{}筹码",
                },
            },
      c_abn_golden = {
                name = "黄金",
                text = {
                    "下一次计分的{C:attention}顺子{}",
                    "若{C:attention}点数{}均不高于{C:attention}10{}",
                    "则给予{C:white,X:mult}X#1#{}倍率",
                },
            },
      c_abn_pi = {
                name = "圆周率",
                text = {
                    "下一次计分的{C:attention}高牌{}",
                    "获得你上一次计分{C:attention}同花{}的",
                    "{C:chips}筹码{}和{C:mult}倍率{}",
                    "{C:inactive}当前：{C:white,X:mult}#1#{}倍率 {C:white,X:chips}#2#{}筹码",
                },
            },
      c_abn_number = {
                name = "数字",
                text = {
                    "下一次出牌仅由{C:attention}数字{}牌组成",
                    "每有一个{C:attention}不同{}的计分数字",
                    "便{C:attention}升级{}一次",
                },
            },
    },
  },
}
