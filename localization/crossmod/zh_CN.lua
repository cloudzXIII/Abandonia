return {
  descriptions = {
    Joker = {
      j_abn_curse_mask = {
                name = "诅咒面具",
                text = {
                    "选择{C:attention}盲注{}时，移除所有小丑牌和牌上的诅咒",
                    "从小丑牌移除的每个诅咒获得{C:mult}+#3#{}倍率",
                    "从牌移除的每个诅咒获得{C:chips}+#4#{}筹码",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                }
            },
      j_abn_anaglyphic_joker = {
                name = "浮雕小丑",
                text = {
                    "给{C:attention}第一次出牌{}的{C:attention}第一张{}和{C:attention}最后一张{}计分牌",
                    "添加{C:mult}立{}{C:chips}体{}{C:mult}浮{}{C:chips}雕{}{C:mult}效{}{C:chips}果{}",
                    "完整牌组中每张{C:mult}立{}{C:chips}体{}{C:mult}浮{}{C:chips}雕{}{C:mult}效{}{C:chips}果{}牌",
                    "获得{C:mult}+#3#{}倍率和{C:chips}+#4#{}筹码",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                }
            },
      j_abn_forsaken_joker = {
                name = "被遗忘的小丑",
                text = {
                    "打出的{C:attention}弯曲{}牌有{C:green}#1#/#2#{}几率",
                    "获得{C:dark_edition}过曝{}",
                    "打出的{C:attention}邮政{}牌有{C:green}#3#/#4#{}几率",
                    "获得{C:dark_edition}荧光{}",
                }
            },
      j_abn_lunatic_joker = {
                name = "疯人小丑",
                text = {
                    "如果这是回合的{C:attention}第一次出牌{}",
                    "给计分的{C:attention}偶数{}牌添加{C:inactive}灰度{}",
                    "如果这是回合的{C:attention}最后一次出牌{}",
                    "给计分的{C:attention}奇数{}牌添加{C:planet}青色蜡封{}",
                }
            },
      j_abn_recursive_joker = {
                name = "递归小丑",
                text = {
                    {
                        "小丑牌可能出现多次",
                    },
                    {
                        "每张小丑牌的复制品",
                        "给予{X:chips,C:white}X#1#{}筹码",
                    }
                }
            },
      j_abn_joker_jester = {
                name = "小丑·小丑",
                text = {
                    "{C:common}普通{}小丑牌给予{C:chips}+#1#{}筹码",
                    "{C:uncommon}罕见{}小丑牌给予{C:mult}+#2#{}倍率",
                    "{C:rare}稀有{}小丑牌给予{X:mult,C:white}X#3#{}倍率",
                }
            },
      j_abn_information_overload = {
                name = "信息过载",
                text = {
                    "所有计分的{C:attention}偶数{}牌获得{C:spectral}火焰灵气{}",
                    "所有计分的{C:attention}奇数{}牌获得{C:money}基础灵气{}",
                }
            },
      j_abn_pirate_server = {
                name = "海盗服务器",
                text = {
                    "计分的{C:money}中型弹药{}牌获得{C:abn_brown_seal}棕色蜡封{}",
                    "计分的{C:purple}经验加成{}牌获得{C:dark_edition}幻彩{}版本",
                    "如果这张小丑牌带有{C:tarot}冲击波{}，重新触发所有{C:attention}不带{} {C:dark_edition}版本{}的小丑牌",
                }
            },
      j_abn_the_big_cheese = {
                name = "大人物",
                text = {
                    "所有{C:uncommon}罕见{}和{C:rare}稀有{}小丑牌{C:attention}免费{}",
                    "但购买时获得{C:money}神话{}版本",
                }
            },
      j_abn_the_drink = {
                name = "饮料",
                text = {
                    {
                        "如果回合的{C:attention}第一次出牌{}",
                        "只有{C:attention}5{}张计分牌",
                        "它们全部获得{C:tarot}冲击波{}",
                    },
                    {
                        "如果回合的{C:attention}最后一次出牌{}是",
                        "{C:attention}高牌{}，给所有{C:attention}未计分{}牌",
                        "添加{C:purple}故障蜡封{}",
                    }
                }
            },
      j_abn_certified_brainrot = {
                name = "认证脑残",
                text = {
                    {
                        "{C:attention}脑残{}小丑牌每张给予",
                        "{X:chips,C:white}^#2#{}筹码和{X:mult,C:white}^#1#{}倍率",
                    },
                    {
                        "削弱所有{C:attention}非脑残{}小丑牌",
                    }
                }
            },
      j_abn_mini_balala = {
                name = "迷你巴拉拉",
                text = {
                    "{C:attention}小丑牌{}被{C:money}售出{}时",
                    "有{C:green}#1#/#2#{}几率生成{C:mult}地精{}",
                    "有{C:green}#1#/#3#{}几率生成{C:purple}绷带火箭筒{}",
                    "有{C:green}#1#/#4#{}几率生成{C:money}FTC诉讼{}",
                }
            },
      j_abn_mango = {
                name = "芒果",
                text = {
                    "#1#",
                    "#2#",
                }
            },
      j_abn_joker_fortnite = {
                name = "小丑=堡垒之夜",
                text = {
                    "如果{C:purple}堡垒之夜{} {C:attention}已安装{}",
                    "每张{C:attention}模组{}小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "否则每张{C:attention}模组{}小丑牌获得{C:mult}+#4#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率，{C:mult}+#3#{C:inactive}倍率）",
                }
            },
      j_abn_ugh_jimbo = {
                name = "呃，金宝？",
                text = {
                    "喜欢说话……也许吧",
                }
            },
      j_abn_narcoleptic_joker = {
                name = "嗜睡小丑",
                text = {
                    {
                        "如果打出的牌只包含",
                        "{C:spades}黑桃{}和{C:clubs}梅花{}",
                        "获得{X:chips,C:white}X#1#{}筹码",
                    },
                    {
                        "如果打出的牌只包含",
                        "{C:spades}黑桃{}和{C:abn_bow}弓{}",
                        "获得{X:mult,C:white}X#2#{}倍率",
                    }
                }
            },
      j_abn_spectrum_hell = {
                name = "光谱地狱",
                text = {
                    "如果打出的牌包含{C:attention}光谱{}",
                    "且分数{C:attention}着火{}",
                    "所有{C:attention}小丑牌{}永久获得{X:mult,C:white}X#1#{}倍率",
                }
            },
      j_abn_nova_red_eyes_joker = {
                name = "新星红眼小丑",
                text = {
                    "如果回合的{C:attention}第一次出牌{}",
                    "只包含{C:spades}暗色花色{}",
                    "所有计分牌永久获得",
                    "{C:attention}+#1#{}次重新触发和{C:dark_edition}幽冥{}版本",
                }
            },
      j_abn_cossak_joker = {
                name = "哥萨克小丑",
                text = {
                    {
                        "计分时将打出的{C:abn_snow}雪{}牌",
                        "{C:attention}增强{}为{C:attention}冰{}牌",
                    },
                    {
                        "每张计分的{C:abn_snow}雪{} {C:attention}冰{}牌",
                        "这张小丑牌获得{C:chips}+#2#{}筹码",
                        "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                    }
                }
            },
      j_abn_spectrum_hand = {
                name = "光谱之手",
                text = {
                    {
                        "如果打出的牌包含{C:attention}光谱{}",
                        "计分的{C:diamonds}光明花色{}牌{C:attention}增强{}为",
                        "{C:dark_edition}银{} {C:attention}狂热{}牌",
                        "计分的{C:spades}暗色花色{}牌{C:attention}增强{}为",
                        "{C:dark_edition}幽冥{} {C:attention}充能{}牌",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}银{}版本",
                        "每张计分牌获得{C:mult}+#1#{}倍率",
                        "如果这张小丑牌带有{C:dark_edition}幽冥{}版本",
                        "每张计分牌获得{C:chips}+#2#{}筹码",
                        "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率，{C:chips}+#4#{C:inactive}筹码）",
                    },
                }
            },
      j_abn_celestial_joker = {
                name = "天体小丑",
                text = {
                    "选择{C:attention}盲注{}时",
                    "所有小丑牌获得{C:chips}+#1#{}筹码",
                }
            },
      j_abn_mod_joker = {
                name = "模组小丑",
                text = {
                    "{C:attention}万能{}牌每被视为一种",
                    "不同{C:attention}花色{}",
                    "获得{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                }
            },
      j_abn_maltese_cross = {
                name = "马耳他十字",
                text = {
                    "计分的{C:attention}多米诺{}牌",
                    "按该{C:attention}点数{}本盲注中计分的次数，",
                    "每次永久获得{C:chips}+#1#{}筹码",
                },
            },
      j_abn_backup_plan = {
                name = "备用计划",
                text = {
                    "计分牌型中每有一张其他牌，",
                    "{C:attention}第一张{}计分牌",
                    "便额外触发一次",
                },
            },
      j_abn_sikhs_joker = {
                name = "锡克小丑牌",
                text = {
                    "每使用过一张{C:attention}不同{}的",
                    "{C:tarot}小秘术{}牌，计分牌",
                    "给予{X:chips,C:white}X#2#{}筹码",
                    "{C:inactive}(当前 {X:chips,C:white}X#1#{} 筹码)",
                },
            },
      j_abn_sol_iii = {
                name = "太阳III",
                text = {
                    "每有一级{C:attention}牌型{}等级，",
                    "该{C:attention}牌型{}给予{C:gold}+#1#{}晋升强度",
                },
            },
      j_abn_librarian_joker = {
                name = "图书管理员",
                text = {
                    "当{C:lexica}辞典{}牌在{C:attention}盲注{}中触发时，",
                    "生成一张随机的{C:dark_edition}负片{}",
                    "{C:calligraphy}书法{}牌",
                },
            },
    },
  },
}
