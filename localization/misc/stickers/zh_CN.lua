return {
  descriptions = {
    Other = {
            --#region 贴纸
            -- 贴纸
      abn_pump_up = {
                name = "振奋",
                text = {
                    "{C:mult}+#1#{}倍率",
                }
            },
      abn_bullseye = {
                name = "靶心",
                text = {
                    "{C:chips}+#1#{}筹码",
                }
            },
      abn_immortal = {
                name = "不朽",
                text = {
                    "这张小丑牌不会被",
                    "{C:red}摧毁{}或",
                    "{C:red}削弱{}",
                }
            },
      abn_shovel = {
                name = "铲子",
                text = {
                    "如果这是回合的{C:attention}第一次出牌{}",
                    "{C:white,X:chips}X#1#{}筹码",
                }
            },
      abn_downgrade = {
                name = "降级",
                text = {
                    "{C:mult}#1#{}倍率",
                }
            },
      abn_vessel = {
                name = "容器",
                text = {
                    "计分时{C:attention}盲注需求{}",
                    "提高{C:attention}10%{}",
                }
            },
      abn_weight = {
                name = "沉重",
                text = {
                    "{C:white,X:chips}X#1#{}筹码",
                    "{C:red,E:1}无法移动{}",
                }
            },
      abn_crown = {
                name = "王冠",
                text = {
                    "{C:dark_edition}版本{}无法改变",
                }
            },
      abn_flip = {
                name = "翻转",
                text = {
                    "计分后",
                    "{C:attention}翻转{}此牌",
                }
            },
      abn_fragile = {
                name = "易碎",
                text = {
                    "计分时此牌有",
                    "{C:green}#1#/#2#{}几率",
                    "被{C:red}摧毁{}",
                }
            },
      abn_possibility = {
                name = "可能性",
                text = {
                    "如果这是回合的{C:attention}第一次出牌{}",
                    "所有列出的",
                    "{C:green,E:1,S:1.1}概率{}翻倍",
                    "{C:inactive}（例：{C:green}1/3{C:inactive} -> {C:green}2/3{C:inactive}）",
                }
            },
      abn_question_mark = {
                name = "问号？",
                text = {
                    "计分牌变为{C:attention}无色{}",
                }
            },
      abn_square = {
                name = "方块",
                text = {
                    "{C:attention}第一张{}计分时",
                    "打出的牌",
                    "给予{C:white,X:chips}X#1#{}筹码",
                }
            },
      abn_cat_eye = {
                name = "猫眼",
                text = {
                    "重新触发{C:attention}第一张{}",
                    "计分的{C:attention}A{}",
                }
            },
      abn_lightning_bolt = {
                name = "闪电",
                text = {
                    "重新触发{C:attention}第一张{}",
                    "计分的{C:attention}数字牌{}",
                }
            },
      abn_top_hat = {
                name = "礼帽",
                text = {
                    "重新触发{C:attention}第一张{}",
                    "计分的{C:attention}增强牌{}",
                }
            },
      abn_negative_plus = {
                name = "负片+",
                text = {
                    "在回合的{C:attention}最后一次",
                    "{C:attention}出牌{}中给随机牌",
                    "添加{C:dark_edition}负片{}版本",
                }
            },
      abn_eraser = {
                name = "橡皮擦",
                text = {
                    "计分前移除",
                    "{C:attention}最左侧{}计分牌的",
                    "所有{C:attention}增强效果{}",
                }
            },
      abn_lucky = {
                name = "幸运",
                text = {
                    "计分牌有",
                    "{C:green}#1#/#2#{}几率",
                    "给予{C:mult}+#3#{}倍率",
                }
            },
      abn_glove_hand = {
                name = "手套",
                text = {
                    "{C:mult}+#1#{}次弃牌",
                }
            },
      abn_spicy = {
                name = "辛辣",
                text = {
                    "如果{C:attention}分数{} {C:mult}着火{}",
                    "永久将此小丑牌的{C:mult}倍率{}/{C:chips}筹码{}翻倍",
                }
            },
      abn_x = {
                name = "X",
                text = {
                    "{C:mult}被削弱{}的牌计分时",
                    "给予{X:mult,C:white}X#1#{}倍率",
                }
            },
      abn_aim = {
                name = "瞄准",
                text = {
                    "每次{C:blue}出牌{}后",
                    "移动位置",
                    "无法手动改变位置",
                }
            },
      abn_stinker = {
                name = "臭气",
                text = {
                    "此贴纸生效时",
                    "所有{C:spectral}幻灵{}牌被{C:red}禁用{}",
                }
            },
      abn_bug = {
                name = "虫",
                text = {
                    "此贴纸生效期间，",
                    "所有{C:tarot}塔罗牌{}被{C:red}禁用{}",
                },
            },
      abn_martini = {
                name = "马提尼",
                text = {
                    "此贴纸生效期间，",
                    "所有{C:planet}星球牌{}被{C:red}禁用{}",
                },
            },
      abn_road_block = {
                name = "路障",
                text = {
                    "此贴纸生效期间，",
                    "首次打出的牌型",
                    "计分为{C:purple}0",
                },
            },
      abn_pawn = {
                name = "兵",
                text = {
                    "此贴纸生效期间，",
                    "所有{C:sigils}符印{}牌和",
                    "{C:astro_cards}星座{}牌被{C:red}禁用{}",
                },
            },
      abn_lightbulb = {
                name = "灯泡",
                text = {
                    "此贴纸生效期间，",
                    "所有{C:solid_state}固态{}牌和",
                    "{C:program_pack}程序{}牌被{C:red}禁用{}",
                },
            },
      abn_matchstick = {
                name = "火柴",
                text = {
                    "若分数{C:attention}着火{}，",
                    "则{C:red,E:2}自毁{}",
                },
            },
      abn_tnt = {
                name = "炸药",
                text = {
                    "计分后，{X:mult,C:white}X#1#{}倍率并",
                    "{C:red,E:2}摧毁{}一张随机",
                    "{C:attention}留在手牌中{}的牌",
                },
            },
      abn_cigarettes = {
                name = "香烟",
                text = {
                    "{C:red,E:2}摧毁{}一张随机",
                    "来自你的{C:attention}整个牌组{}的牌",
                },
            },
      abn_platano = {
                name = "香蕉",
                text = {
                    "{X:mult,C:white}^#1#{}倍率，并有{C:green}#2#/#3#{}几率",
                    "{C:red,E:2}摧毁{}所有",
                    "拥有的{C:attention}小丑牌{}",
                },
            },
      abn_cowboy_hat = {
                name = "牛仔帽",
                text = {
                    "此贴纸生效期间，",
                    "所有{C:weather_report}天气报告{}牌和",
                    "{C:lexica}辞典{}牌被{C:red}禁用{}",
                },
            },
      abn_unholy_relic = {
                name = "亵渎圣物",
                text = {
                    "此贴纸生效期间，",
                    "所有{C:ruinous_power}毁灭之力{}牌和",
                    "{C:nightshift_cards}夜班{}牌被{C:red}禁用{}",
                },
            },
      abn_cactus = {
                name = "仙人掌",
                text = {
                    "此贴纸生效期间，",
                    "所有{C:artistry_cards}技艺{}牌和",
                    "{C:calligraphy}书法{}牌被{C:red}禁用{}",
                },
            },
            -- 贴纸
      abn_bomb = {
                name = "炸弹",
                text = {
                    "若分数{C:attention}着火{}，",
                    "则{C:red,E:2}摧毁{}上一次打出的牌型",
                },
            },
      abn_spade = {
                name = "黑桃贴纸",
                text = {
                    "打出的{C:spades}黑桃{}给予其",
                    "{C:attention}点数{}的{C:attention}两倍{}作为{C:chips}筹码{}",
                    "{C:red}削弱{}所有其他花色",
                }
            },
      abn_club = {
                name = "梅花贴纸",
                text = {
                    "打出的{C:clubs}梅花{}给予其",
                    "{C:attention}点数{}的{C:attention}两倍{}作为{C:chips}筹码{}",
                    "{C:red}削弱{}所有其他花色",
                }
            },
      abn_diamond = {
                name = "方块贴纸",
                text = {
                    "打出的{C:diamonds}方块{}给予其",
                    "{C:attention}点数{}的{C:attention}两倍{}作为{C:chips}筹码{}",
                    "{C:red}削弱{}所有其他花色",
                }
            },
      abn_heart = {
                name = "红桃贴纸",
                text = {
                    "打出的{C:hearts}红桃{}给予其",
                    "{C:attention}点数{}的{C:attention}两倍{}作为{C:chips}筹码{}",
                    "{C:red}削弱{}所有其他花色",
                }
            },
      abn_daytime = {
                name = "白昼",
                text = {
                    "打出的{C:diamonds}光明花色{}给予其",
                    "{C:attention}点数{}的{C:attention}两倍{}作为{C:chips}筹码{}",
                    "{C:red}削弱{}所有{C:spades}暗色花色{}",
                }
            },
      abn_nighttime = {
                name = "夜晚",
                text = {
                    "打出的{C:spades}暗色花色{}给予其",
                    "{C:attention}点数{}的{C:attention}两倍{}作为{C:chips}筹码{}",
                    "{C:red}削弱{}所有{C:diamonds}光明花色{}",
                }
            },
      abn_even_legacy = {
                name = "偶数传承",
                text = {
                    "打出的{C:attention}偶数{}牌给予其",
                    "{C:attention}点数{}的{C:attention}三倍{}作为",
                    "{C:chips}筹码{}，{C:attention}奇数{}牌给予",
                    "{C:chips}+1{}筹码",
                },
            },
      abn_odd_legacy = {
                name = "奇数传承",
                text = {
                    "打出的{C:attention}奇数{}牌给予其",
                    "{C:attention}点数{}的{C:attention}三倍{}作为",
                    "{C:chips}筹码{}，{C:attention}偶数{}牌给予",
                    "{C:chips}+1{}筹码",
                },
            },
      abn_jimbo_legacy = {
                name = "金宝传承",
                text = {
                    "{C:common}普通{}小丑牌",
                    "每张给予{C:chips}+#1#{}筹码",
                },
            },
      abn_rejok_legacy = {
                name = "rejok传承",
                text = {
                    "{C:uncommon}罕见{}小丑牌",
                    "每张给予{C:chips}+#1#{}筹码",
                },
            },
      abn_obmij_legacy = {
                name = "宝金传承",
                text = {
                    "{C:rare}稀有{}小丑牌",
                    "每张给予{C:mult}+#1#{}倍率",
                },
            },
      abn_jester_legacy = {
                name = "宫廷传承",
                text = {
                    "{C:abn_superrare}超稀有{}小丑牌",
                    "每张给予{C:mult}+#1#{}倍率",
                },
            },
      abn_currency = {
                name = "货币",
                text = {
                    "{C:money}$#1#{}",
                }
            },
      abn_chain = {
                name = "锁链",
                text = {
                    "弃牌时弃掉",
                    "全部手牌",
                }
            },
    },
  },
  misc = {
    labels = {
      abn_pump_up = "振奋",
      abn_immortal = "不朽",
      abn_bullseye = "靶心",
      abn_shovel = "铲子",
      abn_downgrade = "降级",
      abn_vessel = "容器",
      abn_weight = "沉重",
      abn_crown = "王冠",
      abn_flip = "翻转",
      abn_fragile = "易碎",
      abn_possibility = "可能性",
      abn_question_mark = "问号？",
      abn_square = "方块",
      abn_lightning_bolt = "闪电",
      abn_top_hat = "礼帽",
      abn_cat_eye = "猫眼",
      abn_eraser = "橡皮擦",
      abn_lucky = "幸运",
      abn_negative_plus = "负片+",
      abn_glove_hand = "手套",
      abn_spicy = "辛辣",
      abn_x = "X",
      abn_spade = "黑桃",
      abn_club = "梅花",
      abn_diamond = "方块",
      abn_heart = "红桃",
      abn_daytime = "白昼",
      abn_nighttime = "夜晚",
      abn_even_legacy = "偶数传承",
      abn_odd_legacy = "奇数传承",
      abn_jimbo_legacy = "金宝传承",
      abn_rejok_legacy = "丑小传承",
      abn_obmij_legacy = "宝金传承",
      abn_jester_legacy = "宫廷传承",
      abn_currency = "货币",
      abn_chain = "锁链",
      abn_aim = "瞄准",
      abn_stinker = "臭气",
      abn_bug = "虫",
      abn_martini = "马提尼",
      abn_road_block = "路障",
      abn_lightbulb = "灯泡",
      abn_pawn = "兵",
      abn_matchstick = "火柴",
      abn_bomb = "炸弹",
      abn_tnt = "炸药",
      abn_cigarettes = "香烟",
      abn_cowboy_hat = "牛仔帽",
      abn_unholy_relic = "亵渎圣物",
      abn_platano = "香蕉",
      abn_cactus = "仙人掌",
    },
  },
}


