return {
  descriptions = {
    Enhanced = {
      m_abn_wallpaper = {
                name = "壁纸牌",
                text = {
                    "计分手牌中每有一个{C:attention}蜡封{}",
                    "获得{C:mult}+#2#{}倍率",
                    "手牌中每有一个{C:attention}蜡封{}",
                    "获得{C:chips}+#4#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码，{C:mult}+#3#{C:inactive}倍率）",
                }
            },
      m_abn_reinforcement = {
                name = "加固牌",
                text = {
                    "你的{C:attention}小丑牌{}中每有一个{C:attention}贴纸{}",
                    "获得{C:mult}+#1#{}倍率、{C:chips}+#2#{}筹码",
                    "和{C:money}$#3#{}",
                    "{C:red,E:1,s:0.85}计分后如果倍率",
                    "{C:red,E:1,s:0.85}高于筹码则自毁{}",
                }
            },
      m_abn_kinship = {
                name = "亲缘牌",
                text = {
                    "每张与这张牌有相同{C:attention}花色{}",
                    "或{C:dark_edition}版本{}的牌",
                    "获得{C:white,X:mult}X#2#{}倍率",
                    "{C:inactive}（当前为{C:white,X:mult}X#1#{C:inactive}）",
                }
            },
      m_abn_zen = {
                name = "禅牌",
                text = {
                    "留在手牌中时，获得{C:mult}+#3#{}倍率",
                    "手牌中每多一张",
                    "{C:attention}禅{}牌额外获得{C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                }
            },
      m_abn_ocean = {
                name = "海洋牌",
                text = {
                    "这张牌{C:attention}左侧{}每有一张计分牌",
                    "获得{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                }
            },
      m_abn_mountain = {
                name = "山脉牌",
                text = {
                    "这张牌{C:attention}右侧{}每有一张计分牌",
                    "获得{C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                }
            },
      m_abn_teatag = {
                name = "茶标牌",
                text = {
                    "{C:attention}完整牌组{}中每有一张",
                    "{C:attention,s:0.85}茶标牌{}",
                    "获得{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码）",
                    "{C:inactive}（剩余{C:attention}#2#{C:inactive}次出牌）",
                }
            },
      m_abn_teastain = {
                name = "茶渍牌",
                text = {
                    "{C:white,X:mult}X#1#{}倍率",
                    "{C:attention}完整牌组{}中每有一张",
                    "{C:attention,s:0.85}茶渍牌{}额外获得{C:white,X:mult}X#2#{}倍率",
                }
            },
      m_abn_polkadot = {
                name = "波尔卡点牌",
                text = {
                    "{C:chips}+#1#{}筹码",
                    "计分时获得{C:chips}+#2#{}筹码",
                    "无点数无花色",
                }
            },
      m_abn_petroleum = {
                name = "石油牌",
                text = {
                    "{C:chips}+#1#{}筹码",
                    "{C:money}+$#2#{}",
                    "如果分数着火",
                    "则变为{C:attention}油田火{}牌",
                    "无点数无花色",
                },
            },
      m_abn_oilfire = {
                name = "油田火牌",
                text = {
                    "{C:mult}+#1#{}倍率",
                    "{C:red}-$#2#{}",
                    "有{C:green}#3#/#4#{}几率",
                    "{C:red}自毁{}",
                    "无点数无花色",
                },
            },
      m_abn_fossil = {
                name = "化石牌",
                text = {
                    "{X:mult,C:white}X#1#{}倍率",
                    "{C:money}+$#2#{}",
                    "有{C:green}#3#/#4#{}几率",
                    "{C:red}自毁{}",
                },
            },
      m_abn_mercurial = {
                name = "水星牌",
                text = {
                    "计分手牌中每有一种不同{C:attention}花色{}",
                    "获得{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                },
            },
      m_abn_hot_iron = {
                name = "烙铁牌",
                text = {
                    "留在手牌中时获得{X:mult,C:white}X#2#{}倍率",
                    "有{C:green}#4#/#5#{}几率获得{C:chips}+#1#{}筹码",
                    "有{C:green}#6#/#7#{}几率获得{X:mult,C:white}X#3#{}倍率",
                    "{C:inactive}打出时不计分{}",
                },
            },
      m_abn_infra = {
                name = "红外牌",
                text = {
                    "每张计分牌获得{C:mult}+#2#{}倍率和{C:chips}+#4#{}筹码",
                    "如果与{C:attention}3{}张或更少计分牌一同打出则{C:mult}自毁{}",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#3#{C:inactive}筹码）",
                },
            },
      m_abn_hazard = {
                name = "险兆牌",
                text = {
                    "{X:mult,C:white}X#1#{}倍率",
                    "每多一张计分的险兆牌额外获得{X:mult,C:white}+X#2#{}倍率",
                    "有{C:green}#3#/#4#{}几率{C:attention}重新触发{}",
                    "提高{C:attention}盲注需求{} {C:attention}10%{}",
                },
            },
      m_abn_contagion_seal = {
                name = "传染蜡封",
                text = {
                    "{X:mult,C:white}倍乘倍率{}效果触发时",
                    "获得{X:mult,C:white}^#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}^#1#{C:inactive}倍率）",
                },
            },
      m_abn_contagion_bonus = {
                name = "传染奖励",
                text = {
                    "获得等同于",
                    "打出牌数量的{C:spectral}倍乘筹码{}",
                },
            },
      m_abn_contagion_mult = {
                name = "传染倍率",
                text = {
                    "{X:mult,C:white}^#1#{}倍率",
                },
            },
      m_abn_monitor = {
                name = "显示器牌",
                text = {
                    "获得等同于计分",
                    "{V:1}#1#{}数量的倍乘倍率",
                    "{s:0.8}花色每回合变化",
                    "无点数无花色",
                },
            },
      m_abn_cotton = {
                name = "棉质牌",
                text = {
                    "手牌中{C:attention}棉质{}牌的",
                    "{C:planet}星球{} {C:attention}点数{}等级翻倍",
                },
            },
      m_abn_sew = {
                name = "缝制牌",
                text = {
                    "此牌每次触发时获得{C:chips}+#4#{}筹码和{C:mult}+#3#{}倍率",
                    "每打出一张缝制牌，重新触发每张缝制牌一次",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码，{C:mult}+#1#{C:inactive}倍率）",
                },
            },
      m_abn_darkner = {
                name = "暗色牌",
                text = {
                    "打出的和手牌中的{C:spades}暗色花色{}牌",
                    "获得{C:chips}+#1#{}筹码和{C:mult}+#2#{}倍率",
                    "如果与{C:attention}#3#{}张或更多{C:diamonds}光明花色{}牌",
                    "一同打出则{C:mult}自毁{}",
                },
            },
      m_abn_lightner = {
                name = "光明牌",
                text = {
                    "打出的和手牌中的{C:diamonds}光明花色{}牌",
                    "获得{C:chips}+#1#{}筹码和{C:mult}+#2#{}倍率",
                    "如果与{C:attention}#3#{}张或更多{C:spades}暗色花色{}牌",
                    "一同打出则{C:mult}自毁{}",
                },
            },
      m_abn_kintsugi = {
                name = "金缮牌",
                text = {
                    "获得{C:chips}+#1#{}筹码、{C:mult}+#2#{}倍率和{C:money}$#3#{}",
                    "其他牌被{C:mult}摧毁{}时",
                    "有{C:green}#4#/#5#{}几率创建此牌的复制牌",
                    "有{C:green}#6#/#7#{}几率使此牌的{C:attention}数值{} {C:attention}翻倍{}",
                },
            },
      m_abn_first_aid = {
                name = "急救牌",
                text = {
                    "如果与{C:mult}被削弱{}的牌一同打出则获得{C:mult}+#4#{}倍率",
                    "如果有牌被{C:mult}摧毁{}则获得{C:chips}+#3#{}筹码",
                    "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率，{C:chips}+#1#{C:inactive}筹码）",
                },
            },
      m_abn_plank = {
                name = "木板牌",
                text = {
                    "给予{C:gold}+#1#{}晋升强度",
                },
            },
      m_abn_flux = {
                name = "熔流牌",
                text = {
                    "{C:purple}+#1#{}计分，若属于",
                    "{C:attention}获胜牌型{}，则再获得{C:purple}+#2#{}计分",
                },
            },
      m_abn_discontinued = {
                name = "绝版牌",
                text = {
                    "本局每获得过一种{C:attention}不同标签{}，",
                    "获得{C:gold}+#3#{}晋升强度和{C:chips}+#4#{}筹码",
                    "{C:inactive}(当前 {C:gold}+#1#{C:inactive}，{C:chips}+#2#{C:inactive})",
                },
            },
      m_abn_tile = {
                name = "瓦片牌",
                text = {
                    "{C:attention}打出{}后返回",
                    "{C:attention}牌组{}",
                },
            },
      m_abn_papermache = {
                name = "纸糊牌",
                text = {
                    "若作为{C:attention}奇数{}牌未计分，",
                    "则获得{X:chips,C:white}X#1#{}筹码",
                    "若作为{C:attention}偶数{}牌未计分，",
                    "则获得{X:mult,C:white}X#2#{}倍率",
                },
            },
    },
    Other = {
            -- 增强
      abn_stk_bonus = {
                name = "加成",
                text = {
                    "计分时{C:blue}+#1#{}筹码",
                },
            },
      abn_stk_mult = {
                name = "倍率",
                text = {
                    "计分时{C:red}+#1#{}倍率",
                },
            },
      abn_stk_wild = {
                name = "万能",
                text = {
                    "{C:attention}第一张计分牌{}同时被视为",
                    "所有{C:attention}花色{}",
                },
            },
      abn_stk_stone = {
                name = "石头",
                text = {
                    "计分时{C:blue}+#1#{}筹码",
                    "每张{C:attention}打出的牌{}都参与计分",
                },
            },
      abn_stk_glass = {
                name = "玻璃",
                text = {
                    "计分时{X:red,C:white}X#1#{}倍率",
                    "所有计分结束后，有{C:green}#2#/#3#{}几率",
                    "摧毁小丑牌",
                },
            },
      abn_stk_steel = {
                name = "钢铁",
                text = {
                    "计分后{X:red,C:white}X#1#{}倍率",
                },
            },
      abn_stk_gold = {
                name = "黄金",
                text = {
                    "回合结束时{C:gold}$#1#{}",
                },
            },
      abn_stk_lucky = {
                name = "幸运",
                text = {
                    "有{C:green}#1#/#2#{}几率给予{C:red}+#3#{}倍率",
                    "有{C:green}#4#/#5#{}几率给予{C:gold}$#6#{}",
                },
            },
      abn_stk_fossil = {
                name = "化石",
                text = {
                    "{X:red,C:white}X#1#{}倍率，{C:gold}$#2#",
                    "计分后，有{C:green}#3#/#4#{}几率",
                    "{C:red,E:2}自毁{}",
                },
            },
      abn_stk_petroleum = {
                name = "石油",
                text = {
                    "{C:chips}+#1#{}筹码，{C:gold}+$#2#",
                    "若分数{C:red,E:2}着火{}，",
                    "则变为{C:enhanced}油田火{}贴纸",
                },
            },
      abn_stk_oilfire = {
                name = "油田火",
                text = {
                    "{C:red}+#1#{}倍率，{C:red}-$#2#",
                    "计分后，有{C:green}#3#/#4#{}几率",
                    "{C:red,E:2}自毁{}",
                },
            },
      abn_stk_mercurial = {
                name = "水星",
                text = {
                    "计分手牌中每有一种{C:attention}不同{}的花色，",
                    "获得{C:chips}+#1#{}筹码",
                    "{C:inactive}(当前 {C:chips}+#2#{C:inactive} 筹码)",
                },
            },
      abn_stk_kintsugi = {
                name = "金缮",
                text = {
                    "{C:chips}+#1#{}筹码，{C:mult}+#2#{}倍率，{C:gold}+$#3#{}",
                    " ",
                    "有{C:green}#6#/#7#{}几率使此贴纸",
                    "的数值翻倍",
                    " ",
                    "每底注一次，摧毁一张{C:red,E:2}游戏牌{}后",
                    "有{C:green}#4#/#5#{}几率克隆此小丑牌",
                    "{C:inactive}(需有空间)",
                },
            },
      abn_stk_wallpaper = {
                name = "墙纸",
                text = {
                    "计分手牌中每有一张带{C:attention}蜡封{}的牌，",
                    "获得{C:mult}+#2#{}倍率；留在手牌中的",
                    "每有一张带{C:attention}蜡封{}的牌，获得{C:chips}+#4#{}筹码",
                    "{C:inactive}(当前 {C:mult}+#1#{C:inactive} 倍率, {C:chips}+#3#{C:inactive} 筹码)",
                },
            },
      abn_stk_infra = {
                name = "红外观测",
                text = {
                    "每有一张计分牌，获得",
                    "{C:mult}+#2#{}倍率和{C:chips}+#4#{}筹码",
                    "若计分牌少于{C:attention}3{}张，",
                    "则{C:red,E:2}自毁{}",
                    "{C:inactive}(当前 {C:mult}+#3#{C:inactive} 倍率, {C:chips}+#1#{C:inactive} 筹码)",
                },
            },
      abn_stk_hazard = {
                name = "险兆",
                text = {
                    "{X:mult,C:white}X#1#{}倍率",
                    "每有一张带有此{C:enhanced}贴纸增强{}的其他小丑牌，",
                    "获得{X:mult,C:white}+X#2#{}倍率",
                    "有{C:green}#3#/#4#{}几率重新触发",
                    "{X:blind,C:white}X#5#{}盲注需求",
                },
            },
      abn_stk_monitor = {
                name = "监视器",
                text = {
                    "{X:mult,C:white}^倍率{}与计分的",
                    "{C:dark_edition}<花色>{}数量相关",
                },
            },
      abn_stk_monitor_hearts = {
                name = "监视器",
                text = {
                    "{X:mult,C:white}^倍率{}与计分的",
                    "{C:hearts}#1#{}数量相关",
                },
            },
      abn_stk_monitor_diamonds = {
                name = "监视器",
                text = {
                    "{X:mult,C:white}^倍率{}与计分的",
                    "{C:diamonds}#1#{}数量相关",
                },
            },
      abn_stk_monitor_clubs = {
                name = "监视器",
                text = {
                    "{X:mult,C:white}^倍率{}与计分的",
                    "{C:clubs}#1#{}数量相关",
                },
            },
      abn_stk_monitor_spades = {
                name = "监视器",
                text = {
                    "{X:mult,C:white}^倍率{}与计分的",
                    "{C:spades}#1#{}数量相关",
                },
            },
    },
  },
  misc = {
    labels = {
      abn_stk_bonus = "加成",
      abn_stk_mult = "倍率",
      abn_stk_stone = "石头",
      abn_stk_glass = "玻璃",
      abn_stk_lucky = "幸运",
      abn_stk_steel = "钢铁",
      abn_stk_wild = "万能",
      abn_stk_gold = "黄金",
      abn_stk_fossil = "化石",
      abn_stk_petroleum = "石油",
      abn_stk_oilfire = "油田火",
      abn_stk_mercurial = "水星",
      abn_stk_monitor = "显示器",
      abn_stk_monitor_hearts = "显示器",
      abn_stk_monitor_diamonds = "显示器",
      abn_stk_monitor_spades = "显示器",
      abn_stk_monitor_clubs = "显示器",
      abn_stk_infra = "红外",
      abn_stk_hazard = "险兆",
      abn_stk_kintsugi = "金缮",
      abn_stk_wallpaper = "壁纸",
    },
  },
}

