return {
  descriptions = {
    weather_report = {
      c_abn_clear_sky = {
                name = "晴天",
                text = {
                    "重新触发所有计分的",
                    "{C:attention}未增强{}牌",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_cloudz = {
                name = "多云",
                text = {
                    "摧毁{C:attention}1{}张选定",
                    "{C:attention}小丑牌{}，复制一张",
                    "拥有的随机小丑牌",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_rain = {
                name = "雨天",
                text = {
                    "复制手牌中一张随机",
                    "{C:attention}游戏牌{}",
                    "{C:inactive}（剩余{C:attention}#1#{C:inactive}次使用）",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_snow = {
                name = "雪天",
                text = {
                    "每回合{C:red}+#1#{}次弃牌",
                    "{C:attention}摧毁{}所有打出的",
                    "非{C:abn_snow}雪{}牌",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_storm = {
                name = "暴风雨",
                text = {
                    "给{C:attention}2{}张选定牌",
                    "随机{C:dark_edition}版本{}、{C:attention}蜡封{}",
                    "和{C:attention}增强效果{}",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_wind = {
                name = "强风",
                text = {
                    "弃掉所有{C:attention}未选定{}的牌",
                    "并重新抽取",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_hail = {
                name = "冰雹",
                text = {
                    "出牌时",
                    "手牌中每张牌",
                    "有{C:green}#1#/#2#{}几率",
                    "被{C:red}摧毁{}",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_fog = {
                name = "雾天",
                text = {
                    "{C:white,X:mult}X#1#{}倍率",
                    "所有牌均以",
                    "{C:attention}背面朝上{}抽取",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_rainbow = {
                name = "彩虹",
                text = {
                    "给手牌中{C:attention}#1#{}张随机牌",
                    "赋予随机{C:dark_edition}版本{}",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_tornado = {
                name = "龙卷风",
                text = {
                    "每回合{C:blue}+#1#{}次出牌",
                    "被弃掉的牌",
                    "被{C:red}摧毁{}",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_hurricane = {
                name = "飓风",
                text = {
                    "抽取{C:attention}#1#{}张{C:attention}翻转{}牌",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_ash_cloud = {
                name = "火山云",
                text = {
                    "每回合{C:blue}+#1#{}次出牌",
                    "削弱所有{C:diamonds}光明花色{}",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_drought_weather = {
                name = "干旱",
                text = {
                    "摧毁手牌中所有{C:clubs}梅花{}牌",
                    "然后{C:attention}抽满{}手牌",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_frigid = {
                name = "严寒",
                text = {
                    "计分的{C:diamonds}光明花色{}牌",
                    "获得随机{C:dark_edition}版本{}",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_pollen = {
                name = "花粉", --在天气预报中，pollen 的中文翻译是花粉，常用于表示空气中的花粉浓度
                text = {
                    "弃掉所有{C:attention}增强{}牌",
                    "并抽取等量的牌",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_blizzard_weather = {
                name = "暴风雪",
                text = {
                    "计分的{C:spades}暗色花色{}牌",
                    "获得随机{C:dark_edition}版本{}",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_sandstorm = {
                name = "沙尘暴",
                text = {
                    "{C:attention}摧毁{}手牌中所有{C:abn_snow}雪{}牌",
                    "然后{C:attention}抽满{}手牌",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_smog = {
                name = "雾霾",
                text = {
                    "{C:attention}摧毁{}手牌中所有{C:hearts}红桃{}牌",
                    "然后{C:attention}抽满{}手牌",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_dust_devil = {
                -- Dust Devil在气象学中的中文翻译是尘卷风，也被称为尘旋风或沙旋
                name = "尘卷风",
                text = {
                    "{C:attention}摧毁{}手牌中所有{C:spades}黑桃{}牌",
                    "然后{C:attention}抽满{}手牌",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_acid_rain = {
                name = "酸雨",
                text = {
                    "{C:attention}摧毁{}手牌中所有{C:diamonds}方块{}牌",
                    "然后{C:attention}抽满{}手牌",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_fire_rainbow = {
                -- 环地平弧（英语：Circumhorizontal arc），又称日承或环水平弧，是一种发生在大气层中罕见的自然现象，为日晕的一种。
                -- 环地平弧亦俗称火彩虹（fire rainbow），此名称于2006年斯波坎出现壮观的环地平弧现象后创造。
                -- 但环地平弧并非真正的彩虹与火也没有关系
                -- 由于它看起来像是在天空中自燃的彩虹而得名
                name = "日承",
                text = {
                    "提升下一次打出的",
                    "包含{C:attention}光谱{}的手牌等级",
                    "{C:red}摧毁{}所有打出的牌",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
      c_abn_dew = {
                -- 在天气预报中，单词 dew 是 “露” 或 “露水”；
                -- 另外说明气象数据中的专业指标，通常是 “露点” 或 “露点温度”（Dew point）。
                name = "露水",
                text = {
                    "每回合{C:blue}+#1#{}次出牌",
                    "削弱所有{C:spades}暗色花色{}",
                    "{C:inactive}（回合结束时被摧毁）",
                }
            },
    },
  },
}
