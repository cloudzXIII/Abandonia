return {
  descriptions = {
    artistry_cards = {
      c_abn_marquee = {
                name = "选取框",
                text = {
                    "选定一张牌和一张小丑牌",
                    "{C:mult}摧毁{}小丑牌",
                    "与选定牌花色相同的所有牌",
                    "根据被摧毁小丑牌的稀有度获得{C:chips}筹码{}",
                    "{C:common}普通{}：{C:chips}+#1#{}筹码",
                    "{C:uncommon}罕见{}：{C:chips}+#2#{}筹码",
                    "{C:rare}稀有{}：{C:chips}+#3#{}筹码",
                    "{C:abn_superrare}超稀有{}：{C:chips}+#4#{}筹码",
                    "{C:legendary}传奇{}：{C:chips}+#5#{}筹码",
                    "{C:abn_parallelrare}爆闪{}：{C:chips}+#6#{}筹码",
                }
            },
      c_abn_pencil = {
                name = "铅笔",
                text = {
                    "选定一张牌和一张小丑牌",
                    "{C:mult}摧毁{}小丑牌",
                    "与选定牌花色相同的所有牌",
                    "根据被摧毁小丑牌的稀有度获得{C:mult}倍率{}",
                    "{C:common}普通{}：{C:mult}+#1#{}倍率",
                    "{C:uncommon}罕见{}：{C:mult}+#2#{}倍率",
                    "{C:rare}稀有{}：{C:mult}+#3#{}倍率",
                    "{C:abn_superrare}超稀有{}：{C:mult}+#4#{}倍率",
                    "{C:legendary}传奇{}：{C:mult}+#5#{}倍率",
                    "{C:abn_parallelrare}爆闪{}：{C:mult}+#6#{}倍率",
                }
            },
      c_abn_eraser = {
                name = "橡皮擦",
                text = {
                    "选定一张{C:attention}无点数{}牌和一张小丑牌",
                    "{C:mult}摧毁{}小丑牌",
                    "所有{C:attention}无点数{}牌根据",
                    "被摧毁小丑牌的稀有度获得{C:chips}筹码{}和{C:mult}倍率{}",
                    "{C:common}普通{}：{C:chips}+#1#{}筹码 {C:mult}+#2#{}倍率",
                    "{C:uncommon}罕见{}：{C:chips}+#3#{}筹码 {C:mult}+#4#{}倍率",
                    "{C:rare}稀有{}：{C:chips}+#5#{}筹码 {C:mult}+#6#{}倍率",
                    "{C:abn_superrare}超稀有{}：{C:chips}+#7#{}筹码 {C:mult}+#8#{}倍率",
                    "{C:legendary}传奇{}：{C:chips}+#9#{}筹码 {C:mult}+#10#{}倍率",
                    "{C:abn_parallelrare}爆闪{}：{C:chips}+#11#{}筹码 {C:mult}+#12#{}倍率",
                }
            },
      c_abn_eyedropper = {
                name = "取色器",
                text = {
                    "选定一张牌和一张小丑牌",
                    "{C:mult}摧毁{}小丑牌",
                    "与选定牌花色相同的所有牌",
                    "根据被摧毁小丑牌的稀有度永久获得{C:money}资金{}",
                    "{C:common}普通{}：{C:money}+$#1#{}",
                    "{C:uncommon}罕见{}：{C:money}+$#2#{}",
                    "{C:rare}稀有{}：{C:money}+$#3#{}",
                    "{C:abn_superrare}超稀有{}：{C:money}+$#4#{}",
                    "{C:legendary}传奇{}：{C:money}+$#5#{}",
                    "{C:abn_parallelrare}爆闪{}：{C:money}+$#6#{}",
                }
            },
      c_abn_hand = {
                name = "抓手工具",
                text = {
                    "选定一张牌和一张小丑牌",
                    "{C:mult}摧毁{}小丑牌",
                    "与选定牌花色相同的所有牌",
                    "根据被摧毁小丑牌的稀有度获得{C:chips}筹码{}",
                    "{C:common}普通{}：{X:chips,C:white}X#1#{}筹码",
                    "{C:uncommon}罕见{}：{X:chips,C:white}X#2#{}筹码",
                    "{C:rare}稀有{}：{X:chips,C:white}X#3#{}筹码",
                    "{C:abn_superrare}超稀有{}：{X:chips,C:white}X#4#{}筹码",
                    "{C:legendary}传奇{}：{X:chips,C:white}X#5#{}筹码",
                    "{C:abn_parallelrare}爆闪{}：{X:chips,C:white}X#6#{}筹码",
                }
            },
      c_abn_move = {
                name = "移动",
                text = {
                    "选定一张牌和一张小丑牌",
                    "{C:mult}摧毁{}小丑牌",
                    "与选定牌花色相同的所有牌",
                    "根据被摧毁小丑牌的稀有度获得{C:mult}倍率{}",
                    "{C:common}普通{}：{X:mult,C:white}X#1#{}倍率",
                    "{C:uncommon}罕见{}：{X:mult,C:white}X#2#{}倍率",
                    "{C:rare}稀有{}：{X:mult,C:white}X#3#{}倍率",
                    "{C:abn_superrare}超稀有{}：{X:mult,C:white}X#4#{}倍率",
                    "{C:legendary}传奇{}：{X:mult,C:white}X#5#{}倍率",
                    "{C:abn_parallelrare}爆闪{}：{X:mult,C:white}X#6#{}倍率",
                }
            },
      c_abn_paint = {
                name = "颜料",
                text = {
                    "选定一张牌和一张小丑牌",
                    "{C:mult}摧毁{}小丑牌",
                    "根据被摧毁小丑牌的稀有度",
                    "提升选定牌花色的{C:planet}星球{} {C:attention}点数{}等级",
                    "{C:common}普通{}：{C:attention}+#1#{}星球点数",
                    "{C:uncommon}罕见{}：{C:attention}+#2#{}星球点数",
                    "{C:rare}稀有{}：{C:attention}+#3#{}星球点数",
                    "{C:abn_superrare}超稀有{}：{C:attention}+#4#{}星球点数",
                    "{C:legendary}传奇{}：{C:attention}+#5#{}星球点数",
                    "{C:abn_parallelrare}爆闪{}：{C:attention}+#6#{}星球点数",
                }
            },
      c_abn_line = {
                name = "线条",
                text = {
                    "选定一张牌和一张小丑牌",
                    "{C:mult}摧毁{}小丑牌",
                    "与选定牌花色相同的所有牌",
                    "根据被摧毁小丑牌的稀有度获得{C:attention}重新触发{}次数",
                    "{C:common}普通{}：{C:attention}+#1#{}次重新触发",
                    "{C:uncommon}罕见{}：{C:attention}+#2#{}次重新触发",
                    "{C:rare}稀有{}：{C:attention}+#3#{}次重新触发",
                    "{C:abn_superrare}超稀有{}：{C:attention}+#4#{}次重新触发",
                    "{C:legendary}传奇{}：{C:attention}+#5#{}次重新触发",
                    "{C:abn_parallelrare}爆闪{}：{C:attention}+#6#{}次重新触发",
                }
            },
    },
  },
}
