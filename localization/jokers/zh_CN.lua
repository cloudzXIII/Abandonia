return {
    descriptions = {
        Joker = {
            j_abn_1_2_joker_even = {
                name = "1、2小丑",
                text = {
                    "弃掉{C:red}偶数{}牌时",
                    "将其摧毁并永久将其{C:attention}点数{}",
                    "添加至这张小丑牌的{C:chips}筹码{}",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                    "{C:inactive,s:0.8}（下回合变为{C:blue,s:0.8}奇数{C:inactive,s:0.8}）",
                }
            },
            j_abn_1_2_joker_odd = {
                name = "1、2小丑",
                text = {
                    "弃掉{C:blue}奇数{}牌时",
                    "将其摧毁并永久将其{C:attention}点数{}",
                    "添加至这张小丑牌的{C:chips}筹码{}",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                    "{C:inactive,s:0.8}（下回合变为{C:red,s:0.8}偶数{C:inactive,s:0.8}）",
                }
            },
            j_abn_10_4_joker = {
                name = "10-4小丑",
                text = {
                    "每张打出的{C:attention}10{}获得{C:mult}+#1#{}倍率",
                    "每张打出的{C:attention}4{}获得{C:chips}+#2#{}筹码",
                },
            },
            j_abn_7_slot = {
                name = "7号槽", -- 此翻译不佳，不管是英文原文还是当前翻译
                text = {
                    {
                        "计分的{C:attention}7{}每有其他计分的{C:attention}7{}",
                        "其{C:attention}点数{}{C:planet}星球{}牌等级提升一次",
                    },
                    {
                        "如果正好有{C:attention}7{}张小丑牌",
                        "每张计分的{C:attention}7{}",
                        "永久获得{C:mult}+#1#{}倍率",
                    },
                }
            },
            j_abn_a_jesters_hat = {
                name = "小丑之帽",
                text = {
                    {
                        "若打出的牌型包含{C:attention}2{}种原版花色",
                        "和{C:attention}2{}种模组花色，则此小丑牌",
                        "获得其{C:attention}点数{}两倍的{C:mult}倍率{}",
                        "{C:inactive}(当前 {C:mult}+#1#{C:inactive} 倍率)",
                    },
                    {
                        "若此小丑牌带有{C:dark_edition}陈酿{}版本，",
                        "则重新触发所有计分牌",
                    },
                },
            },
            j_abn_abandonia = {
                name = "Abandonia", -- 专有名词
                text = {
                    {
                        "打出的牌计分时给予",
                        "{C:white,X:mult}X#1#{}倍率和{C:white,X:chips}X#2#{}筹码",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}荒废{}版本",
                        "所有计分牌永久获得",
                        "{C:mult}+#3#{}倍率和{C:chips}+#4#{}筹码",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}复古{}版本",
                        "所有小丑牌永久获得",
                        "{C:mult}+#3#{}倍率和{C:chips}+#4#{}筹码",
                    }
                },
            },
            j_abn_advertisement_joker = {
                name = "广告小丑",
                text = {
                    {
                        "每次使用{C:solid_state}固态{}牌",
                        "这张小丑牌获得",
                        "{X:mult,C:white}X#3#{}倍率",
                    },
                    {
                        "每次使用{C:program_pack}程序{}牌",
                        "这张小丑牌获得",
                        "{C:chips}+#4#{}筹码",
                        "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                    },
                },
            },
            j_abn_aesthetic_joker = {
                name = "审美小丑",
                text = {
                    {
                        "本赛局每计分过一种",
                        "{C:attention}不同增强效果{}",
                        "获得{C:chips}+#1#{}筹码",
                        "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}版本{}",
                        "{C:enhanced}增强{}牌计分时",
                        "给予等同于其{C:attention}点数{}的{C:red}倍率{}",
                    }
                }
            },
            j_abn_agent_jimbo = {
                name = "特工金宝",
                text = {
                    {
                        "所有{C:attention}消耗牌{}价格翻倍",
                        "但购买时获得{C:attention}随机{}{C:dark_edition}版本{}",
                    },
                    {
                        "当{C:attention}6{}计分时",
                        "每有一种不同{C:dark_edition}版本{}的消耗牌类型",
                        "获得{X:chips,C:white}X#2#{}筹码",
                        "{C:inactive}（当前为{X:chips,C:white}X#1#{C:inactive}筹码）",
                    }
                },
            },
            j_abn_alchemical_joker = {
                name = "炼金小丑",
                text = {
                    "打出的计分牌中每有一种不同",
                    "{C:attention}增强效果{}、{C:dark_edition}版本{}、",
                    "{C:attention}蜡封{}和{C:attention}贴纸{}",
                    "这张小丑牌给予{X:mult,C:white}X#1#{}倍率",
                },
            },
            j_abn_aliasing_joker = {
                name = "混叠小丑",
                text = {
                    {
                        "给{C:attention}第一次{}和{C:attention}最后一次{}出牌中",
                        "第一张计分的{C:attention}数字牌{}",
                        "添加{C:dark_edition}亮光{}、{C:dark_edition}珠光{}",
                        "或{C:dark_edition}虹彩{}版本",
                    },
                    {
                        "带有{C:dark_edition}版本{}的计分牌给予{C:money}$#1#{}",
                    },
                }
            },
            j_abn_alter_suits = {
                name = "改变花色",
                text = {
                    {
                        "如果打出的计分牌包含",
                        "{C:abn_snow}雪{}、{C:abn_penumbra}半影{}、",
                        "{C:abn_tie}和{}和{C:abn_bow}弓{}",
                        "这张小丑牌获得等同于",
                        "所有牌总点数的{C:mult}倍率{}",
                    },
                    {
                        "如果打出的计分牌不包含{C:attention}基础{}花色",
                        "这张小丑牌获得{C:chips}+#3#{}筹码",
                        "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率，{C:chips}+#1#{C:inactive}筹码）",
                    },
                }
            },
            j_abn_alternate_outfit = {
                name = "替换装束",
                text = {
                    {
                        "如果打出的牌包含{C:attention}#4#{}",
                        "这张小丑牌获得{C:mult}+#2#{}倍率",
                        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                    },
                    {
                        "{C:attention,s:0.8}#4#{s:0.8}的{C:abn_chalice,s:0.8}圣杯牌{s:0.8}，计分牌获得{C:mult,s:0.8}+#3#{s:0.8}倍率",
                        "{C:attention,s:0.8}#4#{s:0.8}的{C:abn_coin,s:0.8}币牌{s:0.8}，计分牌获得{C:money,s:0.8}$#3#{s:0.8}",
                        "{C:attention,s:0.8}#4#{s:0.8}的{C:abn_baton,s:0.8}杖牌{s:0.8}，计分牌获得{C:white,X:mult,s:0.8}X#6#{s:0.8}倍率",
                        "{C:attention,s:0.8}#4#{s:0.8}的{C:abn_sword,s:0.8}剑牌{s:0.8}，计分牌获得{C:chips,s:0.8}+#5#{s:0.8}筹码",
                    }
                }
            },
            j_abn_ambigram = {
                name = "回文字",
                text = {
                    "如果打出的牌是{C:attention}对称{}的",
                    "每张打出的牌计分时",
                    "给予{C:mult}+#1#{}倍率",
                    "{C:inactive}（例：{C:attention}4 3 5 3 4{C:inactive}）",
                }
            },
            j_abn_amplifier = {
                name = "放大器",
                text = {
                    "{C:attention}模组{C:dark_edition}增强{}效果在{C:attention}原版{}花色上",
                    "给予{C:attention}50%{}更多的{C:chips}筹码{}和{C:mult}倍率{}",
                    "若在{C:attention}模组{}花色上则为{C:attention}100%{}",
                },
            },
            j_abn_ancient_prophet = {
                name = "古代先知",
                text = {
                    {
                        "重新触发所有打出的",
                        "{C:red}被削弱{}和{C:attention}翻转{}的牌",
                    },
                    {
                        "{C:red}被削弱{}和{C:attention}翻转{}的牌计分时",
                        "给予{C:mult}+#1#{}倍率和{C:chips}+#2#{}筹码",
                    }
                }
            },
            j_abn_annihilated_joker = {
                name = "歼灭小丑",
                text = {
                    "每摧毁{C:attention}#1#{} {C:inactive}(#2#){}张{C:attention}小丑牌{}",
                    "生成一张随机{C:calamity_cards}灾厄{}牌",
                    "{C:inactive}（必须有空位）",
                }
            },
            j_abn_ansatz_joker = {
                name = "试探解小丑",
                text = {
                    "在{C:attention}#5#{}中，每张{C:attention}奇数{}牌",
                    "使这张小丑牌获得{C:chips}+#2#{}筹码，",
                    "每张{C:attention}偶数{}牌获得",
                    "{C:mult}+#4#{}倍率",
                    "{C:inactive}(当前 {C:chips}+#1#{C:inactive} 筹码, {C:mult}+#3#{C:inactive} 倍率)",
                },
            },
            j_abn_answer_sheet = {
                name = "答题卡",
                text = {
                    "当{C:attention}消耗牌{}上的{C:green}几率{}成功触发时，",
                    "这张小丑牌获得{C:mult}+#2#{}倍率；",
                    "若成功触发发生在{C:attention}小丑牌{}上，",
                    "则获得{C:chips}+#1#{}筹码",
                    "{C:inactive}(当前 {C:chips}+#3#{C:inactive} 筹码, {C:mult}+#4#{C:inactive} 倍率)",
                },
            },
            j_abn_ante_up = {
                name = "加注！",
                text = {
                    {
                        "手牌中{C:attention}持有{}的牌给予",
                        "其点数{C:attention}两倍{}的{C:red}倍率{}",
                    },
                    {
                        "游戏胜利的底注{C:attention}+2{}",
                    }
                }
            },
            j_abn_antikythera_mechanism = {
                -- 安提基特拉机械（Antikythera Mechanism），是公元前150年至前100年间制造的古希腊青铜机械装置，被誉为人类历史上第一台模拟计算机或最古老的复杂科学计算器。它于1900年被人在希腊安提基特拉岛附近的古代沉船中发现。
                name = "安提基特拉机械",
                text = {
                    {
                        "每次使用{C:program_pack}程序{}牌时",
                        "这张小丑牌获得",
                        "{X:mult,C:white}X#2#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                    },
                    {
                        "{C:attention}化石{}牌和{C:attention}钢铁{}牌",
                        "不会被{C:red}削弱{}或{C:red}摧毁{}",
                    },
                }
            },
            j_abn_anxious_gimbo = {
                name = "焦虑金宝",
                text = {
                    "每张打出的{C:attention}2{}、{C:attention}3{}、",
                    "{C:attention}5{}、{C:attention}7{}、{C:attention}11{}或{C:attention}13{}",
                    "计分时给予{X:chips,C:white}X#1#{}筹码",
                    "和{C:mult}+#2#{}倍率",
                },
            },
            j_abn_archaic_joker = {
                -- 如果译成古老小丑就和原版的撞名了，所以合理规避一下
                name = "远古小丑",
                text = {
                    "以{C:attention}奇数{}张牌击败{C:attention}盲注{}时",
                    "这张小丑牌获得{C:chips}+#1#{}筹码和{C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码，{C:mult}+#4#{C:inactive}倍率）",
                }
            },
            j_abn_archibald = {
                -- 这个名字有很多的引用，由于初版翻译任务繁重，我没有太多时间去考据
                name = "阿奇博尔德",
                text = {
                    "打出的计分牌包含",
                    "{C:attention}偶数{}点数牌时",
                    "获得{X:chips,C:white}X#2#{}筹码",
                    "{C:inactive}（10、8、6、4、2）",
                    "{C:inactive}（当前为{C:white,X:chips}X#1#{C:inactive}筹码）",
                }
            },
            j_abn_arkham = {
                -- Arkham 最初是洛夫克拉夫特虚构的一座位于马萨诸塞州的虚构城市，是“克苏鲁神话”的核心舞台之一，充满了古老、诡异、禁忌知识与不可名状的恐怖。
                name = "阿卡姆",
                text = {
                    {
                        "计分的{V:1}#5#{}牌给予{X:chips,C:white}X#1#{}筹码",
                        "和{C:white,X:mult}X#7#{}倍率",
                        "每当{V:1}#6#{}计分时提升",
                        "{X:chips,C:white}X#2#{}筹码和{C:white,X:mult}X#8#{}倍率",
                        "{s:0.8}花色每手牌变化",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "{V:1}#5#{}牌手牌中每{C:attention}持有{}一张牌",
                        "永久获得{C:chips}+#4#{}筹码和{C:mult}+#3#{}倍率",
                    }
                }
            },
            j_abn_armageddon_road = {
                -- Armageddon Road来自西方的亚伯拉罕宗教语境，象征着世界末日决战、善恶终极对决、人类文明毁灭的途经，以及带有强烈宿命感与救赎色彩的毁灭之旅。
                name = "末世劫路",
                text = {
                    {
                        "击败{C:attention}大盲注{}时",
                        "摧毁所有{C:attention}持有{}的{C:continent}大陆{}牌",
                        "每摧毁一张就生成一张",
                        "{C:dark_edition}负片{} {C:calamity_cards}灾厄{}牌",
                    },
                    {
                        "击败{C:attention}大盲注{}时",
                        "摧毁所有{C:attention}持有{}的{C:tarot}塔罗{}牌",
                        "每摧毁一张就生成一张",
                        "{C:dark_edition}负片{} {C:weather_report}天气预报{}牌",
                    },
                }
            },
            j_abn_artistic_difference = {
                name = "艺术分歧",
                text = {
                    "如果回合的{C:attention}第一次出牌{}",
                    "不包含{C:attention}人头牌{}",
                    "生成打出的{C:attention}牌型{}",
                    "的{C:planet}星球{}牌",
                    "{C:inactive}（必须有空位）",
                }
            },
            j_abn_artistic_interpretation = {
                name = "艺术诠释",
                text = {
                    "连续打出相同{C:attention}牌型{}时",
                    "每次出牌这张小丑牌获得{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                }
            },
            j_abn_ascended_joker = {
                name = "晋升小丑",
                text = {
                    {
                        "{C:gold}+#1#{}晋升强度",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "计分牌给予{C:gold}+#2#{}晋升强度",
                    }
                }
            },
            j_abn_assassin_joker = {
                name = "刺客小丑",
                text = {
                    "出牌时",
                    "摧毁{C:attention}点数最低{}的牌",
                    "并获得{C:money}$#3#{}，",
                    "这张小丑牌获得{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{C:chips}#1#{C:inactive}筹码）",
                }
            },
            j_abn_astro_joker = {
                name = "星座小丑",
                text = {
                    "{C:astro_cards}星座{}牌总是{C:green}成功{}",
                    "回合结束时这张{C:attention}小丑牌{}",
                    "有{C:green}#1#/#2#{}几率被{C:red}摧毁{}",
                }
            },
            j_abn_asylum_joker = {
                name = "疯人院小丑",
                text = {
                    {
                        "迫使{C:attention}#2#{}张牌",
                        "总是被选中",
                    },
                    {
                        "{C:attention}强制选中{}的牌",
                        "计分时给予{X:chips,C:white}^#1#{}筹码",
                    }
                }
            },
            j_abn_attack_777 = {
                name = "攻击777",
                text = {
                    "如果打出的牌只包含",
                    "{C:hearts}红桃{}和{C:diamonds}方块{}",
                    "{X:mult,C:white}X#3#{}倍率",
                    "每张{C:attention}打出{}的牌",
                    "有{C:green}#1#/#2#{}几率重新触发",
                }
            },
            j_abn_autostereogram_joker = {
                name = "自动立体图小丑",
                text = {
                    {
                        "每张计分的{C:attention}奇数{}牌",
                        "与其它计分牌有相同{C:dark_edition}版本{}时",
                        "{X:red,C:white}X#1#{}倍率",
                    },
                    {
                        "每张计分的{C:attention}偶数{}牌",
                        "与其它计分牌有{C:attention}相同{} {C:dark_edition}版本{}时",
                        "{X:chips,C:white}X#2#{}筹码",
                        "{C:inactive}（当前为{X:red,C:white}X#3#{C:inactive}倍率，{X:blue,C:white}X#4#{C:inactive}筹码）",
                    }
                },
            },
            j_abn_avalanche_joker = {
                name = "雪崩",
                text = {
                    "如果打出的牌中有一张计分的",
                    "{C:abn_snow}雪{}牌和一张",
                    "其他{C:attention}花色{}的计分牌",
                    "{X:mult,C:white}X#1#{}倍率",
                },
            },
            j_abn_aviator = {
                name = "飞行员",
                text = {
                    "如果打出的{C:planet}牌型等级{}至少为{C:attention}#3#{}",
                    "这张小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                },
            },
            j_abn_awakening_oopart = {
                name = "觉醒远古遗物",
                text = {
                    {
                        "购买时{C:planet}星球{}和{C:program_pack}程序{}牌",
                        "变为{C:dark_edition}负片{}",
                    },
                    {
                        "使用{C:planet}星球{}和{C:program_pack}程序{}牌",
                        "给持有的{C:attention}钢铁{}牌",
                        "添加{C:mult}+#1#{}倍率和{C:chips}+#2#{}筹码",
                    },
                }
            },
            j_abn_baba_joker = {
                -- 致敬了《Baba Is You》。它是一款由芬兰独立开发者阿尔维·泰伊卡里（Arvi Teikari，业内称为Hempuli）开发的推箱子类益智游戏。
                name = "巴巴是小丑",
                text = {
                    {
                        "本赛局每使用一张{C:weather_report}天气预报{}牌",
                        "获得{C:blue}+#1#{}筹码和{C:red}+#2#{}倍率",
                        "{C:inactive}（当前为{C:blue}+#3#{C:inactive}筹码，{C:red}+#4#{C:inactive}倍率）",
                    },
                    {
                        "{C:weather_report}天气预报{}牌",
                        "现在售价为{C:gold}$5",
                    },
                }
            },
            j_abn_backrooms_joker = {
                -- “后室”（The Backrooms）是一个源自2019年网络论坛的著名恐怖都市传说与阈限空间（Liminal Space）概念，指代一个由无尽的鹅黄色单调房间、潮湿地毯和嗡鸣日光灯组成的虚构平行异世界。人们传说只要在现实中不小心“穿模”（No-clip），就会坠入这个无边无际的迷宫中。
                name = "后室小丑",
                text = {
                    {
                        "盲注{C:attention}隐藏{}",
                        "击败{C:attention}盲注{}时，生成",
                        "一张带有{C:abn_perishable}易腐{}和{C:money}租用{}的",
                        "{C:purple}爆闪{}小丑牌",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}版本{}",
                        "{C:purple}爆闪{}小丑牌每张给予{X:mult,C:white}X#1#{}倍率",
                    }
                }
            },
            j_abn_bad_director = {
                name = "烂导演",
                text = {
                    {
                        "{C:attention}Boss盲注{}可以重掷",
                        "基础花费{C:money}$#1#{}",
                        "每次重掷花费增加{C:money}$1{}",
                    },
                }
            },
            j_abn_badformat_joker = {
                name = "坏格式小丑",
                text = {
                    "{C:diamonds}光明花色{}牌计分时",
                    "给予{X:chips,C:white}^#1#{}筹码和{X:mult,C:white}^#2#{}倍率",
                }
            },
            j_abn_balakiren = {
                name = "巴拉基伦",
                text = {
                    {
                        "计分的{C:attention}奇数{}牌给予{X:mult,C:white}X#1#{}倍率",
                        "每当{C:attention}奇数{}牌计分时提升{X:mult,C:white}X#3#{}倍率",
                    },
                    {
                        "计分的{C:attention}偶数{}牌给予{X:chips,C:white}X#2#{}筹码",
                        "每当{C:attention}偶数{}牌计分时提升{X:chips,C:white}X#4#{}筹码",
                    },
                }
            },
            j_abn_balance_brandon = {
                name = "平衡布兰登",
                text = {
                    "将{C:mult}+倍率{}效果以{X:mult,C:white}X#1#{}的比例",
                    "转化为{X:mult,C:white}X倍率{}",
                    "若这是{C:attention}倍率小丑牌{}，",
                    "{C:attention}倍率{}增强效果在留在手牌中时",
                    "也会触发",
                },
            },
            j_abn_balatro_64 = {
                -- 由卡面美术可以联想到为Nintendo 64的游戏卡带，
                -- Nintendo 64（简称 N64）是任天堂于 1996 年推出的第五代家用电视游戏机。它采用 64 位处理器，首创三叉形手柄与类比摇杆，开创了家用主机的 3D 游戏新时代，全球销量达到 3293 万台。
                -- 而N64游戏卡带是任天堂于1996年推出的游戏机存储介质。
                -- 它读取速度快、几乎没有读取等待时间，且能有效防止盗版；但它的缺点是制造成本高、存储容量小（通常为8MB至64MB），这让许多大型RPG游戏转向了当时的PlayStation光盘。
                name = "小丑牌64卡带",
                text = {
                    {
                        "如果{C:attention}获胜牌型{}只含{C:spades}暗色花色{}",
                        "每张计分牌获得{X:mult,C:white}X#5#{}倍率",
                        "如果只含{C:diamonds}光明花色{}",
                        "每张计分牌获得{X:chips,C:white}X#6#{}筹码",
                        "{C:inactive}（当前为{X:mult,C:white}X#3#{C:inactive}倍率，{X:chips,C:white}X#4#{C:inactive}筹码）",
                    },
                    {
                        "如果{C:attention}获胜牌型{}同时包含两种花色",
                        "所有小丑牌获得{C:mult}+#1#{}倍率和{C:chips}+#2#{}筹码",
                    },
                }
            },
            j_abn_balatro_the_movie = {
                name = "小丑牌：电影版",
                text = {
                    {
                        "本赛局每击败一个{C:attention}盲注{}",
                        "{C:attention}盲注需求{}提升{X:attention,C:white}X#10#{}",
                    },
                    {
                        "每打出一种不同{C:attention}牌型{}获得{X:mult,C:white}X#6#{}倍率",
                        "每打出一种{C:attention}重复{}牌型获得{X:chips,C:white}X#7#{}筹码",
                        "计分手牌中每有一种不同{C:attention}增强效果{}",
                        "获得{C:mult}+#8#{}倍率和{C:chips}+#9#{}筹码",
                        "{C:inactive}（当前为{X:attention,C:white}X#5#{}、{X:mult,C:white}X#1#{}、{X:chips,C:white}X#2#{}、{C:mult}+#3#{C:inactive}、{C:chips}+#4#{C:inactive}）",
                    },
                    {
                        "如果打出的牌包含",
                        "每种{C:attention}基础{}花色至少一张",
                        "所有计分牌的{C:planet}星球{} {C:attention}点数{}等级提升{C:attention}4{}",
                    }
                }
            },
            j_abn_balatro_university = {
                -- 一个在youtube较为知名的玩balatro的博主
                name = "balatro university",
                text = {
                    {
                        "在{C:attention}盲注{}中获得资金时",
                        "所有小丑牌获得{C:mult}+#1#{}倍率和{C:chips}+#2#{}筹码",
                    },
                    {
                        "如果拥有{C:attention}暴利小丑{}",
                        "用{C:attention}黄金{}牌{C:attention}提升{}牌型等级",
                    },
                    {
                        "如果拥有{C:attention}老虎机{}",
                        "重新触发打出的{C:gold}金色蜡封{}",
                    },
                }
            },
            j_abn_ballistic_glass_joker = {
                name = "防弹玻璃小丑",
                text = {
                    {
                        "{C:attention}玻璃{}牌不会碎裂",
                    },
                    {
                        "手牌中每张{C:attention}玻璃{}牌",
                        "给予{X:mult,C:white}X#1#{}倍率",
                    },
                    {
                        "{C:attention}玻璃{}牌计分时",
                        "给予{X:chips,C:white}X#2#{}筹码和{C:money}-$#3#{}",
                    },
                },
            },
            j_abn_barb_wire_joker = {
                name = "铁丝网小丑",
                text = {
                    {
                        "第一张计分的{C:attention}4",
                        "获得{C:abn_black_seal}黑色蜡封{}",
                    },
                    {
                        "弃掉的牌有{C:green}#1#/#2#{}几率",
                        "被摧毁",
                    }
                },
            },
            j_abn_bark_joker = {
                name = "树皮小丑",
                text = {
                    "当{C:attention}木板{}牌计分时，",
                    "这张小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "和{C:gold}+#4#{}晋升强度",
                    "{C:inactive}(当前 {X:mult,C:white}X#1#{} 倍率, {C:gold}+#3#{} 晋升强度)",
                },
            },
            j_abn_basiquat_joker = {
                -- 让-米歇尔·巴斯奎特（Jean-Michel Basquiat）是20世纪80年代美国最重要的新表现主义与涂鸦艺术大师。
                -- 他的作品风格粗犷、充满原始张力，将街头涂鸦、儿童画般的纯真线条与解剖学、黑人历史及爵士乐文化深度融合，形成独一无二的视觉语言。
                name = "巴斯奎特",
                text = {
                    {
                        "如果打出的牌包含{C:attention}偶数{}张计分牌",
                        "给予等同于当前小丑牌{C:money}售价{}",
                        "{C:attention}两倍{}的{C:chips}筹码{}",
                    },
                    {
                        "如果打出的牌包含{C:attention}奇数{}张计分牌",
                        "给予等同于当前小丑牌{C:money}售价{}",
                        "{C:attention}两倍{}的{C:mult}倍率{}",
                    }
                }
            },
            j_abn_bellman_joker = {
                name = "贝尔曼",
                text = {
                    {
                        "若{C:attention}消耗牌槽位{}已满，",
                        "则给予{C:chips}+#1#{}筹码和",
                        "{C:mult}+#2#{}倍率",
                    },
                    {
                        "若在{C:attention}消耗牌槽位{}已满时",
                        "击败任意{C:attention}盲注{}，则获得",
                        "{C:chips}+#3#{}筹码和{C:mult}+#4#{}倍率",
                    },
                },
            },
            j_abn_best_employ = {
                name = "最佳员工",
                text = {
                    "每击败一个{C:attention}Boss盲注{}",
                    "这张小丑牌获得{C:white,X:mult}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                }
            },
            j_abn_bestfriend_photograph = {
                name = "挚友照片",
                text = {
                    "打出的第一张{C:attention}数字牌{}",
                    "计分时给予{X:chips,C:white}X#1#{}筹码",
                }
            },
            j_abn_beyond_the_rainbow = {
                name = "彩虹之外",
                text = {
                    {
                        "{C:attention}光谱{}手牌中每有一种不同{C:attention}花色{}",
                        "这张小丑牌获得{X:mult,C:white}X#2#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}版本{}",
                        "计分牌有{C:green}#3#/#4#{}几率",
                        "生成{C:attention}双倍标签{}",
                    }
                }
            },
            j_abn_bibliophile = {
                name = "压缩包",
                text = {
                    "{C:attention}+2{}个消耗牌槽位",
                    "击败{C:attention}Boss盲注{}时",
                    "如果{C:attention}持有{}一张{C:lexica}辞典{}牌，获得{X:mult,C:white}X#5#{}倍率",
                    "如果{C:attention}持有{}一张{C:program_pack}程序{}牌，获得{C:mult}+#6#{}倍率",
                    "如果{C:attention}持有{}一张{C:weather_report}天气预报{}牌，获得{C:chips}+#8#{}筹码",
                    "如果{C:attention}持有{}一张{C:calamity_cards}灾厄{}牌，获得{X:chips,C:white}X#7#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率，{C:mult}+#2#{C:inactive}倍率，{X:chips,C:white}X#3#{C:inactive}筹码，{C:chips}+#4#{C:inactive}筹码）",
                }
            },
            j_abn_big_baffoon = {
                -- this is an intentional misspelling of "Buffoon", kinda like Sanic (Big Sonic)
                name = "大Baffoon",
                text = {
                    "若在回合的{C:attention}最后一次出牌{}时",
                    "击败{C:attention}盲注{}，则此小丑牌",
                    "获得{C:chips}+#2#{}筹码",
                    "{C:inactive}(当前 {C:chips}+#2#{C:inactive} 筹码)",
                },
            },
            j_abn_billiard_14 = {
                name = "14号球",
                text = {
                    "每张打出的{C:attention}14{}计分时",
                    "有{C:green}#1#/#2#{}几率",
                    "生成一张{C:clubs}固态{}牌",
                    "{C:inactive}（必须有空位）",
                },
            },
            j_abn_bio_blueprint = {
                name = "生物蓝图",
                text = {
                    "允许你将手牌中的游戏牌",
                    "存入消耗牌槽位",
                    "随后可给予打出的、与所存牌",
                    "{C:attention}点数{}相同的牌加成，",
                    "具体取决于所存的牌",
                    "{C:inactive}(当前 {C:mult}+#1#{} 倍率和 {C:chips}+#2#{} 筹码)",
                },
            },
            j_abn_bios_joker = {
                name = "BIOS小丑",
                text = {
                    "{C:planet}星球{}牌使用时",
                    "重新触发一次",
                }
            },
            j_abn_bitcoin_joker = {
                name = "比特币小丑",
                text = {
                    "当{C:astro_cards}星座{}牌{C:red}失败{}时",
                    "这张小丑牌获得{C:chips}+#4#{}筹码",
                    "和{C:money}$#2#{}售价",
                    "当{C:astro_cards}星座{}牌{C:green}成功{}时",
                    "这张小丑牌获得{C:mult}+#3#{}倍率",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码，{C:mult}+#5#{C:inactive}倍率）",
                },
            },
            j_abn_black_forest = {
                name = "黑森林",
                text = {
                    "{C:attention}模组{}{C:spades}暗{}花色",
                    "给予{C:mult}+#1#{}倍率",
                },
            },
            j_abn_blackhat_joker = {
                name = "黑帽小丑",
                text = {
                    "如果{C:attention}持有{}一张{C:program_pack}程序{}牌",
                    "每张打出的牌计分时获得{C:chips}+#1#{}筹码",
                    "每{C:attention}持有{}一张{C:solid_state}固态{}牌",
                    "获得{C:mult}+#2#{}倍率",
                }
            },
            j_abn_blessed_joker = {
                name = "祝福小丑",
                text = {
                    "第一张计分的{C:dark_edition}闪箔{}牌获得{C:abn_violet_seal}紫色蜡封{}",
                    "第一张计分的{C:dark_edition}镭射{}牌获得{C:abn_brown_seal}棕色蜡封{}",
                    "第一张计分的{C:dark_edition}多彩{}牌获得{C:mult}红色蜡封{}",
                }
            },
            j_abn_bloke_joker = {
                name = "老兄小丑",
                text = {
                    {
                        "额外{C:attention}#3#{}次重新触发",
                        "{C:enhanced}#1#{}和{C:enhanced}#2#{}",
                    },
                },
            },
            j_abn_blood_money = {
                name = "血币",
                text = {
                    "计分牌获得{X:mult,C:white}X#1#{}倍率",
                    "每打出一张牌失去{C:money}$#2#{}",
                    "资金达到{C:money}$0{}或更低时",
                    "{C:mult}摧毁{}所有打出的牌",
                }
            },
            j_abn_bloody_comedian = {
                name = "血色•喜剧演员",
                text = {
                    {
                        "选择{C:attention}盲注{}时",
                        "摧毁左侧小丑牌",
                        "并生成一张随机",
                        "{C:attention}喜剧演员{}小丑牌",
                    },
                    {
                        "{C:attention}喜剧演员{}小丑牌",
                        "每张给予{X:mult,C:white}X#1#{}倍率",
                    }
                },
            },
            j_abn_bodyguard_joker = {
                name = "保镖小丑",
                text = {
                    "每张计分的{C:attention}翻转{}牌获得{C:mult}+#2#{}倍率",
                    "从计分的{C:attention}翻转{}牌上移除{C:attention}翻转{}",
                    "未计分牌获得{C:attention}翻转{}",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                }
            },
            j_abn_bokeh_joker = {
                name = "散景",
                text = {
                    {
                        "计分前，摧毁所有打出的",
                        "和{C:attention}未计分{}的牌",
                    },
                    {
                        "每摧毁一张{C:attention}奇数{}牌获得",
                        "{C:chips}+#2#{}筹码，每摧毁一张",
                        "{C:attention}偶数{}牌获得{C:mult}+#4#{}倍率",
                        "{C:inactive}(当前 {C:chips}+#1#{C:inactive} 筹码, {C:mult}+#3#{C:inactive} 倍率)",
                    },
                },
            },
            j_abn_bonus_buffoon = {
                name = "奖励丑角",
                text = {
                    "{C:attention}增强{}牌每拥有一张{C:attention}喜剧演员{}",
                    "获得{X:mult,C:white}X#4#{}倍率",
                    "回合结束时有{C:green}#1#/#2#{}几率被摧毁",
                    "{C:inactive}（当前为{X:mult,C:white}X#3#{C:inactive}倍率）",
                }
            },
            j_abn_bonus_power_joker = {
                name = "奖励•力量小丑",
                text = {
                    "打出的{C:attention}奖励牌{}计分时",
                    "给予{C:money}$#1#{}、{C:chips}+#3#{}筹码和{C:mult}+#2#{}倍率",
                },
            },
            j_abn_boozy_joker = {
                name = "酗酒小丑",
                text = {
                    {
                        "可以{C:blue}出牌{}和{C:red}弃牌{}",
                        "最多{C:attention}6{}张牌",
                    },
                    {
                        "打出{C:attention}6{}张牌时",
                        "给予{C:money}$#1#{}",
                    }
                }
            },
            j_abn_bouba_joker = {
                name = "布巴小丑",
                text = {
                    {
                        "每有一张计分的{C:attention}奇数{}牌，",
                        "这张小丑牌获得{C:chips}+#2#{}筹码",
                    },
                    {
                        "击败{C:attention}Boss盲注{}时，每持有一张",
                        "{C:lexica}辞典{}牌，再增加{C:chips}+#3#{}筹码",
                        "{C:inactive}(当前 {C:chips}+#1#{} 筹码)",
                    },
                },
            },
            j_abn_boulevard_of_alters = {
                name = "改变大道",
                text = {
                    {
                        "每当{C:rare}稀有{}小丑牌触发",
                        "所有{C:common}普通{}小丑牌获得{C:chips}+#1#{}筹码",
                    },
                    {
                        "每当{C:uncommon}罕见{}小丑牌触发",
                        "所有{C:rare}稀有{}小丑牌获得{X:mult,C:white}x#2#{}倍率",
                    },
                    {
                        "每当{C:common}普通{}小丑牌触发",
                        "所有{C:uncommon}罕见{}小丑牌获得{X:chips,C:white}x#3#{}筹码",
                    },
                }
            },
            j_abn_bowie = {
                -- 无太多时间查找原型
                name = "鲍伊",
                text = {
                    "带有{C:dark_edition}版本{}的小丑牌",
                    "每张给予{X:mult,C:white}X#1#{}倍率",
                }
            },
            j_abn_braile_joker = {
                name = "盲文小丑",
                text = {
                    "有{C:green}#1#/#2#{}几率",
                    "牌以{C:attention}背面朝上{}抽取",
                    "背面朝上的牌计分时",
                    "给予{X:mult,C:white}X#3#{}倍率",
                }
            },
            j_abn_bravais_joker = {
                -- 奥古斯特·布拉维（Auguste Bravais，1811年—1863年）是法国物理学家、天文学家和晶体学家。
                -- 他在1848年提出了著名的布拉维晶格理论，证明了三维空间中共有14种基本的晶体空间点阵型式，为固体物理学和矿物学奠定了重要基础。
                name = "布拉维",
                text = {
                    {
                        "如果打出的牌包含{C:attention}光谱{}",
                        "每张计分的{C:attention}万能{}牌获得{C:chips}+#3#{}筹码",
                        "每张计分的{C:attention}水星{}牌获得{C:mult}+#4#{}倍率",
                        "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率，{C:chips}+#1#{C:inactive}筹码）",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}版本{}",
                        "{C:attention}万能{}牌获得{C:chips}+#3#{}筹码",
                        "{C:attention}水星{}牌获得{C:mult}+#4#{}倍率",
                    }
                }
            },
            j_abn_brothers_memento = {
                name = "手足遗珍",
                text = {
                    "第一张打出的{C:attention}A{}牌",
                    "计分时给予{X:mult,C:white}X#1#{}倍率",
                },
            },
            j_abn_brulio_buffoon = {
                name = "布鲁利奥",
                text = {
                    {
                        "计分的{C:abn_chalice}圣杯{}牌给予{X:mult,C:white}X#1#{}倍率",
                        "每当{C:abn_chalice}圣杯{}计分时提升{X:mult,C:white}X#2#{}倍率",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "打出的{C:abn_chalice}圣杯{}牌计分时",
                        "每张计分牌的{C:planet}星球{} {C:attention}点数{}等级",
                        "永久获得{C:mult}+#3#{}倍率",
                    }
                }
            },
            j_abn_bubbly_comedian = {
                name = "气泡•喜剧演员",
                text = {
                    "当{C:attention}喜剧演员{}小丑牌触发时",
                    "这张小丑牌获得{C:mult}+#4#{}倍率、",
                    "{C:chips}+#5#{}筹码和{C:money}+$#6#{}",
                    "{s:0.8,C:attention}气泡•喜剧演员{s:0.8}除外",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}、{C:chips}+#2#{C:inactive}、{C:money}$#3#{C:inactive}）",
                }
            },
            j_abn_buccaneer_joker = {
                name = "海盗",
                text = {
                    {
                        "计分的{C:abn_Anchor}锚{}牌有{C:green}#1#/#2#{}几率",
                        "给予{C:gold}$#3#{}，有{C:green}#4#/#5#{}几率",
                        "给予{C:mult}+#6#{}倍率",
                    },
                    {
                        "已选中的{C:abn_Anchor}锚{}牌在",
                        "{C:red}弃牌{}或{C:blue}打出{}前",
                        "无法取消选择",
                    },
                },
            },
            j_abn_busybee = {
                name = "忙碌蜜蜂",
                text = {
                    "{C:attention}食物{}小丑牌永不过期",
                    "重新触发{C:attention}最右侧{}的",
                    "{C:attention}食物{}小丑牌并失去{C:money}$#3#{}",
                }
            },
            j_abn_caesar = {
                name = "凯撒", -- 与古罗马大将凯撒大帝有关。
                text = {
                    {
                        "计分的{C:hearts}红桃{}牌",
                        "每{C:attention}持有{}一张{C:continent}大陆{}牌",
                        "永久获得{C:chips}+#5#{}筹码和{C:mult}+#6#{}倍率",
                    },
                    {
                        "分数{C:attention}着火{}时",
                        "这张小丑牌获得{C:chips}+#1#{}筹码",
                        "和{C:white,X:mult}X#2#{}倍率",
                        "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码，{C:white,X:mult}X#4#{C:inactive}倍率）",
                    }
                }
            },
            j_abn_caffeinated_joker = {
                name = "咖啡因小丑",
                text = {
                    {
                        "第一次出牌后{C:mult}削弱{}所有牌",
                        "每打出一张{C:mult}红色蜡封{}牌",
                        "打出的{C:red}红色蜡封{}牌重新触发一次",
                    },
                    {
                        "每张计分的{C:attention}茶渍{}牌被{C:mult}摧毁{}",
                        "这张小丑牌获得{X:mult,C:white}X#2#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                    },
                },
            },
            j_abn_calendar = {
                name = "日历",
                text = {
                    "回合内{C:astro_cards}星座{}牌",
                    "总是{C:green}成功{}",
                }
            },
            j_abn_camorrista = {
                -- 词根Camorra（卡莫拉)起源于意大利那不勒斯地区、历史极其悠久的顶级黑手党犯罪组织（与西西里的 Cosa Nostra / 酷萨诺斯特拉 齐名）。
                name = "卡莫拉黑手党",
                text = {
                    "选择{C:attention}盲注{}时",
                    "从其他小丑牌偷取{C:money}$#3#{}售价",
                    "每偷取{C:money}$#3#{}获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                }
            },
            j_abn_canvas_joker = {
                name = "画布小丑",
                text = {
                    "{C:attention}模组{}花色给予{C:chips}+#1#{}筹码",
                    "和{C:mult}+#2#{}倍率",
                },
            },
            j_abn_carnaval_joker = {
                name = "嘉年华小丑",
                text = {
                    "如果打出的计分牌包含一张",
                    "{C:abn_penumbra}半影{}牌、另一张",
                    "{C:spades}暗色{}花色牌和一张{C:diamonds}光明{}花色牌",
                    "所有计分牌获得{C:mult}+#1#{}倍率",
                }
            },
            j_abn_carnival_comedian = {
                name = "嘉年华•喜剧演员",
                text = {
                    "{C:abn_superrare}超稀有{}小丑牌可能出现在商店",
                    "每次购买{C:abn_superrare}超稀有{}小丑牌",
                    "这张小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                }
            },
            j_abn_castle_jester = {
                name = "城堡弄臣",
                text = {
                    "如果{C:attention}持有{}一张{C:continent}大陆{}牌",
                    "手牌中所有{C:attention}人头牌{}的点数",
                    "添加至这张小丑牌的{C:mult}倍率{}",
                    "手牌中所有{C:attention}数字牌{}的点数",
                    "添加至这张小丑牌的{C:chips}筹码{}",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                }
            },
            j_abn_cataract_joker = {
                name = "白内障小丑",
                text = {
                    "打出{C:attention}#1#{}时：",
                    "如果是{C:abn_snow}雪{}，获得{X:chips,C:white}X#2#{}筹码",
                    "如果是{C:abn_penumbra}半影{}，获得{X:mult,C:white}X#3#{}倍率",
                    "如果是{C:abn_tie}和{}，平衡{C:chips}筹码{}和{C:mult}倍率{}",
                    "如果是{C:abn_bow}弓{}，交换{C:chips}筹码{}和{C:mult}倍率{}",
                },
            },
            j_abn_cenobite_joker = {
                name = "修道士小丑",
                text = {
                    "如果打出的牌型是{C:attention}#1#{}",
                    "给第一张和最后一张计分的{C:diamonds}光明花色{}牌",
                    "添加{C:dark_edition}幽冥{}效果",
                },
            },
            j_abn_certified_joker = {
                name = "认证小丑",
                text = {
                    "每张打出的{C:attention}#1#{}",
                    "计分时给予{X:mult,C:white}X#2#{}倍率和{X:chips,C:white}X#3#{}筹码",
                }
            },
            j_abn_cheerful_joker = {
                name = "欢快小丑",
                text = {
                    "若打出{C:attention}6{}张牌的牌型，",
                    "则这张小丑牌获得{C:gold}+#2#{}",
                    "晋升强度",
                    "{C:inactive}(当前 {C:gold}+#1#{C:inactive} 晋升强度)",
                },
            },
            j_abn_child_drawing = {
                name = "儿童涂鸦",
                text = {
                    "计分的{C:attention}数字{}牌",
                    "给予{X:mult,C:white}X#1#{}倍率",
                },
            },
            j_abn_chip_stone = {
                name = "筹码石",
                text = {
                    "{C:attention}石头{}牌计分时",
                    "获得{C:dark_edition}闪箔{}和{C:chips}+#1#{}筹码",
                }
            },
            j_abn_classified_joker = {
                name = "机密小丑",
                text = {
                    {
                        "所有牌和小丑牌购买时",
                        "变为{C:attention}翻转{}",
                    },
                    {
                        "支付{C:money}$#1#{}可将选定的",
                        "牌和小丑牌{C:attention}翻回{}",
                        "并获得{C:chips}+#2#{}筹码",
                        "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码）",
                    }
                }
            },
            j_abn_claus = {
                -- 可能源自圣诞老人（Santa Claus）的典故或德语/欧洲传统人名。
                name = "克劳斯",
                text = {
                    "每剩余一次{C:attention}出牌{}",
                    "{C:attention}第一张{}计分牌重新触发一次",
                }
            },
            j_abn_cloud_screamer = {
                name = "云之呐喊",
                text = {
                    "当{C:attention}第一张计分牌{}计分时，",
                    "其永久获得",
                    "{C:mult}+#1#{}倍率",
                },
            },
            j_abn_clown_degree = {
                name = "小丑学位",
                text = {
                    {
                        "带有{C:attention}蜡封{}的牌",
                        "被洗至牌组顶部",
                    },
                    {
                        "如果带有{C:attention}蜡封{}的牌被{C:mult}摧毁{}",
                        "将该{C:attention}蜡封{}应用于另一张没有{C:attention}蜡封{}的牌",
                    }
                }
            },
            j_abn_clown_funk = {
                name = "小丑放克",
                text = {
                    {
                        "如果回合的{C:attention}第一次出牌{}是",
                        "{C:attention,s:0.8}同花{s:0.8}的{C:abn_chalice,s:0.8}圣杯{s:0.8}，给{C:attention,s:0.8}最左侧{s:0.8}小丑牌添加{C:dark_edition,s:0.8}亮光{s:0.8}",
                        "{C:attention,s:0.8}顺子{s:0.8}的{C:abn_coin,s:0.8}币牌{s:0.8}，给{C:attention,s:0.8}最左侧{s:0.8}小丑牌添加{C:dark_edition,s:0.8}珠光{s:0.8}",
                        "{C:attention,s:0.8}葫芦{s:0.8}的{C:abn_baton,s:0.8}杖牌{s:0.8}，给{C:attention,s:0.8}最左侧{s:0.8}小丑牌添加{C:dark_edition,s:0.8}虹彩{s:0.8}",
                        "{C:attention,s:0.8}五条{s:0.8}的{C:abn_sword,s:0.8}剑牌{s:0.8}，给{C:attention,s:0.8}最左侧{s:0.8}小丑牌添加{C:dark_edition,s:0.8}幻彩{s:0.8}",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}版本{}",
                        "带有{C:dark_edition}版本{}的小丑牌不会被摧毁",
                    },
                },
            },
            j_abn_clown_vision = {
                name = "小丑幻视",
                text = {
                    {
                        "如果打出的牌包含{C:attention}#4#{}",
                        "这张小丑牌获得{C:mult}+#2#{}倍率",
                        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                    },
                    {
                        "{C:attention,s:0.8}#4#{s:0.8}包含{C:abn_chalice,s:0.8}圣杯{s:0.8}时，所有{C:attention,s:0.8}小丑牌{s:0.8}获得{C:mult,s:0.8}+#3#{s:0.8}倍率",
                        "{C:attention,s:0.8}#4#{s:0.8}包含{C:abn_coin,s:0.8}币{s:0.8}时，所有{C:attention,s:0.8}小丑牌{s:0.8}获得{C:money,s:0.8}$#3#{s:0.8}售价",
                        "{C:attention,s:0.8}#4#{s:0.8}包含{C:abn_baton,s:0.8}杖{s:0.8}时，有{C:green,s:0.8}#6#/#7#{s:0.8}几率",
                        "{s:0.8}生成一张随机{C:attention,s:0.8}消耗牌{}",
                        "{C:attention,s:0.8}#4#{s:0.8}包含{C:abn_sword,s:0.8}剑{s:0.8}时，所有{C:attention,s:0.8}小丑牌{s:0.8}获得{C:chips,s:0.8}+#5#{s:0.8}筹码",
                    }
                }
            },
            j_abn_clowns_soul = {
                name = "小丑之魂",
                text = {
                    "支付{C:money}$#1#{}可{C:green}重掷{}选定的小丑牌",
                    "{C:inactive,s:0.8}（{C:attention,s:0.8}贴纸{C:inactive,s:0.8}和{C:dark_edition,s:0.8}版本{C:inactive,s:0.8}会保留）",
                }
            },
            j_abn_codding_error_even = {
                name = "编码错误",
                text = {
                    "重新触发所有打出的",
                    "{C:red}偶数{}点数牌",
                    "{C:inactive,s:0.8}（下回合变为{C:blue,s:0.8}奇数{C:inactive,s:0.8}）",
                }
            },
            j_abn_codding_error_odd = {
                name = "编码错误",
                text = {
                    "重新触发所有打出的",
                    "{C:blue}奇数{}点数牌",
                    "{C:inactive,s:0.8}（下回合变为{C:red,s:0.8}偶数{C:inactive,s:0.8}）",
                }
            },
            j_abn_coercive_comedian = {
                name = "威逼•喜剧演员",
                text = {
                    {
                        "可以{C:blue}出牌{}和{C:red}弃牌{}",
                        "最多{C:attention}6{}张牌",
                    },
                    {
                        "每张计分的不同{C:attention}数字牌{}",
                        "这张小丑牌获得{X:mult,C:white}X#2#{}倍率",
                        "每打出一手牌获得{C:chips}+#4#{}筹码",
                        "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码，{X:mult,C:white}X#1#{C:inactive}倍率）",
                    }
                }
            },
            j_abn_collectible_joker = {
                name = "收藏品小丑",
                text = {
                    "本赛局每获得一张不同的{C:common}普通{}小丑牌，获得{C:chips}+#8#{}筹码",
                    "每获得一张不同的{C:uncommon}罕见{}小丑牌，获得{C:mult}+#7#{}倍率",
                    "每获得一张不同的{C:rare}稀有{}小丑牌，获得{X:mult,C:white}X#5#{}倍率",
                    "每获得一张不同的{C:legendary}传奇{}小丑牌，获得{X:mult,C:white}X#6#{}筹码",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率，{C:mult}+#3#{C:inactive}倍率，{X:chips,C:white}X#2#{C:inactive}筹码，{C:chips}+#4#{C:inactive}筹码）",
                }
            },
            j_abn_color_anomia = {
                name = "色彩失常",
                text = {
                    {
                        "{C:program_pack}程序{}牌{C:attention}免费{}",
                    },
                    {
                        "如果打出的牌包含{C:attention}光谱{}",
                        "且只含{C:attention}数字牌{}",
                        "提升每张打出的牌的{C:planet}星球{} {C:attention}点数{}等级",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}版本{}",
                        "每使用一张{C:program_pack}程序{}牌获得{C:chips}+#2#{}筹码",
                        "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                    },
                }
            },
            j_abn_color_cascade = {
                name = "色彩瀑布",
                text = {
                    "所有手牌均视为{C:attention}同花{}",
                }
            },
            j_abn_colour_vortex = {
                name = "色彩漩涡",
                text = {
                    "如果回合的{C:attention}第一次出牌{}",
                    "是{C:attention}#2#{}，则获得{C:white,X:mult}X#1#{}倍率",
                }
            },
            j_abn_combo_maker = {
                name = "连击制造者",
                text = {
                    "连续打出至少包含",
                    "{C:attention}1{}张数字牌的手牌时",
                    "每手牌这张小丑牌获得{C:white,X:mult}X#2#{}倍率",
                    "{C:inactive}（当前为{C:white,X:mult}X#1#{C:inactive}倍率）",
                },
            },
            j_abn_comedic_audience = {
                name = "喜剧观众",
                text = {
                    "选择{C:attention}盲注{}时",
                    "摧毁{C:attention}最左侧{}小丑牌",
                    "根据其{C:attention}稀有度{}生成一张小丑牌",
                }
            },
            j_abn_communist_bear = {
                name = "共产主义熊",
                text = {
                    "重新触发所有",
                    "打出的{C:attention}人头牌{}",
                    "并在{C:attention}计分{}后",
                    "将其摧毁",
                },
            },
            j_abn_composite_charles = {
                name = "复合查尔斯",
                text = {
                    "每张打出的{C:attention}#1#{}、{C:attention}#2#{}、{C:attention}#3#{}、{C:attention}#4#{}或{C:attention}#5#{}",
                    "计分时给予{X:chips,C:white}X#6#{}筹码",
                }
            },
            j_abn_composite_creechie = {
                name = "复合克里奇",
                text = {
                    "{C:attention}增强{}牌每拥有一张{C:attention}喜剧演员{}",
                    "获得{X:mult,C:white}X#4#{}倍率",
                    "{C:dark_edition}版本{}牌每拥有一张{C:attention}喜剧演员{}",
                    "获得{X:mult,C:white}X#4#{}倍率",
                    "回合结束时有{C:green}#1#/#2#{}几率被摧毁",
                    "{C:inactive}（当前为{X:mult,C:white}X#3#{C:inactive}倍率）",
                }
            },
            j_abn_computerworm_joker = {
                name = "电脑蠕虫",
                text = {
                    {
                        "选择{C:attention}盲注{}时，{C:red}摧毁{}",
                        "{C:attention}最左侧{}小丑牌并生成",
                        "这张小丑牌的{C:dark_edition}负片{}复制牌（不带{C:abn_eternal}永恒{}）",
                    },
                    {
                        "这张小丑牌的每张复制牌",
                        "给予{X:mult,C:white}^#3#{}倍率和{X:chips,C:white}^#4#{}筹码",
                        "{C:inactive}（当前为{X:mult,C:white}^#1#{C:inactive}倍率，{X:chips,C:white}^#2#{C:inactive}筹码）",
                    },
                    {
                        "如果拥有{C:attention}3{}张或以上",
                        "这张小丑牌的复制牌，则{C:red,E:1}输掉游戏{}",
                    },
                }
            },
            j_abn_confirm_joker = {
                name = "确认小丑",
                text = {
                    {
                        "回合结束时生成",
                        "一张随机{C:attention}标签{}",
                    },
                    {
                        "如果获得",
                        "{C:abn_hazard}险兆标签{}，获得{C:money}$#1#{}",
                    },
                }
            },
            -- 该名字源自日耳曼语，本义为“勇敢的劝告”或“勇敢的领导者”
            j_abn_conrad_joker = {
                name = "康拉德",
                text = {
                    {
                        "计分的{C:abn_tie}和{}牌给予{X:chips,C:white}X#1#{}筹码",
                        "每当{C:abn_tie}和{}计分时提升{X:chips,C:white}X#2#{}筹码",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "打出的{C:abn_tie}和{}牌计分时",
                        "永久获得{C:money}$#3#{}",
                    }
                }
            },
            j_abn_conspiracy_joker = {
                name = "阴谋小丑",
                text = {
                    {
                        "{C:attention}偶数次{}出牌时，翻转并洗乱所有小丑牌",
                        "小丑牌在{C:attention}翻转{}状态下触发时获得{C:mult}+#3#{}倍率",
                    },
                    {
                        "{C:attention}奇数次{}出牌时，将所有小丑牌翻至正面朝上",
                        "小丑牌在{C:attention}正面朝上{}状态下触发时获得{C:chips}+#4#{}筹码",
                        "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率，{C:chips}+#1#{C:inactive}筹码）",
                    },
                }
            },
            j_abn_construction_joker = {
                name = "建筑小丑",
                text = {
                    "每张计分的{C:attention}钢铁{}牌给予{C:chips}+#1#{}筹码",
                    "每张计分的{C:attention}石头{}牌给予{X:mult,C:white}X#2#{}倍率",
                }
            },
            j_abn_consumable_tag = {
                name = "消耗牌标签",
                text = {
                    "每当获得{C:attention}标签{}时，生成一个{C:attention}原版{}消耗牌标签",
                    "当标签给予{C:attention}消耗牌{}补充包时，获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}当前：{X:mult,C:white}X#1#{} 倍率",
                },
            },
            j_abn_contagion_joker = {
                name = "传染小丑",
                text = {
                    "带有{C:attention}蜡封{}的牌有{C:green}#1#/#2#{}几率变为{C:purple}传染蜡封{}",
                    "{C:dark_edition}增强{}牌有{C:green}#3#/#4#{}几率变为{C:purple}传染奖励{}牌",
                    "带有{C:dark_edition}版本{}的打出的牌有{C:green}#5#/#6#{}几率变为{C:purple}传染倍率{}牌",
                    "其他{C:abn_plagued}瘟疫缠身{}小丑牌给予{X:mult,C:white}^#7#{}倍率",
                }
            },
            j_abn_contract_from_below = {
                name = "下层契约",
                text = {
                    "{C:nightshift_cards}夜班{}牌总是出现在{C:spectral}幻灵{}包中",
                    "选择{C:attention}盲注{}时",
                    "给{C:attention}最左侧{}的小丑牌",
                    "添加{C:purple}容器{}、{C:abn_perishable}易腐{}和{C:dark_edition}幽冥{}",
                }
            },
            j_abn_corbin_clown = {
                -- 这个名字源自拉丁语或古英语，本义与“乌鸦”或“乌鸦般黑的头发”有关。
                name = "科尔宾",
                text = {
                    {
                        "计分的{C:abn_sword}剑{}牌给予{X:mult,C:white}X#1#{}倍率",
                        "每当{C:abn_sword}剑{}计分时提升{X:mult,C:white}X#2#{}倍率",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "手牌中所有{C:attention}留在手中{}的牌",
                        "在{C:abn_sword}剑{}计分时永久获得{C:chips}+#3#{}筹码",
                    }
                }
            },
            j_abn_corpuscular_joker = {
                name = "微粒小丑",
                text = {
                    "{C:dark_edition}闪箔{}小丑牌给予{C:mult}+#1#{}倍率",
                    "{C:dark_edition}闪箔{}牌给予其",
                    "点数{C:attention}两倍{}的{C:mult}倍率{}",
                }
            },
            j_abn_corrupted_virtue = {
                name = "腐化美德",
                text = {
                    "如果回合的{C:attention}第一次出牌{}",
                    "是一张单独的{C:attention}13{}，将其摧毁并",
                    "生成一张{C:nightshift_cards}夜班{}牌",
                    "{C:inactive}（必须有空位）",
                }
            },
            j_abn_cosmic_light = {
                name = "宇宙之光",
                text = {
                    "{C:attention}模组{} {C:diamond}光{}花色",
                    "给予{C:mult}+#1#{}倍率",
                },
            },
            j_abn_couple_goals = {
                name = "情侣目标",
                text = {
                    "打出的牌包含一张计分的",
                    "{C:attention}奇数{}和{C:attention}偶数{}牌时",
                    "这张小丑牌获得{C:white,X:mult}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                }
            },
            j_abn_cowboy_poker = {
                name = "牛仔扑克",
                text = {
                    "击败{C:attention}大盲注{}时",
                    "每张{C:attention}持有{}的消耗牌获得一种不同{C:dark_edition}版本{}",
                    "消耗牌上每有一种不同{C:dark_edition}版本{}",
                    "收益增加{C:money}$#2#{}",
                    "{C:inactive}（当前为{C:money}$#1#{C:inactive}）",
                },
            },
            j_abn_crass_joker = {
                -- 致敬《游戏王》（Yu-Gi-Oh!）中的怪兽卡 “Crass Clown”（日文名：ドリーム・ピエロ）
                name = "粗鲁小丑",
                text = {
                    {
                        "如果购买带有{C:dark_edition}版本{}的{C:attention}小丑牌{}",
                        "获得{C:chips}+#1#{}筹码乘以",
                        "其{C:attention}价格{}",
                    },
                    {
                        "如果购买{C:attention}免费{}的{C:attention}小丑牌{}",
                        "获得{C:chips}+#1#{}筹码乘以",
                        "其{C:attention}原价{}",
                        "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）",
                    }
                }
            },
            j_abn_creechie_buffoon = {
                name = "丑角克里奇",
                text = {
                    "{C:dark_edition}版本{}牌每拥有一张{C:attention}喜剧演员{}",
                    "获得{X:mult,C:white}X#4#{}倍率",
                    "回合结束时有{C:green}#1#/#2#{}几率被摧毁",
                    "{C:inactive}（当前为{X:mult,C:white}X#3#{C:inactive}倍率）",
                }
            },
            j_abn_crimson_neko = {
                name = "猩红猫",
                text = {
                    "{C:attention}幸运{}牌不会被削弱",
                    "每当{C:attention}幸运{}牌",
                    "{C:green}成功{}触发时",
                    "这张小丑牌获得{X:chips,C:white}X#2#{}筹码",
                    "{C:inactive}（当前为{X:chips,C:white}X#1#{C:inactive}筹码）",
                },
            },
            j_abn_crossword_puzzle = {
                name = "填字游戏",
                text = {
                    "每当一张{C:lexica}辞典{}牌被激活，",
                    "这张小丑牌获得{X:chips,C:white}X#2#{}筹码",
                    "若售出{C:lexica}辞典{}牌则{C:red}重置{}",
                    "{C:inactive}(当前 {X:chips,C:white}X#1#{C:inactive} 筹码)",
                },
            },
            j_abn_crybaby = {
                -- 在《以撒的结合》（The Binding of Isaac）中，“Cry Baby”是游戏里的一个合作模式（Co-op）特殊宝宝以及对应的游戏成就。
                name = "哭泣宝宝",
                text = {
                    "游戏牌被{C:attention}弃掉{}时",
                    "永久获得{C:mult}+#1#{}倍率",
                }
            },
            j_abn_cupon_joker = {
                name = "优惠券小丑",
                text = {
                    "只能选择{C:attention}1{}个目标的消耗牌",
                    "现在可以选择{C:attention}2{}个",
                }
            },
            j_abn_curtis_clown = {
                name = "柯蒂斯",
                text = {
                    {
                        "计分的{C:abn_sword}剑{}牌给予{X:chips,C:white}X#1#{}筹码",
                        "每当{C:abn_sword}剑{}计分时提升{X:chips,C:white}X#2#{}筹码",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "手牌中所有{C:attention}留在手中{}的牌",
                        "在{C:abn_sword}剑{}计分时永久获得{C:mult}+#3#{}倍率",
                    }
                }
            },
            j_abn_cyber_half = {
                name = "赛博半身",
                text = {
                    "{C:attention}钢铁牌{}留在手牌中时",
                    "给予其点数{C:attention}两倍{}的筹码",
                }
            },
            j_abn_daddy_warbucks = {
                -- 原型来自Oliver "Daddy" Warbucks
                -- 是美国著名经典漫画/音乐剧《小孤女安妮》（Little Orphan Annie）中的核心角色
                -- 是一位富可敌国、光头、外表严厉但对安妮充满慈爱的光头亿万富豪。
                name = "金主老爹",
                text = {
                    "如果出牌时资金",
                    "至少为{C:money}$#2#{}",
                    "则打出的牌计分时",
                    "给予{C:chips}+#1#{}筹码",
                }
            },
            j_abn_dangerlet = {
                -- 此翻译不佳，暂时没有找到更贴切中文词汇
                name = "Dangerlet",
                text = {
                    "打出的牌计分时给予",
                    "{C:chips}+#1#{}筹码、{C:mult}+#2#{}倍率、{X:mult,C:white}X#3#{}倍率",
                    "和{C:money}$#4#{}，并有",
                    "{C:green}#5#/#6#{}几率",
                    "被{C:mult}摧毁{}",
                }
            },
            j_abn_daredevil = {
                -- 原型出自漫威宇宙里的超级英雄夜魔侠
                name = "夜魔俠",
                text = {
                    {
                        "每张{C:attention}打出的牌{}",
                        "都计分",
                    },
                    {
                        "打出的计分牌中每有一张{C:attention}背面朝上{}牌",
                        "{C:attention}背面朝上{}牌重新触发一次",
                    },
                    {
                        "如果拥有{C:attention}特技替身{}",
                        "提升所有计分的",
                        "{C:attention}背面朝上{}牌的{C:planet}星球{} {C:attention}点数{}等级",
                    }
                }
            },
            j_abn_dark_magokert = {
                -- Dark Mago... 是致敬《游戏王》（Yu-Gi-Oh!）的经典标志性怪兽 Dark Magician（黑魔导 / 黑暗魔法师）。
                -- 在许多卡牌 Mod 中，“Mago” 都是 Magician / Magic（魔法）的常用简称或拉丁语系（如西班牙语/意大利语）写法。
                name = "黑魔导小丑",
                text = {
                    "带有{C:spades}暗色花色{}的牌",
                    "被移至{C:attention}完整牌组{}",
                    "顶部",
                }
            },
            j_abn_dark_stallion = {
                -- 原型来自 洛奇·巴尔博亚（Rocky Balboa）
                name = "黑马捍将",
                text = {
                    "其他{C:attention}小丑牌{}触发时",
                    "这张小丑牌获得{C:chips}+#4#{}筹码和{C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码，{C:mult}+#1#{C:inactive}倍率）",
                }
            },
            j_abn_dark_tie = {
                name = "黑领带",
                text = {
                    {
                        "打出的手牌包含{C:attention}#3#{}时",
                        "这张小丑牌获得{C:money}$#6#{}和{C:mult}+#2#{}倍率",
                        "{C:inactive}（当前为{C:money}$#5#{C:inactive}，{C:mult}+#1#{C:inactive}倍率）",
                    },
                    {
                        "若包含{C:attention}#3#{}的手牌中",
                        "至少有一张{C:abn_tie}和{}牌",
                        "每张计分的{C:abn_tie}和{}牌获得{C:money}+$#4#{}",
                        "并按计分手牌中每有一张{C:spades}暗色花色{}牌",
                        "获得{C:mult}+#4#{}倍率",
                    },
                }
            },
            j_abn_darkest_joker = {
                -- 致敬硬核肉鸽游戏《暗黑地牢》（Darkest Dungeon），
                -- 卡面美术来自游戏中英雄职业（Jester）
                -- 的官方默认设定名字（Canon Name）。
                -- 在游戏代码及背景彩蛋中，这个名字代指小丑这一职业
                name = "萨曼蒂",
                text = {
                    "每张计分的带有{C:dark_edition}版本{}的{C:spades}暗色{}花色牌获得{C:mult}+#3#{}倍率",
                    "每张计分的带有{C:attention}增强效果{}的{C:spades}暗色{}花色牌获得{C:chips}+#4#{}筹码",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                }
            },
            j_abn_darknet_joker = {
                name = "暗网小丑",
                text = {
                    {
                        "如果打出的牌型是{C:attention}分界征服{}",
                        "且只含{C:attention}数字牌{}",
                        "它们全部获得{C:dark_edition}比特衰变{}版本",
                    },
                    {
                        "{C:attention}分界征服{}中每张计分牌",
                        "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
                    },
                },
            },
            j_abn_daybreak_aurora = {
                name = "破晓极光",
                text = {
                    "计分的{C:dark_edition}镭射{}牌给予{C:chips}+#2#{}筹码",
                    "{C:dark_edition}镭射{}小丑牌给予{C:chips}+#1#{}筹码",
                    "如果这张小丑牌是{C:dark_edition}镭射{}",
                    "给予的筹码数量{C:attention}翻倍{}",
                }
            },
            j_abn_dead_or_alive = {
                -- 卡面美术源自美国西部拓荒时期
                -- 的一种“生死通缉令”（Wanted Poster/Dead or Alive）以及赏金猎人（Bounty Hunter）文化。
                name = "生死不论",
                text = {
                    "打出{C:attention}#1#{}的{V:1}#2#{}时",
                    "将其{C:chips}筹码{}永久{C:attention}翻倍{}",
                    "并获得等同于其点数的{C:money}$",
                    "{s:0.8}牌每回合变化",
                },
            },
            j_abn_deceitful_joker = {
                name = "欺诈小丑",
                text = {
                    "{X:mult,C:white}X#1#{}倍率",
                    "击败{C:attention}Boss盲注{}时",
                    "给{C:attention}随机{}一种拥有的花色",
                    "的所有牌添加{C:attention}翻转{}",
                }
            },
            j_abn_deck_o_cards = {
                name = "游戏牌牌组",
                text = {
                    "当一张{C:attention}游戏牌{}被加入你的牌组时，",
                    "这张小丑牌获得等同于其{C:attention}点数{}的筹码",
                    "{C:inactive}(当前 {C:chips}+#1#{C:inactive} 筹码)",
                },
            },
            j_abn_decollage_joker = {
                name = "拼贴小丑",
                text = {
                    "给予等同于{C:attention}不同花色{}数量的倍乘倍率",
                    "如果这张小丑牌带有{C:dark_edition}镭射{}版本",
                    "所有计分牌获得{C:mult}+#1#{}倍率",
                },
            },
            j_abn_defective_pixel_joker = {
                name = "坏像素小丑",
                text = {
                    "如果打出的牌包含",
                    "{C:attention}奇数{}张计分牌",
                    "这张小丑牌获得{C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                }
            },
            j_abn_degraded_data_joker = {
                name = "降级数据小丑",
                text = {
                    "{C:purple}传染奖励{}牌计分时获得{C:mult}+#4#{}倍率",
                    "{C:purple}传染蜡封{}牌计分时获得{X:mult,C:white}X#5#{}倍率",
                    "{C:purple}传染倍率{}牌计分时获得{X:mult,C:white}^#6#{}倍率",
                    "{C:inactive}（当前为{C:mult}#1#{C:inactive}倍率，{X:mult,C:white}X#2#{C:inactive}倍率，{X:mult,C:white}^#3#{C:inactive}倍率）",
                }
            },
            j_abn_demolition_expert = {
                name = "爆破专家",
                text = {
                    "{X:mult,C:white}X#1#{}倍率",
                    "每次出牌后{C:red}摧毁{}最左侧小丑牌",
                }
            },
            j_abn_depresor_joker = {
                name = "抑制剂小丑",
                text = {
                    {
                        "{C:attention}第一次{}打出的{C:spades}暗色花色{}牌",
                        "变为{C:dark_edition}负片{}",
                    },
                    {
                        "每张打出的{C:dark_edition}负片{} {C:spades}暗色花色{}牌",
                        "这张小丑牌获得{C:chips}+#6#{}筹码和{C:mult}+#5#{}倍率",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}负片{}版本",
                        "每张打出的{C:dark_edition}负片{}牌获得{X:mult,C:white}X#4#{}倍率",
                        "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码，{C:mult}+#2#{C:inactive}倍率，{X:mult,C:white}X#1#{C:inactive}倍率）",
                    }
                }
            },
            j_abn_deranged_imposter = {
                name = "疯狂冒名者",
                text = {
                    {
                        "每张计分的牌与另一张计分牌有",
                        "相同{C:attention}点数{}和{C:enhanced}增强效果{}",
                        "但不同{C:planet}花色{}时，获得{C:red}+#1#{}倍率",
                    },
                    {
                        "每张计分的牌与另一张计分牌有",
                        "相同{C:planet}花色{}和{C:enhanced}增强效果{}",
                        "但不同{C:attention}点数{}时，获得{C:blue}+#2#{}筹码",
                        "{C:inactive}（当前为{C:red}+#3#{C:inactive}倍率，{C:blue}+#4#{C:inactive}筹码）",
                    }
                },
            },
            -- 卡名为其代表作 《Destination Unknown》
            -- 原型疑似是美国80年代著名的波普/新浪潮乐队 Missing Persons（失踪人口乐队）
            j_abn_destination_unknown = {
                name = "未知去向",
                text = {
                    {
                        "选择{C:attention}盲注{}时",
                        "完整牌组中每缺少一种{C:attention}点数{}",
                        "这张小丑牌获得{C:chips}+#3#{}筹码",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}荒废{}版本",
                        "每缺少一种{C:attention}点数{}",
                        "额外获得{X:chips,C:white}X#4#{}筹码",
                        "{C:inactive}（当前为{X:chips,C:white}X#1#{C:inactive}筹码，{C:chips}+#2#{C:inactive}筹码）",
                    },
                }
            },
            j_abn_detonation_button = {
                name = "引爆按钮",
                text = {
                    {
                        "打出的{C:attention}奖励{}、{C:attention}倍率{}",
                        "{C:attention}万能{}和{C:attention}钢铁{}牌",
                        "计分时永久获得{C:white,X:mult}X#1#{}倍率",
                    },
                    {
                        "如果手牌不包含上述这些牌",
                        "则{C:red}自毁{}",
                    }
                },
            },
            j_abn_device_joker = {
                name = "#1#",
                text = {
                    "{C:attention}#2#{}牌不会被自身效果摧毁",
                    "如果{C:attention}第一次出牌{}只包含{C:attention}#3#{}花色",
                    "它们各自获得{C:dark_edition}#2#{}增强效果",
                    "如果它们都带有{C:dark_edition}#2#{}增强效果",
                    "则全部获得{C:dark_edition}#4#{}并{C:attention}翻转{}此小丑牌",
                }
            },
            j_abn_devil_fruit = {
                name = "恶魔果实",
                text = {
                    {
                        "选择{C:attention}盲注{}时",
                        "给最右侧小丑牌",
                        "添加{C:dark_edition}#3#{}版本",
                    },
                    {
                        "回合结束时",
                        "这张牌有{C:green}#1#/#2#{}几率",
                        "被摧毁",
                    },
                }
            },
            j_abn_digital_currency = {
                -- 2008 年中本聪发明了比特币
                name = "虚拟币",
                text = {
                    "每张打出的{C:attention}牌{}",
                    "计分时永久获得",
                    "{C:money}+$#1#{}",
                }
            },
            j_abn_dimitri_jester = {
                -- 参见：https://en.wikipedia.org/wiki/Dimitri_(clown)
                name = "德米特里",
                text = {
                    {
                        "计分的{C:diamonds}方块{}牌给予{X:mult,C:white}X#1#{}倍率",
                        "每当{C:diamonds}方块{}计分时提升{X:mult,C:white}X#2#{}倍率",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "计分的{C:diamonds}方块{}牌给每张{C:attention}小丑牌{}",
                        "添加{C:money}$#3#{}售价",
                    }
                }
            },
            j_abn_dirac = {
                name = "狄拉克",
                text = {
                    "{C:dark_edition}负片{} {C:attention}模组{}牌和小丑牌不会被{C:mult}削弱{}",
                    "若此小丑牌带有{C:dark_edition}负片{}，则{C:attention}手牌上限{}增加{C:attention}+#5#{}",
                    "每有一张计分的{C:attention}模组{} {C:dark_edition}负片{}牌，获得{X:chips,C:white}X#2#{}筹码",
                    "每有一张触发的{C:attention}模组{} {C:dark_edition}负片{}小丑牌，获得{X:mult,C:white}X#4#{}倍率",
                    "{C:inactive}当前：{X:chips,C:white}X#1#{} 筹码 {X:mult,C:white}X#3#{} 倍率",
                },
            },
            j_abn_forsake_joker = {
                name = "荒废小丑",
                text = {
                    "{C:dark_edition}荒废{}版本触发时获得{C:money}$#1#{}",
                    "如果在{C:attention}游戏牌{}上触发",
                    "获得等同于其{C:attention}两倍{}点数的筹码",
                    "如果在{C:attention}小丑牌{}上触发获得{C:mult}+#4#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                }
            },
            j_abn_discontinued_joker = {
                name = "绝版小丑",
                text = {
                    {
                        "跳过{C:attention}盲注{}时，",
                        "生成一个随机{C:attention}标签{}",
                    },
                    {
                        "本局每获得过一种{C:attention}不同标签{}，",
                        "打出的{C:attention}绝版{}牌永久获得",
                        "{C:mult}+#1#{}倍率",
                        "{C:inactive}(将获得 {C:mult}+#2#{C:inactive})",
                    },
                },
            },
            j_abn_dnr_joker = {
                -- Do Not Resuscitate (DNR) 是指患者或家属签署的一份医疗指令，声明在生命垂危（如心跳或呼吸停止）时，拒绝接受心肺复苏（CPR）等插管或创伤性抢救，允许生命自然结束。
                name = "DNR小丑",
                text = {
                    "{C:attention}增强{}牌计分时",
                    "{C:mult}摧毁{}它们，每张{C:attention}小丑牌",
                    "永久获得{X:mult,C:white}X#1#{}倍率",
                }
            },
            j_abn_dorcelessness = {
                -- 该词为虚构专有名词，保持原文
                -- Dorcelessness 的原型来自于网络著名的“模拟恐怖（Analog Horror）”梗
                -- 而美术灵感来源于著名动画作者 Gooseworx 制作的虚构广告短片《Blue Channel: Thalassin》。
                -- 在视频中，一种名为 “Thalassin” 的虚构药物宣称能让人体验到超越常规人类生理极限的“全新情绪”。
                -- Dorcelessness 就是其中最出名的一个衍生情绪（视频中对应的图像是一张极度扭曲、眼眶空洞、令人不适的诡异人脸）。
                name = "Dorcelessness",
                text = {
                    "重新触发{C:attention}相邻{}的",
                    "{C:attention}翻转{}小丑牌",
                }
            },
            j_abn_double_entendre = {
                name = "双关语", -- 双关是一种修辞方法，利用谐音或借义，使一个句子可以理解成多种意思
                text = {
                    "{C:attention}偶数次{}出牌获得{C:white,X:mult}X#1#{}倍率",
                    "{C:attention}奇数次{}出牌获得{C:white,X:chips}X#2#{}筹码",
                }
            },
            j_abn_double_hubble = {
                name = "双哈勃",
                text = {
                    "若{C:attention}牌型{}已被打出过",
                    "{C:attention}偶数{}次，",
                    "则获得{C:mult}+#1#{}倍率",
                },
            },
            j_abn_double_king = {
                -- 《Double King》（双王）是澳大利亚独立动画师Felix Colgrave
                -- 于2017年发布的一部知名的网络2D超现实主义动画短片。
                -- 主角是一个没有名字的、长着巨大双手和空洞眼神的君主（被称为The King）。
                -- 抛弃了自己的王国和子民，踏上一场血腥疯狂的弑君之旅。他的唯一目标就是掠夺并收集其他动物、植物及神明等各路统治者的王冠。
                -- 因精神错乱切掉了自己戴着小王冠的手指导致失血，最终死后在冥界遇到了死神，仍试图抢夺死神的王冠，最终落入虚无。
                name = "双王",
                text = {
                    {
                        "{C:attention}K{}牌不获得{C:chips}筹码{}",
                        "{C:attention}K{}牌计分时将其{C:mult}摧毁{}",
                        "并获得其{C:attention}点数{}的{C:attention}两倍{}作为{C:chips}筹码{}",
                    },
                    {
                        "如果拥有骷髅先生",
                        "回合{C:attention}结束时{}它变为{C:dark_edition}负片{}",
                        "并且每张计分牌获得{C:mult}+#2#{}倍率",
                        "{C:inactive}当前为：{C:chips}+#1#{C:inactive}筹码",
                    },
                }
            },
            j_abn_drawcia = {
                name = "画西亚",
                text = {
                    "仅由{C:attention}模组{}花色组成的{C:attention}牌型{}",
                    "{C:attention}必定计分{}",
                    "若未打出{C:attention}原版{}花色，则每有一种",
                    "{C:attention}不同{}花色获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}当前：{X:mult,C:white}X#1#{} 倍率",
                },
            },
            j_abn_dreamstalker_joker = {
                -- 原型疑似“梦中人”（This Man），参考其衍生网站 thisman.org
                name = "潜梦者",
                text = {
                    "如果拥有{C:attention}偶数{}次{C:mult}弃牌{}",
                    "每张在{C:diamonds}光明{}花色前计分的{C:spades}暗色{}花色牌",
                    "使{C:diamonds}光明{}花色牌计分时获得{C:mult}+#1#{}倍率",
                    "如果拥有{C:attention}奇数{}次{C:mult}弃牌{}",
                    "每张在{C:spades}暗色{}花色前计分的{C:diamonds}光明{}花色牌",
                    "使{C:spades}暗色{}花色牌计分时获得{C:mult}+#1#{}倍率",
                }
            },
            j_abn_drifter_joker = {
                -- 卡面美术来源：https://discord.com/channels/1116389027176787968/1153815324643299458/1470147662232686716
                name = "漂泊者",
                text = {
                    "如果这是回合的{C:attention}第一次弃牌{}",
                    "被弃掉的牌变为{C:attention}化石牌{}",
                    "{C:attention}无点数{}牌第一次被打出时",
                    "{C:attention}返回{}手牌",
                }
            },
            j_abn_dryeraser_board = {
                name = "白板小丑",
                text = {
                    "如果所有打出的牌和手牌",
                    "都是{C:spades}#2#{}",
                    "则获得{X:red,C:white}X#1#{}倍率",
                }
            },
            j_abn_dual_identity = {
                name = "双面身份",
                text = {
                    "如果你拥有{C:attention}偶数{}张且",
                    "{C:attention}两种不同{}稀有度的小丑牌",
                    "则{X:mult,C:white}X#1#{}倍率",
                }
            },
            j_abn_dungeon_crawler = {
                name = "地牢探索者",
                text = {
                    {
                        "支付{C:money}$#1#{}以增加{C:attention}+1{}小丑牌槽位",
                        "每有一张超过{C:attention}5{}张的小丑牌",
                        "最终{C:attention}底注{}增加{C:attention}+1{}",
                    },
                    {
                        "带有{C:inactive}原版{C:dark_edition}版本{}的小丑牌",
                        "给予{C:gold}+#2#{}晋升强度",
                    },
                    {
                        "若一张带有{C:inactive}原版{}花色和{C:dark_edition}版本{}的牌",
                        "与持有的某张{C:attention}小丑牌的{C:dark_edition}版本{}相同",
                        "这张小丑牌获得{C:gold}+#4#{}晋升强度",
                        "{C:inactive}（当前为{C:gold}+#5#{}晋升强度）",
                    },
                }
            },
            j_abn_edgesketch_joker = {
                -- 美术原型为 Etch A Sketch，它是一款经典的机械绘图玩具，标志性外观为红色塑料外框、灰色屏幕和下方两个白色旋钮。左边旋钮控制横向移动，右边旋钮控制纵向移动，转动时内部的铁笔会刮去铝粉显示出线条，上下摇晃则能重新铺满铝粉“清空画板”。
                name = "蚀刻素描小丑",
                text = {
                    "{C:attention}最右侧{}小丑牌触发时获得{C:mult}+#3#{}倍率",
                    "{C:attention}最左侧{}小丑牌触发时获得{C:chips}+#4#{}筹码",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                }
            },
            j_abn_edition_anonymous = {
                name = "匿名版本",
                text = {
                    "带有{C:dark_edition}版本{}的牌计分时随机改变其{C:dark_edition}版本{}",
                    "每张改变{C:dark_edition}版本{}的牌获得{C:mult}+#1#{}倍率和{C:chips}+#2#{}筹码",
                    "击败{C:attention}盲注{}时随机改变所有小丑牌的版本",
                    "每张改变{C:dark_edition}版本{}的小丑牌获得{C:mult}+#1#{}倍率和{C:chips}+#2#{}筹码",
                }
            },
            j_abn_edition_design_joker = {
                name = "版本设计小丑",
                text = {
                    {
                        "购买带有{C:dark_edition}版本{}的{C:attention}小丑牌{}时",
                        "根据其{C:legendary}稀有度{}获得{C:mult}倍率{}",
                        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                    },
                    {
                        "{C:common,s:0.8}普通{s:0.8}：{C:red,s:0.8}+#2#{s:0.8}倍率",
                        "{C:uncommon,s:0.8}罕见{s:0.8}：{C:red,s:0.8}+#3#{s:0.8}倍率",
                        "{C:rare,s:0.8}稀有{s:0.8}：{C:red,s:0.8}+#4#{s:0.8}倍率",
                        "{C:abn_superrare,s:0.8}超稀有{s:0.8}：{C:red,s:0.8}+#5#{s:0.8}倍率",
                        "{C:abn_parallelrare,s:0.8}爆闪{s:0.8}：{C:red,s:0.8}+#6#{s:0.8}倍率",
                        "{C:legendary,s:0.8}传奇{s:0.8}：{C:red,s:0.8}+#7#{s:0.8}倍率",
                        "{C:abn_virusrare,s:0.8}异变{s:0.8}：{C:red,s:0.8}+#8#{s:0.8}倍率",
                    },
                }
            },
            j_abn_editional_tag = {
                name = "版本标签",
                text = {
                    {
                        "获得{C:attention}标签{}时，获得{X:mult,C:white}X#2#{}倍率",
                        "若该标签是{C:attention}模组{}标签，则带有{C:attention}绝版{}",
                        "{C:dark_edition}增强{}的牌获得{C:money}$#4#{} {C:mult}+#3#{}倍率",
                    },
                    {
                        "若此小丑牌带有{C:dark_edition}版本{}，",
                        "则当小丑牌因{C:attention}标签{}获得{C:dark_edition}版本{}时，",
                        "一张随机的{C:attention}绝版{C:dark_edition}增强{}牌",
                        "获得相同的{C:dark_edition}版本{}",
                        "{C:inactive}当前：{X:mult,C:white}X#1#{} 倍率",
                    },
                },
            },
            j_abn_efo_joker = {
                name = "EFO小丑",
                text = {
                    "有{C:green}#1#/#2#{}几率将第一张打出的",
                    "{C:attention}印章牌{}复制到你的手牌中",
                    "带有{C:attention}印章{}的计分牌给予{C:gold}+#3#{}晋升强度",
                    "打出包含{C:attention}5{}张及以上印章牌的牌型时，",
                    "每张牌给予此小丑牌{X:mult,C:white}X#4#{}倍率",
                    "和{C:gold}+#5#{}晋升强度",
                    "{C:inactive}当前：{X:mult,C:white}X#6#{} 倍率 {C:gold}+#7#{} 晋升强度",
                },
            },
            j_abn_egg_arrival = {
                name = "蛋来",
                text = {
                    {
                        "使用{C:weather_report}天气预报{}牌时",
                        "给每张{C:attention}小丑牌{}",
                        "添加{C:money}$#1#{}售价",
                    },
                    {
                        "重新触发所有售价",
                        "至少{C:money}$#2#{}的{C:attention}小丑牌{}",
                    },
                }
            },
            j_abn_elated_joker = {
                name = "兴高采烈小丑",
                text = {
                    {
                        "包含{C:attention}4{}种或更多",
                        "花色的手牌不会被削弱",
                    },
                    {
                        "每弃掉一种不同{C:attention}花色{}",
                        "这张小丑牌获得{C:chips}+#4#{}筹码",
                        "每打出一种不同{C:attention}花色{}",
                        "获得{C:mult}+#2#{}倍率",
                        "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码，{C:mult}+#1#{C:inactive}倍率）",
                    }
                }
            },
            j_abn_electrocuted_joker = {
                name = "电击小丑",
                text = {
                    {
                        "重新触发所有{C:attention}#1#{}和{C:attention}#2#{}",
                    },
                    {
                        "{C:attention}#1#{}和{C:attention}#2#{}计分时",
                        "有{C:green}#3#/#4#{}几率被{C:red}摧毁{}",
                    }
                }
            },
            j_abn_elementalist_joker = {
                name = "元素师小丑",
                text = {
                    {
                        "如果打出的牌包含",
                        "{C:attention}6{}种或更多花色",
                        "则提升该牌型等级",
                    },
                    {
                        "如果{C:attention}牌型{}是",
                        "{C:attention}逆光谱{}",
                        "提升所有计分牌的{C:planet}星球{} {C:attention}点数{}等级",
                    }
                }
            },
            j_abn_elevator = {
                name = "电梯",
                text = {
                    "打出的牌",
                    "计分后点数",
                    "提升{C:attention}1{}",
                }
            },
            j_abn_emergency_contact = {
                name = "紧急联系人",
                text = {
                    "{C:attention}#1#{}回合后",
                    "{C:attention}售出{}这张小丑牌以生成",
                    "收藏中一张已发现的",
                    "{C:rare}稀有{} {C:abn_perishable}易腐{}小丑牌",
                    "{C:inactive}（当前为{C:attention}#2#{C:inactive}/{C:inactive}#1#）",
                },
            },
            j_abn_ena_joker = {
                name = "ENA小丑",
                text = {
                    {
                        "打出带有{C:attention}原版{}花色和",
                        "{C:attention}模组增强{}的牌，计分时给予",
                        "{X:chips,C:white}X#1#{}筹码",
                    },
                    {
                        "计分手牌中每有一种{C:attention}不同{}的",
                        "{C:attention}模组{C:enhanced}增强{}，这张小丑牌获得",
                        "{C:chips}+#3#{}筹码",
                        "{C:inactive}(当前 {C:chips}+#2#{C:inactive} 筹码)",
                    },
                },
            },
            j_abn_enchanted_night = {
                name = "魔法之夜",
                text = {
                    "重新触发所有打出的",
                    "带有{C:dark_edition}版本{}的{C:spades}暗色花色{}牌",
                }
            },
            j_abn_enigma_comedian = {
                name = "谜语•喜剧演员",
                text = {
                    {
                        "选择{C:attention}盲注{}时",
                        "生成一张带有{C:dark_edition}珠光{}版本的",
                        "{C:planet}基础{} {C:attention}小丑牌{}",
                        "{C:inactive}（必须有空位）",
                    },
                    {
                        "每张触发的{C:planet}基础{} {C:attention}小丑牌{}",
                        "获得{X:mult,C:white}^#1#{}倍率和{X:chips,C:white}^#2#{}筹码",
                    }
                }
            },
            j_abn_enrage_joker = {
                name = "激怒小丑",
                text = {
                    "{C:white,X:chips}X#1#{}筹码",
                    "迫使{C:attention}#2#{}张牌",
                    "总是被选中",
                },
            },
            j_abn_entropic_clubs = {
                name = "熵增梅花",
                text = {
                    "摧毁所有计分的{C:clubs}梅花{}牌",
                    "这张小丑牌获得其{C:chips}筹码{}",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                }
            },
            j_abn_entropic_diamonds = {
                name = "熵增方块",
                text = {
                    "摧毁所有计分的{C:diamonds}方块{}牌",
                    "这张小丑牌获得其{C:chips}筹码{}",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                }
            },
            j_abn_entropic_hearts = {
                name = "熵增红桃",
                text = {
                    "摧毁所有计分的{C:hearts}红桃{}牌",
                    "这张小丑牌获得其{C:chips}筹码{}",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                }
            },
            j_abn_entropic_spades = {
                name = "熵增黑桃",
                text = {
                    "摧毁所有计分的{C:spades}黑桃{}牌",
                    "这张小丑牌获得其{C:chips}筹码{}",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                }
            },
            j_abn_epic_joker = {
                name = "史诗小丑",
                text = {
                    "{C:attention}同花{}中每打出一张",
                    "点数高于{C:attention}10{}的{C:attention}数字牌{}",
                    "这张小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                },
            },
            j_abn_erratic_joker = {
                name = "古怪小丑",
                text = {
                    "{C:attention}计分前{}每张打出的牌",
                    "变为随机{C:attention}花色{}",
                    "牌改变花色时",
                    "这张小丑牌获得{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）",
                }
            },
            j_abn_escuderia_joker = {
                -- Escuderia（或西语拼写 escudería，意语 scuderia）本义是“马厩”，在现代赛车语境中专指“车队”（如著名的 Scuderia Ferrari 译为法拉利车队）。
                name = "俱乐部小丑",
                text = {
                    "你的{C:attention}小丑牌{}中每有一种",
                    "{C:attention}不同贴纸{}",
                    "获得{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）",
                }
            },
            j_abn_eternian_joker = {
                name = "永恒小丑",
                text = {
                    "每持有一种{C:attention}不同{}类型的消耗牌，",
                    "获得{C:gold}+#1#{}晋升强度",
                    "{C:inactive}(当前 {C:gold}+#2#{C:inactive} 晋升强度)",
                },
            },
            j_abn_even_stephen = {
                name = "偶数斯蒂芬",
                text = {
                    "打出的{C:attention}偶数{}点数牌",
                    "计分时给予",
                    "{C:mult}+#1#{}倍率",
                    "{C:inactive}（14、12、10、8、6、4、2）",
                },
            },
            j_abn_evenly_steven = {
                name = "均匀史蒂文",
                text = {
                    "每张打出的{C:attention}偶数{}点数牌",
                    "计分时永久获得",
                    "{C:chips}+#1#{}筹码",
                    "{C:inactive}（10、8、6、4、2）",
                }
            },
            j_abn_example_joker = {
                name = "示例小丑",
                text = {
                    "回合最后",
                    "打出的{C:attention}牌型{}",
                    "生成其{C:sigils}符印{}牌",
                }
            },
            j_abn_executioner = {
                name = "行刑者",
                text = {
                    "当一张{C:attention}游戏牌{}",
                    "被摧毁时",
                    "手牌中{C:attention}持有{}的牌",
                    "永久获得",
                    "{C:chips}+#1#{}筹码",
                }
            },
            j_abn_explorer_joker = {
                name = "探险家",
                text = {
                    {
                        "计分的{C:diamonds}方块{}牌",
                        "每{C:attention}持有{}一张{C:continent}大陆{}牌",
                        "获得{C:chips}+#6#{}筹码和{C:mult}+#7#{}倍率",
                    },
                    {
                        "{C:continent}大陆{}牌售价为{C:money}$#5#{}",
                        "每售出一张{C:continent}大陆{}牌",
                        "这张小丑牌获得{C:chips}+#2#{}筹码和{C:mult}+#4#{}倍率",
                        "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码，{C:mult}+#3#{C:inactive}倍率）",
                    }
                }
            },
            j_abn_eye_exam = {
                name = "视力检查",
                text = {
                    "支付{C:money}$#1#{}可将手牌中所有",
                    "{C:attention}翻转{}牌翻回",
                }
            },
            j_abn_facial_recognition = {
                name = "面部识别",
                text = {
                    {
                        "计分的{C:attention}翻转{}牌中每有",
                        "一种{C:attention}不同点数{}，",
                        "获得{X:red,C:white}X#1#{}倍率",
                    },
                    {
                        "若此{C:attention}小丑牌{}处于{C:attention}翻转{}状态，",
                        "则改为获得等同于计分{C:attention}翻转{}牌",
                        "{C:blue}筹码{}值的{C:blue}筹码{}",
                        "{C:inactive}(当前 {X:red,C:white}X#2#{C:inactive} 倍率 {C:blue}+#3#{C:inactive} 筹码)",
                    },
                },
            },
            j_abn_faded_graffiti = {
                name = "褪色涂鸦",
                text = {
                    "手牌{C:attention}升级{}时",
                    "同时升级{C:attention}同花{}",
                }
            },
            j_abn_fairytale_book = {
                name = "童话书",
                text = {
                    "{C:legendary,E:1}传奇{}小丑牌",
                    "可能出现在{C:attention}商店{}中",
                }
            },
            j_abn_fanart_joker = {
                -- 卡面美术灵感来源于Discord 的UI界面，discord也是小丑牌的社区大本营
                name = "同人小丑",
                text = {
                    "当你拥有{C:attention}奇数{}",
                    "张小丑牌时获得{X:mult,C:white}X#1#{}倍率",
                }
            },
            j_abn_fanfiction_comedian = {
                name = "同人•喜剧演员",
                text = {
                    {
                        "每张计分的{C:attention}不同{} {C:attention}无色{}牌",
                        "这张小丑牌获得{X:mult,C:white}X#2#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                    },
                    {
                        "每张{C:attention}无色{}牌每有一种",
                        "{C:attention}不同{} {C:attention}无色{}牌计分",
                        "获得{C:mult}+#4#{}倍率和{C:chips}+#3#{}筹码",
                    },
                    {
                        "每张{C:attention}无色{}牌每有一种",
                        "{C:attention}不同{} {C:attention}无色{}牌计分",
                        "重新触发一次",
                    },
                }
            },
            j_abn_faruk_jester = {
                -- 原型疑似埃及国王法鲁克一世（King Farouk I）
                name = "法鲁克",
                text = {
                    {
                        "计分的{C:spades}黑桃{}牌给予{X:chips,C:white}X#1#{}筹码",
                        "每当{C:spades}黑桃{}计分时提升{X:chips,C:white}X#2#{}筹码",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "手牌中每{C:attention}持有{}一张牌",
                        "{C:spades}黑桃{}牌永久获得{C:mult}+#3#{}倍率",
                    }
                }
            },
            j_abn_fatal_silhouette = {
                name = "致命剪影",
                text = {
                    "第一张打出的带有",
                    "{C:abn_silver_seal}银色蜡封{}的",
                    "{C:diamonds}光明花色{}牌",
                    "计分时给予{C:white,X:chips}X#1#{}筹码",
                }
            },
            j_abn_feline_joker = {
                name = "猫科小丑",
                text = {
                    "随机获得{C:chips}+#2#{}筹码、",
                    "{C:white,X:mult}X#1#{}倍率或{C:money}$#3#{}",
                }
            },
            j_abn_felix_joker = {
                -- 经典动画角色“菲力猫”（Felix the Cat）的名字
                name = "菲利克斯",
                text = {
                    "击败{C:attention}盲注{}时",
                    "将持有的{C:attention}消耗牌{}",
                    "转化为{C:spectral}幻灵{}牌",
                }
            },
            j_abn_feste = {
                -- 这个名字源自拉丁语及法语的 fête/festum（意为节日、庆典、宴会），
                -- 最著名的出处是莎士比亚喜剧《第十二夜》中的聪明丑角
                name = "费斯特",
                text = {
                    "选择{C:attention}盲注{}时",
                    "生成一张{C:dark_edition}负片{}",
                    "{C:nightshift_cards}夜班{}牌",
                }
            },
            j_abn_figurehead = {
                name = "名义领袖",
                text = {
                    "重新触发所有",
                    "{C:legendary,E:1}传奇{}小丑",
                }
            },
            j_abn_final_showdown = {
                name = "最终决战",
                text = {
                    {
                        "{C:attention}Boss盲注{}被替换为",
                        "{C:legendary,E:1}决战{}{C:attention} Boss盲注{}",
                    },
                    {
                        "击败{C:legendary,E:1}决战{}{C:attention} Boss盲注{}时",
                        "获得{C:attention}+#1#{}个小丑牌槽位",
                    }
                }
            },
            j_abn_finalmix = {
                -- 一个模组名称
                name = "Final Mix",
                text = {
                    "计分{C:hearts}红桃{}时，每有一个",
                    "{C:attention}不同的牌面修饰{}，",
                    "这张小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}(当前 {X:mult,C:white}X#1#{C:inactive} 倍率)",
                },
            },
            j_abn_fit_to_shape = {
                name = "合身",
                text = {
                    "{C:attention}4{}张牌的手牌",
                    "给予{X:chips,C:white}^#1#{}筹码和{X:mult,C:white}^#2#{}倍率",
                }
            },
            j_abn_flawed_imitation = {
                name = "缺陷仿品",
                text = {
                    {
                        "{C:attention}小丑牌{}可以出现复数张",
                    },
                    {
                        "每张小丑牌的复制品",
                        "给予{X:mult,C:white}X#1#{}倍率",
                    },
                }
            },
            j_abn_flotsam_joker = {
                name = "漂浮物小丑",
                text = {
                    "如果打出的牌包含{C:attention}同花{}",
                    "手牌中{C:attention}持有{}的相同",
                    "{C:attention}花色{}牌可在计分时计数",
                }
            },
            j_abn_for_sale_joker = {
                name = "待售",
                text = {
                    "出牌时",
                    "获得等同于当前所有",
                    "{C:attention}小丑牌{}总{C:attention}售价{}的{C:chips}筹码{}",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                }
            },
            j_abn_force_encounter = {
                name = "强制遭遇",
                text = {
                    {
                        "其他{C:attention}小丑牌{}的{C:mult}+倍率{}效果计分时",
                        "这张小丑牌获得{C:chips}+#1#{}筹码",
                    },
                    {
                        "击败{C:attention}盲注{}时",
                        "筹码增加{C:chips}+#2#{}",
                    }
                }
            },
            j_abn_foreign_id = {
                name = "异国身份",
                text = {
                    "计分的{C:attention}模组{}花色牌",
                    "的{C:attention}点数{}作为{C:mult}倍率{}，",
                    "使这张小丑牌获得倍率",
                    "{C:inactive}(当前 {C:mult}+#1#{C:inactive} 倍率)",
                },
            },
            j_abn_foreign_license = {
                name = "外国驾照",
                text = {
                    "如果{C:attention}完整牌组{}中至少有",
                    "{C:attention}#2#{}张增强牌",
                    "则获得{X:chips,C:white}X#1#{}筹码",
                    "{C:inactive}（当前为{C:attention}#3#{C:inactive}）",
                },
            },
            j_abn_foreign_thunk = {
                name = "异国思扣",
                text = {
                    {
                        "若{C:attention}第一张计分牌{}带有",
                        "{C:attention}原版{C:enhanced}增强{}，则将其对应的",
                        "{C:enhanced}贴纸{}赋予{C:attention}最右侧{}的小丑牌",
                    },
                    {
                        "若某张{C:attention}小丑牌{}的{C:enhanced}贴纸{}与",
                        "计分牌的{C:enhanced}原版增强{}相符，",
                        "则{C:attention}其{}获得{C:purple}+#1#{}计分",
                    },
                },
            },
            j_abn_forgemaster_joker = {
                name = "锻造大师",
                text = {
                    "{C:attention}未计分{}牌变为{C:attention}烙铁{}牌",
                    "{C:attention}烙铁{}牌打出时可以计分",
                }
            },
            j_abn_fortlatro = {
                name = "财富牌局",
                text = {
                    "{C:attention}原版{}消耗牌和小丑牌{C:attention}不会{}出现",
                    "选择{C:chips}小盲注{}时，生成一个随机的{C:attention}模组{}消耗牌",
                    "选择{C:attention}大盲注{}时，生成一张随机的{C:attention}模组{}小丑牌",
                    "本局每使用过一种{C:attention}不同的模组消耗牌{}，获得{X:chips,C:white}X#2#{}筹码",
                    "本局每使用过一张{C:attention}不同的模组小丑牌{}，获得{X:mult,C:white}X#4#{}倍率",
                    "{C:inactive}当前：{X:chips,C:white}X#1#{} 筹码 {X:mult,C:white}X#3#{} 倍率",
                },
            },
            j_abn_fortune_joker = {
                name = "幸运小丑",
                text = {
                    {
                        "提升所有计分的",
                        "{C:attention}幸运{}牌的{C:planet}星球{} {C:attention}点数{}等级",
                    },
                    {
                        "计分的{C:attention}幸运{}牌",
                        "{C:green}成功{}触发时重新触发",
                    }
                }
            },
            j_abn_fractured_identity_joker = {
                name = "破碎身份小丑",
                text = {
                    "计分的{C:mult}倍率{}牌或{C:Steel}黄金{}牌给予{X:chips,C:white}^#1#{}筹码",
                    "计分的{C:attention}玻璃{}牌或{C:attention}石头{}牌给予{X:mult,C:white}^#2#{}倍率",
                }
            },
            j_abn_fraser_jester = {
                name = "弗雷泽", -- 源自苏格兰的姓氏
                text = {
                    "{C:attention}+#1#{}手牌上限",
                },
            },
            j_abn_fraud_soul = {
                name = "欺诈灵魂",
                text = {
                    "选择{C:attention}盲注{}时",
                    "持有的{C:tarot}塔罗{}牌给{C:attention}最右侧{}小丑牌{C:chips}+#1#{}筹码",
                    "持有的{C:planet}星球{}牌给最右侧小丑牌{C:mult}+#2#{}倍率",
                    "持有的{C:spectral}幻灵{}牌给最右侧小丑牌{X:mult,C:white}+X#3#{}倍率",
                    "持有的{C:sigils}符印{}牌给最右侧小丑牌{X:chips,C:white}+X#4#{}筹码",
                    "持有的{C:astro_cards}星座{}牌给最右侧小丑牌{C:money}$#5#{}",
                    "持有的{C:abn_calamity}灾厄{}牌使这张小丑牌所有数值翻倍",
                    "持有的{C:nightshift_cards}夜班{}牌给手牌中{C:attention}随机{}牌添加{C:attention}+#6#{}次重新触发",
                }
            },
            j_abn_fraudulent_mod_joker = {
                name = "欺诈模组小丑",
                text = {
                    {
                        "每张计分的{C:abn_tie}和{}或{C:abn_bow}弓{} {C:attention}缝制{}牌",
                        "这张小丑牌获得{C:mult}+#1#{}倍率",
                    },
                    {
                        "每张计分的{C:abn_tie}和{}或{C:abn_bow}弓{} {C:attention}棉质{}牌",
                        "这张小丑牌获得{C:chips}+#2#{}筹码",
                        "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率，{C:chips}+#4#{C:inactive}筹码）",
                    }
                }
            },
            j_abn_freddy_jester = {
                -- 疑似出自歌剧《魔弹射手》（Der Freischütz）中的主角 Freischütz（魔弹射手），以及《脑叶公司》（Lobotomy Corporation）中以此为原型的同名异想体。
                name = "弗雷迪",
                text = {
                    {
                        "计分的{C:abn_penumbra}半影{}牌给予{X:mult,C:white}X#1#{}倍率",
                        "每当{C:abn_penumbra}半影{}计分时提升{X:mult,C:white}X#2#{}倍率",
                    },
                    {
                        "如果拥有{C:attention}金宝{}",
                        "打出的{C:abn_penumbra}半影{}牌计分时",
                        "永久获得{C:chips}+#3#{}筹码",
                    }
                }
            },
            j_abn_frenemy_joker = {
                name = "亦敌亦友",
                text = {
                    "每有一种不同{C:attention}稀有度{}的小丑牌",
                    "就降低{C:attention}盲注需求{}的{C:attention}#1#%{}",
                }
            },
            j_abn_friend_jimbo = {
                name = "朋友金宝",
                text = {
                    {
                        "{C:spades}暗色花色{}牌被{C:mult}摧毁{}时",
                        "生成一张{C:attention}石头{}牌",
                    },
                    {
                        "如果被摧毁的牌是{C:abn_black_seal}暗色{}牌",
                        "获得等同于其{C:attention}点数{}的{C:chips}筹码{}",
                        "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                    }
                }
            },
            j_abn_frigid_joker = {
                name = "严寒小丑",
                text = {
                    "打出的{C:abn_snow}#2#{}花色牌",
                    "计分时给予{C:mult}+#1#{}倍率",
                },
            },
            j_abn_from_pixel_to_dust = {
                name = "化素为尘",
                text = {
                    "打出的{C:attention}未计分{}牌",
                    "每张将其{C:attention}点数{}的{C:attention}两倍{}作为{C:mult}倍率{}添加",
                    "然后{C:mult}自毁{}",
                }
            },
            j_abn_front_to_cover = {
                name = "从头到尾",
                text = {
                    {
                        "未计分的{C:attention}翻转{}牌",
                        "返回牌组",
                    },
                    {
                        "{C:attention}翻转{}牌计分时",
                        "获得等同于其点数的{C:blue}筹码{}",
                    }
                },
            },
            j_abn_frontier_joker = {
                name = "边疆小丑",
                text = {
                    {
                        "回合结束时每{C:attention}持有{}一张消耗牌",
                        "获得{C:money}$#1#{}",
                    },
                    {
                        "使用{C:continent}大陆{}牌时",
                        "给每张{C:attention}小丑牌{}",
                        "添加{C:money}$#2#{}售价",
                    }
                }
            },
            j_abn_full_jester = {
                name = "完整小丑",
                text = {
                    {
                        "如果打出的牌由",
                        "{C:attention}6{}种或更多花色组成，这张小丑牌",
                        "每种计分花色获得{C:white,X:mult}X#2#{}倍率",
                    },
                    {
                        "如果打出的牌由{C:attention}5{}种花色",
                        "和一张{C:attention}无点数{}牌组成，这张小丑牌",
                        "每种计分花色获得{C:white,X:chips}X#4#{}筹码",
                        "{C:inactive}（当前为{C:white,X:chips}X#3#{C:inactive}筹码，{C:white,X:mult}X#1#{C:inactive}倍率）",
                    }
                }
            },
            j_abn_funambulist = {
                name = "走钢丝艺人",
                text = {
                    "左侧每张{C:attention}小丑牌{}获得{C:mult}+#1#{}倍率",
                    "右侧每张{C:attention}小丑牌{}获得{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率，{C:chips}+#4#{C:inactive}筹码）",
                }
            },
            j_abn_gabagool_sandwhich = {
                -- “Gabagool”是对意大利腌猪肉“Capocollo”（或 Capicola）的方言俗称。它源于美国意裔移民（尤其是新泽西州和纽约地区）对南部意大利方言的发音演变
                -- 它是一种经风干或烟熏制成的猪肩肉或颈肉切片，带有浓郁的香料味和咸香。
                name = "意式火腿三明治",
                text = {
                    "每当小丑牌触发",
                    "为其添加{C:chips}+#3#{}筹码",
                    "回合结束时有{C:green}#1#/#2#{}几率",
                    "被{C:attention}吃掉{}",
                }
            },
            j_abn_gachapon = {
                name = "扭蛋机",
                text = {
                    "选择{C:attention}盲注{}时，{C:money}-$#1#{}",
                    "有{C:green}#2#/#3#{}几率生成",
                    "一张随机{C:green}罕见{}小丑牌",
                    "有{C:green}#4#/#5#{}几率生成",
                    "一张随机{C:red}稀有{}小丑牌",
                    "资金为$0时{C:red}自毁{}",
                    "{C:inactive}（必须有空位）",
                }
            },
            j_abn_gag_flower = {
                name = "笑料花",
                text = {
                    "如果打出的牌包含",
                    "{C:attention}#1#{}",
                    "每张计分牌这张小丑牌",
                    "获得{C:mult}+#5#{}倍率和{C:chips}+#4#{}筹码",
                    "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                }
            },
            j_abn_gagman_joker = {
                name = "笑料小丑",
                text = {
                    "波尔卡点牌保留其",
                    "{C:attention}点数{}和{C:attention}花色{}",
                },
            },
            j_abn_galactic_consciousness = {
                name = "银河意识",
                text = {
                    "{C:dark_edition}亮光{}版本{C:attention}牌{}计分时给予{C:mult}+#1#{}倍率",
                    "{C:dark_edition}珠光{}版本{C:attention}牌{}计分时给予{X:chips,C:white}X#2#{}筹码",
                    "{C:dark_edition}虹彩{}版本{C:attention}牌{}计分时给予{X:mult,C:white}X#3#{}倍率",
                    "{C:dark_edition}幻彩{}版本{C:attention}牌{}计分时给予{X:chips,C:white}^#4#{}筹码",
                },
            },
            j_abn_galactic_night = {
                name = "银河之夜",
                text = {
                    "给予等同于打出的{C:attention}牌型{}",
                    "等级的{X:mult,C:white}X倍率{}",
                },
            },
            j_abn_gallows_joker = {
                name = "绞架小丑",
                text = {
                    "当一张{C:attention}人头牌{}",
                    "被摧毁时，这张小丑牌",
                    "有{C:green}#1#/#2#{}几率",
                    "生成一张{C:tarot}倒吊人{}",
                }
            },
            j_abn_garden_gnome = {
                name = "花园地精",
                text = {
                    "计分的{C:spades}黑桃{}和{C:clubs}梅花{}",
                    "有{C:green}#1#/#2#{}几率",
                    "变为{C:dark_edition}负片{}",
                }
            },
            j_abn_geiger_joker = {
                name = "盖革小丑",
                text = {
                    "计分的{C:attention}数字{} {C:attention}险兆{}牌",
                    "按其{C:attention}点数{}本回合计分的次数，",
                    "每次给予{C:gold}+#1#{}晋升强度",
                },
            },
            j_abn_genocide_route = {
                -- 美术原型来自于独立游戏《Deltarune》（《三角符文》，《Undertale》作者 Toby Fox 的作品）中的主角 Kris（克里斯），名称来自该系列经典的“屠杀/灭绝路线”（Genocide Route / Snowgrave Route）
                name = "灭绝路线",
                text = {
                    {
                        "购买时{C:mult}摧毁{}所有小丑牌",
                        "每张{C:mult}摧毁{}的小丑牌",
                        "获得{X:mult,C:white}X#3#{}倍率和{X:chips,C:white}X#4#{}筹码",
                        "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率，{X:chips,C:white}X#2#{C:inactive}筹码）",
                    },
                    {
                        "获得{C:abn_superrare}超稀有{}{C:attention}小丑牌{}时",
                        "{C:attention}重新开始{}此过程",
                    },
                    {
                        "选择{C:attention}盲注{}时",
                        "生成一张随机{V:1}#5#{}小丑牌",
                        "带有{C:dark_edition}#6#{}版本",
                    },
                }
            },
            j_abn_gerrymandering = {
                -- 该词起源于 1812 年的美国马萨诸塞州。
                -- 当时的州长埃尔布里奇·杰利（Elbridge Gerry）为了本党利益，
                -- 签署批准了一个形状怪异的选举选区。
                -- 当地报纸发现其中一个选区形状酷似一只巨型蝾螈（Salamander），
                -- 便将州长名字“杰利（Gerry）”与蝾螈后缀“-mandering”结合，
                -- 创造了“Gerrymandering”这个政治讽刺新词。
                name = "杰利蝾螈",
                text = {
                    "重新触发所有",
                    "打出的{V:1}#1#{}花色牌",
                    "{s:0.8}花色在回合结束时变化",
                }
            },
            j_abn_getter_robo = {
                -- 《Getter Robo!》是日本经典超级机器人作品《盖塔机器人》（ゲッターロボ）的英文名称或标题
                name = "盖塔机器人！",
                text = {
                    "{X:mult,C:white}X#1#{}倍率 {X:chips,C:white}X#2#{}筹码 {X:attention,C:white}X#3#{} {C:attention}Boss需求{}",
                    "击败{C:attention}Boss盲注{}后这些数值{C:attention}翻倍{}",
                },
            },
            j_abn_ghost_in_the_machine = {
                -- 该词由英国哲学家吉尔伯特·赖尔（Gilbert Ryle）于1949年在其著作《心灵的概念》（The Concept of Mind）中首次提出。
                -- 赖尔用“机器中的幽灵”来批判法国哲学家勒内·笛卡尔的“身心二元论”。
                -- 笛卡尔认为人的身体是物理机器，而心灵/灵魂是独立于身体之外的非物质实体。
                -- 赖尔讽刺这种观点就像是“把幽灵装进了机器里”，认为这是一种范畴错误。
                -- 同时，日本知名动漫《攻壳机动队》（英文名 Ghost in the Shell）深受该概念启发。片中的 “Ghost” 指的是人类的意识、灵魂或心灵，而 “Shell” 则是指义体（机械身体）。
                name = "机中幽灵",
                text = {
                    "每次使用{C:solid_state}固态{}牌",
                    "生成一张随机{C:dark_edition}负片{}",
                    "{C:spectral}幻灵{}牌",
                },
            },
            j_abn_giacomo_king = {
                -- 原型来源于1956年的经典喜剧电影《宫廷小丑》（The Court Jester）
                -- 他在剧中极具代表性的台词与自我介绍称号就是
                -- "Giacomo, King of Jesters and Jester of Kings!"
                -- （“贾科莫：小丑中的王者，王者的小丑！”）。
                name = "贾科莫•小丑之王",
                text = {
                    "打出的{C:attention}11{}、{C:attention}12{}、{C:attention}13{}",
                    "和{C:attention}14{}的{C:diamonds}方块{}和{C:clubs}梅花{}",
                    "计分时给予{C:white,X:mult}^#1#{}倍率",
                    "{s:0.8}触发时翻转此小丑牌{}",
                }
            },
            j_abn_giacomo_hidden = {
                name = "贾科莫 隐藏恶徒",
                text = {
                    "打出的{C:attention}11{}、{C:attention}12{}、{C:attention}13{}",
                    "和{C:attention}14{}的{C:hearts}红桃{}和{C:spades}黑桃{}",
                    "计分时给予{C:white,X:mult}^#1#{}倍率",
                    "{s:0.8}触发时翻转此小丑牌{}",
                }
            },
            j_abn_gimbo = {
                name = "金宝",
                text = {
                    "{C:attention}2{}、{C:attention}3{}、",
                    "{C:attention}5{}或{C:attention}7{}计分时",
                    "这张小丑牌获得{C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                }
            },
            j_abn_glasgow_smile = {
                -- 指一种残忍的虐待或伤口形态，即用刀具或其他利器从受害者的嘴角向两边耳根处划开，使伤口愈合后在脸上留下一道看起来像是在咧嘴笑的恐怖疤痕。
                name = "格拉斯哥微笑",
                text = {
                    "在{C:attention}第一次{}和{C:attention}最后一次{}出牌中",
                    "打出的{C:spades}暗色花色{}牌",
                    "变为{C:dark_edition}幽冥{}和{C:attention}翻转{}",
                }
            },
            j_abn_glass_gold = {
                name = "玻璃黄金牌",
                text = {
                    {
                        "若打出的牌型同时包含{C:attention}玻璃{}牌",
                        "和{C:attention}黄金{}牌，它们各获得",
                        "{C:gold}+#1#{}晋升强度和{C:purple}+#2#{}计分",
                    },
                    {
                        "触发时，{C:enhanced}玻璃{} {C:attention}小丑牌{}获得",
                        "{X:mult,C:white}X#3#{}倍率，{C:enhanced}黄金{}",
                        "{C:attention}小丑牌{}获得{X:chips,C:white}X#4#{}筹码",
                    },
                    {
                        "选择{C:attention}大盲注{}时，生成",
                        "本局最后使用的{C:weather_report}天气报告{}牌",
                        "{C:inactive}当前：{C:weather_report}#5#{}",
                    },
                },
            },
            j_abn_glass_stone = {
                name = "玻璃石牌",
                text = {
                    {
                        "若打出的牌型同时包含{C:attention}石头{}牌",
                        "和{C:attention}玻璃{}牌，它们各获得",
                        "{C:gold}+#1#{}晋升强度和{C:purple}+#2#{}计分",
                    },
                    {
                        "触发时，{C:enhanced}石头{}{C:attention}小丑{}获得",
                        "{X:mult,C:white}X#3#{}倍率，{C:enhanced}玻璃{}",
                        "{C:attention}小丑牌{}获得{X:chips,C:white}X#4#{}筹码",
                    },
                    {
                        "选择{C:attention}大盲注{}时，生成",
                        "本局最后使用的{C:calligraphy}书法{}牌",
                        "{C:inactive}当前：{C:calligraphy}#5#{}",
                    },
                },
            },
            j_abn_globalist_joker = {
                name = "全球主义者",
                text = {
                    "使用{C:continent}大陆{}牌时，生成一个随机的{C:dark_edition}负片{}消耗牌",
                    "使用{C:attention}#4#{}张{C:continent}大陆{}牌后（{C:inactive}已用[#1#]{}），",
                    "在下一次打出的{C:attention}全谱{}牌型的每张",
                    "计分牌上放置一个{C:attention}印章{}",
                    "本局每使用过一种{C:attention}不同{}的{C:continent}大陆{}牌，",
                    "获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}当前：{X:mult,C:white}X#3#{} 倍率",
                },
            },
            j_abn_glossy_joker = {
                name = "亮光小丑",
                text = {
                    {
                        "{C:dark_edition}亮光{}版本计分时",
                        "获得{X:mult,C:white}X#1#{}倍率",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}亮光{}版本",
                        "{C:dark_edition}亮光{}牌计分时",
                        "获得{C:mult}+#3#{}倍率",
                        "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）",
                    }
                }
            },
            j_abn_gold_7 = {
                name = "黄金7",
                text = {
                    {
                        "打出的{C:attention}7{}计分时",
                        "变为{C:attention}黄金{}牌",
                    },
                    {
                        "打出的{C:attention}黄金{}牌计分时",
                        "给予其点数{C:attention}两倍{}的{C:mult}倍率{}",
                    },
                },
            },
            j_abn_gold_lucky = {
                name = "黄金幸运牌",
                text = {
                    {
                        "若打出的牌型同时包含{C:attention}黄金{}牌",
                        "和{C:attention}幸运{}牌，它们各获得",
                        "{C:gold}+#1#{}晋升强度和{C:purple}+#2#{}计分",
                    },
                    {
                        "触发时，{C:enhanced}黄金{} {C:attention}小丑牌{}获得",
                        "{X:mult,C:white}X#3#{}倍率，{C:enhanced}幸运{}",
                        "{C:attention}小丑牌{}获得{X:chips,C:white}X#4#{}筹码",
                    },
                    {
                        "选择{C:attention}大盲注{}时，生成",
                        "本局最后使用的{C:continent}大陆{}牌",
                        "{C:inactive}当前：{C:continent}#5#{}",
                    },
                },
            },
            j_abn_goldcartridge_joker = {
                name = "金卡带小丑",
                text = {
                    "售价低于这张小丑牌的小丑牌",
                    "给予{X:mult,C:white}X#1#{}倍率",
                    "回合结束时获得",
                    "{C:money}$#2#{}售价",
                }
            },
            j_abn_golden_apple = {
                name = "金苹果",
                text = {
                    {
                        "选择{C:attention}盲注{}时",
                        "移除所有{C:abn_perishable}易腐{}贴纸",
                    },
                    {
                        "{C:abn_eternal}永恒{}小丑牌可以售出",
                    }
                }
            },
            j_abn_goth_gabe = {
                -- 这个原型有点像G胖，但我不确定。
                -- Gabe Newell（“GabeN” / G胖，Valve 创始人）
                name = "哥特盖比",
                text = {
                    "如果打出的牌只包含{C:spades}暗色花色{}",
                    "这张小丑牌获得{X:red,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                }
            },
            j_abn_grampa_joker = {
                name = "爷爷小丑",
                text = {
                    "回合的{C:attention}最后一次出牌{}中",
                    "给第一张计分牌",
                    "添加{C:dark_edition}复古{}版本",
                }
            },
            j_abn_grapheme_joker = {
                name = "字素小丑",
                text = {
                    {
                        "给{C:attention}第一次{}计分的",
                        "{C:diamonds}光明花色{}牌添加{C:dark_edition}负片{}版本",
                    },
                    {
                        "每张计分的{C:dark_edition}负片{}",
                        "{C:diamonds}光明花色{}牌",
                        "这张小丑牌获得{C:chips}+#6#{}筹码和{C:mult}+#5#{}倍率",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}负片{}版本",
                        "每张打出的{C:dark_edition}负片{}牌获得{X:mult,C:white}X#4#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率，{C:mult}+#2#{C:inactive}倍率，{C:chips}+#3#{C:inactive}筹码）",
                    }
                }
            },
            j_abn_green_horn = {
                -- green（意为“新鲜的、未成熟的、新的”）和 horn（意为“角”）组合而成。
                -- 最初指刚长出角不久的幼年有角动物，或是指长着嫩角、未长成的动物。
                -- 大约在 1650 年左右，
                -- 这个词开始被用来比喻刚入伍的新兵（就像未成熟的幼兽）。
                -- 到 1680 年代，词义进一步扩大，泛指任何缺乏经验、刚接触某领域而显得生疏的人，并沿用至今
                name = "生瓜蛋子",
                text = {
                    "{C:white,X:mult}X#1#{}倍率",
                    "你不能打出你的",
                    "{C:attention}最高等级{}牌型",
                    "{C:inactive}（当前为{C:attention}#2#{C:inactive}）",
                }
            },
            j_abn_greygoo_joker = {
                name = "灰蛊小丑",
                text = {
                    "如果回合的{C:attention}第一次出牌{}",
                    "只有{C:abn_suitless}无色{}牌",
                    "向牌组中添加永久复制牌",
                    "并将其抽至{C:attention}手牌{}",
                }
            },
            j_abn_gris_gris_joker = {
                -- Gris-gris是一种起源于西非、在美洲新奥尔良地区发扬光大的巫术法器。它通常是一个装有草药、骨头、符咒或圣物的麻布/皮革小袋，被认为具有辟邪、招财、改变运势或施加诅咒的神秘力量。
                name = "格里格里",
                text = {
                    "{C:blue}蓝色{}和{C:purple}紫色{}{C:attention}蜡封{}",
                    "打出时可以{C:attention}激活{}",
                }
            },
            j_abn_gtp_joker = {
                name = "GTP小丑",
                text = {
                    "回合中每连续打出一手牌，",
                    "基础牌型的{C:mult}倍率{}和{C:chips}筹码{}",
                    "分别获得{X:mult,C:white}X#1#{}和{X:chips,C:white}X#2#{}，",
                    "{C:attention}高牌{}除外",
                },
            },
            j_abn_gtp_joker_after = {
                name = "GTP小丑",
                text = {
                    "回合中每连续打出一手牌，",
                    "基础牌型的{C:mult}倍率{}和{C:chips}筹码{}",
                    "分别获得{X:mult,C:white}X#1#{}和{X:chips,C:white}X#2#{}，",
                    "{C:attention}高牌{}除外",
                    "{C:inactive}(上一手牌：{C:attention}#3#{C:inactive})",
                },
            },
            j_abn_hammerspace_joker = {
                name = "异次元口袋",
                text = {
                    "{C:attention}+2{}个消耗牌槽位",
                    "击败{C:attention}Boss盲注{}时",
                    "如果{C:attention}持有{}一张{C:sigils}符印{}牌，获得{X:mult,C:white}X#5#{}倍率",
                    "如果{C:attention}持有{}一张{C:astro_cards}星座{}牌，获得{C:mult}+#6#{}倍率",
                    "如果{C:attention}持有{}一张{C:tarot}塔罗{}牌，获得{C:chips}+#8#{}筹码",
                    "如果{C:attention}持有{}一张{C:spectral}幻灵{}牌，获得{X:chips,C:white}X#7#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率，{C:mult}+#2#{C:inactive}倍率，{X:chips,C:white}X#3#{C:inactive}筹码，{C:chips}+#4#{C:inactive}筹码）",
                }
            },
            j_abn_hand_puppet = {
                -- 用手套在手上、通过手指活动来操纵的玩具或表演道具。
                name = "手偶",
                text = {
                    "手牌中带有{C:dark_edition}版本{}的牌",
                    "将其点数的{C:attention}两倍{}",
                    "作为{C:mult}倍率{}添加至这张小丑牌",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                }
            },
            j_abn_handbook_of_a_conman = {
                name = "骗徒手册",
                text = {
                    "所有牌型的{C:chips}筹码{}和{C:mult}倍率{}数值翻倍",
                    "{C:mult}削弱{}所有非{C:abn_plagued}瘟疫缠身{}小丑牌",
                }
            },
            j_abn_haphazard_joker = {
                name = "随意小丑",
                text = {
                    "增强的{C:attention}偶数{}牌给予{X:mult,C:white}X#4#{}倍率",
                    "每张计分牌提升{X:mult,C:white}X#3#{}倍率",
                    "{C:attention}偶数{}牌计分时",
                    "有{C:green}#1#/#2#{}几率生成{C:abn_hazard}险兆标签{}",
                }
            },
            j_abn_hard_and_dry = {
                name = "硬邦邦",
                text = {
                    "盲注{C:attention}隐藏{}",
                    "击败{C:attention}盲注{}时",
                    "{C:attention}最左侧{}小丑牌数值{C:attention}翻倍{}",
                }
            },
            j_abn_harlequin_joker = {
                -- 源自意大利即兴喜剧中的经典丑角
                name = "Harlequin（哈莉昆）",
                text = {
                    {
                        "如果{C:attention}第一张{}计分牌是{C:attention}偶数{}且",
                        "{C:attention}最后一张{}计分牌是{C:attention}奇数{}：",
                    },
                    {
                        "如果它们有相同的{C:enhanced}增强效果{}",
                        "生成一张{C:dark_edition}负片{} {C:sigils}符印{}牌",
                    },
                    {
                        "如果它们有相同的{C:dark_edition}版本{}",
                        "生成一张{C:dark_edition}负片{} {C:solid_state}固态{}牌",
                    },
                    {
                        "如果它们有相同的{C:attention}蜡封{}",
                        "生成一张{C:dark_edition}负片{} {C:lexica}辞典{}牌",
                    },
                },
            },
            j_abn_haunted_recording = {
                name = "闹鬼录音",
                text = {
                    "连续打出非{C:attention}#3#{}的游戏牌时",
                    "这张小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                },
            },
            j_abn_hawk = {
                name = "鹰",
                text = {
                    {
                        "{C:mult}摧毁{}第一张计分牌",
                    },
                    {
                        "如果它是{C:attention}偶数{}",
                        "所有计分牌获得{C:mult}+#5#{}倍率，这张牌获得{X:mult,C:white}X#3#{}倍率",
                    },
                    {
                        "如果它是{C:attention}奇数{}",
                        "所有计分牌获得{C:chips}+#6#{}筹码，这张牌获得{X:chips,C:white}X#4#{}筹码",
                    },
                    {
                        "如果{C:attention}获胜牌型{}同时包含{C:attention}奇数{}和{C:attention}偶数{}牌",
                        "提升所有计分牌的{C:planet}星球{} {C:attention}点数{}等级",
                    },
                    {
                        "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率，{X:chips,C:white}X#2#{C:inactive}筹码）",
                    }
                }
            },
            j_abn_hazard_cryptid = {
                name = "险兆神秘生物",
                text = {
                    "如果打出的牌包含",
                    "一张{C:abn_hazard}险兆{}牌和一张{C:dark_edition}未增强{}牌",
                    "这张小丑牌获得{C:mult}+#4#{}倍率",
                    "有{C:green}#1#/#2#{}几率{C:mult}摧毁{}",
                    "所有计分牌和这张小丑牌",
                    "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率）",
                }
            },
            j_abn_hd_joker = {
                name = "高清小丑",
                text = {
                    {
                        "没有{C:dark_edition}版本{}的{C:common}普通{}小丑牌",
                        "不会被{C:red}削弱{}或{C:red}摧毁{}",
                    },
                    {
                        "{C:uncommon}罕见{}和{C:rare}稀有{}小丑牌",
                        "不再出现在{C:green}商店{}中",
                    },
                },
            },
            j_abn_health_stickers = {
                name = "健康贴纸",
                text = {
                    "击败{C:attention}盲注{}时",
                    "给{C:attention}最左侧{}的小丑牌",
                    "放置一个随机{C:green}有益{} {C:abn_perishable}贴纸{}",
                }
            },
            j_abn_heart_of_glass = {
                name = "玻璃之心",
                text = {
                    "{C:attention}玻璃牌{}计分时给予{C:white,X:chips}X#1#{}筹码",
                    "并且总是{C:attention}碎裂{}",
                    "每摧毁一张{C:hearts}红桃{} {C:attention}玻璃牌{}",
                    "这张小丑牌获得{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码）",
                }
            },
            j_abn_hieroglyph = {
                name = "象形文字",
                text = {
                    "打出的{C:attention}未计分{}牌",
                    "变为{C:attention}化石牌{}",
                }
            },
            j_abn_holy_mountain = {
                name = "圣山",
                text = {
                    {
                        "{C:attention}#5#{}中第一张计分的{C:abn_snow}雪{}牌",
                        "获得{C:dark_edition}烈日灾祸{}",
                    },
                    {
                        "每张计分的{C:dark_edition}烈日灾祸{}牌",
                        "这张小丑牌获得{C:mult}+#4#{}倍率和{C:chips}+#2#{}筹码",
                        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#3#{C:inactive}筹码）",
                    },
                    {
                        "当非{C:dark_edition}负片{}的{C:weather_report}天气预报{}牌",
                        "被摧毁时，生成一张它的{C:dark_edition}负片{}复制牌",
                    }
                }
            },
            j_abn_housing_crisis = {
                name = "住房危机",
                text = {
                    {
                        "如果{C:attention}第一次{}出牌是{C:attention}#1#{}",
                        "由{C:attention}2{}张偶数和{C:attention}3{}张奇数牌组成",
                        "获得{C:gold}$#2#{}、{C:red}+#3#{}倍率和{C:blue}+#4#{}筹码",
                    },
                    {
                        "如果{C:attention}第二次{}出牌是{C:attention}#1#{}",
                        "由{C:attention}2{}张奇数和{C:attention}3{}张偶数牌组成",
                        "获得{C:gold}$#5#{}、{C:red}+#6#{}倍率和{C:blue}+#7#{}筹码",
                    },
                    {
                        "如果{C:attention}第三次{}出牌是{C:attention}#1#{}",
                        "由{C:attention}2{}张{C:diamonds}光明花色{}和{C:attention}3{}张{C:spades}暗色花色{}组成",
                        "{C:planet}提升{}该{C:attention}牌型{}等级",
                    },
                    {
                        "{C:inactive}（当前为{C:red}+#8#{C:inactive}倍率，{C:blue}+#9#{C:inactive}筹码）",
                    },
                },
            },
            j_abn_hunter_license = {
                name = "猎人执照",
                text = {
                    "购买时获得{C:money}$#1#{}",
                    "资金达到{C:money}$0{}时{C:mult}自毁{}",
                }
            },
            j_abn_hustler_joker = {
                name = "骗子小丑",
                text = {
                    "如果打出的牌包含",
                    "{C:abn_bow}弓{}和{C:abn_tie}和{}",
                    "获得{C:money}+$#1#{}、{C:chips}+#3#{}筹码",
                    "和{C:mult}+#2#{}倍率",
                }
            },
            j_abn_i_am_not_joker = {
                name = "我不是小丑",
                text = {
                    {
                        "击败{C:attention}Boss盲注{}时",
                        "{C:attention}最左侧{}的小丑牌变为{C:attention}翻转{}",
                    },
                    {
                        "{C:attention}翻转{}的小丑牌触发时",
                        "这张小丑牌获得{C:mult}+#2#{}倍率",
                        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                    },
                    {
                        "如果这张牌是{C:attention}翻转{}的",
                        "将第一张计分牌",
                        "转化为{C:attention}险兆牌{}",
                    },
                }
            },
            j_abn_ichor = {
                name = "灵液小丑",
                text = {
                    "带有{C:dark_edition}#2#{}版本的小丑牌",
                    "给予{C:white,X:mult}X#1#{}倍率",
                }
            },
            j_abn_id_staff = {
                name = "身份证",
                text = {
                    "{C:attention}人头牌{}被{C:mult}摧毁{}时",
                    "将手牌中{C:attention}最左侧{}的牌",
                    "增强为{C:attention}险兆{}牌",
                }
            },
            j_abn_identigram_joker = {
                name = "同形图小丑",
                text = {
                    {
                        "每张计分的{C:attention}奇数{}牌",
                        "与其它计分牌有不同{C:dark_edition}版本{}时",
                        "获得{X:red,C:white}X#1#{}倍率",
                    },
                    {
                        "每张计分的{C:attention}偶数{}牌",
                        "与其它计分牌有{C:attention}不同{} {C:dark_edition}版本{}时",
                        "获得{X:chips,C:white}X#2#{}筹码",
                        "{C:inactive}（当前为{X:red,C:white}X#3#{C:inactive}倍率，{X:blue,C:white}X#4#{C:inactive}筹码）",
                    }
                },
            },
            j_abn_ill_gotten_gains = {
                name = "不义之财",
                text = {
                    "计分的{C:abn_tie}和{}牌给予{C:money}$#1#{}",
                    "如果计分的{C:abn_tie}和{}牌带有{C:attention}增强效果{}",
                    "则给予{C:money}$#2#{}",
                }
            },
            j_abn_illegal_ante = {
                name = "非法底注",
                text = {
                    "{C:attention}偶数{}底注时所有{C:green}概率{}翻倍",
                    "{C:attention}奇数{}底注时获得的所有{C:money}资金{}翻倍",
                }
            },
            j_abn_immolation_joker = {
                name = "献祭小丑",
                text = {
                    "{C:attention}油田火{}牌触发时",
                    "不会被{C:mult}摧毁{}",
                }
            },
            j_abn_improved_joker = {
                name = "改良小丑牌",
                text = {
                    {
                        "若{C:attention}计分牌型{}恰好包含",
                        "{C:attention}5{}张牌，则{C:attention}计分前{}",
                        "获得{X:mult,C:white}X#1#{}倍率",
                    },
                    {
                        "若拥有{C:attention}小丑牌{}，",
                        "则计分牌给予",
                        "{C:gold}+#2#{}晋升强度",
                    },
                },
            },
            j_abn_inescapable_encounter = {
                -- 在经典RPG中，遭遇Boss战或剧情关键战斗时，系统会弹出 “Inescapable Encounter / You can't run away!”（无法逃脱的遭遇战 / 无法逃跑）
                -- 卡面美术里的Boss是‘疯狂小丑’
                name = "不可避免的遭遇",
                text = {
                    "计分牌获得等同于",
                    "其{C:attention}点数{}的{C:chips}筹码{}",
                    "{C:mult}跳过{}被禁用",
                }
            },
            j_abn_inferno_comedian = {
                name = "地狱•喜剧演员",
                text = {
                    {
                        "计分牌给予{C:white,X:mult}X#1#{}倍率",
                    },
                    {
                        "如果分数{C:attention}着火{}",
                        "给随机小丑牌添加{C:dark_edition}烈日灾祸{}版本",
                        "并将手牌中所有牌增强为",
                        "{C:dark_edition}烈日灾祸{} {C:attention}油田火{}牌",
                    },
                    {
                        "{C:attention}油田火{}牌给予{C:white,X:mult}X#1#{}倍率",
                        "{C:attention}油田火{}牌保留其{C:attention}点数{}",
                        "被{C:mult}摧毁{}时获得等同于其{C:attention}点数{}的{C:mult}倍率{}",
                        "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）",
                    }
                }
            },
            j_abn_ink_depleted_joker = {
                name = "墨水耗尽",
                text = {
                    "如果回合的{C:attention}第一次出牌{}是{C:attention}葫芦{}",
                    "给计分的{C:diamonds}光明花色{}牌",
                    "添加{C:dark_edition}闪箔{}和{C:abn_orange_seal}橙色蜡封{}",
                    "给计分的{C:spades}暗色花色{}牌",
                    "添加{C:dark_edition}闪箔{}和{C:abn_pink_seal}粉色蜡封{}",
                },
            },
            j_abn_inkblot_test = {
                name = "墨迹测验",
                text = {
                    {
                        "迫使{C:attention}点数最低{}的牌",
                        "总是被选中",
                    },
                    {
                        "{C:attention}强制选中{}的牌",
                        "总是计分",
                    }
                }
            },
            j_abn_insolvent_comedian = {
                name = "破产•喜剧演员",
                text = {
                    "如果打出的牌与",
                    "上一回合的{C:attention}最后一次牌型{}相同",
                    "所有小丑牌获得{C:chips}+#1#{}筹码和{C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:attention}#4#{C:inactive}）",
                }
            },
            j_abn_insomniac_joker = {
                name = "失眠症小丑",
                text = {
                    "每次使用{C:planet}星球{}牌时",
                    "这张小丑牌获得",
                    "{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                }
            },
            j_abn_intergalactic_joker = {
                name = "星际小丑牌",
                text = {
                    "持有与牌型对应的{C:planet}星球牌{}时，",
                    "打出的牌型中所有牌型的",
                    "晋升强度{C:gold}+#1#{}",
                },
            },
            j_abn_interminable_joker = {
                name = "无尽小丑",
                text = {
                    "如果你有{C:attention}6{}张或以上{C:attention}小丑牌{}",
                    "每张给予{X:mult,C:white}X#1#{}倍率",
                }
            },
            j_abn_inventory_joker = {
                -- Minecraft的UI和美术风格。
                name = "物品栏小丑",
                text = {
                    "选择{C:attention}盲注{}时",
                    "每{C:attention}持有{}一张消耗牌",
                    "获得{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                },
            },
            j_abn_invisible_ink_joker = {
                name = "隐形墨水小丑",
                text = {
                    {
                        "计分的{C:attention}幸运{}牌中每有一种不同{C:attention}花色{}",
                        "这张小丑牌获得{C:mult}+#3#{}倍率",
                        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{X:chips,C:white}X#2#{C:inactive}筹码）",
                    },
                    {
                        "如果打出的牌包含{C:attention}光谱{}",
                        "且只含{C:attention}幸运{}牌",
                        "每张获得{X:chips,C:white}X#4#{}筹码",
                    },
                }
            },
            j_abn_ironworks = {
                name = "铁厂",
                text = {
                    {
                        "{C:attention}完整牌组{}中每有一张",
                        "{C:attention}烙铁牌{}",
                        "给予{X:mult,C:white}X#3#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#4#{C:inactive}倍率）",
                    },
                    {
                        "{C:attention}完整牌组{}中每有一张",
                        "{C:attention}钢铁牌{}",
                        "给予{X:chips,C:white}X#1#{}筹码",
                        "{C:inactive}（当前为{X:chips,C:white}X#2#{C:inactive}筹码）",
                    }
                }
            },
            j_abn_ishihara_joker = {
                name = "Ishihara小丑", -- 专有名词
                text = {
                    "计分的{C:dark_edition}负片{} {C:diamonds}光明花色{}牌",
                    "获得等同于其{C:attention}点数{}的{C:chips}筹码{}",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                },
            },
            j_abn_isocromatic_joker = {
                name = "等色小丑",
                text = {
                    "计分的{C:dark_edition}闪箔{}牌获得{C:attention}+#2#{}次重新触发",
                    "计分的{C:dark_edition}镭射{}牌",
                    "{C:planet}星球{} {C:attention}点数{}提升{C:attention}#3#{}级",
                    "计分的{C:dark_edition}多彩{}牌获得{C:chips}+#1#{}筹码",
                }
            },
            j_abn_j_for_joker = {
                name = "J代表小丑",
                text = {
                    "如果小丑牌槽位{C:attention}已满{}",
                    "则获得{X:mult,C:white}X#1#{}倍率",
                },
            },
            j_abn_j_jimbob = {
                name = "J·金宝",
                text = {
                    {
                        "计分的{C:attention}石头{}、{C:attention}玻璃{}、{C:attention}幸运{}",
                        "和{C:attention}倍率{}牌给予{X:chips,C:white}X#2#{}筹码",
                    },
                    {
                        "计分的{C:attention}钢铁{}、{C:attention}奖励{}、{C:attention}黄金{}",
                        "和{C:attention}万能{}牌给予{X:mult,C:white}X#1#{}倍率",
                    }
                }
            },
            j_abn_jack_of_all_trades = {
                name = "万金油",
                text = {
                    {
                        "本赛局弃掉的非{C:attention}#3#{}牌",
                        "每有一种不同{C:attention}花色{}的{C:attention}#3#{}",
                        "打出且{C:attention}不计分{}时",
                        "给予{C:white,X:mult}X#1#{}倍率",
                        "{C:inactive}（将给予{C:white,X:mult}X#4#{C:inactive}）",
                    },
                    {
                        "如果打出的牌不包含{C:attention}#3#{}",
                        "计分后{C:red,E:1}自毁{}",
                    }
                }
            },
            j_abn_jakdos = {
                -- 原型疑似来自于集换式卡牌游戏《万智牌》中的著名公会——拉铎司狂欢会（Cult of Rakdos）
                name = "杰克多斯",
                text = {
                    "{X:mult,C:white}X#1#{}倍率",
                    "没有{C:dark_edition}幽冥{}的计分牌",
                    "被{C:mult}削弱{}",
                }
            },
            j_abn_jamie = {
                name = "杰米",
                text = {
                    "提升打出的",
                    "{C:attention}牌型{}等级",
                }
            },
            j_abn_jenga_joker = {
                name = "叠叠乐小丑",
                text = {
                    {
                        "这张小丑牌被{C:red}摧毁{}时",
                        "生成一张复制牌并额外获得{X:mult,C:white}X#2#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                    },
                    {
                        "如果得分超过盲注需求的{C:attention}两倍{}",
                        "则{C:red}自毁{}",
                    }
                }
            },
            j_abn_jennia = {
                name = "詹尼亚",
                text = {
                    {
                        "计分的{C:abn_rose}玫瑰{}牌给予{X:chips,C:white}X#1#{}筹码",
                        "每当{C:abn_rose}玫瑰{}计分时提升{X:chips,C:white}X#2#{}筹码",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "计分的{C:abn_rose}玫瑰{}牌永久获得",
                        "本盲注中每张{C:abn_rose}玫瑰{}牌{C:mult}+#3#{}倍率",
                    }
                }
            },
            j_abn_jenson = {
                -- 没有找到原型
                name = "詹森",
                text = {
                    {
                        "计分的{C:abn_suitless}无色{}牌给予{X:mult,C:white}X#1#{}倍率",
                        "每当{C:abn_suitless}无色{}计分时提升{X:mult,C:white}X#2#{}倍率",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "打出的{C:abn_suitless}无色{}牌计分时",
                        "每剩余一次出牌永久获得{C:mult}+#3#{}倍率",
                    }
                }
            },
            j_abn_jerry_jester = {
                -- 这个原型疑似美国传奇嬉皮士/迷幻摇滚乐队感恩至死（Grateful Dead）的主唱兼吉他手 杰里·加西亚（Jerry Garcia）
                -- 美术结合了该乐队最具代表性的小丑（Jester）吉祥物与大麻/嬉皮文化
                name = "杰瑞",
                text = {
                    {
                        "计分的{C:abn_leaf}叶{}牌给予{X:mult,C:white}X#1#{}倍率",
                        "每当{C:abn_leaf}叶{}计分时提升{X:mult,C:white}X#2#{}倍率",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "手牌中所有{C:attention}持有{}的牌",
                        "当{C:abn_leaf}叶{}计分时获得等同于最高叶牌点数的{C:chips}筹码{}",
                    }
                }
            },
            j_abn_jester_vs_jester = {
                -- 原型和视觉灵感来自于动漫作品《JOJO的奇妙冒险》
                -- 中的经典画风与宿命对决梗（特别是空条承太郎 VS DIO 的对峙名场面）
                name = "小丑对小丑",
                text = {
                    {
                        "如果拥有{C:attention}偶数{}张（稀有度）小丑牌",
                        "计分的{C:attention}偶数{}牌给予奖励1",
                        "如果拥有{C:attention}奇数{}张（稀有度）小丑牌",
                        "计分的{C:attention}奇数{}牌给予奖励2",
                    },
                    {
                        "{C:inactive,s:0.8}（例：稀有度：奖励1或奖励2）",
                        "{C:common}普通{}：{C:chips}+#1#{}或{C:chips}+#2#{}筹码",
                        "{C:uncommon}罕见{}：{X:mult,C:white}X#3#{}或{X:mult,C:white}X#4#{}倍率",
                        "{C:rare}稀有{}：{X:chips,C:white}X#5#{}或{X:chips,C:white}X#6#{}筹码",
                    },
                },
            },
            j_abn_jevil = {
                name = "Spare Bikini",
                text = {
                    "打出任意{C:blue}牌型{}即可！",
                    "{E:1,s:0.8,C:purple}\"我什么都能做到！\"",
                },
            },
            j_abn_jfool = {
                name = "J·愚者",
                text = {
                    {
                        "打出的{C:attention}奇数{}牌给予等同于",
                        "打出奇数牌数量的{C:white,X:mult}倍乘倍率{}",
                    },
                    {
                        "打出的{C:attention}偶数{}牌给予等同于",
                        "打出偶数牌数量的{C:white,X:mult}倍乘倍率{}",
                    },
                }
            },
            j_abn_jimbo = {
                name = "金宝本尊",
                text = {
                    {
                        "计分的{C:hearts}红桃{}牌给予{X:mult,C:white}X#1#{}倍率",
                        "每当{C:hearts}红桃{}计分时提升{X:mult,C:white}X#2#{}倍率",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}（金宝）",
                        "{C:hearts}红桃{}牌在计分前永久获得{C:mult}+#3#{}倍率",
                    }
                }
            },
            j_abn_jimbo_10 = {
                name = "金宝10",
                text = {
                    {
                        "当{C:attention}10{}计分时",
                        "这张小丑牌获得{C:chips}+#4#{}筹码",
                        "和{C:white,X:mult}X#2#{}倍率",
                        "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码，{X:mult,C:white}X#1#{C:inactive}倍率）",
                    },
                    {
                        "回合结束时{C:attention}完整牌组{}中",
                        "每有一张{C:attention}10{}",
                        "获得{C:money}$#5#{}",
                        "{C:inactive}（当前为{C:money}$#6#{C:inactive}）",
                    }
                }
            },
            j_abn_jimbo_inscryption = {
                -- 卡面美术源自暗黑卡牌解谜游戏《邪恶冥刻》（Inscryption）
                name = "金宝·邪恶铭刻",
                text = {
                    "手牌中每张{C:attention}9{}和{C:attention}3{}",
                    "给予{C:white,X:mult}X#1#{}倍率",
                }
            },
            j_abn_jimbos_love_letter = {
                name = "金宝的情书",
                text = {
                    "手牌中的{C:hearts}红桃{}牌可在计分时计数",
                    "每回合一次，如果打出的牌",
                    "包含{C:attention}同花{}的{C:hearts}红桃{}",
                    "提升所有计分牌的{C:planet}星球{} {C:attention}点数{}等级",
                }
            },
            j_abn_jinxie = {
                name = "金克西",
                text = {
                    {
                        "计分的{C:abn_rose}玫瑰{}牌给予{X:mult,C:white}X#1#{}倍率",
                        "每当{C:abn_rose}玫瑰{}计分时提升{X:mult,C:white}X#2#{}倍率",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "计分的{C:abn_rose}玫瑰{}牌永久获得",
                        "本盲注中每张{C:abn_rose}玫瑰{}牌{C:mult}+#3#{}倍率",
                    }
                }
            },
            j_abn_joe_kert = {
                -- 名字谐音梗， “Joe Kert”在英语里直接快速连读，发音与“Joker”（小丑）完全一致。
                -- 此外，在英文文化中，“Joe”经常被用来指代最基层的普通人/平民
                name = "乔·科特",
                text = {
                    "计分的{C:attention}未增强{}牌",
                    "给予{C:mult}+#1#{}倍率",
                },
            },
            j_abn_joerror = {
                name = "Joeerror",
                text = {
                    "每张小丑牌给予{X:mult,C:white}X#1#{}倍率",
                    "{C:red,E:1}计分后自毁{}",
                    "{C:inactive}名字为joker+error取一半拼接而来{}",
                }
            },
            j_abn_joker_ai = {
                name = "AI小丑",
                text = {
                    {
                        "迫使{C:attention}1{}张牌",
                        "总是被选中",
                    },
                    {
                        "{C:attention}强制选中{}的牌",
                        "计分时永久获得",
                        "{C:chips}+#1#{}筹码和",
                        "{C:mult}+#2#{}倍率",
                    }
                }
            },
            j_abn_joker_besties = {
                name = "小丑好基友",
                text = {
                    {
                        "带有版本1的小丑牌或游戏牌效果触发时",
                        "变为版本2",
                        "改变{C:dark_edition}版本{}时",
                        "小丑牌或游戏牌获得{C:chips}+#1#{}筹码",
                    },
                    {
                        "{C:inactive}（例：版本1 -> 版本2）",
                        "{C:dark_edition}闪箔{} -> {C:dark_edition}镭射{}",
                        "{C:dark_edition}镭射{} -> {C:dark_edition}多彩{}",
                        "{C:dark_edition}多彩{} -> {C:dark_edition}幻彩{}",
                    }
                },
            },
            j_abn_joker_blast = {
                -- 日系格斗游戏中的“气功波/能量弹（Ki Blast）”攻击招式
                name = "小丑冲击波",
                text = {
                    "仅用{C:attention}一次{}出牌连续",
                    "击败{C:attention}盲注{}时",
                    "这张小丑牌获得{C:chips}+#1#{}筹码和{C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码，{C:mult}+#4#{C:inactive}倍率）",
                },
            },
            j_abn_joker_collector = {
                name = "小丑收藏家",
                text = {
                    "本赛局每购买一张不同的小丑牌",
                    "这张小丑牌获得{C:chips}+#1#{}筹码",
                    "如果购买{C:attention}10{}张或以上小丑牌",
                    "给予{C:white,X:mult}X#3#{}倍率",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）",
                }
            },
            j_abn_joker_deck = {
                name = "小丑牌组",
                text = {
                    "剩余牌组中每有一张{C:attention}偶数{}牌",
                    "给予{C:mult}+#2#{}倍率，每有一张",
                    "{C:attention}奇数{}牌给予{C:chips}+#1#{}筹码",
                    "{C:inactive}(当前 {C:mult}+#3#{C:inactive} 倍率 & {C:chips}+#4#{C:inactive} 筹码)",
                },
            },
            j_abn_joker_ena = {
                name = "小丑ENA",
                text = {
                    {
                        "打出带有{C:attention}原版{}花色和",
                        "{C:attention}模组增强{}的牌，计分时给予",
                        "{X:mult,C:white}X#1#{}倍率",
                    },
                    {
                        "计分手牌中每有一种{C:attention}不同{}的",
                        "{C:attention}模组{C:enhanced}增强{}，这张小丑牌获得",
                        "{C:mult}+#3#{}倍率",
                        "{C:inactive}(当前 {C:mult}+#2#{C:inactive} 倍率)",
                    },
                },
            },
            j_abn_joker_family = {
                name = "小丑家族",
                text = {
                    "如果你拥有{C:common}普通{}、{C:uncommon}罕见{}、",
                    "{C:rare}稀有{}和{C:attention}喜剧演员{}小丑牌",
                    "降低{C:attention}盲注需求{} {C:attention}50%{}",
                    "你拥有的{C:attention}小丑牌{}中",
                    "每有一种{C:attention}不同稀有度{}获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                }
            },
            j_abn_joker_forge = {
                -- joker forge是小丑牌社区的一个用于快速制作模组的项目，
                -- 其简单的图形化操作界面让很多小丑牌爱好者
                -- 能够低门槛地制作出自己的模组
                name = "小丑工坊",
                text = {
                    "计分牌将所有当前小丑牌的",
                    "{C:attention}售价{}总和作为",
                    "{C:mult}倍率{}",
                    "{C:inactive}(当前 {C:mult}+#1#{} 倍率)",
                },
            },
            j_abn_joker_form = {
                -- 卡面美术源自卡牌肉鸽游戏《杀戮尖塔》（Slay the Spire）中的各种职业对应的“形态”卡牌，
                -- 比如 “恶魔形态”
                name = "小丑形态",
                text = {
                    "每张打出的{C:attention}8{}或{C:attention}2",
                    "计分时给予{C:chips}+#1#{}筹码和",
                    "{C:mult}+#2#{}倍率",
                },
            },
            j_abn_joker_in_hiding = {
                name = "藏匿小丑",
                text = {
                    {
                        "从{C:attention}补充包{}中选择的{C:attention}小丑牌{}",
                        "添加{C:attention}翻转{}和{C:dark_edition}镭射{}版本",
                    },
                    {
                        "{C:attention}翻转{}的小丑牌和游戏牌",
                        "每张给予{C:money}$#1#{}",
                    },
                }
            },
            j_abn_joker_invoice = {
                name = "小丑发票",
                text = {
                    "如果出牌时资金",
                    "不多于{C:money}$#2#{}",
                    "获得{C:mult}+#1#{}倍率",
                }
            },
            j_abn_joker_midnight = {
                name = "午夜小丑",
                text = {
                    {
                        "削弱所有{C:diamonds}光明花色{}",
                    },
                    {
                        "选择{C:attention}盲注{}时",
                        "给最左侧小丑牌",
                        "添加{C:dark_edition}#3#{}版本",
                    },
                    {
                        "每有一张",
                        "带有{C:dark_edition}#3#{}版本的小丑牌或游戏牌",
                        "就给予{C:mult}+#1#{}倍率",
                        "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）",
                    }
                }
            },
            j_abn_joker_note = {
                name = "小丑笔记",
                text = {
                    {
                        "每张计分的带有{C:attention}蜡封{}的牌",
                        "这张小丑牌：",
                        "如果牌是{C:attention}偶数{}，获得{C:red}+#1#{}倍率",
                        "如果牌是{C:attention}奇数{}，获得{C:blue}+#2#{}筹码",
                        "{C:inactive}（当前为{C:red}+#3#{C:inactive}倍率，{C:blue}+#4#{C:inactive}筹码）",
                    },
                }
            },
            j_abn_joker_of_destruction = {
                -- 原型来自于动漫《龙珠超》（Dragon Ball Super）中的“破坏神（God of Destruction）”（如比鲁斯 Beerus 等），并结合了其标志性神技“破坏（Hakai）”
                name = "破坏小丑",
                text = {
                    "如果回合的{C:attention}第一次出牌{}",
                    "有{C:attention}4{}张牌，将其摧毁并",
                    "生成一张{C:dark_edition}召唤{} {C:spectral}幻灵{}牌",
                }
            },
            j_abn_joker_of_the_week = {
                name = "工作日小丑",
                text = {
                    "以{C:attention}奇数{}张小丑牌",
                    "击败{C:attention}盲注{}时",
                    "这张小丑牌获得{C:white,X:mult}X#2#{}倍率",
                    "否则获得{C:white,X:chips}X#4#{}筹码",
                    "{C:inactive}（当前为{C:white,X:mult}X#1#{C:inactive}倍率，{C:white,X:chips}X#3#{C:inactive}筹码）",
                }
            },
            j_abn_joker_of_the_weekend = {
                name = "周末小丑",
                text = {
                    "击败{C:attention}奇数{}盲注时",
                    "这张小丑牌获得{C:white,X:mult}X#2#{}倍率",
                    "击败{C:attention}偶数{}盲注时",
                    "这张小丑牌获得{C:white,X:chips}X#4#{}筹码",
                    "{C:inactive}（当前为{C:white,X:mult}X#1#{C:inactive}倍率，{C:white,X:chips}X#3#{C:inactive}筹码）",
                }
            },
            j_abn_joker_once_again = {
                -- 幻灵牌《Déjà Vu》（既视感）的小丑牌版本
                name = "既视感小丑",
                text = {
                    "给第一张计分的{C:attention}牌{}",
                    "添加{C:abn_white_seal}白色蜡封{}",
                },
            },
            j_abn_joker_rave = {
                name = "小丑狂欢",
                text = {
                    {
                        "选择{C:attention}盲注{}时",
                        "翻转所有没有版本的小丑牌和游戏牌",
                    },
                    {
                        "{C:attention}翻转{}牌计分时",
                        "这张小丑牌获得{C:chips}+#2#{}筹码",
                        "{C:attention}翻转{}小丑牌触发时",
                        "获得{C:mult}+#4#{}倍率",
                        "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码，{C:mult}+#3#{C:inactive}倍率）",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}版本{}",
                        "重新触发所有打出的",
                        "{C:attention}翻转{}牌",
                    }
                }
            },
            j_abn_joker_reloaded = {
                name = "重装小丑",
                text = {
                    "回合结束时",
                    "持有的{C:attention}消耗牌{}中每有一种",
                    "不同{C:dark_edition}版本{}",
                    "所有小丑牌获得{C:mult}+#1#{}倍率和{C:chips}+#2#{}筹码",
                },
            },
            j_abn_joker_republic = {
                name = "小丑共和国",
                text = {
                    {
                        "选择{C:attention}大盲注{}时",
                        "生成一张{C:continent}大陆{}牌",
                        "{C:inactive}（必须有空位）",
                    },
                    {
                        "使用{C:continent}大陆{}牌时",
                        "提升第一张计分牌的点数等级",
                    }
                }
            },
            j_abn_joker_scroll = {
                name = "小丑卷轴",
                text = {
                    {
                        "如果拥有{C:attention}偶数{}张相同{C:money}售价{}的小丑牌",
                        "给{C:attention}葫芦{}中计分的{C:attention}偶数{}张牌",
                        "添加{C:dark_edition}复古{}版本",
                    },
                    {
                        "如果拥有{C:attention}奇数{}张相同{C:money}售价{}的小丑牌",
                        "给{C:attention}葫芦{}中计分的{C:attention}奇数{}张牌",
                        "添加{C:dark_edition}复古{}版本",
                    },
                    {
                        "如果这张牌带有{C:dark_edition}荒废{}版本",
                        "每张计分的{C:dark_edition}复古{}牌",
                        "获得{X:mult,C:white}X#2#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                    },
                }
            },
            j_abn_joker_tile = {
                name = "小丑瓷砖",
                text = {
                    "连续打出计分牌数量与持有小丑牌数量{C:attention}相等{}的手牌时",
                    "每手牌获得{X:chips,C:white}X#2#{}筹码",
                    "{C:inactive}当前为：{X:chips,C:white}X#1#{C:inactive}筹码",
                }
            },
            j_abn_joker_totebag = {
                name = "小丑手提袋",
                text = {
                    {
                        "选择{C:attention}盲注{}时",
                        "每张同名的消耗牌",
                        "获得{C:mult}+#2#{}倍率和{C:chips}+#1#{}筹码",
                    },
                    {
                        "如果每张消耗牌都有",
                        "{C:attention}不同{} {C:dark_edition}版本{}",
                        "这张小丑牌的{C:chips}筹码{}和{C:mult}倍率{}翻倍",
                        "{C:inactive}（当前为{C:mult}+#4#{C:inactive}倍率，{C:chips}+#3#{C:inactive}筹码）",
                    },
                },
            },
            j_abn_joker_tv = {
                name = "小丑电视",
                text = {
                    {
                        "使用{C:program_pack}程序{}牌时",
                        "给所有{C:attention}小丑牌{}添加{C:money}$#1#{}售价",
                        "{C:diamonds}光明花色{}牌永久获得{C:mult}+#2#{}倍率",
                    },
                    {
                        "使用{C:planet}点数星球{}牌时",
                        "所有{C:spades}暗色花色{}牌永久获得{C:mult}+#2#{}倍率",
                    }
                }
            },
            j_abn_joker_unlimited = {
                name = "无限小丑",
                text = {
                    {
                        "{C:attention}Boss盲注{}期间",
                        "每次出牌",
                        "这张小丑牌获得{X:red,C:white}X#1#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
                    },
                    {
                        "击败{C:attention}Boss盲注{}时",
                        "{C:attention}复制{}",
                        "{C:attention}完整牌组{}中的所有牌",
                    }
                },
            },
            j_abn_jokerge = {
                -- 这个名字融合了梗，保留原名。
                -- 卡面美术则来自于Discord社区的一张表情包
                -- 参见：https://discord.com/channels/1116389027176787968/1153815324643299458/1222929187250114660
                name = "Jokerge",
                text = {
                    "{C:attention}翻倍{}所有小丑牌数值",
                }
            },
            j_abn_jokerian_dogma = {
                name = "小丑教条",
                text = {
                    "打出带有{C:attention}模组{C:dark_edition}版本{}的",
                    "{C:attention}增强{}牌，计分时给予",
                    "{C:gold}+#1#{}晋升强度",
                },
            },
            j_abn_jokers_mixtape_grey = {
                name = "小丑混音带",
                text = {
                    "每拥有一张{C:attention}小丑牌{}获得{C:chips}+10{}筹码",
                    "{s:0.8}特定版本会改变效果",
                }
            },
            j_abn_jokers_mixtape_black = {
                name = "小丑混音带",
                text = {
                    "每拥有一张小丑牌获得{C:white,X:mult}X1{}倍率",
                    "{s:0.8}特定版本会改变效果",
                }
            },
            j_abn_jokers_mixtape_red = {
                name = "小丑混音带",
                text = {
                    "重新触发所有小丑牌",
                    "{s:0.8}特定版本会改变效果",
                }
            },
            j_abn_jokers_mixtape_blue = {
                name = "小丑混音带",
                text = {
                    "{C:white,X:chips}X3{}筹码",
                    "{s:0.8}特定版本会改变效果",
                }
            },
            j_abn_jokers_mixtape_yellow = {
                name = "小丑混音带",
                text = {
                    "给予等同于计分牌数量的倍乘倍率",
                    "{s:0.8}特定版本会改变效果",
                }
            },
            j_abn_jokertopia = {
                name = "小丑乌托邦",
                text = {
                    {
                        "所有{C:continent}大陆{}牌{C:attention}免费{}",
                    },
                    {
                        "如果{C:attention}持有{}一张{C:continent}大陆{}牌",
                        "{C:attention}#2#{}中每有一种不同计分花色",
                        "所有小丑牌获得{C:mult}+#1#{}倍率",
                    }
                }
            },
            j_abn_jokester = {
                name = "玩笑者",
                text = {
                    {
                        "{s:0.8}计分的{C:hearts,s:0.8}红桃{s:0.8}变为{C:abn_snow,s:0.8}雪{}",
                        "{s:0.8}计分的{C:spades,s:0.8}黑桃{s:0.8}变为{C:abn_bow,s:0.8}弓{}",
                        "{s:0.8}计分的{C:diamonds,s:0.8}方块{s:0.8}变为{C:abn_tie,s:0.8}和{}",
                        "{s:0.8}计分的{C:clubs,s:0.8}梅花{s:0.8}变为{C:abn_penumbra,s:0.8}半影{}",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}胶棉{}版本",
                        "花色改变时获得{C:mult}+#2#{}倍率",
                        "和{C:money}$#2#{}售价",
                        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                    },
                }
            },
            j_abn_jolly_roger = {
                name = "海盗旗",
                text = {
                    "从{C:attention}补充包{}中选择{C:attention}消耗牌{}时",
                    "可以多选{C:attention}1{}张牌",
                    "{C:money}售出{}消耗牌产生不同效果：",
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
                name = "快乐体素小丑",
                text = {
                    "如果{C:attention}牌型{}是{C:attention}#2#{}",
                    "获得{X:chips,C:white}X#1#{}筹码",
                }
            },
            j_abn_jorg = {
                -- 不会翻
                name = "Jorg",
                text = {
                    "{C:mult}弃掉{}的牌在{C:attention}下一次{}出牌中",
                    "给予{X:mult,C:white}X#1#{}倍率",
                }
            },
            j_abn_jorick = {
                name = "约里克",
                text = {
                    "剩余{C:attention}0{}次弃牌时",
                    "获得{X:mult,C:white}X#1#{}倍率和{X:chips,C:white}X#2#{}筹码",
                },
            },
            j_abn_july_jester = {
                name = "七月小丑",
                text = {
                    {
                        "计分的{C:abn_suitless}无色{}牌给予{X:chips,C:white}X#1#{}筹码",
                        "每当{C:abn_suitless}无色{}计分时提升{X:chips,C:white}X#2#{}筹码",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "打出的{C:abn_suitless}无色{}牌计分时",
                        "每剩余一次出牌永久获得{C:money}$#3#{}",
                    }
                }
            },
            j_abn_jurian = {
                name = "Jurian",
                text = {
                    "{C:mult}弃掉{}的牌在{C:attention}下一次{}出牌中",
                    "给予{X:chips,C:white}X#1#{}筹码",
                }
            },
            j_abn_kefka = {
                -- 原型来自于《最终幻想6》（Final Fantasy VI）的超级反派凯夫卡·帕拉佐（Kefka Palazzo）
                name = "凯夫卡",
                text = {
                    {
                        "计分的{C:diamonds}光明花色{}牌给予{X:mult,C:white}X#1#{}倍率",
                        "每当{C:diamonds}光明花色{}计分时提升{X:mult,C:white}X#2#{}倍率",
                    },
                    {
                        "回合的{C:attention}获胜牌型{}中",
                        "提升所有计分牌对应的点数{C:planet}星球牌{}{C:attention}等级{}",
                    }
                }
            },
            j_abn_khonsu_joker = {
                name = "孔苏",
                text = {
                    "若你的第一次出牌是包含{C:diamonds}光{}和",
                    "{C:spades}暗{}花色的{C:attention}对子{}，则计分牌",
                    "分别获得{C:money}明亮{}和{C:dark_edition}暗沉{}版本",
                    "若孔苏小丑牌本身带有{C:money}明亮{}或",
                    "{C:dark_edition}暗沉{}版本，则花色匹配的",
                    "{C:diamonds}光{}或{C:spades}暗{}计分牌",
                    "还会给予其{C:attention}点数{}两倍的{C:mult}倍率{}",
                },
            },
            j_abn_kiki_joker = {
                name = "琪琪小丑",
                text = {
                    {
                        "每有一张计分的{C:attention}偶数{}牌，",
                        "这张小丑牌获得{C:mult}+#2#{}倍率",
                    },
                    {
                        "击败{C:attention}Boss盲注{}时，每持有一张",
                        "{C:lexica}辞典{}牌，再增加{C:mult}+#3#{}倍率",
                        "{C:inactive}(当前 {C:mult}+#1#{} 倍率)",
                    },
                },
            },
            j_abn_king_of_games = {
                -- 原型来自于日本漫画家高桥和希创作的漫画《游戏王》（Yu-Gi-Oh!），
                -- 该漫画自1996年起在集英社的《周刊少年Jump》上连载，后被改编为动画、电影、卡牌游戏等多种形式。
                -- 漫画讲述了主人公武藤游戏与各种对手进行卡牌决斗的故事。
                -- 卡面美术中是其一代主角法老王（Yami Yugi / Pharaoh Atem）
                name = "游戏王",
                text = {
                    "每{C:attention}底注{}一次，生成一张",
                    "拥有选定{C:attention}点数{}、{C:attention}花色{}和{C:dark_edition}增强效果{}的牌",
                    "将其加入手牌",
                }
            },
            j_abn_klyde_clown = {
                name = "克莱德",
                text = {
                    {
                        "计分的{C:abn_coin}币{}牌给予{X:mult,C:white}X#1#{}倍率",
                        "每当{C:abn_coin}币{}计分时提升{X:mult,C:white}X#2#{}倍率",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "打出的每张{C:abn_coin}币{}牌计分时",
                        "永久获得{C:money}$#3#{}",
                    }
                }
            },
            j_abn_lawn_joker = {
                name = "草坪小丑",
                text = {
                    {
                        "每{C:attention}持有{}一张{C:continent}大陆{}牌",
                        "计分的{C:spades}黑桃{}牌",
                        "永久获得{C:chips}+#5#{}筹码和{C:mult}+#6#{}倍率",
                    },
                    {
                        "每使用一张{C:weather_report}天气预报{}牌",
                        "这张小丑牌获得{C:chips}+#2#{}筹码和{C:mult}+#4#{}倍率",
                        "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码，{C:mult}+#3#{C:inactive}倍率）",
                    },
                }
            },
            j_abn_legends_remade = {
                name = "传奇再现",
                text = {
                    "如果拥有一张{C:legendary}传奇{}小丑牌",
                    "{C:money}售出{}这张{C:attention}小丑牌{}以生成",
                    "收藏中任意一张{C:legendary}传奇{}小丑牌",
                }
            },
            j_abn_light_collage = {
                name = "光之拼贴",
                text = {
                    "{C:dark_edition}闪箔{}牌计分时获得{C:chips}+#1#{}筹码",
                    "{C:dark_edition}亮光{}牌计分时获得{C:mult}+#2#{}倍率",
                    "使用{C:sigils}符印{}牌时，有{C:green}#5#/#6#{}几率将牌组中",
                    "1张随机无版本牌转化为{C:dark_edition}闪箔{}牌",
                    "有{C:green}#5#/#6#{}几率将牌组中",
                    "1张随机无版本牌转化为{C:dark_edition}亮光{}牌",
                    "{C:inactive}（当前为{C:chips}+#7#{C:inactive}筹码，{C:mult}+#8#{C:inactive}倍率）",
                },
            },
            j_abn_living_card = {
                name = "活牌",
                text = {
                    "打出的{C:attention}未计分{}牌",
                    "永久获得{C:chips}+#2#{}筹码和{C:mult}+#1#{}倍率",
                }
            },
            j_abn_loki = {
                -- 漫威宇宙中（MCU）著名的“恶作剧之神/诡计之神”洛基（Loki）
                name = "洛基",
                text = {
                    "{C:attention}喜剧演员{}小丑牌触发时",
                    "所有其他{C:attention}非喜剧演员{}小丑牌",
                    "永久获得{C:mult}+#1#{}倍率",
                }
            },
            j_abn_lost_media = {
                name = "失传媒体",
                text = {
                    "牌组中每缺少一种{C:attention}点数{}",
                    "这张小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                    "{C:inactive,s:0.8}（缺少：#3#）",
                }
            },
            j_abn_lotion_joker = {
                name = "润肤露小丑",
                text = {
                    "移除打出的和弃掉的",
                    "{C:attention}石油{}和{C:attention}石头{}牌的{C:attention}增强效果{}",
                    "每张以此方式恢复的牌获得{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                }
            },
            j_abn_lucky_glass = {
                name = "幸运玻璃牌",
                text = {
                    {
                        "若打出的牌型同时包含{C:attention}幸运{}牌",
                        "和{C:attention}玻璃{}牌，它们各获得",
                        "{C:gold}+#1#{}晋升强度和{C:purple}+#2#{}计分",
                    },
                    {
                        "触发时，{C:enhanced}幸运{} {C:attention}小丑牌{}获得",
                        "{X:mult,C:white}X#3#{}倍率，{C:enhanced}玻璃{}",
                        "{C:attention}小丑牌{}获得{X:chips,C:white}X#4#{}筹码",
                    },
                    {
                        "选择{C:attention}大盲注{}时，生成",
                        "本局最后使用的{C:glyphs}符印{}牌",
                        "{C:inactive}当前：{C:glyphs}#5#{}",
                    },
                },
            },
            j_abn_lucky_mult = {
                name = "幸运倍率牌",
                text = {
                    {
                        "若打出的牌型同时包含{C:attention}幸运{}牌",
                        "和{C:attention}倍率{}牌，它们各获得",
                        "{C:gold}+#1#{}晋升强度和{C:purple}+#2#{}计分",
                    },
                    {
                        "触发时，{C:enhanced}幸运{} {C:attention}小丑牌{}获得",
                        "{X:mult,C:white}X#3#{}倍率，{C:enhanced}倍率{}",
                        "{C:attention}小丑牌{}获得{X:chips,C:white}X#4#{}筹码",
                    },
                    {
                        "选择{C:attention}大盲注{}时，生成",
                        "本局最后使用的{C:paradox}悖论{}牌",
                        "{C:inactive}当前：{C:paradox}#5#{}",
                    },
                },
            },
            j_abn_lucky_socks = {
                name = "幸运袜子",
                text = {
                    {
                        "如果打出的牌包含{C:attention}对子{}",
                        "这张小丑牌获得{C:mult}+#1#{}倍率",
                    },
                    {
                        "{C:attention}对子{}中的{C:attention}幸运{}牌",
                        "必定{C:green}成功{}",
                        "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）",
                    }
                },
            },
            j_abn_lucky_stone = {
                name = "幸运石头",
                text = {
                    {
                        "若打出的牌型同时包含{C:attention}石头{}牌",
                        "和{C:attention}幸运{}牌，它们各获得",
                        "{C:gold}+#1#{}晋升强度和{C:purple}+#2#{}计分",
                    },
                    {
                        "触发时，{C:enhanced}石头{}{C:attention}小丑{}获得",
                        "{X:mult,C:white}X#3#{}倍率，{C:enhanced}幸运{}",
                        "{C:attention}小丑牌{}获得{X:chips,C:white}X#4#{}筹码",
                    },
                    {
                        "选择{C:attention}大盲注{}时，生成",
                        "本局最后使用的{C:artistry_cards}技艺{}牌",
                        "{C:inactive}当前：{C:artistry_cards}#5#{}",
                    },
                },
            },
            j_abn_lucrative_joker = {
                name = "暴利小丑",
                text = {
                    {
                        "{C:money}利息{}和{C:tarot}翻倍{}机制无上限",
                    },
                    {
                        "{C:attention}黄金{}牌和带有{C:gold}金色蜡封{}的牌",
                        "被洗至牌组顶部",
                    },
                    {
                        "如果拥有{C:attention}老虎机{}",
                        "{C:attention}黄金{}牌和{C:attention}蜡封{}的收益翻倍",
                    }
                }
            },
            j_abn_luftballon_joker = {
                name = "气球小丑",
                text = {
                    {
                        "当{C:attention}9{}触发时",
                        "{C:attention}完整牌组{}中每有一张{C:attention}9{}",
                        "获得{C:red}+#1#{}倍率",
                        "{C:inactive}（当前为{C:red}+#3#{C:inactive}倍率）",
                    },
                    {
                        "如果打出{C:attention}#2#{}",
                        "且只含{C:attention}9{}",
                        "牌型等级提升{C:attention}9{}次",
                    },
                }
            },
            j_abn_lunar_conspiracy = {
                name = "月球阴谋",
                text = {
                    {
                        "每当打出与任一持有的{C:planet}星球牌{}",
                        "相关的{C:attention}牌型{}时，",
                        "获得{C:chips}+#3#{}筹码和{C:mult}+#4#{}倍率",
                        "{C:inactive}(当前 {C:blue}+#1#{C:inactive} 筹码和 {C:red}+#2#{C:inactive} 倍率)",
                    },
                },
            },
            j_abn_m_earl = {
                name = "M·厄尔",
                text = {
                    "降低所有{C:attention}盲注需求{} {C:attention}90%{}",
                }
            },
            j_abn_mad_petr = {
                name = "疯狂佩特尔",
                text = {
                    "每{C:attention}持有{}一种不同的消耗牌",
                    "重新触发所有{C:attention}小丑牌{}一次",
                    "{C:inactive}（当前为{C:attention}#1#{C:inactive}次重新触发）",
                }
            },
            j_abn_mad_professor = {
                name = "疯狂教授",
                text = {
                    {
                        "每张打出的{C:attention}牌{}",
                        "在本手牌中每次",
                        "其{C:attention}点数{}被{C:attention}计分{}时",
                        "永久获得{C:blue}+#1#{}筹码",
                        "{C:inactive}例：\"2\",\"4\",\"2\",\"4\"",
                        "{C:inactive}= {C:chips}+1{C:inactive},{C:chips}+1{C:inactive},{C:chips}+2{C:inactive},{C:chips}+2{C:inactive}",
                    },
                }
            },
            j_abn_magician_tag = {
                name = "魔术师标签",
                text = {
                    "重掷{C:green}商店{}时，",
                    "{C:green}重掷{}所有持有的标签",
                },
            },
            j_abn_mainframe_joker = {
                name = "大型机小丑",
                text = {
                    "使用{C:solid_state}固态{}牌时，这张小丑牌获得{C:mult}+#4#{}倍率",
                    "使用{C:program_pack}程序{}牌时，获得{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码，{C:mult}+#3#{C:inactive}倍率）",
                }
            },
            j_abn_malefactor_comedian = {
                name = "恶徒•喜剧演员",
                text = {
                    "获得等同于光明花色计分牌点数的{C:chips}筹码{}",
                    "获得等同于暗色花色计分牌点数的{C:mult}倍率{}",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                }
            },
            j_abn_malicious_code_joker = {
                name = "恶意代码小丑",
                text = {
                    {
                        "计分的{C:attention}倍率{}牌",
                        "有{C:green}#1#/#2#{}几率{C:attention}增强{}为{C:purple}传染倍率{}",
                    },
                    {
                        "计分的{C:attention}奖励{}牌",
                        "有{C:green}#1#/#2#{}几率{C:attention}增强{}为{C:purple}传染奖励{}",
                    },
                }
            },
            j_abn_malicious_entity = {
                name = "恶意实体",
                text = {
                    "如果这是回合的{C:attention}第一次出牌{}",
                    "摧毁{C:attention}最左侧{}计分牌",
                    "并获得{C:white,X:mult}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                }
            },
            j_abn_malware_joker = {
                name = "恶意软件小丑",
                text = {
                    "重新触发所有{C:attention}小丑牌{}",
                    "每次出牌每张小丑牌",
                    "有{C:green}#1#/#2#{}几率",
                    "被{C:red}摧毁{}",
                }
            },
            j_abn_mana = {
                -- 源自《驱魔少年》（D.Gray-man）中的小丑“马拿·沃克”（Mana Walker）
                name = "马拿",
                text = {
                    "如果这是回合的{C:attention}第一次出牌{}",
                    "给第一张计分的",
                    "{C:attention}A{}和{C:attention}2",
                    "添加{C:dark_edition}烈日灾祸{}",
                }
            },
            j_abn_manga_panel_joker = {
                name = "漫画分镜小丑",
                text = {
                    "计分的{C:spades}暗色花色{}牌",
                    "给予{X:chips,C:white}^#1#{}筹码和{X:mult,C:white}^#2#{}倍率",
                }
            },
            j_abn_map_joker = {
                name = "地图小丑",
                text = {
                    {
                        "计分的{C:attention}A{}牌",
                        "每{C:attention}持有{}一张{C:continent}大陆{}牌",
                        "永久获得{C:chips}+#1#{}筹码和{C:mult}+#2#{}倍率",
                    },
                    {
                        "使用{C:continent}大陆{}牌时",
                        "获得的筹码和倍率增加",
                        "{C:chips}+#3#{}筹码和{C:mult}+#4#{}倍率",
                    }
                }
            },
            j_abn_mardi_gras = {
                name = "狂欢节小丑",
                text = {
                    "可以从{C:tarot}秘术包{}中",
                    "多选择{C:attention}1{}张牌",
                }
            },
            j_abn_mariner_joker = {
                name = "水手小丑",
                text = {
                    "每次使用{C:continent}大陆{}牌",
                    "生成一张随机{C:attention}点数{}的{C:planet}星球{}牌",
                }
            },
            j_abn_marionette_joker = {
                name = "木偶小丑",
                text = {
                    {
                        "迫使{C:attention}#3#{}张牌",
                        "总是被选中",
                    },
                    {
                        "每张计分牌",
                        "这张小丑牌获得{C:white,X:mult}X#2#{}倍率",
                        "{C:inactive}（当前为{C:white,X:mult}X#1#{C:inactive}倍率）",
                    }
                }
            },
            j_abn_market_crash = {
                name = "市场崩盘",
                text = {
                    {
                        "获得{C:money}金钱{}时，将获得金额降至{C:money}$1{}，",
                        "并将损失的{C:money}金钱{}的",
                        "{C:attention}两倍{}作为{C:mult}倍率{}",
                        "{C:inactive}(当前 {C:mult}+#1#{C:inactive} 倍率)",
                    },
                    {
                        "{C:attention}售出{}时，取回所有",
                        "损失的{C:money}金钱{}",
                        "{C:inactive}(将获得 {C:money}$#2#{C:inactive})",
                    },
                },
            },
            j_abn_marmalade_sandwhich = {
                -- “Marmalade”是一种果酱，通常由柑橘类水果制成，常用于三明治中
                name = "果酱三明治",
                text = {
                    "每当小丑牌触发",
                    "为其添加{X:mult,C:white}+X#3#{}倍率",
                    "回合结束时有{C:green}#1#/#2#{}几率",
                    "被{C:attention}吃掉{}",
                }
            },
            j_abn_marmalize_joker = {
                name = "果酱化小丑",
                text = {
                    "小丑牌不会被{C:mult}削弱{}或带有{C:abn_perishable}易腐{}贴纸",
                    "选择{C:attention}盲注{}时，所有小丑牌",
                    "获得{C:mult}+#1#{}倍率和{C:chips}+#2#{}筹码",
                }
            },
            j_abn_marques_the_joker = {
                name = "马奎斯小丑",
                text = {
                    "打出的{C:attention}黄金牌{}",
                    "计分时永久获得{X:mult,C:white}+X#1#{}倍率",
                    "和{C:chips}+#2#{}筹码",
                    "非黄金牌计分时被削弱",
                },
            },
            j_abn_mateo_mime = {
                name = "马特奥•哑剧演员",
                text = {
                    {
                        "计分的{C:abn_coin}币{}牌给予{X:chips,C:white}X#1#{}筹码",
                        "每当{C:abn_coin}币{}计分时提升{X:chips,C:white}X#2#{}筹码",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "提升所有计分{C:abn_coin}币{}牌的{C:planet}星球{} {C:attention}点数{}",
                    }
                }
            },
            j_abn_maurice_jester = {
                name = "莫里斯",
                text = {
                    {
                        "计分的{C:hearts}红桃{}牌给予{X:chips,C:white}X#1#{}筹码",
                        "每当{C:hearts}红桃{}计分时提升{X:chips,C:white}X#2#{}筹码",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "打出的{C:hearts}红桃{}牌计分时",
                        "永久获得{C:white,X:mult}X#3#{}倍率",
                    }
                }
            },
            j_abn_maxwell_joker = {
                name = "麦克斯韦",
                text = {
                    "带有{C:dark_edition}#2#{}版本的牌",
                    "给予{X:chips,C:white}X#1#{}筹码",
                }
            },
            j_abn_meddlesome_naidemoc = {
                -- 名字naidemoc是comedians的反向拼写
                name = "多事演员剧喜",
                text = {
                    {
                        "计分前牌改变{C:attention}花色{}",
                        "{C:diamonds,s:0.8}方块{s:0.8} -> {C:spades,s:0.8}黑桃{s:0.8}",
                        "{C:spades,s:0.8}黑桃{s:0.8} -> {C:hearts,s:0.8}红桃{s:0.8}",
                        "{C:hearts,s:0.8}红桃{s:0.8} -> {C:clubs,s:0.8}梅花{s:0.8}",
                        "{C:clubs,s:0.8}梅花{s:0.8} -> {C:abn_snow,s:0.8}雪{s:0.8}",
                        "{C:abn_snow,s:0.8}雪{s:0.8} -> {C:abn_penumbra,s:0.8}半影{s:0.8}",
                        "{C:abn_penumbra,s:0.8}半影{s:0.8} -> {C:abn_tie,s:0.8}和{s:0.8}",
                        "{C:abn_tie,s:0.8}和{s:0.8} -> {C:abn_bow,s:0.8}弓{s:0.8}",
                    },
                    {
                        "牌改变{C:attention}花色{}时",
                        "这张小丑牌获得{C:chips}+#3#{}筹码和{C:mult}+#4#{}倍率",
                        "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率，{C:chips}+#1#{C:inactive}筹码）",
                    },
                }
            },
            j_abn_melnibone_comedian = {
                -- Melniboné（梅尔尼博内）出自英国奇幻大师迈克尔·考克斯（Michael Moorcock）的代表作《永恒战士/白狼埃尔里克系列》（Elric of Melniboné）。
                name = "梅尔尼博内",
                text = {
                    "{C:attention}售出{}小丑牌时获得{X:mult,C:white}X#3#{}倍率",
                    "{C:mult}摧毁{}小丑牌时获得{C:chips}+#4#{}筹码",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                    "{C:attention}售出{}和{C:mult}摧毁{}的小丑牌不会再次出现",
                }
            },
            j_abn_melted_joker = {
                name = "已融化小丑",
                text = {
                    {
                        "选择{C:attention}盲注{}时",
                        "给最左侧小丑牌",
                        "添加{C:money}租用{}贴纸",
                    },
                    {
                        "{C:money}租用{}小丑牌每张给予",
                        "{X:mult,C:white}X#2#{}倍率和{C:money}$#1#{}",
                    }
                }
            },
            j_abn_melty_joker = {
                name = "半融小丑",
                text = {
                    "{C:attention}最左侧{}打出的牌",
                    "永久获得{C:attention}最右侧{}牌",
                    "点数作为{C:chips}筹码{}，然后",
                    "摧毁{C:attention}最右侧{}牌",
                }
            },
            j_abn_memory_dump_joker = {
                name = "内存转储小丑",
                text = {
                    {
                        "每次计分手牌",
                        "每张小丑牌获得{X:mult,C:white}X#1#{}倍率",
                    },
                    {
                        "计分手牌数量必须",
                        "大于{C:attention}#2#{}",
                        "{C:inactive}（变化为打出的最大手牌数量）",
                        "{C:inactive}（击败盲注时重置）",
                    },
                }
            },
            j_abn_menacing_clown = {
                name = "威吓小丑",
                text = {
                    "选择{C:attention}盲注{}时",
                    "摧毁右侧的小丑牌",
                    "并给左侧的小丑牌",
                    "添加{C:dark_edition}#1#{}、{C:dark_edition}#2#{}",
                    "或{C:dark_edition}#3#{}版本",
                },
            },
            j_abn_meta_joker = {
                name = "元小丑",
                text = {
                    "你的{C:attention}小丑牌{}中每有一种",
                    "{C:attention}不同稀有度{}",
                    "获得{C:white,X:mult}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
                }
            },
            j_abn_metallic_upgrade = {
                name = "金属升级",
                text = {
                    "在{C:attention}全谱{}牌型中，第一张计分的",
                    "{C:attention}原版{C:dark_edition}增强{}牌",
                    "会将其{C:dark_edition}增强{}效果给予",
                    "{C:attention}最左侧{}的小丑牌",
                    "若以{C:attention}5{}张原版{C:dark_edition}增强{}牌",
                    "打出{C:attention}全谱{}牌型，",
                    "则所有打出的牌永久获得",
                    "{C:chips}+#1#{}筹码 {C:mult}+#2#{}倍率，",
                    "且所有小丑牌获得{C:purple}+#3#{}计分",
                },
            },
            j_abn_metropolitan_joker = {
                name = "都会小丑",
                text = {
                    "{C:attention}完整牌组{}中每有一张",
                    "{C:attention}#2#{}牌",
                    "获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#3#{C:inactive}倍率）",
                }
            },
            j_abn_mike_jester = {
                name = "迈克",
                text = {
                    {
                        "计分的{C:abn_bow}弓{}牌给予{X:mult,C:white}X#1#{}倍率",
                        "每当{C:abn_bow}弓{}计分时提升{X:mult,C:white}X#2#{}倍率",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "计分的{C:abn_bow}弓{}牌按{C:white,X:abn_plasma}#3#%{}",
                        "平衡{C:chips}筹码{}和{C:mult}倍率{}",
                    }
                }
            },
            j_abn_mikhail_jester = {
                name = "米哈伊尔",
                text = {
                    {
                        "计分的{C:abn_bow}弓{}牌给予{X:chips,C:white}X#1#{}筹码",
                        "每当{C:abn_bow}弓{}计分时提升{X:chips,C:white}X#2#{}筹码",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "计分的{C:abn_bow}弓{}牌每{C:attention}持有{}一张消耗牌",
                        "永久获得{C:mult}+#3#{}倍率",
                    }
                }
            },
            j_abn_mindflayer = {
                name = "夺心魔",
                text = {
                    "每张打出的{C:attention}翻转牌{}",
                    "计分时永久获得",
                    "{C:mult}+#1#{}倍率",
                }
            },
            j_abn_minimalist_joker = {
                name = "极简小丑",
                text = {
                    "所有{C:common}普通{}小丑牌给予{X:mult,C:white}X#1#{}倍率",
                    "售出小丑牌时{C:mult}自毁{}",
                    "{C:attention}消耗牌{}售价为{C:money}$0{}",
                }
            },
            j_abn_minimus = {
                name = "米尼姆斯",
                text = {
                    "计分的{C:attention}数字牌{}",
                    "点数低于{C:attention}5{}时",
                    "给予{X:mult,C:white}X#1#{}倍率和{X:chips,C:white}X#2#{}筹码",
                }
            },
            j_abn_misplaced_texture = {
                name = "错位纹理",
                text = {
                    "所有{C:attention}人头牌{}",
                    "被视为",
                    "{C:attention}数字牌{}",
                },
            },
            j_abn_missing_texture = {
                name = "缺失纹理",
                text = {
                    "每张计分牌在计分前",
                    "变为{C:attention}A{}",
                },
            },
            j_abn_mitch_jester = {
                name = "米奇",
                text = {
                    {
                        "计分的{C:abn_tie}和{}牌给予{X:mult,C:white}X#1#{}倍率",
                        "每当{C:abn_tie}和{}计分时提升{X:mult,C:white}X#2#{}倍率",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "计分的{C:abn_tie}和{}牌每{C:attention}持有{}一张消耗牌",
                        "永久获得{C:attention}+#3#{}次重新触发",
                    }
                }
            },
            j_abn_moai_joker = {
                -- 造型直接来源于智利复活节岛（Easter Island）巨型人面石像——摩艾（Moai / 🗿）。牌面在坚硬、带有裂纹的灰色石像头上加戴了一顶极小的红黄双色小丑帽，并涂上了红色的笑脸嘴唇。
                -- 摩艾石像（🗿）在现代网络流行文化中也是极其经典的表情包梗
                name = "摩艾小丑",
                text = {
                    "每张打出的{C:attention}石头牌{}",
                    "计分时永久获得",
                    "{C:mult}+#1#{}倍率和",
                    "{C:money}+$#2#{}",
                }
            },
            j_abn_moe_joker = {
                name = "萌化小丑",
                text = {
                    "{C:attention}波尔卡点{}牌{C:attention}留在手中{}",
                    "可在计分时计数",
                    "{C:attention}波尔卡点{}牌计分时",
                    "永久获得{C:mult}+#1#{}倍率",
                }
            },
            j_abn_moirologist_joker = {
                name = "哭丧人小丑牌",
                text = {
                    {
                        "选择{C:attention}盲注{}时，将一张随机",
                        "小丑牌变为{C:enhanced}易碎{}",
                    },
                    {
                        "当小丑牌被摧毁时，获得{C:gold}$#1#{}",
                        "以及与其稀有度相应的奖励：",
                        "{C:common}普通{}：{C:blue}+#9#{C:inactive}[+#2#]{}筹码",
                        "{C:uncommon}罕见{}：{C:red}+#10#{C:inactive}[+#3#]{}倍率",
                        "{C:rare}稀有{}：{X:chips,C:white}X#11#{C:inactive}[X#4#]{}筹码",
                        "{C:abn_superrare}超稀有{}：{X:red,C:white}X#12#{C:inactive}[X#5#]{}倍率",
                        "{C:legendary}传说{}：{C:gold}+#13#{C:inactive}[+#6#]{}晋升强度",
                        "{C:abn_parallelrare}平行稀有{}：{C:attention}+#14#{C:inactive}[+#7#]{}次重新触发",
                        "{s:0.8}击败{C:attention,s:0.8}Boss盲注{}后，摧毁小丑牌",
                        "{s:0.8}获得的金钱增加{C:gold,s:0.8}+$#8#{}",
                    },
                },
            },
            j_abn_money_talk = {
                name = "金钱至上",
                text = {
                    {
                        "击败{C:attention}Boss盲注{}时",
                        "给每张{C:attention}持有{}的消耗牌",
                        "添加{C:money}$#2#{}售价",
                    },
                    {
                        "击败{C:attention}Boss盲注{}时",
                        "金额增加{C:money}$#1#{}",
                    }
                }
            },
            j_abn_monitor_joker = {
                name = "显示器小丑",
                text = {
                    {
                        "你可以出牌和弃牌",
                        "最多{C:attention}6{}张牌",
                    },
                    {
                        "第一次打出{C:attention}6{}张牌的手牌",
                        "且包含{C:attention}显示器{}牌时，",
                        "打出的所有牌{C:attention}点数{}提升{C:attention}1{}级",
                        "打出的牌计分时永久获得",
                        "{X:chips,C:white}X#1#{}筹码",
                    },
                }
            },
            j_abn_monkey_buisness = {
                name = "猩牌危机",
                text = {
                    "{C:attention}消耗牌{}可以有不同{C:dark_edition}版本{}",
                },
            },
            j_abn_monocromator_joker = {
                name = "单色器小丑",
                text = {
                    {
                        "打出的手牌包含{C:attention}顺子{}时",
                        "每计分一种不同的{C:attention}花色{}",
                        "这张小丑牌获得{C:chips}+#3#{}筹码",
                    },
                    {
                        "打出的手牌为{C:attention}顺子光谱{}时",
                        "这张小丑牌将所有计分的{C:dark_edition}模组{}花色的",
                        "{C:attention}点数{}转化为{C:mult}倍率{}",
                        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                    },
                    {
                        "若打出的手牌为没有{C:inactive}原版{}花色的",
                        "{C:attention}顺子光谱{}牌型",
                        "给所有计分的{C:spades}暗色花色{}牌",
                        "添加{C:dark_edition}暗淡{}版本",
                    },
                }
            },
            j_abn_moon_joker = {
                name = "月亮小丑",
                text = {
                    "每次使用{C:planet}星球{}牌时",
                    "这张小丑牌获得",
                    "{C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                }
            },
            j_abn_motocross_joker = {
                name = "越野摩托小丑",
                text = {
                    {
                        "每张{C:attention}#2#{}计分时",
                        "获得{X:red,C:white}X#1#{}倍率",
                        "{C:inactive}（花色在出牌后变化）",
                        "{C:inactive}（当前为{X:red,C:white}X#3#{C:inactive}倍率）",
                    },
                    {
                        "完整牌组中每有一张",
                        "{C:attention}万能{}牌",
                        "计分的{C:attention}万能{}牌",
                        "获得{C:gold}+$#4#{}和{C:chips}+#5#{}筹码",
                    },
                }
            },
            j_abn_mult_disco = {
                name = "倍率迪斯科",
                text = {
                    {
                        "每张计分的",
                        "{C:dark_edition}负片{} {C:attention}倍率{}牌",
                        "获得{X:mult,C:white}X#1#{}倍率",
                    },
                    {
                        "每张计分的",
                        "{C:spades}暗色{}花色 {C:attention}倍率{}牌",
                        "获得{C:mult}+#2#{}倍率",
                        "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率）",
                    }
                }
            },
            j_abn_mult_glass = {
                name = "倍率玻璃牌",
                text = {
                    {
                        "若打出的牌型同时包含{C:attention}倍率{}牌",
                        "和{C:attention}玻璃{}牌，它们各获得",
                        "{C:gold}+#1#{}晋升强度和{C:purple}+#2#{}计分",
                    },
                    {
                        "触发时，{C:enhanced}倍率{} {C:attention}小丑牌{}获得",
                        "{X:chips,C:white}X#3#{}筹码，{C:enhanced}玻璃{}",
                        "{C:attention}小丑牌{}获得{X:chips,C:white}X#4#{}筹码",
                    },
                    {
                        "选择{C:attention}大盲注{}时，生成",
                        "本局最后使用的{C:program_pack}程序{}牌",
                        "{C:inactive}当前：{C:program_pack}#5#{}",
                    },
                },
            },
            j_abn_mult_speed = {
                name = "倍率速度",
                text = {
                    "{C:attention}偶数次{}出牌的计分牌永久获得{C:mult}+#1#{}倍率",
                    "{C:attention}奇数次{}出牌的计分牌永久获得{C:chips}+#2#{}筹码",
                    "{C:attention}最后一次{}出牌的计分牌永久获得{C:money}$#3#{}",
                }
            },
            j_abn_mult_stone = {
                name = "倍率石",
                text = {
                    "{C:attention}石头{}牌计分时",
                    "获得{C:red}红色蜡封{}和{C:mult}+#1#{}倍率",
                }
            },
            j_abn_mutually_assured_destruction = {
                -- Mutually Assured Destruction（简称 MAD，意为“相互保证毁灭”或“相互确保摧毁”）
                -- 是冷战时期美苏两大核大国之间的核威慑战略原则 —— 任何一方发动核袭击，另一方都有能力发动报复性打击摧毁对方，最终导致双绝对毁灭。
                name = "玉石俱焚",
                text = {
                    {
                        "所有{C:legendary}稀有度{}",
                        "可能出现在{C:attention}商店{}中",
                    },
                    {
                        "如果在{C:attention}商店{}中",
                        "没有购买任何{C:attention}小丑牌{}",
                        "则{C:red}摧毁{}所有{C:attention}持有{}的小丑牌",
                        "{C:inactive}（可摧毁{C:abn_eternal}永恒{C:inactive}牌）",
                        "{C:inactive}小丑牌安全度：{B:1,C:white}#1#",
                    },
                }
            },
            j_abn_naneinf_joker = {
                name = "NANEINF小丑",
                text = {
                    "成长型小丑成长速度{C:attention}翻倍{}",
                    "重新触发{C:attention}第一张{}成长型小丑牌",
                }
            },
            j_abn_napping_joker = {
                name = "打盹小丑",
                text = {
                    "{C:planet}星球牌{}提供",
                    "{C:chips}%#1#{}更多筹码",
                    "使用{C:attention}9{C:inactive}（#2#）{}张{C:planet}星球牌{}后",
                    "转化为{C:attention}酣睡小丑牌{}",
                },
            },
            j_abn_negative_suit = {
                name = "负片花色",
                text = {
                    "{C:attention}完整牌组{}中每有一张",
                    "{C:dark_edition}#3#{}牌",
                    "获得{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{C:chips}#2#{C:inactive}筹码）",
                }
            },
            j_abn_nerd_joker = {
                name = "书呆子小丑",
                text = {
                    {
                        "如果{C:attention}计分手牌{}中奇数牌的数量为偶数",
                        "获得等同于点数{X:blue,C:white}X#1#{}倍的{C:chips}筹码{}",
                        "{C:inactive}（当前为{C:blue}+#2#{C:inactive}筹码）",
                    },
                },
            },
            j_abn_newestia = {
                name = "纽斯蒂亚",
                text = {
                    {
                        "计分牌给予",
                        "{X:chips,C:white}X#1#{}筹码、{X:mult,C:white}X#2#{}倍率",
                        "和{X:gold,C:white}X#3#{}晋升强度",
                    },
                    {
                        "如果拥有{C:attention}阿班多尼亚{}",
                        "计分牌给予{C:gold}+#4#{}晋升强度",
                    }
                }
            },
            j_abn_newground_joker = {
                -- Newgrounds是全球最著名的独立游戏与Flash动画创作社区，被称为“互联网独立艺术与 Flash 游戏的发源地”。
                -- 卡面美术复刻了 Newgrounds 社区的经典标志——新地坦克
                name = "新地小丑",
                text = {
                    "选择{C:attention}盲注{}时",
                    "这张小丑牌获得{C:mult}+#3#{}倍率",
                    "和{C:chips}+#4#{}筹码",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                }
            },
            j_abn_nicotine_joker = {
                name = "尼古丁小丑",
                text = {
                    "{C:chips}+#1#{}筹码",
                    "{C:inactive}（分数着火时翻倍）",
                }
            },
            j_abn_night_comedian = {
                -- 世嘉（SEGA）经典游戏《飞天幽梦》（NiGHTS into Dreams...）主角“奈特”（NiGHTS）
                name = "奈特",
                text = {
                    {
                        "计分的{C:attention}增强{}牌每有一种相同{C:attention}增强效果{}",
                        "获得{C:chips}+#5#{}筹码和{C:mult}+#6#{}倍率",
                        "计分的{C:dark_edition}版本{}牌每有一种相同{C:dark_edition}版本{}",
                        "获得{C:chips}+#6#{}筹码和{C:mult}+#5#{}倍率",
                    },
                    {
                        "每张计分的{C:attention}增强{}牌",
                        "这张小丑牌获得{C:chips}+#4#{}筹码",
                        "每张计分的{C:dark_edition}版本{}牌",
                        "获得{X:mult,C:white}X#3#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率，{C:chips}+#1#{C:inactive}筹码）",
                    }
                }
            },
            j_abn_nightstalker = {
                name = "夜行者小丑",
                text = {
                    {
                        "所有打出的{C:spades}暗色{}牌",
                        "计分时变为",
                        "{C:dark_edition}#3#{}",
                    },
                    {
                        "{C:attention}完整牌组{}中每有一张",
                        "{C:dark_edition}#3#{}牌",
                        "给予{X:mult,C:white}X#1#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
                    },
                },
            },
            j_abn_noir_joker = {
                name = "黑色电影小丑",
                text = {
                    {
                        "{C:diamonds}光明{}花色计分时",
                        "给手牌中所有{C:spades}暗色{}花色牌",
                        "添加{C:attention}翻转{}",
                    },
                    {
                        "每张计分的{C:attention}翻转{}牌",
                        "这张小丑牌获得{C:mult}+#3#{}倍率和{C:chips}+#4#{}筹码",
                        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                    }
                }
            },
            j_abn_noneuclidean_joker = {
                name = "非欧小丑",
                text = {
                    "其他小丑牌获得{C:chips}筹码{}或{C:mult}倍率{}时",
                    "这张小丑牌获得{C:attention}两倍{}该数值",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码，{C:mult}+#2#{C:inactive}倍率）",
                }
            },
            j_abn_number_44 = {
                -- 源自美国著名作家马克·吐温（Mark Twain）的长篇哲学小说《44号神秘陌生人》。
                -- 小说中的主角是一个名为 “44号”（No. 44） 的神秘少年/超自然存在。
                name = "44号",
                text = {
                    "选择{C:attention}盲注{}时",
                    "创建{C:attention}#1#{}个小丑牌槽位",
                    "并用随机{C:attention}小丑牌{}填满",
                }
            },
            j_abn_nuruomino_joker = {
                -- Nuruomino 是由著名解谜概念“涂壁/数墙”（Nurikabe）与“多格骨牌”（Polyomino）结合而成的经典格纸逻辑谜题。在 Nuruomino 谜题中，玩家需要将网格中的部分格子涂黑/暗化（Dark），使其连接构成特定形状的骨牌块
                name = "诺鲁骨牌小丑",
                text = {
                    "使用{C:program_pack}程序{}牌时",
                    "持有的{C:spades}暗色{}花色牌获得{C:chips}+#1#{}筹码",
                    "提升{C:attention}第一次{}计分的",
                    "{C:spades}暗色花色{} {C:attention}顺子{}中",
                    "牌的{C:planet}星球{} {C:attention}点数{}等级",
                }
            },
            j_abn_obmij = {
                name = "宝金",
                text = {
                    "给予等同于",
                    "拥有{C:attention}小丑牌{}数量的倍乘倍率",
                }
            },
            j_abn_obra_dinn = {
                -- 原型来自独立解谜游戏《奥伯拉·丁的回归》（Return of the Obra Dinn）
                -- 现实原型为“奥伯拉·丁号”（Obra Dinn） 是一艘于 1802 年在海上失踪、并在 1807 年飘回港口的东印度公司商船，船上的 60 名船员全部死亡或失踪。
                name = "奥伯拉丁",
                text = {
                    {
                        "本赛局每摧毁一张{C:spades}暗色花色{}牌",
                        "{C:diamonds}光明花色{}牌获得{C:mult}+1{}倍率",
                        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}）",
                    },
                    {
                        "本赛局每摧毁一张{C:diamonds}光明花色{}牌",
                        "{C:spades}暗色花色{}牌获得{C:mult}+1{}倍率",
                        "{C:inactive}（当前为{C:mult}+#2#{C:inactive}）",
                    }
                }
            },
            j_abn_odd_couple = {
                name = "奇怪的一对",
                text = {
                    "每张打出的{C:attention}A{}和{C:attention}数字牌{}",
                    "计分时给予其点数作为{C:mult}倍率{}",
                }
            },
            j_abn_oddball_todd = {
                name = "怪胎托德",
                text = {
                    "打出的{C:attention}奇数{}点数牌",
                    "计分时给予",
                    "{C:chips}+#1#{}筹码",
                    "{C:inactive}（13、12、11、A、9、7、5、3）",
                },
            },
            j_abn_oddly_thomas = {
                name = "古怪托马斯",
                text = {
                    "每张打出的{C:attention}奇数{}点数牌",
                    "计分时永久获得",
                    "{C:chips}+#1#{}筹码",
                    "{C:inactive}（A、9、7、5、3）",
                }
            },
            j_abn_oiled_joker = {
                name = "油润小丑",
                text = {
                    {
                        "如果回合的{C:attention}第一次弃牌{}",
                        "包含一张{C:abn_black_seal}石油{}牌",
                        "它不会被{C:attention}消耗{}",
                    },
                    {
                        "打出的{C:abn_black_seal}石油{}牌给予",
                        "{C:money}$#1#{}、{C:mult}+#2#{}倍率和{C:chips}+#3#{}筹码",
                    },
                }
            },
            j_abn_oilsplash = {
                name = "油花",
                text = {
                    {
                        "打出的{C:attention}未计分{}牌",
                        "变为{C:abn_black_seal}石油{}牌",
                    },
                    {
                        "如果分数{C:attention}着火{}",
                        "{C:abn_black_seal}石油{}牌不会",
                        "变为{C:abn_black_seal}油田火{}",
                    },
                }
            },
            j_abn_old_as_dirt = {
                name = "老掉牙",
                text = {
                    "每低于{C:red}$0{} {C:money}$1{}",
                    "这张小丑牌获得{C:white,X:mult}X#1#{}倍率",
                    "{C:inactive}（当前为{C:white,X:mult}X#2#{C:inactive}倍率）",
                }
            },
            j_abn_old_growth_joker = {
                name = "古木小丑",
                text = {
                    "计分的{C:attention}数字{} {C:attention}木板{}牌",
                    "的{C:attention}点数{}的{C:attention}三倍{}作为倍率，",
                    "并给予{C:gold}+#3#{}晋升强度",
                    "{C:inactive}(当前 {C:mult}+#1#{} 倍率, {C:gold}+#2#{} 晋升强度)",
                },
            },
            j_abn_omaha_joker = {
                name = "奥马哈扑克",
                text = {
                    "若打出的牌型包含{C:attention}5{}张计分牌，",
                    "则其中每组成一种{C:attention}牌型{}，",
                    "这张小丑牌获得{C:mult}+#2#{}倍率",
                    "{C:inactive}(当前 {C:mult}+#1#{} 倍率)",
                },
            },
            j_abn_oopsy_daisy = {
                name = "哎呀糟糕",
                text = {
                    "{C:attention}+#1#{}消耗牌槽位",
                    "此小丑牌及此后所有小丑牌都会放入{C:attention}消耗牌{}中",
                    "若此小丑牌被{C:mult}售出{}或{C:mult}摧毁{}，",
                    "则{C:mult}摧毁{}{C:attention}消耗牌{}中的所有{C:attention}小丑牌{}",
                },
            },
            j_abn_origiri_triplets = {
                name = "饭团三胞胎",
                text = {
                    "如果打出的计分牌中的{C:attention}点数{}总和",
                    "能被{C:attention}3{}整除",
                    "这张小丑牌获得{C:chips}+#4#{}筹码、{C:mult}+#3#{}倍率",
                    "和{C:money}$#5#{}售价",
                    "{C:inactive}（例：{C:attention}3{C:inactive}、{C:attention}6{C:inactive}、{C:attention}9{C:inactive}、{C:attention}12{C:inactive}）",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码，{C:mult}+#1#{C:inactive}倍率）",
                }
            },
            j_abn_orphic_joker = {
                -- Orphic 在艺术史上专指 20 世纪初由罗贝尔·德洛内（Robert Delaunay）等人发起的“奥费主义”（立体主义的一个重要前卫分支）。
                -- 该流派主张放弃写实，通过强烈对比的几何色块、多边形拼贴与光色韵律来表达纯粹的视觉音乐感。
                name = "奥费小丑",
                text = {
                    {
                        "如果打出包含",
                        "{C:hearts}红桃{}、{C:diamonds}方块{}、{C:spades}黑桃{}和{C:clubs}梅花{}的",
                        "{C:attention}#1#{}，提升该{C:attention}牌型{}等级",
                        "并获得{C:mult}+#2#{}倍率",
                        "{C:inactive}（当前为{C:mult}+#4#{C:inactive}倍率）",
                    },
                    {
                        "如果打出包含",
                        "{C:abn_penumbra}半影{}、{C:abn_snow}雪{}、{C:abn_bow}弓{}和{C:abn_tie}和{}的",
                        "{C:attention}#1#{}，提升每张{C:attention}计分{}牌的",
                        "{C:planet}星球{} {C:attention}点数{}等级",
                        "并获得{C:chips}+#3#{}筹码",
                        "{C:inactive}（当前为{C:chips}+#5#{C:inactive}筹码）",
                    },
                }
            },
            j_abn_outdated_joker = {
                name = "过时小丑",
                text = {
                    "以{C:attention}偶数{}张牌击败{C:attention}盲注{}时",
                    "这张小丑牌获得{C:chips}+#1#{}筹码和{C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码，{C:mult}+#4#{C:inactive}倍率）",
                }
            },
            j_abn_paint_by_numbers = {
                -- Paint by Numbers 是一种风靡全球的业余艺术创作方式（中文常称为“数字油画”或“按数字填色”），
                -- 画布上被分割成许多带有数字编号的小区域，
                -- 玩家只需要根据数字填上对应的颜料就能完成一幅画。
                name = "数字油画",
                text = {
                    {
                        "如果{C:attention}第一次出牌{}",
                        "只包含{C:attention}数字 {C:abn_suitless}无色{}牌",
                        "重新触发所有牌",
                        "并{C:attention}提升{}该牌型等级",
                    },
                    {
                        "如果{C:attention}第二次出牌{}",
                        "只包含{C:attention}数字{} {C:attention}非无色{}牌",
                        "重新触发所有牌",
                        "并{C:attention}提升{}该牌型等级",
                    },
                }
            },
            j_abn_painyatta = {
                -- 原型来自游戏系列《动视/小龙斯派罗》（Skylanders: Trap Team）中的
                -- 反派/角色 Painyatta（痛苦皮尼亚塔）。
                name = "痛苦皮尼亚塔",
                text = {
                    "购买{C:attention}优惠券{}时",
                    "{C:attention}免费{}兑换{C:attention}#1#{}张随机优惠券",
                }
            },
            j_abn_palindromic_beetle = {
                name = "回文甲虫",
                text = {
                    {
                        "如果{C:attention}完整手牌{}是{C:attention}回文序列{}",
                        "且同时包含{C:diamonds}光明{}和{C:spades}暗色{}花色",
                        "提升每张{C:attention}计分{}牌的{C:planet}星球{} {C:attention}点数{}等级",
                        "提升幅度等于该{C:attention}点数{}在手牌中{C:attention}重复{}的次数",
                    },
                }
            },
            j_abn_pankert = {
                name = "潘克特",
                text = {
                    "如果{C:attention}持有{}",
                    "{C:attention}4{}张或以上消耗牌",
                    "获得{C:white,X:chips}^#1#{}筹码",
                }
            },
            j_abn_paradox_chip = {
                name = "悖论筹码",
                text = {
                    {
                        "计分的{C:attention}数字牌{}",
                        "点数高于{C:attention}10{}时",
                        "给予其点数作为{C:red}倍率{}",
                    },
                }
            },
            j_abn_parkateo = {
                name = "帕卡泰欧",
                text = {
                    "持有的{C:attention}消耗牌{}给予{X:mult,C:white}X#1#{}倍率",
                }
            },
            j_abn_parq = {
                -- 这个不知道是指谁，保留英文
                name = "P'arq",
                text = {
                    "每{C:attention}持有{}一种不同的消耗牌",
                    "降低{C:attention}盲注需求{} {C:attention}#1#%{}",
                    "{C:inactive}（当前为{C:attention}#2#%{C:inactive}）",
                }
            },
            j_abn_patient_zero = {
                name = "零号病人",
                text = {
                    "选择{C:attention}盲注{}时",
                    "给{C:attention}最右侧{}的小丑牌",
                    "添加{C:green}增益{}贴纸",
                }
            },
            j_abn_paywall_joker = {
                name = "付费墙小丑",
                text = {
                    "{C:attention}重新触发{}一张{C:attention}随机{}小丑牌并失去",
                    "等同于其{C:money}售价{}的{C:money}$",
                    "资金达到{C:money}$0{}或更低时{C:mult}自毁{}",
                }
            },
            j_abn_pearls_of_worlds = {
                name = "世界之珠",
                text = {
                    "获得等同于所触发{C:attention}小丑牌{}描述中",
                    "所有数字{C:attention}之和{}的",
                    "{C:chips}筹码{}",
                    "{C:inactive}(当前 {C:chips}+#1#{C:inactive} 筹码)",
                },
            },
            j_abn_pedro_joker = {
                -- Pedro 在植物学分类上属于 AAB 基因型组（Mysore 亚群），它最著名的国际通用名称是 Pisang Ceylan（锡兰香蕉）。在澳大利亚（尤其是昆士兰州），人们普遍习惯称它为 Pedro。
                -- 它对导致现代香蕉产业面临严重危机的巴拿马病（香蕉枯萎病）具有极强的抗性，因此常被推荐给庭院种植者和有机农场。
                name = "佩德罗香蕉",
                text = {
                    "击败{C:attention}盲注{}时",
                    "{C:mult}摧毁{}售价最低的小丑牌",
                    "并将其{C:money}价值{}的8倍",
                    "作为{C:chips}筹码{}和{C:mult}倍率{}添加至这张小丑牌",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                }
            },
            j_abn_peel_off = {
                name = "剥离",
                text = {
                    "选择{C:attention}盲注{}时",
                    "移除所有小丑牌上的{C:attention}贴纸{}",
                    "每移除一张贴纸",
                    "获得{C:white,X:mult}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                }
            },
            j_abn_pentomino_joker = {
                name = "五格骨牌",
                text = {
                    {
                        "使用{C:program_pack}程序{}牌时",
                        "持有的{C:diamonds}光明{}花色牌获得{C:chips}+#1#{}筹码",
                    },
                    {
                        "提升{C:attention}第一次{}计分的",
                        "{C:diamonds}光明花色{} {C:attention}顺子{}中",
                        "牌的{C:planet}星球{} {C:attention}点数{}等级",
                    }
                }
            },
            j_abn_penultimate_joker = {
                name = "倒数第二小丑",
                text = {
                    {
                        "计分的{C:spades}暗色花色{}中每有一种不同{C:attention}增强效果{}",
                        "所有打出的{C:diamonds}光明花色{}牌重新触发一次",
                    },
                    {
                        "计分的{C:diamonds}光明花色{}中每有一种不同{C:attention}增强效果{}",
                        "所有打出的{C:spades}暗色花色{}牌重新触发一次",
                    }
                }
            },
            j_abn_perfidious_comedian = {
                name = "奸诈•喜剧演员",
                text = {
                    "手牌中带有{C:attention}蜡封{}的{C:attention}偶数{}和{C:attention}奇数{}牌可在计分时计数",
                    "带有{C:attention}蜡封{}的{C:attention}偶数{}牌计分时获得等同于其{C:attention}点数{}的{C:mult}倍率{}",
                    "带有{C:attention}蜡封{}的{C:attention}奇数{}牌计分时获得等同于其{C:attention}点数{}的{C:chips}筹码{}",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                }
            },
            j_abn_periodic_table = {
                name = "元素周期表",
                text = {
                    "若计分{C:attention}着火{}，则为打出的",
                    "{C:attention}牌型{}生成对应的",
                    "{C:periodic}元素周期{}牌",
                },
            },
            j_abn_perrrkeo = {
                -- Perrrkeo
                name = "帕~奇欧",
                text = {
                    "按{C:white,X:abn_plasma}#3#%{}平衡",
                    "{C:mult}倍率{}和{C:chips}筹码{}",
                    "每{C:attention}持有{}一张消耗牌",
                    "额外增加{C:white,X:abn_plasma}#2#%{}",
                }
            },
            j_abn_phonechat_joker = {
                name = "电话聊天",
                text = {
                    "左侧{C:attention}小丑牌{}触发时获得{C:chips}+#3#{}筹码",
                    "右侧{C:attention}小丑牌{}触发时获得{C:mult}+#4#{}倍率",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码，{C:mult}+#2#{C:inactive}倍率）",
                }
            },
            j_abn_photoalbum = {
                name = "相册",
                text = {
                    "{C:attention}数字牌{}计分时",
                    "手牌中每张{C:attention}人头牌{}",
                    "这张小丑牌获得{C:chips}+#2#{}筹码",
                    "如果打出的牌包含{C:attention}人头牌{}则重置",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                }
            },
            j_abn_photodegradation = {
                name = "光降解",
                text = {
                    {
                        "如果打出的牌包含{C:attention}光谱{}",
                        "手牌中每有一张{C:attention}匹配花色{}的牌",
                        "这张小丑牌获得{C:chips}+#4#{}筹码和{C:mult}+#5#{}倍率",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}版本{}",
                        "匹配花色时获得{X:mult,C:white}X#6#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#3#{C:inactive}倍率，{C:mult}+#2#{C:inactive}倍率，{C:chips}+#1#{C:inactive}筹码）",
                    },
                }
            },
            j_abn_pincushion_joker = {
                name = "针垫小丑",
                text = {
                    "重新触发{C;attention}左侧{}的小丑牌",
                    "小丑牌被重新触发时获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                }
            },
            j_abn_pixelgrid_joker = {
                name = "像素网格",
                text = {
                    "如果打出的牌包含",
                    "{C:attention}偶数{}张计分牌",
                    "这张小丑牌获得{C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                }
            },
            j_abn_planet_joker = {
                -- 卡面美术疑似源自“武器A”。是一个早期在网络（如哔哩哔哩等平台）上流传的著名猎奇与精神污染类视频。它原本是日本网络上用来恶搞和攻击特定人物的短片，因诡异的画面和叫声给许多观众留下心理阴影
                name = "行星小丑",
                text = {
                    "如果以{C:attention}一次{}出牌",
                    "击败{C:attention}Boss盲注{}",
                    "所有{C:legendary,E:1}牌型{}",
                    "提升{C:attention}#1#{}级",
                }
            },
            j_abn_planet_rejok = {
                name = "行星丑小",
                text = {
                    "给予打出的牌中",
                    "包含的所有{C:attention}牌型{}的",
                    "{C:mult}倍率{}和{C:chips}筹码{}",
                }
            },
            j_abn_planetarian_joker = {
                name = "行星学家",
                text = {
                    {
                        "使用{C:planet}星球牌{}时，获得其",
                        "筹码和倍率数值",
                        "{C:inactive}(当前 {C:blue}+#1#{C:inactive} 和 {C:red}+#2#{C:inactive})",
                    },
                    {
                        "使用{C:attention}#3# {C:inactive}[#4#]{}张不同的",
                        "{C:abn_tie}点数星球牌{}后，",
                        "生成一张{C:spectral}黑洞{}牌",
                        "{C:inactive}(需有空间)",
                    },
                },
            },
            j_abn_planetary_joker = {
                name = "星球小丑",
                text = {
                    "在回合的{C:attention}最后一次出牌{}中",
                    "生成打出的{C:attention}牌型{}的{C:planet}星球{}牌",
                }
            },
            j_abn_planetoid_joker = {
                name = "小行星小丑",
                text = {
                    "在第一次打出的{C:attention}顺子{}中",
                    "给最左侧计分牌",
                    "放置{C:abn_orange_seal}橙色蜡封{}",
                },
            },
            j_abn_plank_joker = {
                name = "木板小丑",
                text = {
                    "计分的{C:attention}木板{}牌",
                    "获得{C:gold}+#1#{}晋升强度",
                },
            },
            j_abn_plastic_joker = {
                name = "塑料小丑",
                text = {
                    "{C:abn_black_seal}石油{}牌变为{C:abn_black_seal}油田火{}牌时",
                    "提升手牌中{C:attention}点数最低{}牌的",
                    "{C:planet}星球{} {C:attention}点数{}等级",
                }
            },
            j_abn_plug_in_joker = {
                name = "插件小丑",
                text = {
                    "当{C:attention}倍率{}牌计分时获得{C:mult}+#4#{}倍率",
                    "当{C:attention}加成{}牌计分时获得{C:chips}+#5#{}筹码",
                    "当{C:attention}木板{}牌计分时获得{C:gold}+#6#{}晋升强度",
                    "{C:inactive}(当前 {C:mult}+#1#{} 倍率, {C:chips}+#2#{} 筹码, {C:gold}+#3#{} 晋升强度)",
                },
            },
            j_abn_polychameleon = {
                name = "多彩变色龙",
                text = {
                    {
                        "{C:dark_edition}镭射{}小丑牌给予{X:mult,C:white}X#1#{}倍率",
                        "{C:dark_edition}多彩{}小丑牌给予{C:mult}+#2#{}倍率",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}镭射{}版本",
                        "当{C:dark_edition}镭射/多彩{}小丑牌触发时",
                        "获得{X:chips,C:white}X#3#{}筹码",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}多彩{}版本",
                        "当{C:dark_edition}多彩/镭射{}小丑牌触发时",
                        "获得{C:chips}+#4#{}筹码",
                        "{C:inactive}（当前为{X:chips,C:white}X#6#{C:inactive}筹码，{C:chips}+#5#{C:inactive}筹码）",
                    },
                }
            },
            j_abn_polyolic_joker = {
                name = "多色小丑",
                text = {
                    {
                        "所有打出的{C:diamonds}光明{}牌",
                        "计分时变为",
                        "{C:dark_edition}#3#{}",
                    },
                    {
                        "{C:attention}完整牌组{}中每有一张",
                        "{C:dark_edition}#3#{}牌",
                        "给予{X:mult,C:white}X#1#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
                    }
                }
            },
            j_abn_pong_joker = {
                name = "乒乓球小丑",
                text = {
                    "打出仅由{C:spades}暗色{}花色组成的{C:attention}顺子{}时获得{X:chips,C:white}X#4#{}筹码",
                    "打出仅由{C:diamonds}光明{}花色组成的{C:attention}顺子{}时获得{X:mult,C:white}X#3#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率，{X:chips,C:white}X#2#{C:inactive}筹码）",
                }
            },
            j_abn_ponzi = {
                -- 查尔斯·庞兹（Charles Ponzi)是历史上最著名的诈骗犯之一，
                -- 著名的金融诈骗模式“庞氏骗局”（Ponzi Scheme）就是以他的名字命名的。他在 20 世纪 20 年代以“国际回邮卡券”套利为借口，承诺 45 天内获得 50% 的高额回报，
                -- 实际上是用后生投资者的钱支付前期投资者的利息。
                name = "庞兹",
                text = {
                    "每打出一张牌失去{C:money}$#1#{}",
                    "每张计分牌获得等同于",
                    " {C:attention}失去{}资金的{C:mult}倍率{}",
                }
            },
            j_abn_porke = {
                name = "波尔克",
                text = {
                    "每{C:attention}持有{}一种不同的消耗牌",
                    "每张小丑牌给予{X:chips,C:white}X#1#{}筹码",
                    "{C:inactive}（当前为{X:chips,C:white}X#2#{C:inactive}筹码）",
                }
            },
            j_abn_portal_joker = {
                name = "传送门小丑",
                text = {
                    "{C:attention}顺子{}可以首尾相接",
                    "{C:inactive}（例：{C:attention}Q K A 2 3{C:inactive}）",
                }
            },
            j_abn_power_four = {
                name = "四色之力",
                text = {
                    "重新触发包含{C:attention}4{}种或以上",
                    "{C:attention}花色{}的手牌中的所有牌",
                    "每使用一种不同花色",
                    "这张小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                }
            },
            j_abn_ppe_joker = {
                name = "防护装备小丑",
                text = {
                    "每张{C:red}被削弱{}的小丑牌",
                    "获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
                }
            },
            j_abn_pracheo = {
                name = "普拉奇欧",
                text = {
                    "每{C:attention}持有{}一种不同的消耗牌",
                    "牌重新触发{C:attention}1{}次",
                    "{C:inactive}（当前为{C:attention}#1#{C:inactive}次重新触发）",
                }
            },
            j_abn_prehistoric_joker = {
                name = "史前小丑",
                text = {
                    "{C:attention}石头牌{}计分时，这张小丑牌获得{C:white,X:mult}X#2#{}倍率",
                    "{C:attention}化石牌{}计分时，获得{C:white,X:chips}X#4#{}筹码",
                    "{C:inactive}（当前为{C:white,X:chips}X#3#{C:inactive}筹码，{C:white,X:mult}X#1#{C:inactive}倍率）",
                }
            },
            j_abn_prenatural_joker = {
                name = "超自然小丑",
                text = {
                    "增强的{C:attention}奇数{}牌给予{X:chips,C:white}X#4#{}筹码",
                    "每张计分牌提升{X:chips,C:white}X#3#{}筹码",
                    "{C:attention}奇数{}牌计分时",
                    "有{C:green}#1#/#2#{}几率生成{C:attention}优惠券{}",
                }
            },
            j_abn_prime_paul = {
                name = "质数保罗",
                text = {
                    "每张打出的{C:attention}#1#{}、{C:attention}#2#{}、{C:attention}#3#{}、",
                    "{C:attention}#4#{}、{C:attention}#5#{}或{C:attention}#6#{}",
                    "计分时给予{X:mult,C:white}X#7#{}倍率",
                }
            },
            j_abn_primogeniture_joker = {
                name = "长子继承",
                text = {
                    {
                        "{C:common}普通{}小丑牌{C:money}免费{}",
                        "{C:common}普通{}小丑牌",
                        "每张给予{X:mult,C:white}X#1#{}倍率",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "{C:common}普通{}小丑牌触发时",
                        "这张小丑牌获得{C:chips}+#2#{}筹码",
                        "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码）",
                    }
                }
            },
            j_abn_prizefighter_inferno = {
                name = "拳击手地狱",
                text = {
                    "当{C:attention}标签{}触发时获得{X:chips,C:white}X#3#{}筹码，",
                    "若该标签是{C:abn_hazard}险兆标签{}，则获得",
                    "{X:mult,C:white}X#4#{}倍率",
                    "{C:inactive}(当前 {X:chips,C:white}X#1#{C:inactive} 筹码, {X:mult,C:white}X#2#{C:inactive} 倍率)",
                },
            },
            j_abn_prizefighter_joker = {
                name = "拳击手",
                text = {
                    {
                        "如果打出的{C:attention}牌数量{}大于{C:attention}#1#{}",
                        "获得{C:chips}+#2#{}筹码和{C:mult}+#3#{}倍率",
                        "{C:inactive}（当前为{C:chips}+#4#{C:inactive}筹码，{C:mult}+#5#{C:inactive}倍率）",
                    },
                    {
                        "如果打出的{C:attention}牌数量{}是{C:attention}#1#{}的两倍",
                        "这张小丑牌的{C:chips}筹码{}和{C:mult}倍率{} {C:attention}翻倍{}",
                        "{C:inactive}（击败盲注时计数重置）",
                    },
                }
            },
            j_abn_propagator_joker = {
                name = "繁殖者",
                text = {
                    "每张与计分牌相同{C:attention}点数{}和{C:attention}花色{}的牌",
                    "计分牌给予{X:mult,C:white}^#3#{}倍率",
                    "有{C:green}#1#/#2#{}几率生成",
                    "{C:attention}第一张{}计分牌的复制牌",
                }
            },
            j_abn_psychokinesis_joker = {
                name = "念力小丑",
                text = {
                    {
                        "当{C:attention}第一次出牌{}计分时",
                        "留在手中的所有",
                        "{C:attention}钢铁{}和{C:attention}黄金{}牌",
                        "变为{C:dark_edition}逆转{}",
                    },
                    {
                        "计分的{C:dark_edition}逆转{}牌",
                        "给予{C:gold}$#1#",
                    },
                }
            },
            j_abn_puddles = {
                -- 原型是美国著名高个子悲伤小丑歌手 Puddles（全称 Puddles Pity Party，由音乐人 Mike Geier 扮演）。
                name = "Puddles",
                text = {
                    "右侧每张{C:attention}小丑牌{}",
                    "获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                }
            },
            j_abn_punk_joker = {
                name = "朋克小丑",
                text = {
                    {
                        "给第一张计分的{C:abn_suitless}无色{}牌",
                        "添加{C:dark_edition}负片{}版本",
                    },
                    {
                        "计分{C:dark_edition}负片{} {C:abn_suitless}无色{}牌时",
                        "这张小丑牌获得{C:white,X:chips}X#2#{}倍率",
                        "{C:inactive}（当前为{C:white,X:chips}X#1#{C:inactive}筹码）",
                    }
                }
            },
            j_abn_qrcode_joker = {
                name = "二维码",
                text = {
                    "选择{C:attention}盲注{}时",
                    "生成一张{C:program_pack}程序{}牌",
                    "{C:inactive}（必须有空位）",
                },
            },
            j_abn_quadratic_joker = {
                name = "二次小丑",
                text = {
                    {
                        "包含{C:attention}4{}种花色的{C:attention}顺子{}",
                        "从{C:attention}最低{}到{C:attention}最高{}点数获得{C:dark_edition}版本{}",
                        "{C:inactive,s:0.8}（{C:dark_edition,s:0.8}亮光{C:inactive,s:0.8}、{C:dark_edition,s:0.8}虹彩{C:inactive,s:0.8}、{C:dark_edition,s:0.8}珠光{C:inactive,s:0.8}、{C:dark_edition,s:0.8}幻彩{C:inactive,s:0.8}）",
                    },
                    {
                        "手牌中{C:attention}持有{}的牌与",
                        "计分牌有相同{C:attention}点数{}或{C:attention}花色{}时",
                        "可在计分时计数",
                    },
                },
            },
            j_abn_rage_baiter = {
                name = "愤怒诱饵",
                text = {
                    {
                        "降低打出的{C:attention}牌型{}的等级，",
                        "然后获得{C:chips}+#3#{}筹码和",
                        "{C:mult}+#4#{}倍率",
                        "{C:inactive}(当前 {C:blue}+#1#{C:inactive} 筹码和 {C:red}+#2#{C:inactive} 倍率)",
                    },
                },
            },
            j_abn_rampegous_jester = {
                name = "狂暴小丑",
                text = {
                    {
                        "如果拥有{C:attention}偶数{}张{C:rare}稀有{}小丑牌",
                        "且计分{C:attention}偶数{}张牌",
                        "这张小丑牌和所有其他{C:rare}稀有{}小丑牌",
                        "每张计分牌获得{X:mult,C:white}X#2#{}倍率",
                    },
                    {
                        "如果拥有{C:attention}奇数{}张{C:common}普通{}小丑牌",
                        "且计分{C:attention}奇数{}张牌",
                        "这张小丑牌和所有其他{C:common}普通{}小丑牌",
                        "每张计分牌获得{C:chips}+#1#{}筹码",
                    },
                },
            },
            j_abn_rando_jester = {
                name = "兰多",
                text = {
                    {
                        "计分的{C:clubs}梅花{}牌给予{X:mult,C:white}X#1#{}倍率",
                        "每当{C:clubs}梅花{}计分时提升{X:mult,C:white}X#2#{}倍率",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "计分的{C:clubs}梅花{}牌提升下一次{C:green}概率{}的{C:attention}#3#{}",
                        "{C:inactive,s:0.8}（例：{C:green,s:0.8}1/4{C:inactive,s:0.8} -> {C:green,s:0.8}2/4{C:inactive,s:0.8} -> {C:green,s:0.8}3/4{C:inactive,s:0.8}）",
                    }
                }
            },
            j_abn_random_encounter = {
                -- 一种游戏机制，
                -- 一般指JRPG游戏中在野外地图行走时随机触发切入战斗场景的机制。
                name = "随机遭遇",
                text = {
                    {
                        "其他{C:attention}小丑牌{}的{C:chips}+筹码{}效果计分时",
                        "这张小丑牌获得{C:mult}+#1#{}倍率",
                    },
                    {
                        "击败{C:attention}盲注{}时",
                        "倍率增加{C:mult}+#2#{}",
                    }
                }
            },
            j_abn_ransom_joker = {
                name = "赎金小丑",
                text = {
                    {
                        "回合结束时每拥有一张",
                        "小丑牌失去{C:money}$#3#{}",
                    },
                    {
                        "{C:attention}小丑牌{}被售出",
                        "或摧毁时，有{C:green}#1#/#2#{}几率",
                        "生成一张{C:attention}更高稀有度{}的小丑牌",
                    },
                }
            },
            j_abn_ransomware_joker = {
                name = "勒索软件",
                text = {
                    "使用特定{C:attention}消耗牌{}时应用以下效果：",
                    "{C:tarot}塔罗{}：所有小丑牌获得{C:chips}+#1#{}筹码，失去{C:money}$#2#{}",
                    "{C:spectral}幻灵{}：所有小丑牌获得{C:chips}+#3#{}筹码，失去{C:money}$#4#{}",
                    "{C:abn_calamity}灾厄{}：所有小丑牌筹码值乘以{X:chips,C:white}^#5#{}，失去{C:money}$#6#{}",
                    "{C:abn_snow}天气预报{}：所有小丑牌获得{C:mult}+#7#{}倍率，失去{C:money}$#8#{}",
                    "{C:astro_cards}星座{}：所有小丑牌获得{C:mult}+#9#{}倍率，失去{C:money}$#10#{}",
                    "{C:nightshift_cards}夜班{}：所有小丑牌倍率值乘以{X:mult,C:white}^#11#{}",
                }
            },
            j_abn_rectangular_joker = {
                name = "矩形小丑",
                text = {
                    "若打出的牌型恰好有",
                    "{C:attention}6{}张计分牌，",
                    "则这张小丑牌获得{C:gold}+#2#{}晋升强度",
                    "{C:inactive}(当前 {C:gold}+#1#{C:inactive} 晋升强度)",
                },
            },
            j_abn_recycled_joker = {
                name = "回收小丑",
                text = {
                    "{C:attention}弃掉{}的牌",
                    "返回牌组",
                }
            },
            j_abn_regalia_joker = {
                name = "王权",
                text = {
                    {
                        "如果{C:attention}牌型{}是{C:attention}#2#{}或{C:attention}#3#{}",
                        "获得{C:money}$#1#{}",
                    },
                    {
                        "如果{C:attention}牌型{}是{C:attention}#3#{}",
                        "提升所有计分牌的{C:planet}星球{} {C:attention}点数{}等级",
                    }
                }
            },
            j_abn_reggy_jester = {
                name = "雷吉",
                text = {
                    {
                        "计分的{C:abn_snow}雪{}牌给予{X:mult,C:white}X#1#{}倍率",
                        "每当{C:abn_snow}雪{}计分时提升{X:mult,C:white}X#2#{}倍率",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "计分的{C:abn_snow}雪{}牌降低",
                        "{C:attention}盲注需求{} {C:attention}#3#%{}",
                    }
                }
            },
            j_abn_rekoj_esrever = {
                -- Rekoj Esrever 是 "Reverse Joker" 的反向拼写。
                name = "丑小转反",
                text = {
                    {
                        "计分的{C:attention}翻转{}牌",
                        "计分后翻至正面朝上",
                    },
                    {
                        "每张{C:attention}翻回{}的牌",
                        "这张小丑牌获得{C:mult}+#2#{}倍率和{C:chips}+#3#{}筹码",
                        "{C:inactive}（当前为{C:chips}+#4#{C:inactive}筹码，{C:mult}+#1#{C:inactive}倍率）",
                    },
                }
            },
            j_abn_respectable = {
                name = "体面小丑",
                text = {
                    "当第一张{C:attention}未增强{}牌",
                    "计分时",
                    "这张小丑牌获得其",
                    "{C:attention}点数{}的{C:mult}倍率{}",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                }
            },
            j_abn_reversecard_joker = {
                -- UNO游戏中有一张“反转牌”，当玩家打出这张牌时，游戏的出牌顺序会发生反转。
                name = "反转牌",
                text = {
                    {
                        "如果打出的牌同时包含",
                        "{C:attention}翻转{}和{C:attention}正面朝上{}牌",
                        "翻转所有计分牌",
                    },
                    {
                        "{C:attention}翻回{}的牌获得其{C:attention}点数{}作为{C:chips}筹码{}",
                        "{C:attention}翻面{}的牌获得其{C:attention}点数{}作为{C:mult}倍率{}",
                        "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率，{C:chips}+#1#{C:inactive}筹码）",
                    },
                    {
                        "如果这张小丑牌是{C:attention}翻转{}的",
                        "{C:attention}翻转{}牌获得双倍",
                        "{C:chips}筹码{}和{C:mult}倍率{}",
                    },
                }
            },
            j_abn_richard = {
                name = "理查德",
                text = {
                    {
                        "迫使{C:attention}1{}张牌",
                        "总是被选中",
                    },
                    {
                        "{C:attention}强制选中{}的牌给予{X:mult,C:white}X#1#{}倍率",
                        "每张{C:attention}持有{}的牌与强制选中牌",
                        "共享一种{C:attention}花色{}时，重新触发一次",
                    }
                }
            },
            j_abn_ridiculous_joker = {
                name = "荒唐小丑",
                text = {
                    {
                        "如果{C:attention}打出{}的所有牌都是{C:attention}偶数{}",
                        "且{C:attention}手牌{}中所有牌都是{C:attention}奇数{}",
                        "获得等同于所有牌点数之和的{C:mult}倍率{}",
                    },
                    {
                        "如果{C:attention}打出{}的所有牌都是{C:attention}奇数{}",
                        "且{C:attention}手牌{}中所有牌都是{C:attention}偶数{}",
                        "获得等同于所有牌点数之和的{C:chips}筹码{}",
                        "{C:inactive}（当前为{C:red}+#1#{C:inactive}倍率，{C:blue}+#2#{C:inactive}筹码）",
                    },
                },
            },
            j_abn_rival_photograph = {
                name = "对比照片",
                text = {
                    "打出的第一张{C:attention}数字牌{}",
                    "计分时给予{X:mult,C:white}X#1#{}倍率",
                },
            },
            j_abn_robert_jester = {
                name = "罗伯特",
                text = {
                    {
                        "计分的{C:clubs}梅花{}牌给予{X:chips,C:white}X#1#{}筹码",
                        "每当{C:clubs}梅花{}计分时提升{X:chips,C:white}X#2#{}筹码",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "打出的{C:clubs}梅花{}牌计分时",
                        "每剩余一次弃牌永久获得{C:money}$#3#{}",
                    }
                }
            },
            j_abn_rom_hack_balatro = {
                name = "ROM改版的小丑牌",
                text = {
                    "{C:attention}基础{}小丑牌每张给予",
                    "{X:mult,C:white}X#1#{}倍率、{X:chips,C:white}X#2#{}筹码和{C:money}$#3#{}",
                }
            },
            j_abn_rough_draft_joker = {
                name = "草稿小丑",
                text = {
                    "计分的{C:attention}幸运{} {C:abn_suitless}无色{}牌：",
                    "有{C:green}#1#/#2#{}几率获得{C:chips}+#5#{}筹码",
                    "有{C:green}#1#/#3#{}几率获得{C:chips}+#6#{}筹码",
                    "有{C:green}#1#/#4#{}几率{C:attention}翻倍{}",
                    "所有计分牌的{C:chips}筹码{}",
                }
            },
            j_abn_royal_order = {
                name = "皇家秩序",
                text = {
                    "如果计分牌按以下顺序排列",
                    "{C:hearts}红桃{} {C:diamonds}方块{} {C:clubs}梅花{} {C:spades}黑桃{}",
                    "打出的牌型提升{C:attention}#1#{}级",
                    "并获得{X:mult,C:white}X#2#{}倍率",
                }
            },
            -- 原型是《最终幻想 IV》（Final Fantasy IV）中的Boss——“火之四天王”鲁比坎特（Rubicante / 炎のルビカンテ）。
            j_abn_rubicante = {
                name = "鲁比坎特",
                text = {
                    "{C:attention}偶数{}计分牌获得",
                    "其点数{C:attention}三倍{}的{C:mult}倍率{}",
                }
            },
            j_abn_ruin_bastion = {
                name = "废墟堡垒",
                text = {
                    "选择{C:attention}盲注{}时",
                    "给{C:attention}最右侧{}的小丑牌",
                    "添加{C:dark_edition}#1#{}版本",
                }
            },
            j_abn_ruination_joker = {
                name = "毁灭小丑",
                text = {
                    {
                        "计分手牌中每有一种{C:attention}不同{}花色",
                        "打出的牌给予{X:mult,C:white}^1.8{}倍率和{X:chips,C:white}^1.8{}筹码",
                    },
                    {
                        "如果打出的牌包含{C:attention}光谱{}",
                        "{C:attention}提升{}每张牌的{C:planet}星球{} {C:attention}点数{}等级",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}版本{}",
                        "重新触发所有打出的牌",
                    },
                }
            },
            j_abn_ruinous_joker = {
                name = "业力小丑",
                text = {
                    "{C:attention}+#1#{}个业力槽位",
                    "如果因{C:abn_black_seal}毁灭牌{}而{C:mult}输掉赛局{}",
                    "{C:mult}摧毁{}这张小丑牌来代替",
                }
            },
            j_abn_runedelta = {
                -- 《Deltarune》是一款由独立游戏制作人Toby Fox开发的章节式电子角色扮演游戏，为其2015年作品《Undertale》的后续作品。
                name = "三角符文",
                text = {
                    "如果{C:attention}获胜牌型{}只含{C:spades}暗色花色{}",
                    "这张小丑牌获得{C:mult}+#3#{}倍率",
                    "如果只含{C:diamonds}光明花色{}",
                    "获得{C:chips}+#4#{}筹码",
                    "{C:red,s:0.8}手牌同时包含光明和暗色花色时自毁{}",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                }
            },
            j_abn_runedelta_disc2 = {
                -- 有些游戏会进行分盘，例如《Deltarune》在Switch平台上就分为两盘，第一盘是“Runedelta Disc 1”，第二盘是“Runedelta Disc 2”。本小丑牌的美术原型来自于《Deltarune》的第二盘。
                name = "三角符文光盘2",
                text = {
                    {
                        "第一张计分的带有{C:dark_edition}版本{}的{C:inactive}点数{}牌",
                        "每有一张相同{C:dark_edition}版本{}的小丑牌",
                        "重新触发一次，每重新触发一次",
                        "这张小丑牌获得{C:inactive}奖励{}",
                    },
                    {
                        "{C:inactive}（例：点数：奖励）",
                        "{C:attention}偶数{}：{X:mult,C:white}X#3#{}倍率",
                        "{C:attention}奇数{}：{X:chips,C:white}X#4#{}筹码",
                        "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率，{X:chips,C:white}X#2#{C:inactive}筹码）",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}版本{}",
                        "带有{C:dark_edition}版本{}的{C:attention}小丑牌{}不会被{C:red}削弱{}",
                    }
                }
            },
            j_abn_russian_roulette = {
                name = "俄罗斯轮盘赌",
                text = {
                    "所有{C:attention}补充包{}售价{C:money}$1{}，但其中的消耗牌有{C:green}#1#/#2#{}几率{C:mult}失效{}",
                    "所有{C:attention}小丑牌{}售价{C:money}$1{}，但购买后获得{C:mult}易碎{}效果",
                    "当{C:green}几率{}成功时，获得{C:money}$#3#{}",
                },
            },
            j_abn_sacred_bleu = {
                name = "神圣蓝",
                text = {
                    "打出的手牌中每有一种不同{C:attention}花色{}",
                    "这张小丑牌获得{C:white,X:chips}X#2#{}筹码",
                    "每有一种不同{C:attention}点数{}",
                    "获得{C:chips}+#4#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码，{C:white,X:chips}X#1#{C:inactive}筹码）",
                },
            },
            j_abn_sacred_rouge = {
                name = "神圣红",
                text = {
                    "打出的手牌中每有一种不同{C:attention}花色{}",
                    "这张小丑牌获得{C:white,X:mult}X#2#{}倍率",
                    "每有一种不同{C:attention}点数{}",
                    "获得{C:mult}+#4#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率，{C:white,X:mult}X#1#{C:inactive}倍率）",
                }
            },
            j_abn_sailor_joker = {
                name = "水手小丑",
                text = {
                    {
                        "打出的{C:attention}奇数{}牌",
                        "打出但不计分时",
                        "给予{C:chips}+#1#{}筹码",
                    },
                    {
                        "重新触发所有",
                        "打出的{C:attention}海洋{}牌",
                    }
                }
            },
            j_abn_salvation_tag = {
                name = "救赎标签",
                text = {
                    "每当获得{C:attention}原版{}标签时，",
                    "将其转化为{C:abn_hazard}险兆{}变体",
                },
            },
            j_abn_sanguine_treasure = {
                name = "血色宝藏",
                text = {
                    "计分的{C:attention}黄金{}牌给予",
                    "双倍的{C:chips}筹码{}和{C:money}资金{}",
                },
            },
            j_abn_saturated_joker = {
                name = "饱和小丑",
                text = {
                    {
                        "打出的{C:abn_coin}币{}、{C:abn_baton}杖{}、",
                        "{C:abn_chalice}圣杯{}和{C:abn_sword}剑{}牌",
                        "计分时永久获得{C:mult}+#1#{}倍率",
                    },
                    {
                        "每张带有{C:dark_edition}复古{}版本的计分牌",
                        "这张小丑牌获得{C:chips}#2#{}筹码",
                        "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码）",
                    },
                },
            },
            j_abn_savy_joker = {
                name = "精明小丑",
                text = {
                    "若打出的牌型包含",
                    "{C:attention}#2#张偶数{}牌，",
                    "则获得{C:mult}+#1#{}倍率",
                },
            },
            j_abn_scantron_joker = {
                -- 阅卷机是一种用于自动读取和判定考试答题卡分数的电子设备，主要通过光学原理快速处理客观题。
                name = "阅卷机",
                text = {
                    "计分的{C:attention}幸运{}牌或{C:attention}黄金{}牌给予{X:chips,C:white}^#1#{}筹码",
                    "计分的{C:attention}奖励{}牌或{C:attention}万能{}牌给予{X:mult,C:white}^#2#{}倍率",
                }
            },
            j_abn_scrabble_joker = {
                name = "拼字小丑",
                text = {
                    "每次激活{C:lexica}辞典{}牌时",
                    "这张小丑牌获得",
                    "{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                },
            },
            j_abn_scrapbook_joker = {
                name = "剪贴簿小丑",
                text = {
                    {
                        "选择{C:attention}盲注{}时",
                        "每张{C:attention}小丑牌{}上的每个{C:attention}贴纸{}",
                        "获得{C:chips}+#1#{}筹码",
                    },
                }
            },
            j_abn_seal_edition_joker = {
                name = "蜡封版本小丑",
                text = {
                    "计分手牌中每有一种不同{C:attention}蜡封{}",
                    "每张小丑牌获得{C:mult}+#1#{}倍率",
                }
            },
            j_abn_seal_letter = {
                name = "蜡封信",
                text = {
                    "重新触发所有打出的",
                    "带有{C:red}红色蜡封{}的牌",
                },
            },
            j_abn_shadowy_joker = {
                name = "阴影小丑",
                text = {
                    "商店中所有牌和补充包",
                    "{C:attention}#1#%{}折扣",
                    "所有{C:attention}牌{}和{C:attention}小丑牌{}",
                    "均为翻转状态",
                }
            },
            j_abn_sharpshooter = {
                name = "神枪手",
                text = {
                    "计分手牌中每有一张{C:attention}万能牌{}",
                    "重新触发所有打出的{C:attention}万能牌{}",
                    "有{C:green}#1#/#2#{}几率",
                    "摧毁打出的{C:attention}万能牌{}",
                }
            },
            j_abn_sherlock_joker = {
                name = "福尔摩斯", -- 夏洛克·福尔摩斯（Sherlock Holmes）是英国作家亚瑟·柯南·道尔笔下著名的虚构咨询侦探。
                text = {
                    {
                        "揭示选定的",
                        "{C:attention}翻转{}牌的名称",
                        "{C:inactive}（#1#）",
                    },
                    {
                        "揭示下一张",
                        "将要{C:attention}抽取{}的牌",
                        "{C:inactive}（#2#）",
                    },
                }
            },
            j_abn_shovel_knight = {
                -- 《铲子骑士》是由Yacht Club Games开发并发行的一款8-bit风格横版动作冒险游戏，
                -- 于2014年6月27日发售。
                -- 玩家扮演铲子骑士，
                -- 使用多功能铲子进行战斗与挖掘，
                -- 为拯救同伴盾牌骑士而对抗无情骑士团。
                name = "铲子骑士",
                text = {
                    "选择{C:attention}盲注{}时",
                    "向牌组中添加一张",
                    "{C:attention}化石{}牌",
                },
            },
            j_abn_shrewd_joker = {
                name = "机敏小丑",
                text = {
                    "若打出的牌型包含",
                    "{C:attention}#2#张奇数{}牌，",
                    "则获得{C:chips}+#1#{}筹码",
                },
            },
            j_abn_shy_gall = {
                name = "羞怯的胆小鬼",
                text = {
                    "将所有完全由{C:attention}翻转{}牌组成的",
                    "{C:attention}牌型{}升级",
                },
            },
            j_abn_sigil_joker = {
                name = "符印小丑",
                text = {
                    {
                        "选择{C:attention}Boss盲注{}时",
                        "为{C:attention}最后一次打出{}的牌型",
                        "生成一张{C:sigils}符印{}牌",
                    },
                    {
                        "{C:sigils}符印包{}可以被跳过",
                    }
                }
            },
            j_abn_slippery_joker = {
                name = "滑溜小丑",
                text = {
                    {
                        "使用{C:weather_report}天气预报{}牌时",
                        "给手牌中{C:attention}点数最低{}的牌",
                        "添加{C:dark_edition}荒废{}版本",
                    },
                    {
                        "{C:dark_edition}荒废{}牌计分时",
                        "这张小丑牌获得{C:chips}+#4#{}筹码",
                        "和{C:mult}+#2#{}倍率",
                        "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码，{C:mult}+#1#{C:inactive}倍率）",
                    },
                }
            },
            j_abn_slot_machine = {
                name = "老虎机",
                text = {
                    {
                        "{C:green,E:1,S:1.1}概率{}判定总是{C:green}成功{}",
                        "但每次花费{C:money}$5{}",
                        "除非拥有{C:attention}黄金小丑",
                    },
                    {
                        "如果{C:attention}牌型{}是{C:attention}#2#{}",
                        "重新触发并提升",
                        "对应打出的牌型等级",
                    },
                }
            },
            j_abn_snoozing_joker = {
                name = "酣睡小丑",
                text = {
                    "{C:planet}星球牌{}提供",
                    "{C:red}%#1#{}更多倍率",
                },
            },
            j_abn_snow_comedian = {
                name = "雪•喜剧演员",
                text = {
                    {
                        "如果打出的牌包含{C:attention}偶数{} {C:abn_snow}雪{}牌",
                        "这张小丑牌获得{C:mult}+#3#{}倍率",
                        "如果打出的牌包含{C:attention}奇数{} {C:abn_snow}雪{}牌",
                        "获得{C:chips}+#4#{}筹码",
                        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                    },
                    {
                        "如果打出的牌是{C:attention}同花{}",
                        "且只含{C:abn_snow}雪{}牌",
                        "提升所有计分牌的{C:planet}星球{} {C:attention}点数{}等级",
                    },
                }
            },
            j_abn_snow_route = {
                name = "雪路",
                text = {
                    "打出的{C:abn_snow}雪{}花色牌",
                    "有{C:green}#1#/#2#{}几率",
                    "{C:attention}提升{}打出的牌型等级",
                }
            },
            j_abn_spanish_joker = {
                name = "西班牙小丑",
                text = {
                    {
                        "{s:0.8}计分的{C:hearts,s:0.8}红桃{s:0.8}变为{C:abn_coin,s:0.8}币{}",
                        "{s:0.8}计分的{C:diamonds,s:0.8}方块{s:0.8}变为{C:abn_baton,s:0.8}杖{}",
                        "{s:0.8}计分的{C:clubs,s:0.8}梅花{s:0.8}变为{C:abn_chalice,s:0.8}圣杯{}",
                        "{s:0.8}计分的{C:spades,s:0.8}黑桃{s:0.8}变为{C:abn_sword,s:0.8}剑{}",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}复古{}版本",
                        "每张计分的{C:abn_coin}币{}、{C:abn_baton}杖{}、",
                        "{C:abn_chalice}圣杯{}或{C:abn_sword}剑{}",
                        "获得{C:mult}+#2#{}倍率",
                        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                    },
                }
            },
            j_abn_spare_bikini = {
                name = "备用比基尼",
                text = {
                    "若打出的牌型包含{C:attention}#3#{}，",
                    "则这张小丑牌获得{C:mult}+#2#{}倍率",
                    "和{C:chips}+#7#{}筹码；若牌型包含",
                    "{C:attention}5{}种{C:attention}不同花色{}，",
                    "获得{C:gold}+#5#{}晋升强度",
                    "{C:inactive}(当前 {C:chips}+#6#{C:inactive} 筹码, {C:mult}+#1#{C:inactive} 倍率, {C:gold}+#4#{C:inactive} 晋升强度)",
                },
            },
            j_abn_spare_coat = {
                name = "备用外套",
                text = {
                    {
                        "若打出的牌型包含{C:attention}#3#{}，",
                        "则这张小丑牌获得{C:chips}+#6#{}筹码",
                        "和{C:mult}+#2#{}倍率",
                        "{C:inactive}(当前 {C:chips}+#5#{C:inactive} 筹码, {C:mult}+#1#{C:inactive} 倍率)",
                    },
                    {
                        "若包含{C:attention}#3#{}的牌型中",
                        "至少有一张{C:abn_snow}雪{}牌，则",
                        "留在手牌中的每张{C:abn_snow}雪{}牌",
                        "各获得{C:purple}+#4#{}计分",
                    },
                },
            },
            j_abn_spare_overall = {
                name = "备用工装裤",
                text = {
                    {
                        "如果打出的牌包含",
                        "{C:attention}#2#{}",
                        "这张小丑牌获得{C:red}+#1#{}倍率",
                        "{C:inactive}（当前为{C:red}+#3#{C:inactive}倍率）",
                    },
                    {
                        "{C:attention}奇数奖励{}牌计分时",
                        "永久获得{C:chips}+#4#{}筹码",
                        "{C:attention}偶数倍率{}牌计分时",
                        "永久获得{C:mult}+#5#{}倍率",
                    }
                }
            },
            j_abn_spare_suit = {
                name = "备用花色",
                text = {
                    "如果打出的牌包含{C:attention}#3#{}",
                    "这张小丑牌获得{C:mult}+#2#{}倍率",
                    "重新触发打出的{C:attention}水星牌{}",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                }
            },
            j_abn_spawn_joker = {
                name = "再生小丑",
                text = {
                    {
                        "计分的{C:attention}6{}和{C:attention}4{}",
                        "变为{C:dark_edition}负片{}",
                    },
                    {
                        "{C:dark_edition}负片{}牌",
                        "计分时给予其点数两倍的筹码",
                    },
                    {
                        "打出的{C:attention}红外{}牌",
                        "有{C:green}#1#/#2#{}几率",
                        "提升计分牌型等级",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}负片{}版本",
                        "并且分数{C:attention}着火{}时",
                        "手牌中所有牌",
                        "变为{C:dark_edition}负片{}",
                    }
                }
            },
            j_abn_spice_melange = {
                name = "香料混合物",
                text = {
                    "接下来{C:attention}#1#{}次出牌",
                    "重新触发{C:attention}左侧{}的小丑牌",
                }
            },
            j_abn_spilling_salt = {
                name = "撒盐",
                text = {
                    "计分的{C:red}被削弱{}牌",
                    "其{C:planet}星球{} {C:attention}点数{}等级",
                    "提升{C:attention}1{}级",
                }
            },
            j_abn_square_rekoj = {
                name = "方形丑小",
                text = {
                    "如果打出的牌正好",
                    "有{C:attention}4{}张计分牌",
                    "这张小丑牌获得{C:chips}+#2#{}筹码",
                    "和{C:white,X:mult}X#4#{}倍率",
                    "{C:inactive}（当前为{C:chips}#1#{C:inactive}筹码，{C:white,X:mult}X#3#{C:inactive}倍率）",
                }
            },
            j_abn_statue_joker = {
                name = "雕像小丑",
                text = {
                    "每张计分的{C:attention}无点数{}牌获得{C:mult}+#2#{}倍率",
                    "{C:attention}石头{}牌获得{C:dark_edition}幻彩{}",
                    "{C:attention}石油{}牌获得{C:dark_edition}胶棉{}",
                    "{C:attention}波尔卡点{}牌获得{C:dark_edition}亮光{}",
                    "{C:attention}油田火{}牌获得{C:dark_edition}荒废{}",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                }
            },
            j_abn_steel_gold = {
                name = "钢铁黄金牌",
                text = {
                    {
                        "若打出的牌型同时包含{C:attention}钢铁{}牌",
                        "和{C:attention}黄金{}牌，它们各获得",
                        "{C:gold}+#1#{}晋升强度和{C:purple}+#2#{}计分",
                    },
                    {
                        "触发时，{C:enhanced}钢铁{} {C:attention}小丑牌{}获得",
                        "{X:mult,C:white}X#3#{}倍率，{C:enhanced}黄金{}",
                        "{C:attention}小丑牌{}获得{X:chips,C:white}X#4#{}筹码",
                    },
                    {
                        "选择{C:attention}大盲注{}时，生成",
                        "本局最后使用的{C:periodic}元素周期{}牌",
                        "{C:inactive}当前：{C:periodic}#5#{}",
                    },
                },
            },
            j_abn_stereogram = {
                name = "立体图",
                text = {
                    "计分的{C:attention}数字牌{}",
                    "按{C:white,X:abn_plasma}#1#%{}平衡{C:chips}筹码{}和{C:mult}倍率{}",
                }
            },
            j_abn_sticky_fingers = {
                name = "粘手",
                text = {
                    "{C:tarot}塔罗{}、{C:planet}星球{}和{C:spectral}幻灵{}牌",
                    "可以从{C:attention}补充包{}中",
                    "{C:attention}保留{}",
                },
            },
            j_abn_stone_bonus = {
                name = "石之加成牌",
                text = {
                    {
                        "若打出的牌型同时包含{C:attention}石头{}牌",
                        "和{C:attention}加成{}牌，它们各获得",
                        "{C:gold}+#1#{}晋升强度和{C:purple}+#2#{}计分",
                    },
                    {
                        "触发时，{C:enhanced}石头{}{C:attention}小丑{}获得",
                        "{X:mult,C:white}X#3#{}倍率，{C:enhanced}加成{}",
                        "{C:attention}小丑牌{}获得{X:chips,C:white}X#4#{}筹码",
                    },
                    {
                        "选择{C:attention}大盲注{}时，生成",
                        "本局最后使用的{C:lexica}辞典{}牌",
                        "{C:inactive}当前：{C:lexica}#5#{}",
                    },
                },
            },
            j_abn_stone_calendar = {
                name = "石头日历",
                text = {
                    {
                        "{C:attention}石头{}和{C:attention}石油{}牌",
                        "保留其点数和花色",
                    },
                    {
                        "如果手牌由{C:attention}石头{}牌组成",
                        "且至少有{C:attention}4{}种不同花色",
                        "获得{X:chips,C:white}X#1#{}筹码",
                        "{C:inactive}（当前为{X:blue,C:white}X#2#{C:inactive}筹码）",
                    },
                    {
                        "{C:attention}石油{}牌触发时",
                        "有{C:green}#3#/#4#{}几率",
                        "生成一张{C:astro_cards}星座{}牌",
                        "{C:inactive}（必须有空位）",
                    },
                    {
                        "打出至少{C:attention}2{}张奇数{C:attention}石头{}牌和",
                        "{C:attention}2{}张偶数{C:attention}石油{}牌时",
                        "在下一个{C:attention}盲注{}之前",
                        "必定生成{C:astro_cards}星座{}牌",
                    },
                },
            },
            j_abn_stone_gold = {
                name = "石之黄金牌",
                text = {
                    {
                        "若打出的牌型同时包含{C:attention}石头{}牌",
                        "和{C:attention}黄金{}牌，它们各获得",
                        "{C:gold}+#1#{}晋升强度和{C:purple}+#2#{}计分",
                    },
                    {
                        "触发时，{C:enhanced}石头{}{C:attention}小丑{}获得",
                        "{X:mult,C:white}X#3#{}倍率，{C:enhanced}黄金{}",
                        "{C:attention}小丑牌{}获得{X:chips,C:white}X#4#{}筹码",
                    },
                    {
                        "选择{C:attention}大盲注{}时，生成",
                        "本局最后使用的{C:solid_state}固态{}牌",
                        "{C:inactive}当前：{C:solid_state}#5#{}",
                    },
                },
            },
            j_abn_stone_mult = {
                name = "石之倍率",
                text = {
                    {
                        "若打出的牌型同时包含{C:attention}石头{}牌",
                        "和{C:attention}倍率{}牌，它们各获得",
                        "{C:gold}+#1#{}晋升强度和{C:purple}+#2#{}计分",
                    },
                    {
                        "触发时，{C:enhanced}石头{} {C:attention}小丑{}获得",
                        "{X:mult,C:white}X#3#{}倍率，{C:enhanced}倍率{}",
                        "{C:attention}小丑牌{}获得{X:chips,C:white}X#4#{}筹码",
                    },
                    {
                        "选择{C:attention}大盲注{}时，生成",
                        "本局最后使用的{C:algebraic}代数{}牌",
                        "{C:inactive}当前：{C:algebraic}#5#{}",
                    },
                },
            },
            j_abn_stop_sign = {
                name = "停止标志",
                text = {
                    "{C:attention}商店{}不再出现{C:attention}小丑牌{}",
                    "你可以从所有{C:attention}小丑包{}中",
                    "选择最多{C:attention}2{}张牌",
                }
            },
            j_abn_streetart_joker = {
                name = "街头艺术",
                text = {
                    "石头牌保留其",
                    "{C:attention}点数{}和{C:attention}花色{}",
                }
            },
            j_abn_strickland_joker = {
                -- 原型是美国动画《山丘之王》（King of the Hill）的主角——汉克·希尔（Hank Hill）
                -- 以及他工作的公司——斯特里克兰丙烷公司（Strickland Propane）。
                name = "斯特里克兰",
                text = {
                    "每张{C:attention}打出{}的牌获得{C:red}+#1#{}倍率",
                    "分数{C:red,E:2}着火{}时重置",
                    "{C:inactive}（当前为{C:red}+#2#{C:inactive}倍率）",
                }
            },
            j_abn_stuntdouble = {
                name = "特技替身",
                text = {
                    {
                        "{C:mult}+#1#{}倍率",
                        "{C:attention}-#2#{}手牌上限",
                    },
                    {
                        "如果拥有{C:attention}特技演员{}",
                        "获得{C:attention}+#3#{}手牌上限",
                    },
                },
            },
            j_abn_stygian_joker = {
                name = "冥河小丑",
                text = {
                    {
                        "打出的{C:hearts}红桃{}花色牌",
                        "有{C:green}#3#/#4#{}几率",
                        "获得{C:dark_edition}幽冥{}",
                    },
                    {
                        "{C:attention}完整牌组{}中每有一张{C:dark_edition}幽冥{}牌",
                        "给予{X:mult,C:white}X#1#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
                    },
                },
            },
            j_abn_suit_eradication = {
                name = "花色根除",
                text = {
                    {
                        "摧毁每张计分的{C:hearts}红桃{}、{C:diamonds}方块{}、",
                        "{C:spades}黑桃{}和{C:clubs}梅花{}牌",
                        "获得等同于被摧毁牌{C:attention}点数{}的{C:chips}筹码{}",
                        "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                    },
                    {
                        "生成一张与被摧毁牌相同{C:attention}点数{}的随机牌",
                        "花色为{V:1}雪{}、{V:2}和{}、",
                        "{V:3}半影{}或{V:4}弓{}",
                    },
                }
            },
            j_abn_suit_seal_joker = {
                name = "花色蜡封小丑",
                text = {
                    {
                        "如果手牌有{C:attention}4{}种不同花色",
                        "给所有没有蜡封的",
                        "{C:spades}暗色{}花色牌添加{C:abn_violet_seal}紫色蜡封{}",
                        "给所有没有蜡封的",
                        "{C:diamonds}光明{}花色牌添加{C:abn_brown_seal}棕色蜡封{}",
                    },
                    {
                        "每张打出的带有蜡封的{C:diamonds}光明{}花色牌",
                        "这张小丑牌获得{C:chips}+#4#{}筹码和{C:mult}+#3#{}倍率",
                        "每张打出的带有蜡封的{C:spades}暗色{}花色牌",
                        "获得{C:chips}+#3#{}筹码和{C:mult}+#4#{}倍率",
                        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                    },
                }
            },
            j_abn_super_eight = {
                name = "超级8",
                text = {
                    "{C:attention}8{}不能被{C:mult}削弱{}，并被视为所有{C:attention}原版{}花色",
                    "计分的{C:attention}8{}的{C:attention}点数{}的两倍作为{C:mult}倍率{}",
                    "若没有{C:attention}8{}计分，则{C:mult}摧毁{}此小丑牌",
                    "{C:inactive}当前：{C:mult}+#1#{} 倍率",
                },
            },
            j_abn_superhero = {
                name = "超级英雄",
                text = {
                    {
                        "每张打出的{C:attention}翻转数字牌{}",
                        "变为{C:attention}翻回{}并计分时",
                        "给予其点数作为{C:mult}倍率{}",
                    },
                    {
                        "如果打出的牌包含{C:attention}#1#{}",
                        "且所有牌都是{C:attention}背面朝上{}",
                        "生成这张小丑牌的{C:dark_edition}负片{}复制牌",
                    }
                }
            },
            j_abn_supermember_card = {
                name = "超级会员卡",
                text = {
                    "小丑牌将其{C:attention}售价{}",
                    "作为{C:mult}倍率{}",
                },
            },
            j_abn_suspicious_icon = {
                name = "可疑图标",
                text = {
                    "选择{C:attention}盲注{}时",
                    "{C:mult}摧毁{} {C:attention}#1#{}张非{C:abn_plagued}瘟疫缠身{}小丑牌",
                    "并生成{C:attention}#1#{}张{C:abn_plagued}瘟疫缠身{}小丑牌",
                }
            },
            j_abn_sweepstakes_card = {
                name = "抽奖牌",
                text = {
                    "商店价格降低{C:attention}#1#%{}",
                    "{C:attention}模组{}小丑牌售价{C:money}$1{}",
                },
            },
            j_abn_symbol_of_peace = {
                -- 原型是动漫《我的英雄学院》（My Hero Academia）中的核心角色、
                -- No.1 英雄——欧尔麦特（All Might，八木俊典）。
                -- 警告：这个动漫目前在中国大陆地区已被封禁，由于众所周知的原因~
                name = "和平象征",
                text = {
                    "{C:enhanced}+#1#{}次出牌选择",
                    "{C:blue}+#1#{}次出牌，{C:red}+#1#{}次弃牌",
                    "{C:attention}+#1#{}个小丑牌槽位",
                    "{C:tarot}+#1#{}个消耗牌槽位",
                    "{C:attention}+#1#{}张商店优惠券",
                    "{C:tarot}+#1#{}个商店补充包",
                    "{C:red}禁用{} {C:attention}Boss盲注{}",
                }
            },
            j_abn_synergy_joker = {
                name = "协同小丑",
                text = {
                    "其他小丑牌获得",
                    "{C:chips}+筹码{}或{C:mult}+倍率{}时",
                    "将相同数量添加至这张小丑牌",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                }
            },
            j_abn_syntha_joker = {
                name = "合成乐小丑",
                text = {
                    "本赛局每激活一张{C:lexica}辞典{}牌",
                    "获得{C:red}+#1#{}倍率",
                    "{C:inactive}（当前为{C:red}+#2#{C:inactive}）",
                }
            },
            j_abn_tag_collector = {
                name = "标签收藏家",
                text = {
                    "商店中可以{C:attention}购买{}标签",
                    "价格为{C:money}$#2#{}",
                }
            },
            j_abn_tag_joker = {
                name = "标签小丑",
                text = {
                    "{C:attention}标签{}触发时",
                    "这张小丑牌获得{C:white,X:mult}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                }
            },
            j_abn_talstaff = {
                -- 原型是莎士比亚戏剧中的喜剧角色/小丑代表人物——约翰·福斯塔夫爵士（Sir John Falstaff）（代码中写作 Talstaff，但卡牌下方的牌名画着像 FALSTAFF）。
                name = "Talstaff",
                text = {
                    "左侧每张{C:attention}小丑牌{}",
                    "获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                }
            },
            j_abn_telejoker = {
                -- 原型是儿童节目《天线宝宝》（Teletubbies）中的紫色天线宝宝——丁丁（Tinky Winky）。
                name = "天线宝宝",
                text = {
                    "如果打出的牌是{C:attention}#1#{}或{C:attention}#2#{}",
                    "且只包含{C:attention}#3#{}张牌",
                    "则重新触发所有打出的牌",
                }
            },
            j_abn_telisyndrome_joker = {
                name = "终末综合症",
                text = {
                    {
                        "每有一种{C:attention}不同{}计分{C:attention}增强效果{}",
                        "给予{X:chips,C:white}^#1#{}筹码",
                    },
                    {
                        "每张{C:abn_plagued}瘟疫缠身{}小丑牌",
                        "每有一种{C:attention}不同{} {C:dark_edition}版本{}",
                        "给予{C:mult}+#2#{}倍率",
                    }
                }
            },
            j_abn_terminator = {
                name = "终结者",
                text = {
                    {
                        "{C:attention}钢铁牌{}留在手牌中时",
                        "永久获得{C:chips}+#1#{}筹码和{C:mult}+#2#{}倍率",
                    },
                    {
                        "摧毁所有计分的",
                        "{C:attention}钢铁牌{}",
                    }
                }
            },
            j_abn_tesseract_joker = {
                name = "超立方体",
                text = {
                    {
                        "击败{C:attention}Boss盲注{}时",
                        "将{C:attention}最右侧{}的小丑牌",
                        "放入{C:attention}消耗牌槽位{}",
                    },
                    {
                        "消耗牌中每有一种不同小丑牌稀有度",
                        "{C:attention}+1{}个消耗牌槽位",
                    },
                }
            },
            j_abn_test_crash_dummy = {
                name = "碰撞测试假人",
                text = {
                    "每回合第一张计分的{C:attention}对子{}牌获得{C:abn_hazard}险兆{}",
                    "{C:abn_hazard}险兆{}牌计分时将其{C:mult}摧毁{}",
                    "并获得其{C:attention}点数{}作为{C:chips}筹码{}",
                    "{C:inactive}当前为：{C:chips}+#1#{C:inactive}筹码{}",
                }
            },
            j_abn_tetris_joker = {
                -- 《俄罗斯方块》，是1980年末期至1990年代初期风靡全世界的电脑游戏，是落下型益智游戏的始祖，
                -- 电子游戏领域的代表作之一，为苏联首个在美国发布的娱乐软件。
                -- 此游戏最初由阿列克谢·帕基特诺夫在苏联设计和编写，于1984年6月6日首次发布。
                name = "俄罗斯方块",
                text = {
                    "当你拥有{C:attention}偶数{}",
                    "张小丑牌时获得{X:mult,C:white}X#1#{}倍率",
                }
            },
            j_abn_that_one_evenly_split = {
                name = "均匀分割",
                text = {
                    {
                        "打出的{C:attention}奇数{}点数牌",
                        "计分时给予",
                        "{C:chips}+#1#{}筹码",
                        "{C:inactive}（A、9、7、5、3）",
                    },
                    {
                        "打出的{C:attention}偶数{}点数牌",
                        "计分时给予",
                        "{C:white,X:mult}X#2#{}倍率",
                        "{C:inactive}（10、8、6、4、2）",
                    }
                }
            },
            j_abn_the_great_gig_in_the_sky = {
                name = "天国的伟大演出",
                text = {
                    {
                        "如果打出{C:attention}光谱{}",
                        "且不包含任何{C:diamonds}基础 {C:spades}花色{}",
                        "这张{C:attention}小丑牌{}",
                        "获得{C:gold}+#2#{}晋升强度",
                        "{C:inactive}（当前为{C:gold}+#1#{C:inactive}晋升强度）",
                    },
                    {
                        "如果这张{C:attention}小丑牌{}带有{C:dark_edition}版本{}",
                        "计分牌获得{C:gold}+#3#{}晋升强度",
                    }
                }
            },
            j_abn_the_joker = {
                -- 爆闪稀有度的金宝~
                name = "金宝",
                text = {
                    "计分牌降低{C:attention}盲注需求{} {C:attention}10%{}",
                }
            },
            j_abn_the_joker_dance = {
                name = "小丑之舞",
                text = {
                    "小丑牌{C:attention}无法{}移动",
                    "出牌时{C:attention}洗乱{}所有小丑牌",
                    "所有小丑牌获得{C:mult}+#1#{}倍率和{C:chips}+#2#{}筹码",
                }
            },
            j_abn_the_mule = {
                name = "骡子",
                text = {
                    "{C:chips}+#1#{}筹码",
                    "每拥有{C:money}$1{}",
                    "{C:red}-#2#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码）",
                }
            },
            j_abn_tier_list = {
                -- 也就是短视频里经常看到的“从夯到拉”系列，将某种同领域的东西做一个梯度排名来进行评价。
                name = "梯度表",
                text = {
                    {
                        "这张小丑牌根据{C:attention}最后获得{}的小丑牌",
                        "的{C:attention}稀有度{}获得加成：",
                        "{C:inactive}上次稀有度：{C:attention}#11#{}",
                        "{C:inactive,s:0.8}（当前为{C:attention,s:0.8}#5#{s:0.8}次重新触发，{X:mult,C:white,s:0.8}X#3#{C:inactive,s:0.8}，{C:mult,s:0.8}+#2#{s:0.8}{C:inactive,s:0.8}，{X:chips,C:white,s:0.8}X#4#{C:inactive,s:0.8}，{C:chips,s:0.8}+#1#{s:0.8}{C:inactive,s:0.8}）",
                    },
                    {
                        "{C:common,s:0.8}普通{s:0.8}：{C:chips,s:0.8}+#6#{s:0.8}筹码",
                        "{C:uncommon,s:0.8}罕见{s:0.8}：{C:mult,s:0.8}+#7#{s:0.8}倍率",
                        "{C:rare,s:0.8}稀有{s:0.8}：{X:mult,C:white,s:0.8}+X#8#{s:0.8}倍率",
                        "{C:abn_superrare,s:0.8}超稀有{s:0.8}：{X:chips,C:white,s:0.8}+X#9#{s:0.8}筹码",
                        "{C:purple,s:0.8}爆闪{s:0.8}：{C:attention,s:0.8}+#10#{s:0.8}次重新触发",
                        "{C:legendary,s:0.8}传奇{s:0.8}：所有数值翻倍",
                    },
                }
            },
            j_abn_tiktoker_joker = {
                -- Tiktoker（或称 TikToker），Tiktok是国外的一个短视频分享平台，TikToker是指在该平台上发布短视频的创作者/主播，国内的对应平台是抖音。
                name = "抖音创作者",
                text = {
                    {
                        "每有一张计分的{C:hearts}红桃{}，",
                        "计分的非{C:hearts}红桃{}牌",
                        "获得{C:mult}+#1#{}倍率",
                    },
                },
            },
            j_abn_till_joker = {
                name = "收银机小丑",
                text = {
                    "回合{C:attention}第一次出牌{}的第一张{C:attention}数字牌{}",
                    "添加{C:abn_grey_seal}灰色蜡封{}",
                    "回合{C:attention}最后一次出牌{}的第一张{C:attention}数字牌{}",
                    "添加{C:gold}金色蜡封{}",
                },
            },
            j_abn_time_attack = {
                name = "计时攻击",
                text = {
                    {
                        "所有{C:attention}小丑牌{}的成长速度",
                        "{C:attention}翻倍{}",
                    },
                    {
                        "重新触发所有打出的",
                        "带有{C:dark_edition}版本{}的牌",
                    },
                    {
                        "击败{C:attention}盲注{}前",
                        "所有小丑牌必须触发",
                        "否则{C:red}摧毁牌组中所有牌{}",
                    }
                }
            },
            j_abn_tlumddo = {
                -- 不会翻
                name = "Tlumddo",
                text = {
                    {
                        "{C:attention}奖励牌{}计分时",
                        "计分手牌中所有非{C:attention}奖励{}牌",
                        "永久获得{C:mult}+#1#{}倍率",
                    },
                    {
                        "{C:attention}奇数奖励牌{}计分时",
                        "计分手牌中所有非{C:attention}奖励{}牌",
                        "永久获得{C:chips}+#2#{}筹码",
                    }
                },
                unlock = {
                    "在奇数点数的牌上拥有{C:attention,E:1}奖励{}增强效果",
                }
            },
            j_abn_tochic = {
                -- 原版小丑牌希科（Chicot）倒过来写，但是不完全一致，不知道是写错还是有别的原型
                name = "科希",
                text = {
                    "选择{C:attention}盲注{}时",
                    "每有一张{C:attention}小丑牌{}",
                    "降低{C:attention}盲注需求{} {C:attention}#1#%{}",
                    "{C:inactive}（当前为{C:attention}#2#%{C:inactive}）",
                }
            },
            j_abn_tom = {
                -- 原型疑似是莎士比亚戏剧《李尔王》（King Lear）中的伪装形象 “疯癫汤姆”（Poor Tom）
                name = "汤姆",
                text = {
                    "每剩余一次{C:attention}出牌{}",
                    "{C:attention}最后一张{}计分牌重新触发一次",
                }
            },
            j_abn_totally_naked = {
                name = "赤条条",
                text = {
                    "计分的{C:attention}未增强{}牌",
                    "给予{C:mult}+#1#{}倍率和{C:chips}+#2#{}筹码",
                },
            },
            j_abn_trans_joker = {
                name = "转换小丑",
                text = {
                    "牌改变{C:attention}花色{}时",
                    "提升其{C:planet}星球{} {C:attention}点数{}等级",
                }
            },
            j_abn_transvestite_joker = {
                name = "易装小丑",
                text = {
                    "任何被改变过点数",
                    "或花色的牌获得",
                    "{C:mult}+#1#{}倍率和{C:chips}+#2#{}筹码",
                }
            },
            j_abn_trevulit = {
                -- 原型应该是原版小丑牌中的特里布莱（Triboulet）
                name = "特雷维利特",
                text = {
                    "{C:attention}奇数{}计分牌获得",
                    "其点数{C:attention}三倍{}的{C:mult}倍率{}",
                }
            },
            j_abn_tri_tag = {
                name = "三连标签",
                text = {
                    "每当获得{C:attention}原版{}标签时获得{X:mult,C:white}X#2#{}倍率",
                    "每当获得{C:attention}模组{}标签时获得{X:chips,C:white}X#4#{}筹码",
                    "每当获得{C:abn_hazard}险兆{}标签时获得{C:money}$#5#{}",
                    "{C:inactive}当前：{X:mult,C:white}X#1#{} 倍率 {X:chips,C:white}X#3#{} 筹码",
                },
            },
            j_abn_triple_nicole = {
                name = "三尼可",
                text = {
                    "若{C:attention}牌型{}已被打出过",
                    "{C:attention}奇数{}次，",
                    "则获得{C:chips}+#1#{}筹码",
                },
            },
            j_abn_triple_star_license = {
                name = "三星执照",
                text = {
                    "{X:mult,C:white}X#1#{}倍率，{X:chips,C:white}X#2#{}筹码",
                    "如果{C:attention}小丑牌{}被{C:attention}售出{}",
                    "则{C:mult}自毁{}",
                }
            },
            j_abn_trojan_joker = {
                name = "特洛伊小丑",
                text = {
                    "选择{C:attention}盲注{}时，{C:red}摧毁{}",
                    "{C:attention}相邻{}的两张小丑牌，并获取其",
                    "累积的{C:chips}筹码{}、{C:mult}倍率{}和{X:mult,C:white}倍乘倍率{}",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}/{C:mult}+#2#{C:inactive}/{X:mult,C:white}X#3#{C:inactive}）",
                }
            },
            j_abn_tronie_joker = {
                -- Tronie（16 或 17 世纪荷兰语中的“脸”，与法语单词“trogne”相关）
                -- 是荷兰黄金时代绘画和佛拉蒙巴洛克绘画（英语：Flemish Baroque painting）中常见的一种作品的名称/类别，
                -- 它们表现出夸张的面部表情或穿着服装的人。这些作品的目的不是肖像，而是对表情、类型、相貌或有趣角色的研究，
                -- 例如老人或女人、年轻女人、士兵、牧羊女、东方人或特定种族的人等。
                -- ---------------------------
                -- 美术原型来自《戴珍珠耳环的少女》是荷兰画家扬·弗美尔约1665年所作的布面油画，纵44.5厘米、横39厘米，
                -- 自1903年起藏于海牙莫瑞泰斯皇家美术馆，
                -- 馆方称其为弗美尔最著名的作品。
                -- 画中少女在深色底子前侧身回望，
                -- 头裹蓝黄两色头巾，耳下垂着一颗尺寸夸张的珍珠。
                name = "Tronie",
                text = {
                    "{C:chips}+#1#{}个小丑牌槽位",
                    "{C:attention}盲注需求{} {X:mult,C:white}#2#X{}",
                    "击败{C:attention}底注{}时提升{X:mult,C:white}#3#X{}",
                },
            },
            j_abn_turf_graffiti = {
                name = "领地涂鸦",
                text = {
                    "打出的{C:spades}暗色{}花色牌",
                    "计分时给予{X:mult,C:white}X#1#{}倍率",
                }
            },
            j_abn_twinbo = {
                name = "双胞胎金宝",
                text = {
                    "{C:attention}+#1#{}个小丑牌槽位",
                    "每次只能出{C:attention}2{}张牌",
                    "打出的牌给予{X:mult,C:white}X#2#{}倍率",
                },
            },
            j_abn_tyches_keychain = {
                name = "提喀的钥匙链",
                text = {
                    {
                        "如果打出{C:attention}#1#{}",
                        "计分牌获得",
                        "{V:1}#2#{} #3#",
                        "{C:inactive}（每手牌循环）",
                    },
                }
            },
            j_abn_uboa = {
                -- 原型是心理恐怖、探索肉鸽类游戏《梦日记》（Yume Nikki）中的著名隐藏角色/彩蛋——乌波阿（Uboa）
                -- 在《梦日记》中，主角附窗子（Madotsuki）来到NPC浅木（Poniko）的房间时，
                -- 切换房间灯光开关有1/64的几率不会关灯，而是让背景音效骤变，
                -- Poniko 瞬间变成异形 Uboa，并会将玩家传送至一个无法逃脱的血色/静止异空间。
                name = "乌波阿",
                text = {
                    {
                        "计分的{C:spades}暗色花色{}牌给予{X:mult,C:white}X#1#{}倍率",
                        "每当{C:spades}暗色花色{}计分时提升{X:mult,C:white}X#2#{}倍率",
                    },
                    {
                        "回合的{C:attention}获胜牌型{}中",
                        "提升所有计分牌的{C:planet}星球{} {C:attention}点数{}等级",
                    }
                }
            },
            j_abn_ulam_joker = {
                name = "乌拉姆小丑",
                text = {
                    {
                        "{C:attention}光谱{}手牌中第一张和最后一张",
                        "计分牌的点数差值",
                        "作为这张小丑牌的{C:mult}倍率{}和{C:chips}筹码{}",
                        "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率，{C:chips}+#1#{C:inactive}筹码）",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}版本{}",
                        "获得点数差值的{C:attention}两倍{}",
                    },
                }
            },
            j_abn_ultimo_joker = {
                name = "终极小丑",
                text = {
                    "计分手牌中每有一种不同",
                    "{C:attention}增强效果{}",
                    "所有打出的牌重新触发一次",
                }
            },
            j_abn_underblackcloudz = {
                name = "乌云之下",
                text = {
                    {
                        "重新触发所有{C:weather_report}天气{}效果",
                    },
                    {
                        "当{C:weather_report}天气{}效果{C:attention}触发{}时",
                        "这张小丑牌获得{C:chips}+#4#{}筹码、{C:mult}+#2#{}倍率",
                        "以及{C:money}$#6#{}的{C:attention}售价{}",
                    },
                    {
                        "当{C:weather_report}天气预报{}牌",
                        "未触发而自毁时，获得{C:money}$#5#{}",
                        "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码，{C:mult}+#1#{C:inactive}倍率）",
                    },
                }
            },
            j_abn_under_construction = {
                name = "施工中",
                text = {
                    "击败{C:attention}Boss盲注{}时",
                    "{C:attention}售出{}这张小丑牌以生成",
                    "收藏中{C:attention}任意{}一张小丑牌",
                    "{C:inactive,s:0.8}（只能生成{C:common,s:0.8}普通{C:inactive,s:0.8}、{C:uncommon,s:0.8}罕见{C:inactive,s:0.8}和{C:rare,s:0.8}稀有{C:inactive,s:0.8}）",
                }
            },
            j_abn_undiscovered_sunset = {
                -- 美术原型疑似是独立游戏《看火人》（Firewatch） 的主视觉海报与美学风格。
                name = "未曾瞩目的落日",
                text = {
                    {
                        "{C:attention}#5#{}中第一张计分的{C:abn_penumbra}半影{}牌",
                        "获得{C:dark_edition}烈日灾祸{}",
                    },
                    {
                        "每张计分的{C:dark_edition}烈日灾祸{}牌",
                        "这张小丑牌获得{C:mult}+#4#{}倍率和{C:chips}+#2#{}筹码",
                        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#3#{C:inactive}筹码）",
                    },
                    {
                        "购买时{C:continent}大陆{}牌",
                        "变为{C:dark_edition}负片{}",
                    }
                }
            },
            j_abn_unendy_wendy = {
                name = "无尽温迪",
                text = {
                    {
                        "重新触发所有",
                        "打出的{C:attention}数字牌{}",
                    },
                    {
                        "削弱所有{C:attention}人头牌{}",
                    }
                }
            },
            j_abn_unhinged_umar = {
                name = "疯狂乌马尔",
                text = {
                    "将{C:chips}+筹码{}效果以{X:chips,C:white}X#1#{}的比例",
                    "转化为{X:chips,C:white}X筹码{}",
                    "若这是{C:attention}加成小丑牌{}，",
                    "{C:attention}加成{}增强效果在留在手牌中时",
                    "也会触发",
                },
            },
            j_abn_union_jack = {
                name = "联合杰克",
                text = {
                    "如果打出的牌包含",
                    "一张{C:attention}奖励牌{}和",
                    "一张{C:attention}倍率牌{}",
                    "重新触发所有打出的牌",
                }
            },
            j_abn_usury_joker = {
                name = "高利贷小丑",
                text = {
                    {
                        "{C:abn_tie}和{}、{C:abn_bow}弓{}和{C:clubs}梅花",
                        "{C:attention}计分{}时变为{C:attention}幸运{}牌",
                        "{C:attention}幸运牌{}触发时",
                        "失去{C:gold}-$#1#{}",
                    },
                    {
                        "最多可负债",
                        "{C:red}-$#2#{}",
                    },
                },
            },
            j_abn_van_joker = {
                -- 原型是荷兰后印象派代表画家——文森特·梵高（Vincent van Gogh）
                -- 及其著名的自画像作品（Self-Portraits）（尤其是 1889 年创作的《蓝漩涡背景自画像》）。
                -- 这幅画作于 1889年9月，当时梵高正住在法国圣雷米（Saint-Rémy）的精神疗养院中。
                -- 目前，这幅无价的杰作由法国巴黎的奥赛博物馆（Musée d'Orsay）永久收藏。
                name = "梵高",
                text = {
                    "商店中{C:attention}+#1#{}个",
                    "优惠券槽位",
                }
            },
            j_abn_vaporwave_joker = {
                name = "蒸汽波小丑",
                text = {
                    {
                        "打出的和弃掉的{C:dark_edition}#2#{}牌",
                        "每张打出或弃掉的牌",
                        "永久获得{C:chips}+#1#{}筹码",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}#2#{}版本",
                        "带有{C:dark_edition}#2#{}版本的小丑牌",
                        "给予{C:white,X:chips}X#3#{}筹码",
                    }
                }
            },
            j_abn_venom_comedian = {
                name = "毒液•喜剧演员",
                text = {
                    {
                        "如果打出的牌包含{C:attention}光谱{}",
                        "这张小丑牌根据{C:inactive}花色{}获得{C:inactive}奖励{}",
                    },
                    {
                        "{C:abn_tie}和{}：{C:mult}+#5#{}倍率",
                        "{C:abn_bow}弓{}：{X:chips,C:white}X#6#{}筹码",
                        "{C:abn_snow}雪{}：{X:mult,C:white}X#7#{}倍率",
                        "{C:abn_penumbra}半影{}：{C:chips}+#8#{}筹码",
                        "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率，{C:mult}+#1#{C:inactive}倍率，{X:chips,C:white}X#4#{C:inactive}筹码，{C:chips}+#3#{C:inactive}筹码）",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}版本{}",
                        "包含{C:attention}光谱{}的打出手牌提升{C:attention}2{}级",
                    },
                }
            },
            j_abn_vintage_joker = {
                name = "复古小丑",
                text = {
                    {
                        "将本局{C:attention}第一张打出的手牌{}{C:attention}升级{}",
                        "若它不是{C:attention}隐藏牌型{}",
                        "且仅由{C:inactive}原版{}花色组成",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}复古{}版本",
                        "每次手牌{C:attention}升级{}时",
                        "随机{C:attention}升级{}另一种手牌",
                    },
                }
            },
            j_abn_vitamin_joker = {
                name = "维生素小丑",
                text = {
                    "带有{C:attention}蜡封{}的计分牌",
                    "永久获得{C:chips}+#1#{}筹码和{C:mult}+#2#{}倍率",
                    "出牌后这张牌有{C:green}#3#/#4#{}几率",
                    "被{C:attention}吃掉{}",
                },
            },
            j_abn_void_emissary = {
                name = "虚空使者",
                text = {
                    "打出的牌型中，每{C:attention}两张{}同为",
                    "{C:attention}偶数{}或{C:attention}奇数{}的",
                    "{C:abn_suitless}无色{}{C:attention}数字{}牌，",
                    "这张小丑牌获得{C:chips}+#4#{}筹码",
                    "和{C:mult}+#2#{}倍率",
                    "{C:inactive}(当前 {C:chips}+#3#{C:inactive} 筹码, {C:mult}+#1#{C:inactive} 倍率)",
                },
            },
            j_abn_void_joker = {
                name = "虚空小丑",
                text = {
                    "商店中所有{C:attention}翻转{}小丑牌",
                    "{C:attention}免费{}",
                    "购买时获得",
                    "{C:dark_edition}#1#{}、{C:dark_edition}#2#{}",
                    "或{C:dark_edition}#3#{}版本",
                }
            },
            j_abn_voracity_joker = {
                name = "贪食小丑",
                text = {
                    "重新触发所有{C:attention}食物{}小丑牌",
                    "回合结束时有{C:green}#1#/#2#{}几率",
                    "{C:attention}吃掉{}所有{C:attention}食物{}小丑牌",
                }
            },
            -- WIP 还在开发
            j_abn_vjoker = {
                name = "V小丑",
                text = {
                    "嘿Vsauce，我是迈克尔",
                },
            },
            j_abn_watermelon = {
                name = "西瓜",
                text = {
                    "小丑牌{C:attention}触发{}时获得{C:mult}+#3#{}倍率",
                    "回合结束时有{C:green}#1#/#2#{}几率",
                    "被{C:attention}吃掉{}",
                }
            },
            j_abn_wee_bonus = {
                name = "小奖励",
                text = {
                    "计分的{C:attention}数字{}",
                    "{C:attention}奖励牌{}永久获得",
                    "{C:chips}+#1#{}筹码",
                }
            },
            j_abn_wee_mult = {
                name = "小倍率",
                text = {
                    "计分的{C:attention}数字{}",
                    "{C:attention}倍率牌{}永久获得",
                    "{C:white,X:mult}X#1#{}倍率",
                }
            },
            j_abn_weltschmerz_joker = {
                name = "世愁小丑",
                text = {
                    "计分的{C:inactive}无色{}牌获得{C:attention}翻转{}",
                    "重新触发{C:attention}翻转{}的{C:inactive}无色{}牌",
                }
            },
            j_abn_wet_joker = {
                name = "湿漉小丑",
                text = {
                    {
                        "{C:weather_report}天气预报{}牌",
                        "回合结束时",
                        "不会被摧毁",
                    },
                }
            },
            j_abn_whitedwarf_joker = {
                name = "白矮星小丑",
                text = {
                    "每次使用{C:planet}点数星球{}牌时",
                    "这张小丑牌获得",
                    "{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
                },
            },
            j_abn_whitenoise_joker = {
                name = "白噪音小丑",
                text = {
                    "打出{C:attention}偶数{}张",
                    "{C:diamonds}光明{}和{C:spades}暗色{}花色牌时",
                    "这张小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                }
            },
            j_abn_wild_stone = {
                name = "万能石头牌",
                text = {
                    {
                        "若打出的牌型同时包含{C:attention}石头{}牌",
                        "和{C:attention}万能{}牌，它们各获得",
                        "{C:gold}+#1#{}晋升强度和{C:purple}+#2#{}计分",
                    },
                    {
                        "触发时，{C:enhanced}石头{}{C:attention}小丑{}获得",
                        "{X:mult,C:white}X#3#{}倍率，{C:enhanced}万能{}",
                        "{C:attention}小丑牌{}获得{X:chips,C:white}X#4#{}筹码",
                    },
                    {
                        "选择{C:attention}大盲注{}时，生成",
                        "本局最后使用的{C:astro_cards}星座{}牌",
                        "{C:inactive}当前：{C:astro_cards}#5#{}",
                    },
                },
            },
            j_abn_wild_gold = {
                name = "万能黄金牌",
                text = {
                    {
                        "若打出的牌型同时包含{C:attention}万能{}牌",
                        "和{C:attention}黄金{}牌，它们各获得",
                        "{C:gold}+#1#{}晋升强度和{C:purple}+#2#{}计分",
                    },
                    {
                        "触发时，{C:enhanced}万能{} {C:attention}小丑牌{}获得",
                        "{X:mult,C:white}X#3#{}倍率，{C:enhanced}黄金{}",
                        "{C:attention}小丑牌{}获得{X:chips,C:white}X#4#{}筹码",
                    },
                    {
                        "选择{C:attention}大盲注{}时，生成",
                        "本局最后使用的{C:atomic}原子{}牌",
                        "{C:inactive}当前：{C:atomic}#5#{}",
                    },
                },
            },
            j_abn_wild_power_joker = {
                name = "野性力量小丑",
                text = {
                    "当{C:attention}万能{}牌计分时：",
                    "{C:green,s:0.8}#1#/#2#几率{s:0.8}获得{X:mult,C:white,s:0.8}X#7#{s:0.8}倍率",
                    "{C:green,s:0.8}#3#/#4#几率{s:0.8}获得{C:mult,s:0.8}+#8#{s:0.8}倍率",
                    "{C:green,s:0.8}#5#/#6#几率{s:0.8}获得{C:chips,s:0.8}+#9#{s:0.8}筹码",
                },
            },
            j_abn_wildfrost_joker = {
                -- 原型是冰雪末日题材的肉鸽卡牌构建游戏——《雪居之地》（Wildfrost） 的角色/随从卡牌界面。
                name = "雪居之地",
                text = {
                    "如果打出的牌型是{C:attention}#5#{}",
                    "这张小丑牌获得{C:mult}+#3#{}倍率",
                    "{C:abn_snow}雪{}牌计分时",
                    "获得{C:chips}+#4#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码，{C:mult}+#1#{C:inactive}倍率）",
                }
            },
            j_abn_will = {
                -- 原型是都铎王朝时期英国国王亨利八世（Henry VIII）最著名的宫廷小丑——威廉·萨默斯（Will Sommers / Will Somers）
                name = "威廉",
                text = {
                    "计分手牌包含",
                    "{C:attention}奇数{}点数牌时",
                    "获得{X:chips,C:white}X#2#{}筹码",
                    "{C:inactive}（A、9、7、5、3）",
                    "{C:inactive}（当前为{C:white,X:chips}X#1#{C:inactive}筹码）",
                }
            },
            j_abn_wingding_joker = {
                name = "装饰符号小丑",
                text = {
                    "售出{C:lexica}辞典{}牌时，这张小丑牌获得{C:mult}+#4#{}倍率",
                    "售出{C:program_pack}程序{}牌时，获得{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码，{C:mult}+#3#{C:inactive}倍率）",
                }
            },
            j_abn_wireframe_joker = {
                name = "线框小丑",
                text = {
                    "每张打出的{C:attention}数字牌{}计分时",
                    "有{C:green}#1#/#2#{}几率",
                    "生成一张{C:tarot}塔罗{}牌",
                    "{C:inactive}（必须有空位）",
                }
            },
            j_abn_witching_hour = {
                name = "巫术时刻",
                text = {
                    {
                        "所有{C:spades}暗色花色{}牌",
                        "以背面朝上抽取",
                    },
                    {
                        "每张背面朝上抽取的牌",
                        "这张小丑牌获得{X:mult,C:white}X#2#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                    }
                }
            },
            j_abn_witness_protection = {
                name = "证人保护",
                text = {
                    {
                        "当前处于{C:attention}翻转{}状态的小丑牌中，",
                        "每有一种{C:attention}不同稀有度{}，",
                        "获得{X:chips,C:white}X#1#{}筹码",
                        "{C:inactive}(当前 {X:chips,C:white}X#3#{C:inactive} 筹码)",
                    },
                    {
                        "若这张小丑牌{C:attention}翻转{}，则每拥有",
                        "一张{C:attention}翻转{}小丑牌，计分牌",
                        "给予{C:chips}+#2#{}筹码",
                        "{C:inactive}(当前 {C:chips}+#4#{C:inactive} 筹码)",
                    },
                },
            },
            j_abn_worldwind_joker = {
                -- 由 world（世界）和 wind（风）组合而成，通常用来形容席卷全球的风暴、世界狂风，或比喻影响全世界的巨大变革潮流。
                name = "世界风",
                text = {
                    {
                        "打出牌型时，{C:attention}小丑牌{}",
                        "会被打乱顺序",
                    },
                    {
                        "重新触发{C:attention}最左侧{}的小丑牌；",
                        "若最左侧是{C:attention}世界风{}，",
                        "则改为获得{X:mult,C:white}X#1#{}倍率",
                    },
                },
            },
            j_abn_xenon_joker = {
                name = "氙气小丑",
                text = {
                    "带有{C:dark_edition}#2#{}版本的牌",
                    "和小丑牌给予{X:mult,C:white}X#1#{}倍率",
                }
            },
            j_abn_yanga_joker = {
                name = "扬加小丑",
                text = {
                    {
                        "{C:attention}暗影{}牌计分时获得{C:chips}+#4#{}筹码",
                        "{C:dark_edition}幽冥{}牌计分时获得{C:mult}+#3#{}倍率",
                        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                    },
                    {
                        "如果{C:attention}第一次出牌{}是{C:attention}同花{}的{C:abn_bow}弓{}，",
                        "打出的牌增强为{C:dark_edition}幽冥{} {C:spades}暗色{}牌",
                        "如果{C:attention}第一次出牌{}是{C:attention}同花{}的{C:spades}黑桃{}，",
                        "打出的牌增强为{C:dark_edition}暗影{} {C:spades}暗色{}牌",
                        "如果{C:attention}第一次出牌{}是{C:attention}同花{}的{C:clubs}梅花{}，",
                        "打出的牌增强为{C:dark_edition}幽冥{} {C:spades}暗色{}牌",
                    },
                }
            },
            j_abn_yesman_joker = {
                -- 《好好先生》指2008年由金·凯瑞主演的美国喜剧电影《好好先生》（Yes Man）
                name = "好好先生",
                text = {
                    "{C:attention}持有{}的{C:dark_edition}版本{}会被触发",
                    "{C:dark_edition}版本{}触发时",
                    "这张小丑牌获得{C:mult}+#3#{}倍率和{C:chips}+#4#{}筹码",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率，{C:chips}+#2#{C:inactive}筹码）",
                }
            },
            j_abn_yharman_joker = {
                -- 原型是 FromSoftware 制作的动作RPG游戏《血源诅咒》（Bloodborne） 及其核心舞台——雅南（Yharnam）
                name = "雅南小丑",
                text = {
                    {
                        "{V:1}#1#花色{}的牌以{C:attention}背面朝上{}抽取",
                        "{C:inactive,s:0.8}盲注选择时花色变化",
                    },
                    {
                        "每张计分的{C:attention}翻转{}牌，提升{C:attention}正面朝上{}",
                        "计分牌的{C:planet}星球{} {C:attention}点数{}等级，等级超过{C:attention}5{}的牌",
                        "添加{C:dark_edition}#2#{}版本",
                    },
                }
            },
            j_abn_yorick_deluxe = {
                name = "约里克 {C:attention}豪华版",
                text = {
                    {
                        "每弃掉一张牌",
                        "这张小丑牌获得{C:mult}+#5#{}倍率",
                        "{C:inactive}（当前为{C:mult}+#6#{C:inactive}倍率）",
                    },
                    {
                        "每弃掉{C:attention}#2#{C:inactive}[#3#]{}张牌",
                        "这张小丑牌获得{X:chips,C:white}X#1#{}筹码",
                        "{C:inactive}（当前为{X:chips,C:white}X#4#{C:inactive}筹码）",
                    },
                    {
                        "如果拥有{C:attention}约里克{}",
                        "被弃掉的牌永久获得",
                        "等同于其{C:attention}点数{}的{C:mult}倍率",
                    }
                }
            },
            j_abn_york = {
                name = "约克",
                text = {
                    "计分牌给予{X:mult,C:white}X#1#{}倍率",
                    "手牌中持有的牌给予{X:chips,C:white}X#1#{}筹码",
                }
            },
            j_abn_zack_comic = {
                name = "扎克漫画",
                text = {
                    {
                        "计分的{C:abn_leaf}叶{}牌给予{X:chips,C:white}X#1#{}筹码",
                        "每当{C:abn_leaf}叶{}计分时提升{X:chips,C:white}X#2#{}筹码",
                    },
                    {
                        "如果拥有{C:attention}默认小丑{}",
                        "所有{C:attention}计分{}牌",
                        "当{C:abn_leaf}叶{}计分时获得等同于持有消耗牌数量的{C:mult}倍率{}",
                    }
                }
            },
            j_abn_zauberer_magicians = {
                -- 卡名中的 Zauberer 是德语中的“魔术师”
                -- 美术原型疑似卡普空法庭冒险游戏《逆转裁判4》（Ace Attorney 4） 中的
                -- 传奇魔术表演团体——“或真敷一座”（Troupe Gramarye） 的两位核心魔术师：
                -- 或真敷巴朗（Valant Gramarye） 与 或真敷扎克（Zak Gramarye）。
                name = "魔术师",
                text = {
                    {
                        "{s:0.8}计分的{C:hearts,s:0.8}红桃{s:0.8}变为{C:abn_snow,s:0.8}雪{}",
                        "{s:0.8}计分的{C:diamonds,s:0.8}方块{s:0.8}变为{C:abn_tie,s:0.8}和{}",
                        "{s:0.8}计分的{C:clubs,s:0.8}梅花{s:0.8}变为{C:abn_penumbra,s:0.8}半影{}",
                        "{s:0.8}计分的{C:spades,s:0.8}黑桃{s:0.8}变为{C:abn_bow,s:0.8}弓{}",
                    },
                    {
                        "如果这张小丑牌带有{C:dark_edition}复古{}版本",
                        "牌改变{C:attention}花色{}时",
                        "获得{C:mult}+#2#{}倍率和{C:money}$#2#{}售价",
                        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                    },
                }
            },
            j_abn_zip_folder = {
                name = "压缩文件夹",
                text = {
                    "{C:attention}翻倍{}消耗牌槽位",
                    "击败{C:attention}盲注{}时",
                    "每{C:attention}持有{}一张消耗牌",
                    "获得{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                }
            },
            j_abn_zoom_in = {
                name = "拉近",
                text = {
                    "如果打出的牌包含",
                    "一张{C:attention}A{}和一张{C:attention}数字牌{}",
                    "这张小丑牌获得{C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                },
            },
            j_abn_abysmal_joker = {
                name = "深渊小丑",
                text = {
                    {
                        "{C:dark_edition}幽冥{}牌计分时",
                        "其数值变为{C:attention}X#1#",
                    },
                    {
                        "若出牌仅由{C:edition}幽冥{}牌组成",
                        "且计分时{C:attention}着火{}，",
                        "生成数量等于计分牌数的",
                        "{C:dark_edition}负片{}{C:attention}模组{}消耗牌",
                    },
                    {
                        "若这张小丑牌是{C:dark_edition}幽冥{}版本，",
                        "打出的{C:attention}6{}计分时",
                        "使其{C:green}星球等级{}提升{C:attention}#2#{}级",
                    },
                },
            },
            j_abn_amateur_artist = {
                name = "业余艺术家",
                text = {
                    {
                        "每次出牌时，",
                        "永久复制{C:attention}第一张{}",
                        "计分的{C:attention}亲缘牌{}加入牌组",
                        "并抽到{C:attention}手牌",
                    },
                    {
                        "若计分牌全部为",
                        "{C:attention}亲缘牌{}，将你牌组中",
                        "等量的牌转化为",
                        "计分牌的{C:attention}复制{}",
                        "{C:attention,s:0.8}高牌{s:0.8}除外",
                    },
                },
            },
            j_abn_ancient_tapestry = {
                name = "古老织锦",
                text = {
                    {
                        "{C:attention}壁纸牌{}被洗到",
                        "牌组顶部",
                    },
                    {
                        "若{C:attention}计分牌{}全部由",
                        "{C:inactive}原版{}蜡封组成，获得",
                        "{V:1}#3#{}等于",
                        "{C:attention}计分牌{}的数量",
                    },
                    {
                        "若{C:attention}计分牌{}全部由",
                        "{C:dark_edition}模组{}蜡封组成，获得",
                        "{B:1,C:white}x#3#{}等于",
                        "{C:attention}计分牌{}的数量，然后",
                        "{C:attention}翻转{}这张小丑牌",
                        "{C:inactive}（当前为{V:1}+#1#{C:inactive} #3#，{B:1,C:white}X#2#{C:inactive} #3#）",
                    },
                },
            },
            j_abn_apprentice_wizard = {
                name = "学徒巫师",
                text = {
                    {
                        "使用{C:dark_edition}模组{}{C:spectral}幻灵{}牌时这张小丑牌获得{X:mult,C:white}X#1#{}倍率，",
                        "使用{C:inactive}原版{}{C:spectral}幻灵{}牌时重置",
                        "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
                    },
                },
            },
            j_abn_authenticated_graded_joker = {
                name = "认证评级小丑",
                text = {
                    {
                        "计分的{C:dark_edition}复古{}牌给予{C:chips}筹码{}和{C:mult}倍率{}",
                        "等于你最高等级的{C:attention}牌型",
                        "{C:inactive}（当前为：{C:attention}#1#{C:inactive}，{C:chips}+#2# {C:inactive}筹码，{C:mult}+#3# {C:inactive}倍率）",
                    },
                    {
                        "若这张小丑牌是{C:dark_edition}复古{}版本，",
                        "所有{C:dark_edition}复古{}游戏牌",
                        "被移到牌组顶部",
                    },
                },
            },
            j_abn_big_raff = {
                name = "大 riff",
                text = {
                    {
                        "{C:common}普通{}和{C:uncommon}罕见{}小丑牌",
                        "不再出现在商店中",
                    },
                    {
                        "选择{C:attention}盲注{}时，",
                        "生成一张{C:rare}稀有{}小丑牌",
                        "{C:inactive}（必须有空位）",
                    },
                },
            },
            j_abn_bubbly_joker = {
                name = "泡泡小丑",
                text = {
                    "当一张{C:attention}气泡{}牌被{C:attention}添加{}时，",
                    "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
                    "当一张{C:attention}气泡{}牌被{C:mult}摧毁{}时，",
                    "获得{X:chips,C:white}X#2#{}筹码",
                    "{C:inactive}（当前为{X:mult,C:white}X#3#{}倍率，{X:chips,C:white}X#4#{}筹码）",
                }
            },
            j_abn_chips_to_mult = {
                name = "筹码马修",
                text = {
                    "每当其他小丑牌给予{C:chips}筹码{}时，",
                    "这张小丑牌将那些筹码作为{C:mult}倍率{}给予",
                }
            },
            j_abn_cloten = {
                name = "克罗滕",
                text = {
                    "计分的{C:attention}加成{}牌给予",
                    "{X:chips,C:white}X筹码{}等于其{C:attention}点数",
                    "{C:attention}重新触发{}所有{C:attention}加成{}牌",
                }
            },
            j_abn_costard = {
                name = "科斯塔德",
                text = {
                    {
                        "这张小丑牌每次使用",
                        "{C:planet}星球{}牌时获得",
                        "{X:chips,C:white}^#2#{}筹码",
                    },
                    {
                        "每家{C:attention}商店{}始终包含",
                        "一包{C:attention}大型天体包",
                    },
                },
            },
            j_abn_crease_joker = {
                name = "折痕小丑",
                text = {
                    "{X:attention,C:white}X#1#{}手牌上限，",
                    "弃牌选择数量",
                    "减少至{C:red}#2#{}",
                }
            },
            j_abn_dagonet = {
                -- 亚瑟王传奇（King Arthur's Legend）
                name = "达戈内特",
                text = {
                    "留在手牌中的{C:attention}钢铁{}牌",
                    "给予{C:gold}+#1#{}晋升强度",
                }
            },
            j_abn_demon_sphere = {
                name = "恶魔之球",
                text = {
                    {
                        "打出的{C:dark_edition}模组{}{C:attention}点数{}牌",
                        "计分时给予{C:gold}+#1#{}",
                        "晋升强度",
                    },
                    {
                        "打出的牌有",
                        "{C:green}#2#/#3#{}几率在",
                        "计分后被{C:red}摧毁{}",
                    },
                },
            },
            j_abn_double_dip = {
                name = "双重蘸取",
                text = {
                    "这张小丑牌给予所打出牌型的",
                    "基础{C:chips}筹码{}和{C:red}倍率{}",
                }
            },
            j_abn_dreamtime_sphinx = {
                name = "梦境时代斯芬克斯",
                text = {
                    {
                        "当一张{C:attention}化石牌{}被计分时",
                        "这张小丑牌获得{C:chips}+#2#{}筹码",
                        "若它有{C:dark_edition}暗淡{}版本，",
                        "提升其{C:planet}星球{}{C:attention}等级{}",
                    },
                    {
                        "若一张{C:attention}化石牌{}被{C:mult}摧毁{}，",
                        "将其{C:attention}点数{}作为{C:mult}倍率{}",
                        "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码，{C:mult}+#3#{}倍率）",
                    },
                },
            },
            j_abn_early_sketch = {
                name = "早期草图",
                text = {
                    {
                        "若回合的{C:attention}第一次出牌{}全部为",
                        "{C:dark_edition}复古{}的{C:attention}亲缘牌{}，",
                        "该牌型将视为",
                        "高了{C:attention}#1#{}级来计分",
                    },
                    {
                        "全部由{C:dark_edition}复古{}",
                        "{C:attention}亲缘牌{}组成的出牌",
                        "不会{C:red}降级{}",
                    },
                },
            },
            j_abn_eccentric_artist = {
                name = "古怪艺人",
                text = {
                    {
                        "计分的{C:attention}亲缘{}牌同时拥有",
                        "{C:inactive}原版{}{C:attention}花色{}和{C:attention}版本{}时，",
                        "给予{C:chips}+#1#{}筹码和{C:mult}+#2#{}倍率",
                    },
                    {
                        "计分的{C:attention}亲缘{}牌同时拥有",
                        "{C:dark_edition}模组{}{C:attention}花色{}和{C:attention}版本{}时，",
                        "给予{C:chips}+#3#{}筹码和{C:mult}+#4#{}倍率",
                    },
                    {
                        "若你的{C:attention}整副牌组{}只含{C:attention}亲缘{}牌，",
                        "给予{C:chips}+#5#{}筹码和{C:mult}+#6#{}倍率",
                    },
                },
            },
            j_abn_entitled_fool = {
                name = "特权愚者",
                text = {
                    "每当你在单个回合内多次",
                    "计分完全相同数量的",
                    "{C:chips}奇数{}或{C:mult}偶数{}{C:attention}瓷砖{}牌，",
                    "这张小丑牌分别获得",
                    "{X:chips,C:white}X#1#{}筹码或{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:chips,C:white}X#3#{C:inactive}筹码，{X:mult,C:white}X#4#{C:inactive}倍率）",
                }
            },
            j_abn_erwyd = {
                name = "埃尔维德",
                text = {
                    {
                        "这张小丑牌每次使用",
                        "{C:tarot}塔罗{}牌时获得",
                        "{X:chips,C:white}^#2#{}筹码",
                        "{C:inactive}（当前为{X:chips,C:white}^#1#{}筹码）",
                    },
                    {
                        "每家{C:attention}商店{}始终包含",
                        "一个{C:attention}大型秘术包",
                    },
                },
            },
            j_abn_feste2 = {
                name = "愚者费斯特",
                text = {
                    "打出的{C:attention}万能{}牌",
                    "计分时给予{X:mult,C:white}^#1#{}倍率",
                    "或{X:chips,C:white}^#2#{}筹码",
                }
            },
            j_abn_foreign_advert = {
                name = "外部广告",
                text = {
                    "每次出牌时这张小丑牌获得",
                    "{C:white,X:mult}X#2#{}倍率，每有一个",
                    "{C:inactive}原版{}{C:attention}增强{}；获得{C:white,X:chips}X#4#{}筹码，",
                    "每有一个{C:dark_edition}模组{}{C:attention}增强{}",
                    "在计分牌中",
                    "{C:inactive}（当前为{C:white,X:mult}X#1#{C:inactive}倍率，{C:white,X:chips}X#3#{C:inactive}筹码）",
                }
            },
            j_abn_forgotten_joker = {
                name = "被遗忘的小丑",
                text = {
                    {
                        "{C:attention}底注{}增长速度{C:attention}翻倍{}",
                    },
                    {
                        "升级{C:inactive}原版{}牌型时，生成",
                        "一张随机的{C:dark_edition}负片{}{C:inactive}原版{}消耗牌",
                        "升级{C:dark_edition}模组{}牌型时，生成",
                        "一张随机的{C:dark_edition}负片{}{C:dark_edition}模组{}消耗牌",
                    },
                    {
                        "当等级{C:attention}2+{}的{C:inactive}原版{}牌型被打出，",
                        "{C:mult}降级{}并获得{C:attention}三倍{}失去的{C:chips}筹码{}，",
                        "当等级{C:attention}2+{}的{C:dark_edition}模组{}牌型被打出，",
                        "{C:mult}降级{}并获得{C:attention}三倍{}失去的{C:mult}倍率{}，",
                        "{C:inactive}（当前为{C:chips}+#1#{}筹码，{C:mult}+#2#{}倍率）",
                    },
                },
            },
            j_abn_genetically_modified_food = {
                name = "转基因食品",
                text = {
                    "当小丑牌被{C:attention}购买{}或{C:attention}售出{}时，",
                    "这张小丑牌获得等同于",
                    "{C:attention}食物小丑{}{C:money}价格{}的{C:chips}筹码{}，",
                    "获得其{C:inactive}初始状态{}{C:attention}小丑{}的",
                    "{C:money}价格{}的{C:mult}倍率{}",
                    "{C:inactive}（当前为{C:chips}+#1# {C:inactive}筹码，{C:mult}+#2# {C:inactive}倍率）",
                }
            },
            j_abn_glass_bonus = {
                name = "玻璃加成",
                text = {
                    {
                        "若出牌同时包含{C:attention}玻璃{}",
                        "和{C:attention}加成{}牌，它们各自获得",
                        "{C:gold}+#1#{}晋升强度和{C:purple}+#2#{}分数",
                    },
                    {
                        "{C:enhanced}玻璃{}{C:attention}小丑{}触发时获得{X:mult,C:white}X#3#{}倍率，{C:enhanced}加成{}",
                        "{C:attention}小丑{}获得{X:chips,C:white}X#4#{}筹码",
                    },
                    {
                        "选择{C:attention}大盲注{}时，生成",
                        "本局最后使用的{C:crepuscular}黄昏{}牌",
                        "{C:inactive}当前为：{}{C:crepuscular}#5#{}",
                    },
                },
            },
            j_abn_hot_mult_in_your_area = {
                name = "附近热点",
                text = {
                    {
                        "{C:attention}持有{}的每张{C:dark_edition}模组{}消耗牌",
                        "给予{X:mult,C:white}X#1#{}倍率",
                    },
                    {
                        "每次出牌时，",
                        "{C:green}#2#/#3#{}几率{C:red}摧毁{}",
                        "{C:attention}持有{}的{C:dark_edition}模组{}消耗牌",
                    },
                },
            },
            j_abn_joke_22 = {
                name = "玩笑 22",
                text = {
                    {
                        "若{C:attention}牌型{}为{C:dark_edition}原版{}牌型",
                        "获得{C:red}倍率{}等于",
                        "{C:attention}计分{}牌中{C:dark_edition}模组{}花色的点数之和",
                    },
                    {
                        "若{C:attention}牌型{}为{C:dark_edition}模组{}特有牌型",
                        "获得{C:blue}筹码{}等于",
                        "{C:attention}计分{}牌中{C:dark_edition}原版{}花色的点数之和",
                        "{C:inactive}（当前为{C:red}+#1#{C:inactive}倍率，{C:blue}+#2#{C:inactive}筹码）",
                    },
                },
            },
            j_abn_joker_of_recca = {
                name = "烈焰小丑",
                text = {
                    {
                        "已增强的{C:spades}暗之民{}/{C:diamonds}光之民{}小丑牌不会",
                        "被包含过多相反花色类型的",
                        "出牌摧毁",
                    },
                    {
                        "{C:dark_edition}逆转{}的{C:spades}暗之民{}牌给予{C:chips}+#1#{}筹码和{C:mult}+#2#{}倍率",
                        "{C:dark_edition}逆转{}的{C:diamonds}光之民{}牌给予{C:chips}+#3#{}筹码和{C:mult}+#4#{}倍率",
                    },
                    {
                        "若这张小丑牌是{C:dark_edition}荒废{}版本，",
                        "每有一张计分的{C:spades}暗之民{}牌",
                        "获得{X:mult,C:white}X#5#{}倍率，每有一张",
                        "计分的{C:diamonds}光之民{}牌获得{X:chips,C:white}X#6#{}筹码",
                        "{C:inactive}（当前为{X:mult,C:white}X#7#{C:inactive}倍率，{X:chips,C:white}X#8#{C:inactive}筹码）",
                    },
                },
            },
            j_abn_la_bete_noire = {
                name = "{f:abn_m6x11}黑 野 兽",
                text = {
                    {
                        "你的{C:purple}分数{}被隐藏",
                    },
                    {
                        "本局每使用一张{C:attention}灾厄{}牌，",
                        "终局{C:attention}底注{}增加{C:attention}+#1#{}",
                    },
                    {
                        "持有{C:attention}灾厄{}牌时出牌，",
                        "这张小丑牌获得{C:gold}+#2#{}",
                        "晋升强度",
                        "{C:inactive}（当前为{C:gold}+#3#{C:inactive}晋升强度）",
                    },
                    {
                        "当你售出一张{C:spectral}幻灵{}牌时，",
                        "生成一张随机的{C:attention}灾厄{}牌",
                    },
                },
            },
            j_abn_losers_dice = {
                name = "输家的骰子",
                text = {
                    "打出并计分的{C:attention}2{}给予{C:mult}+#2#{}倍率",
                    "每拥有一张{C:common}普通{}小丑牌",
                    "{C:inactive}（将给予{C:mult}+#1#{C:inactive}倍率）",
                }
            },
            j_abn_meatkin = {
                name = "肉亲小丑",
                text = {
                    "当一张{C:attention}钢铁牌{}计分时，",
                    "每张计分的非钢铁牌",
                    "永久获得{X:mult,C:white}+X#1#{}倍率",
                }
            },
            j_abn_mult_to_chips = {
                name = "倍率•布拉德利",
                text = {
                    "每当其他小丑牌给予{C:mult}倍率{}时，",
                    "改为给予{C:chips}筹码{}",
                }
            },
            j_abn_nasreddin = {
                name = "纳斯尔丁",
                text = {
                    "计分的{C:attention}幸运{}牌",
                    "给予{X:mult,C:white}^#1#{}倍率、{X:chips,C:white}^#2#{}筹码",
                    "或{C:gold}+#3#{}晋升强度",
                }
            },
            j_abn_phasetransfer_joker = {
                name = "相移小丑",
                text = {
                    "将小丑牌的{C:mult}+倍率{}效果",
                    "以{C:gold}X#1#{}的比率",
                    "转化为{C:gold}晋升强度{}",
                }
            },
            j_abn_rereleased_special_collector_edition = {
                name = "再发售特别典藏版",
                text = {
                    "若计分牌全部带{C:dark_edition}版本{}，",
                    "且{C:inactive}原版版本{}为偶数、{C:attention}模组版本{}为奇数，",
                    "或{C:inactive}原版版本{}为奇数、{C:attention}模组版本{}为偶数，",
                    "这张小丑牌获得{C:gold}+#2#{}晋升强度",
                    "乘以偶数那一侧的{C:dark_edition}版本{}数量",
                    "{C:inactive}（当前为{C:gold}+#1# {C:inactive}晋升强度）",
                }
            },
            j_abn_rorrim = {
                name = "镜像小丑",
                text = {
                    {
                        "当一张{C:attention}玻璃牌{}计分时，",
                        "计分的非玻璃牌每打出一张",
                        "获得{C:chips}+#2#{}筹码和{C:mult}+#1#{}倍率",
                    },
                    {
                        "当一张{C:attention}玻璃牌{}碎裂时",
                        "其他计分牌的",
                        "基础筹码{C:attention}翻倍{}",
                    },
                },
            },
            j_abn_spihcneve = {
                name = "反向瓷砖小丑",
                text = {
                    {
                        "当一张{C:mult}倍率牌{}计分时，",
                        "计分的非倍率牌",
                        "永久获得{C:chips}+#1#{}筹码",
                    },
                    {
                        "当一张{C:attention}偶数{}的{C:mult}倍率牌{}计分时，",
                        "计分的{C:attention}奇数{}非倍率牌",
                        "永久获得{C:mult}+#2#{}倍率",
                    },
                },
            },
            j_abn_spitting_imagine = {
                name = "吐息想象",
                text = {
                    "每当你复制一张{C:mult}偶数{}",
                    "或{C:chips}奇数{}点数的牌，",
                    "分别获得{C:mult}倍率{}或{C:chips}筹码{}",
                    "{C:inactive}（当前为：{C:mult}+#1# {C:inactive}倍率，{C:chips}+#2# {C:inactive}筹码）",
                }
            },
            j_abn_steel_bonus = {
                name = "钢铁加成",
                text = {
                    {
                        "若出牌同时包含{C:attention}钢铁{}",
                        "和{C:attention}加成{}牌，它们各自获得",
                        "{C:gold}+#1#{}晋升强度和{C:purple}+#2#{}分数",
                    },
                    {
                        "{C:enhanced}钢铁{}{C:attention}小丑{}触发时获得{X:mult,C:white}X#3#{}倍率，{C:enhanced}加成{}",
                        "{C:attention}小丑{}获得{X:chips,C:white}X#4#{}筹码",
                    },
                    {
                        "选择{C:attention}大盲注{}时，生成",
                        "本局最后使用的{C:crimson}深红{}牌",
                        "{C:inactive}当前为：{}{C:crimson}#5#{}",
                    },
                },
            },
            j_abn_stiff_drink = {
                name = "烈酒",
                text = {
                    {
                        "首次击败某个{C:attention}盲注{}时，",
                        "重复该盲注{C:attention}而非{}进入{C:attention}下一个盲注{}",
                    },
                    {
                        "所有{C:chips}出牌次数{}和{C:mult}弃牌次数{}",
                        "均视为回合的{C:attention}第一次{}",
                        "和{C:attention}最后一次{}",
                    },
                },
            },
            j_abn_swag_voucher = {
                name = "派头优惠券",
                text = {
                    "每兑换一张{C:attention}优惠券{}获得",
                    "{X:red,C:white}X#1#{}倍率和{X:blue,C:white}X#2#{}筹码",
                    "{C:inactive}（当前为{X:red,C:white}X#3#{C:inactive}倍率，{X:blue,C:white}X#4#{C:inactive}筹码）",
                }
            },
            j_abn_the_contrarian = {
                name = "唱反调者",
                text = {
                    "每计分一张{C:red}被削弱{}的牌",
                    "给予{X:mult,C:white}X#1#{}倍率",
                }
            },
            j_abn_the_feast = {
                name = "盛宴",
                text = {
                    {
                        "购买{C:attention}食物{}小丑牌时，",
                        "生成它的一张{C:dark_edition}负片{}复制",
                    },
                    {
                        "当一张{C:attention}食物{}小丑牌被{C:gold}售出{}时，",
                        "每持有该牌一个回合",
                        "获得{X:red,C:white}X#1#{}倍率",
                    },
                    {
                        "若它被摧毁，则每持有回合",
                        "获得{X:blue,C:white}X#2#{}筹码",
                        "{C:inactive}（当前为{X:red,C:white}X#3#{C:inactive}倍率，{X:blue,C:white}X#4#{C:inactive}筹码）",
                        "{C:inactive,s:0.8}（回合数从拥有这张小丑牌起算）",
                    },
                },
            },
            j_abn_topsy_turvy_joker = {
                name = "颠倒小丑",
                text = {
                    {
                        "当一张{C:dark_edition}逆转{}牌计分时，",
                        "这张小丑牌获得",
                        "交换所获得的{C:mult}倍率{}（若有），",
                        "{C:inactive}（当前为{C:mult}+#1# {C:inactive}倍率）",
                    },
                    {
                        "若这张小丑牌是{C:dark_edition}逆转{}版本，",
                        "每当{C:mult}倍率{}因{C:dark_edition}逆转{}",
                        "而提升，该提升",
                        "将被{C:mult}X#2#{}放大",
                    },
                },
            },
            j_abn_towser = {
                name = "陶瑟",
                text = {
                    {
                        "这张小丑牌每次使用",
                        "{C:spectral}幻灵{}牌时获得",
                        "{X:chips,C:white}^#2#{}筹码",
                        "{C:inactive}（当前为{X:chips,C:white}^#1#{}筹码）",
                    },
                    {
                        "每家{C:attention}商店{}始终包含",
                        "一包{C:attention}大型幻灵包",
                    },
                },
            },
            j_abn_triskaidekaphobia = {
                name = "恐十三症",
                text = {
                    {
                        "当一张{C:attention}幸运牌{}计分时，",
                        "计分的非幸运牌",
                        "其基础{C:chips}筹码{}永久翻倍",
                    },
                    {
                        "当一张{C:attention}13{}计分时，",
                        "消耗{X:blind,C:white}X#2#{}盲注大小",
                        "和{X:blind,C:white}+X#4#{}起始盲注大小，",
                        "获得{C:attention}+#3#{}小丑牌槽位",
                        "{C:inactive}（当前为{X:blind,C:white}X#5#{C:inactive}盲注大小）",
                    },
                },
            },
            j_abn_voucher_jimbo = {
                name = "优惠券金宝",
                text = {
                    "每兑换一张{C:attention}优惠券{}获得",
                    "{C:red}+#1#{}倍率和{C:blue}+#2#{}筹码",
                    "{C:inactive}（当前为{C:red}+#3#{C:inactive}倍率，{C:blue}+#4#{C:inactive}筹码）",
                }
            },
            j_abn_wicked_witch = {
                name = "邪恶女巫",
                text = {
                    {
                        "使用{C:dark_edition}模组{}{C:tarot}塔罗{}牌时",
                        "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
                    },
                    {
                        "若使用一张{C:weather_report}天气预报{}",
                        "则{C:red}自毁{}",
                    },
                },
            },
            j_abn_wiimotionplus = {
                name = "Wii 小丑",
                text = {
                    "若这张小丑牌未在该{C:attention}小丑牌槽位{}",
                    "开始过{C:attention}盲注{}，",
                    "则每个{C:attention}盲注{}开始时",
                    "获得{C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                    "{C:inactive,s:0.8}（已用槽位：#3#）",
                }
            },
        },
        Other = {
            abn_bio_blueprint_even = {
                name = "#1#的#2#（偶数）",
                text = {
                    "所有计分的#1#给予{C:mult}+#3#{}倍率",
                    "若回合结束前至少有{C:attention}#1#{}张",
                    "#1#被计分，倍率翻倍",
                    "{C:inactive}（已计分{C:attention}#4#{C:inactive}/#1#张#1#）",
                }
            },
            abn_bio_blueprint_even_edi = {
                name = "{C:dark_edition}#5#{} #1#的#2#（偶数）",
                text = {
                    "所有计分的#1#给予{C:mult}+#3#{}倍率",
                    "所有计分的{C:dark_edition}#5#{}#1#额外给予{C:mult}+#6#{}倍率",
                    "若回合结束前至少有{C:attention}#1#{}张",
                    "#1#被计分，倍率翻倍",
                    "若回合结束前至少有{C:attention}#1#{}张",
                    "{C:dark_edition}#5#{}#1#被计分，倍率翻倍",
                    "{C:inactive}（已计分{C:attention}#4#{C:inactive}/#1#张#1#，{C:attention}#7#{C:inactive}/#1#张{C:dark_edition}#5#{C:inactive}#1#）",
                }
            },
            abn_bio_blueprint_even_edi_enh = {
                name = "{C:dark_edition}#5#{} {C:attention}#8#{} #1#的#2#（偶数）",
                text = {
                    "所有计分的#1#给予{C:mult}+#3#{}倍率",
                    "所有计分的{C:dark_edition}#5#{}#1#额外给予{C:mult}+#6#{}倍率",
                    "所有计分的{C:attention}#8#{}#1#额外给予{C:chips}+#9#{}筹码",
                    "若回合结束前至少有{C:attention}#1#{}张",
                    "#1#被计分，倍率翻倍",
                    "若回合结束前至少有{C:attention}#1#{}张",
                    "{C:dark_edition}#5#{}#1#被计分，倍率翻倍",
                    "若回合结束前至少有{C:attention}#1#{}张",
                    "{C:attention}#8#{}#1#被计分，筹码翻倍",
                    "{C:inactive}（已计分{C:attention}#4#{C:inactive}/#1#张#1#，{C:attention}#7#{C:inactive}/#1#张{C:dark_edition}#5#{C:inactive}#1#，{C:inactive}#10#/#1#张{C:attention}#8#{C:inactive}#1#）",
                }
            },
            abn_bio_blueprint_even_enh = {
                name = "{C:attention}#5#{} #1#的#2#（偶数）",
                text = {
                    "所有计分的#1#给予{C:mult}+#3#{}倍率",
                    "所有计分的{C:attention}#5#{}#1#额外给予{C:chips}+#6#{}筹码",
                    "若回合结束前至少有{C:attention}#1#{}张",
                    "#1#被计分，倍率翻倍",
                    "若回合结束前至少有{C:attention}#1#{}张",
                    "{C:attention}#5#{}#1#被计分，筹码翻倍",
                    "{C:inactive}（已计分{C:attention}#4#{C:inactive}/#1#张#1#，{C:attention}#7#{C:inactive}/#1#张{C:attention}#5#{C:inactive}#1#）",
                }
            },
            abn_bio_blueprint_incompatible_norank = {
                name = "不兼容",
                text = {
                    "没有点数的牌",
                    "无法获得任何加成",
                }
            },
            abn_bio_blueprint_incompatible_rank = {
                name = "不兼容",
                text = {
                    "点数为‘#1#’的牌",
                    "无法获得任何加成",
                }
            },
            abn_bio_blueprint_odd = {
                name = "#1#的#2#（奇数）",
                text = {
                    "所有计分的#1#给予{C:chips}+#3#{}筹码",
                    "若回合结束前至少有{C:attention}#1#{}张",
                    "#1#被计分，筹码翻倍",
                    "{C:inactive}（已计分{C:attention}#4#{C:inactive}/#1#张#1#）",
                }
            },
            abn_bio_blueprint_odd_edi = {
                name = "{C:dark_edition}#5#{} #1#的#2#（奇数）",
                text = {
                    "所有计分的#1#给予{C:chips}+#3#{}筹码",
                    "所有计分的{C:dark_edition}#5#{}#1#额外给予{C:mult}+#6#{}倍率",
                    "若回合结束前至少有{C:attention}#1#{}张",
                    "#1#被计分，筹码翻倍",
                    "若回合结束前至少有{C:attention}#1#{}张",
                    "{C:dark_edition}#5#{}#1#被计分，倍率翻倍",
                    "{C:inactive}（已计分{C:attention}#4#{C:inactive}/#1#张#1#，{C:attention}#7#{C:inactive}/#1#张{C:dark_edition}#5#{C:inactive}#1#）",
                }
            },
            abn_bio_blueprint_odd_edi_enh = {
                name = "{C:dark_edition}#5#{} {C:attention}#8#{} #1#的#2#（奇数）",
                text = {
                    "所有计分的#1#给予{C:chips}+#3#{}筹码",
                    "所有计分的{C:dark_edition}#5#{}#1#额外给予{C:mult}+#6#{}倍率",
                    "所有计分的{C:attention}#8#{}#1#额外给予{C:chips}+#9#{}筹码",
                    "若回合结束前至少有{C:attention}#1#{}张",
                    "#1#被计分，筹码翻倍",
                    "若回合结束前至少有{C:attention}#1#{}张",
                    "{C:dark_edition}#5#{}#1#被计分，倍率翻倍",
                    "若回合结束前至少有{C:attention}#1#{}张",
                    "{C:attention}#8#{}#1#被计分，筹码翻倍",
                    "{C:inactive}（已计分{C:attention}#4#{C:inactive}/#1#张#1#，{C:attention}#7#{C:inactive}/#1#张{C:dark_edition}#5#{C:inactive}#1#，{C:inactive}#10#/#1#张{C:attention}#8#{C:inactive}#1#）",
                }
            },
            abn_bio_blueprint_odd_enh = {
                name = "{C:attention}#5#{} #1#的#2#（奇数）",
                text = {
                    "所有计分的#1#给予{C:chips}+#3#{}筹码",
                    "所有计分的{C:attention}#5#{}#1#额外给予{C:chips}+#6#{}筹码",
                    "若回合结束前至少有{C:attention}#1#{}张",
                    "#1#被计分，筹码翻倍",
                    "若回合结束前至少有{C:attention}#1#{}张",
                    "{C:attention}#5#{}#1#被计分，筹码翻倍",
                    "{C:inactive}（已计分{C:attention}#4#{C:inactive}/#1#张#1#，{C:attention}#7#{C:inactive}/#1#张{C:attention}#5#{C:inactive}#1#）",
                }
            },
        },
    },
    misc = {
        dictionary = {
            abn_unique_suit_1 = {
                "{E:1}1 种花色",
                "若{C:money}资金{}为{C:attention}质数{}",
                "则所有牌重新触发{C:attention}#5#{}次",
            },
            abn_unique_suit_2 = {
                "{E:1}2 种花色",
                "计分牌给予{X:blind,C:white}X#2#{}盲注需求",
            },
            abn_unique_suit_3 = {
                "{E:1}3 种花色",
                "计分牌将{C:attention}相邻{}牌的",
                "{C:attention}点数{}作为{C:chips}筹码{}",
            },
            abn_unique_suit_4 = {
                "{E:1}4 种花色",
                "计分牌给予{X:mult,C:white}X#3#{}倍率",
            },
            abn_unique_suit_5 = {
                "{E:1}5 种花色",
                "计分牌永久获得{C:gold}+#4#{}晋升强度",
            },
            abn_unique_suit_6 = {
                "{E:1}6 种花色",
                "摧毁所有{C:attention}非传说{}小丑牌",
                "并替换为{C:legendary}传说{}小丑牌",
                "{C:abn_j,s:0.8}杰{C:abn_e,s:0.8}维{C:abn_v,s:0.8}尔{C:abn_i,s:0.8}除{C:abn_l,s:0.8}外{}",
            },
        },
    },
}
