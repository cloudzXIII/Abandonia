return {
  descriptions = {
    lexica = {
      c_abn_a = {
                name = "A（电流）",
                text = {
                    "下次带有{C:dark_edition}版本{}的{C:attention}小丑牌",
                    "{C:attention}触发{}时",
                    "将相同版本添加到{C:attention}第一张{}",
                    "和{C:attention}最后一张{}计分牌上",
                },
            },
      c_abn_b = {
                name = "B（气压计）",
                text = {
                    "下次{C:attention}倍率牌{}",
                    "{C:attention}触发{}时",
                    "给予三倍的{C:mult}倍率",
                },
            },
      c_abn_c = {
                name = "C（节奏）",
                text = {
                    "下次{C:attention}两对{}",
                    "{C:attention}触发{}时",
                    "每张计分牌给予{C:white,X:chips}X#1#{}筹码",
                },
            },
      c_abn_d = {
                name = "D（清创）",
                text = {
                    "下次{C:attention}背面朝上{}的牌",
                    "{C:attention}触发{}时",
                    "将你{C:attention}完整牌组{}中所有牌翻至正面朝上",
                    "并使其永久获得{C:chips}+#1#{}筹码",
                },
            },
      c_abn_e = {
                name = "E（流逝）",
                text = {
                    "下次跳过{C:attention}盲注{}时",
                    "获得一个随机{C:abn_hazard}险兆标签{}",
                },
            },
      c_abn_f = {
                name = "F（封建）",
                text = {
                    "下次{C:gold}金色蜡封{}{C:attention}触发{}时",
                    "所有小丑牌获得{C:white,X:mult}X#1#{}倍率",
                },
            },
      c_abn_g = {
                name = "G（英勇）",
                text = {
                    "下次{C:attention}葫芦{}",
                    "{C:attention}触发{}时",
                    "{C:red}摧毁{}所有{C:attention}人头牌{}",
                    "手牌中{C:attention}点数最小{}的牌",
                    "获得它们所有的{C:chips}筹码",
                },
            },
      c_abn_h = {
                name = "H（敬意）",
                text = {
                    "下次使用{C:tarot}塔罗牌{}时",
                    "生成一张它的{C:dark_edition}负片{}复制牌",
                },
            },
      c_abn_i = {
                name = "I（固有）",
                text = {
                    "下次{C:attention}未增强{}的牌计分时",
                    "其永久获得{C:attention}+1{}次重新触发",
                },
            },
      c_abn_j = {
                name = "J（交汇）",
                text = {
                    "下次打出{C:attention}顺子{}时",
                    "每打出一张{C:attention}数字牌{}",
                    "将其等级提升{C:attention}1{}级",
                },
            },
      c_abn_k = {
                name = "K（业力）",
                text = {
                    "下次{C:attention}玻璃牌{}",
                    "被{C:red}摧毁{}时",
                    "所有计分牌永久获得{C:white,X:mult}X#1#{}倍率",
                },
            },
      c_abn_l = {
                name = "L（挽歌）",
                text = {
                    "下次{C:green}概率{}未触发时",
                    "将你的{C:attention}最常用{}牌型提升{C:attention}1{}级",
                },
            },
      c_abn_m = {
                name = "M（入学）",
                text = {
                    "下次升级牌型时",
                    "同时升级你的{C:attention}最常用{}牌型",
                },
            },
      c_abn_n = {
                name = "N（命名法）",
                text = {
                    "下次{C:attention}万能牌{}",
                    "计分时",
                    "手牌中所有牌",
                    "获得{C:abn_brown_seal}棕色蜡封{}",
                },
            },
      c_abn_o = {
                name = "O（尊崇）",
                text = {
                    "下次{C:attention}黄金牌{}",
                    "计分时",
                    "将其{C:chips}筹码{}永久变为三倍",
                },
            },
      c_abn_p = {
                name = "P（幻影）",
                text = {
                    "下次使用{C:spectral}幻灵牌{}时",
                    "生成一张它的{C:dark_edition}负片{}复制牌",
                },
            },
      c_abn_q = {
                name = "Q（泥沼）",
                text = {
                    "下次{C:attention}石头牌{}",
                    "计分时",
                    "所有小丑牌获得{C:chips}+#1#{}筹码",
                },
            },
      c_abn_r = {
                -- Requiem（安魂曲/追思弥撒）是一个拉丁语词汇，原意为“安息”。
                -- 它主要指天主教会为死去的人举行的追悼仪式（安魂弥撒），
                -- 或是专门为这种仪式创作的音乐作品，引申义则指任何悼念或告别死者的悲伤事物
                name = "R（安魂曲）",
                text = {
                    "下次使用{C:sigils}符印牌{}时",
                    "下一次出牌中所有计分牌",
                    "变为{C:dark_edition}多彩{}",
                    "并获得{C:abn_violet_seal}紫色蜡封{}",
                },
            },
      c_abn_s = {
                name = "S（亵渎）",
                text = {
                    "下次一手牌中",
                    "同时包含{C:diamonds}光明{}和{C:spades}暗色花色{}时",
                    "摧毁所有牌并生成",
                    "一张{C:dark_edition}负片{}{C:attention}灵魂{}牌",
                },
            },
      c_abn_t = {
                name = "T（激流）",
                text = {
                    "下次{C:attention}同花{}",
                    "{C:attention}触发{}时",
                    "给每张打出的牌",
                    "添加{C:abn_skyblue_seal}天蓝蜡封{}",
                },
            },
      c_abn_u = {
                name = "U（无处不在）",
                text = {
                    "下次打出{C:attention}奖励牌{}时",
                    "为其添加{C:dark_edition}亮光{}版本",
                },
            },
      c_abn_v = {
                name = "V（冒险）",
                text = {
                    "下次打出的牌中",
                    "只包含{C:spades}暗色花色{}时",
                    "摧毁所有牌并生成",
                    "一张{C:dark_edition}负片{}{C:attention}躯体{}牌",
                    "{C:attention,s:0.8}高牌{s:0.8}除外",
                },
            },
      c_abn_w = {
                name = "W（悲苦）",
                text = {
                    "下次{C:attention}幸运牌{}",
                    "计分时",
                    "为其添加{C:dark_edition}荒废{}版本",
                    "和{C:red}红色蜡封{}",
                },
            },
      c_abn_x = {
                -- 外族中心主义（Xenocentrism）是一个社会学概念，
                -- 指一个人认为他国或外族的文化、习俗、产品、思想和生活方式优于自己本民族的文化，并对其盲目崇拜或过度偏好。
                -- 它是“民族中心主义（Ethnocentrism）”的反义词。
                name = "X（崇洋媚外）",
                text = {
                    "下次打出{C:attention}光谱{}时",
                    "所有小丑牌获得",
                    "{C:chips}+#1#{}筹码和{C:mult}+#2#{}倍率",
                },
            },
      c_abn_y = {
                name = "Y（远方）",
                text = {
                    "下次使用{C:astro_cards}星座{}牌时",
                    "其{C:green}概率{}必定成功",
                    "生成一张随机{C:dark_edition}负片{}",
                    "{C:planet}点数星球{}牌",
                },
            },
      c_abn_z = {
                name = "Z（狂热者）",
                text = {
                    "下次打出的牌中",
                    "只包含{C:diamonds}光明花色{}时",
                    "摧毁所有牌并生成",
                    "一张{C:dark_edition}负片{}{C:attention}精神{}牌",
                    "{C:attention,s:0.8}高牌{s:0.8}除外",
                },
            },
      c_abn_thorn = {
                -- Þ、þ（þorn 或 thorn）是古英语和冰岛语的一个字母。
                -- 前者是大写，后者是小写。这字母也曾在中世纪斯堪的纳维亚使用，
                -- 但在现代英语和斯堪的纳维亚各语言均已被 th 所取代。
                -- þ 来自如尼字母 ᚦ (U+16A6) ，在古英语称为 þorn，
                -- 在斯堪的纳维亚称为 thurs（北欧神话的巨人）。
                name = "THORN",
                text = {
                    "下次使用{C:nightshift_cards}夜班{}牌时",
                    "所有小丑牌获得{C:chips}+#1#{}筹码",
                    "并{C:red}移除{}其{C:attention}贴纸{}",
                },
            },
      c_abn_yogh = {
                -- yogh是中古英语和中古苏格兰语中曾使用过的一个字母，写作“ȝ”
                -- 该字母在古英语和中古英语时期用于代表腭摩擦音或软腭摩擦音
                -- 14世纪后，该符号在词首或音节开头演变为现代英语的辅音'y'
                -- 在词中位置通过现代英语的'gh'保留
                -- 其书写系统被法语抄写员改变，使用-g-、-y-或-gh-替代。
                name = "YOGH",
                text = {
                    "下次打出的牌中",
                    "包含{C:abn_penumbra}半影{}牌时",
                    "为打出的{C:abn_penumbra}半影{}牌",
                    "添加{C:dark_edition}逆转{}版本",
                },
            },
      c_abn_eth = {
                -- 在古英语中，Eth（大写 Ð，小写 ð）有两个主要含义：
                -- 一是代表发音类似“th”的古老字母；
                -- 二是代表动词在第三人称单数现在的词尾后缀
                name = "ETH",
                text = {
                    "下次打出的牌中",
                    "包含{C:abn_snow}雪{}牌时",
                    "为打出的{C:abn_snow}雪{}牌",
                    "添加{C:dark_edition}胶棉{}版本",
                },
            },
      c_abn_v_hook = {
                name = "V (Hooked)", -- 没有找到相关的中文翻译，暂时保留原文
                text = {
                    "下次打出的牌中",
                    "包含{C:abn_tie}和{}牌时",
                    "添加{C:abn_violet_seal}#2#{}",
                    "并将打出的{C:abn_tie}和{}牌增强为{C:attention}#1#",
                },
            },
      c_abn_vend = {
                -- 上Discord问过，Vend（Ꝩ，ꝩ） 是古诺尔斯语的一个字母。
                -- 它曾用来表示 /u/ 、 /v/ 和 /w/ 的发音。
                name = "VEND",
                text = {
                    "下次打出的牌中",
                    "包含{C:abn_bow}弓{}牌时",
                    "添加{C:abn_brown_seal}#2#{}",
                    "并将打出的{C:abn_bow}弓{}牌",
                    "增强为{C:attention}#1#",
                },
            },
    },
  },
}
