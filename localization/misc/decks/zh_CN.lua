return {
  descriptions = {
    Back = {
      b_abn_das_goodtime = {
                name = "美好时光牌组",
                text = {
                    "开局时牌组包含全套",
                    "{C:abn_florette}小花{}、{C:abn_acorn}橡果{}",
                    "{C:abn_bell}铃{}和{C:abn_leaf}叶{}牌",
                    "{C:attention}+#1#{}手牌上限",
                    "{C:red}-4{}弃牌次数",
                }
            },
      b_abn_glue_deck = {
                name = "胶水牌组",
                text = {
                    "开局时拥有",
                    "{C:attention,T:v_abn_gold_tree}#1#{}优惠券",
                    "牌选中后无法取消",
                    "{C:attention}小丑牌{}无法移动",
                }
            },
      b_abn_woebegone = {
                name = "悲苦牌组",
                text = {
                    "开局时拥有{C:tarot,T:v_abn_tarot_master}#1#{}",
                    "以及全套",
                    "{C:abn_chalice}圣杯{}、{C:abn_sword}剑{}",
                    "{C:abn_baton}杖{}和{C:abn_coin}币{}牌",
                    "每次弃牌失去{C:red}$1{}",
                }
            },
      b_abn_calamity = {
                name = "灾厄牌组",
                text = {
                    "弃掉的牌有{C:green}#1#/#2#{}几率",
                    "被摧毁",
                    "选择{C:attention}盲注{}时",
                    "生成一张随机{C:dark_edition}负片{} {C:sigils}符印{}牌",
                }
            },
      b_abn_cyber = {
                name = "赛博牌组",
                text = {
                    "商店中可能出现",
                    "{C:solid_state}固态{}牌",
                    "开局时拥有{C:solid_state,T:c_abn_database}数据库{}牌",
                }
            },
      b_abn_CrimsonDeck = {
                name = "深红牌组",
                text = {
                    "牌型的{C:chips}基础筹码{}",
                    "{C:attention}减半{}",
                    "{X:mult,C:white}X2{}倍率",
                    "{C:red}X1.7{}基础盲注需求",
                }
            },
      b_abn_AzulDeck = {
                name = "蔚蓝牌组",
                text = {
                    "可以{C:chips}出牌{}和{C:mult}弃牌{} {C:attention}6{}张牌",
                    "出牌少于{C:attention}6{}张时失去{C:money}$3{}",
                }
            },
      b_abn_GoldenDeck = {
                name = "黄金牌组",
                text = {
                    "每打出一张牌获得{C:money}$1{}",
                    "如果资金达到{C:money}$0{}",
                    "自动输掉当前回合",
                }
            },
      b_abn_EmeraldDeck = {
                name = "翡翠牌组",
                text = {
                    "开局时拥有{C:green,T:v_reroll_surplus}多次重掷{}",
                    "和{C:green,T:v_reroll_glut}重掷加強版{}",
                    "{C:attention}0{}个消耗牌槽位",
                }
            },
      b_abn_WhiteDeck = {
                name = "白色牌组",
                text = {
                    "{C:attention}-2{}个小丑牌槽位",
                    "小丑牌出现{C:dark_edition}负片{}",
                    "版本的概率{C:attention}提高2倍{}",
                }
            },
      b_abn_EvenOddDeck = {
                name = "奇偶牌组",
                text = {
                    "开局时牌组中",
                    "只包含{C:attention}数字牌{}",
                }
            },
      b_abn_SnowDeck = {
                name = "雪牌组",
                text = {
                    "开局时额外拥有一套",
                    "{C:abn_snow}雪{}牌",
                    "和{C:spectral,T:v_omen_globe}#1#{}",
                    "回合结束时，每张{C:attention}非雪{}牌",
                    "有{C:green}#2#/#3#{}几率",
                    "转化为{C:abn_snow}雪{}牌",
                }
            },
      b_abn_PenumbraDeck = {
                name = "半影牌组",
                text = {
                    "开局时额外拥有一套",
                    "{C:abn_penumbra}半影{}牌",
                }
            },
      b_abn_DarkNebulaDeck = {
                name = "暗星云牌组",
                text = {
                    "商店中不会出现{C:planet}星球{}补充包",
                    "{C:astro_cards}星座{}牌出现频率{C:attention}提高2倍{}",
                }
            },
      b_abn_PoltergiestDeck = {
                -- Poltergeist源自德语，意指会发出噪声、移动家具或乱扔东西的超自然灵体或现象
                name = "骚灵牌组",
                text = {
                    "{C:nightshift_cards}夜班{}牌出现频率更高",
                    "每使用一张{C:attention}消耗牌{}",
                    "提升{C:attention}盲注需求{} {X:attention,C:white}x0.02{}",
                }
            },
            -- 它假设两个人的外部行为、语言反应和大脑物理功能完全相同，但他们内心的主观体验（感质）却完全相反——例如一个人看到的“红”是另一个人看到的“绿”，但两人都能正确说出那是“红色的苹果”。
            -- 感质倒转（Inverted Qualia）是心灵哲学中的一个著名思想实验。
      b_abn_InvertedQualia = {
                name = "感质倒转牌组",
                text = {
                    "每经过{C:attention}1{}个{C:attention}底注{}",
                    "选择一种随机{C:attention}花色{}",
                    "该花色视为{C:attention}所有{}花色",
                    "当前花色：#1#",
                }
            },
      b_abn_OxidizedDeck = {
                name = "氧化牌组",
                text = {
                    "{C:dark_edition}增强{}牌在{C:attention}计分{}后",
                    "会被{C:mult}削弱{}",
                    "未增强的牌不会被{C:mult}削弱{}",
                }
            },
      b_abn_PlatinumDeck = {
                name = "白金牌组",
                text = {
                    "开局时拥有{C:red}打磨{}和{C:red}焕彩{}",
                    "没有{C:dark_edition}版本{}的小丑牌",
                    "有{C:green}1/5{}几率被{C:mult}摧毁{}",
                }
            },
      b_abn_ConvergenceDeck = {
                name = "汇聚牌组",
                text = {
                    "计分前交换",
                    "{C:chips}筹码{}和{C:mult}倍率{}",
                    "{C:mult}X2.5{}盲注需求",
                }
            },
      b_abn_JugglerDeck = {
                name = "杂耍牌组",
                text = {
                    "开局时拥有{C:attention}10{}次{C:chips}出牌{}次数",
                    "{C:chips}出牌{}次数可在回合间保留",
                    "售出小丑牌可获得{C:chips}出牌{}次数",
                }
            },
      b_abn_ensnared = {
                name = "诱捕牌组",
                text = {
                    "{C:attention}#1#{}个消耗牌槽位",
                    "击败{C:attention}Boss盲注{}时",
                    "增加{C:attention}+#2#{}个",
                    "最多可负债{C:red}-$#3#{}",
                }
            },
      b_abn_treaty = {
                name = "色彩论牌组", -- Treaty of Colors，色彩论是由德国诗人、作家、艺术家约翰·沃尔夫冈·冯·歌德于1810年发表的著作，书中提出了关于颜色的理论和观察。
                text = {
                    "开局时牌组包含所有",
                    "{C:attention}基础{}花色以及",
                    "{C:abn_snow}雪{}、{C:abn_penumbra}半影{}",
                    "{C:abn_tie}和{}和{C:abn_bow}弓{}牌",
                }
            },
      b_abn_photometry = {
                name = "测光牌组",
                text = {
                    "开局时牌组包含{C:abn_snow}雪{}、{C:abn_penumbra}半影{}",
                    "{C:abn_tie}和{}、{C:abn_bow}弓{}和{C:inactive}无色{}牌",
                    "不包含{C:attention}基础{}花色",
                }
            },
      b_abn_synesthic = {
                name = "通感之环牌组",
                text = {
                    "开局时牌组包含全套",
                    "{C:abn_chalice}圣杯{}、{C:abn_baton}杖{}、{C:abn_coin}币{}、{C:abn_sword}剑{}",
                    "{C:abn_bow}弓{}、{C:abn_tie}和{}、{C:abn_penumbra}半影{}和{C:abn_snow}雪{}牌",
                    "不包含{C:attention}人头{}牌",
                    "{C:attention}+1{}手牌选择上限",
                    "击败{C:attention}Boss盲注{}时",
                    "{C:attention}盲注需求{}{C:white,X:mult}X1.3{}",
                }
            },
      b_abn_epoch = {
                name = "新纪元牌组",
                text = {
                    "开局时拥有全套",
                    "{C:inactive}原版{}、{C:abn_talon}利爪{}、",
                    "{C:abn_crown}王冠{}、{C:abn_moon}月亮{}",
                    "和{C:abn_star}群星{}",
                    "本局每跳过一个{C:attention}盲注{}",
                    "所有{C:attention}盲注需求{}增加{C:white,X:mult}+X1{}",
                }
            },
      b_abn_untamed = {
                name = "未驯牌组",
                text = {
                    "开局时拥有{C:planet,T:v_abn_satellite}#1#{}",
                    "和{C:sigils,T:v_abn_chaos}#2#{}",
                    "{C:chips}小盲注{}现在变为{C:attention}大盲注{}",
                },
            },
      b_abn_shackle = {
                name = "枷锁狂热者",
                text = {
                    "开局时牌组只包含{C:spades}暗色花色{}牌",
                    "并带有{C:dark_edition}幽冥{}版本",
                }
            },
      b_abn_poneglyph = {
                name = "历史正文牌组", -- Poneglyph大概率出自《海贼王》
                text = {
                    "开局时牌组包含全套",
                    "{C:attention}石头{}、{C:attention}石油{}",
                    "{C:attention}波尔卡点{}和{C:inactive}无色{}牌",
                }
            },
    },
  },
}

