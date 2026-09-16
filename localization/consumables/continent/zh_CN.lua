return {
  descriptions = {
    continent = {
      c_abn_africa = {
                name = "非洲",
                text = {
                    {
                        "给{C:attention}最右侧{}的小丑牌",
                        "添加{C:diamonds}方块贴纸{}",
                    },
                    {
                        "所有留在手中的{C:diamonds}方块{}牌",
                        "永久获得{C:mult}+#1#{}倍率",
                    },
                },
            },
      c_abn_australia = {
                name = "澳洲",
                text = {
                    {
                        "给{C:attention}最右侧{}的小丑牌",
                        "添加{C:spades}黑桃贴纸{}",
                    },
                    {
                        "所有留在手中的{C:spades}黑桃{}牌",
                        "永久获得{C:mult}+#1#{}倍率",
                    },
                },
            },
      c_abn_asia = {
                name = "亚洲",
                text = {
                    {
                        "给{C:attention}最右侧{}的小丑牌",
                        "添加{C:attention}白昼{}效果",
                    },
                    {
                        "所有留在手中的{C:diamonds}光明花色{}牌",
                        "永久获得{C:chips}+#1#{}筹码",
                    },
                },
            },
      c_abn_europe = {
                name = "欧洲",
                text = {
                    {
                        "给{C:attention}最右侧{}的小丑牌",
                        "添加{C:clubs}梅花贴纸{}",
                    },
                    {
                        "所有留在手中的{C:clubs}梅花{}牌",
                        "永久获得{C:mult}+#1#{}倍率",
                    },
                },
            },
      c_abn_antarctica = {
                name = "南极洲",
                text = {
                    {
                        "给{C:attention}最右侧{}的小丑牌",
                        "添加{C:attention}夜晚{}效果",
                    },
                    {
                        "所有留在手中的{C:spades}暗色花色{}牌",
                        "永久获得{C:chips}+#1#{}筹码",
                    },
                },
            },
      c_abn_south_america = {
                name = "南美洲",
                text = {
                    {
                        "给{C:attention}最右侧{}的小丑牌",
                        "添加{C:hearts}红桃贴纸{}",
                    },
                    {
                        "所有留在手中的{C:hearts}红桃{}牌",
                        "永久获得{C:mult}+#1#{}倍率",
                    },
                },
            },
      c_abn_north_america = {
                name = "北美洲",
                text = {
                    {
                        "给{C:attention}最右侧{}的小丑牌",
                        "添加{C:attention}金宝传承{}效果",
                    },
                    {
                        "给每张{C:attention}小丑牌{}",
                        "增加{C:money}$#1#{}的售价",
                    },
                },
            },
      c_abn_atlantis = {
                name = "亚特兰蒂斯",
                text = {
                    {
                        "给{C:attention}最右侧{}的小丑牌",
                        "添加{C:attention}沉重{}效果",
                        "给{C:attention}最左侧{}的小丑牌",
                        "添加{C:attention}易碎{}效果",
                    },
                    {
                        "所有留在手中的{C:abn_penumbra}半影{}牌",
                        "永久获得{C:mult}+#1#{}倍率",
                        "和{C:chips}+#2#{}筹码",
                    },
                },
            },
      c_abn_hyperborea = {
                name = "极北之地", -- 译为许珀耳玻瑞亚或极北之地。在希腊神话中指的是一个位于北风之神居住地之北的传说国度。它的字面意思是“在北风之外”。古希腊人认为那里阳光普照、土地肥沃，居民生活幸福且长寿。
                text = {
                    {
                        "给{C:attention}最右侧{}的小丑牌",
                        "添加{C:attention}偶数传承{}效果",
                        "给{C:attention}最左侧{}的小丑牌",
                        "添加{C:money}租用{}和{C:abn_perishable}易腐{}效果",
                    },
                    {
                        "所有留在手中的{C:abn_snow}雪{}牌",
                        "永久获得{C:mult}+#1#{}倍率",
                        "和{C:chips}+#2#{}筹码",
                    },
                },
            },
      c_abn_lemuria = {
                -- Lemuria（雷姆利亚）是一个科学史上的假想地质概念，
                -- 后来演变成与亚特兰蒂斯齐名的传说中沉没的神秘大陆。
                -- 它最早由19世纪科学家提出，后被神秘学和流行文化赋予了高度传奇色彩。
                name = "雷姆利亚",
                text = {
                    {
                        "给{C:attention}最右侧{}的小丑牌",
                        "添加{C:attention}奇数传承{}效果",
                        "给{C:attention}最左侧{}的小丑牌",
                        "添加{C:abn_eternal}永恒{}和{C:attention}降级{}效果",
                    },
                    {
                        "所有留在手中的{C:abn_bow}弓{}牌",
                        "永久获得{C:mult}+#1#{}倍率",
                        "和{C:chips}+#2#{}筹码",
                    },
                },
            },
      c_abn_mu = {
                -- 19世纪至20世纪初由西方学者提出的一個传说中存在于太平洋的消失古大陆。
                -- 根据假说，它曾拥有高度繁荣的史前文明，但在约一万年前的一次大灾难中沉入海底。现代科学与地质学已证实该大陆并不存在
                name = "姆大陆",
                text = {
                    {
                        "给{C:attention}最右侧{}的小丑牌",
                        "添加{C:attention}Rejok Legacy{}效果", -- 疑似为《盗贼遗产》（Rogue Legacy）的拼凑词
                        "给{C:attention}最左侧{}的小丑牌",
                        "添加{C:abn_eternal}永恒{}和{C:money}租用{}效果",
                    },
                    {
                        "所有留在手中的{C:abn_tie}和{}牌",
                        "永久获得{C:mult}+#1#{}倍率",
                        "和{C:chips}+#2#{}筹码",
                    },
                },
            },
      c_abn_asgard = {
                name = "阿斯加德", -- 北欧神话中阿萨神族（Æsir）居住的国度
                text = {
                    {
                        "给{C:attention}最右侧{}的小丑牌",
                        "添加{C:attention}宝金传承{}效果",
                        "给{C:attention}最左侧{}的小丑牌",
                        "添加{C:attention}易碎{}和{C:money}租用{}效果",
                    },
                    {
                        "所有留在手中的{C:abn_suitless}无色{}牌",
                        "永久获得{C:mult}+#1#{}倍率",
                        "和{C:chips}+#2#{}筹码",
                    },
                },
            },
      c_abn_shangrila = {
                -- “香格里拉”（Shangri-La）最早出自1933年英国作家詹姆斯·希尔顿的小说《消失的地平线》。它指一个虚构、和平与快乐的世外桃源。
                -- 这个词后来变成人间天堂的代称，也被用来命名真实的地方和知名酒店。
                name = "香格里拉",
                text = {
                    {
                        "如果{C:attention}最右侧{}的小丑牌为{C:common}普通{}",
                        "则将其摧毁并生成一张{C:uncommon}罕见{}小丑牌",
                        "带有{C:attention}幸运{}和{C:attention}可能性{}效果",
                    },
                    {
                        "给{C:attention}最左侧{}的小丑牌",
                        "添加{C:attention}橡皮擦{}和{C:abn_eternal}永恒{}效果",
                    },
                },
            },
      c_abn_ker_is = {
                -- Kêr-Is 是一个在神话中出现的城市，建立在布列塔尼半岛杜瓦讷内湾，后来被海洋吞噬。
                name = "伊斯",
                text = {
                    {
                        "如果{C:attention}最右侧{}的小丑牌为{C:uncommon}罕见{}",
                        "则将其摧毁并生成一张{C:rare}稀有{}小丑牌",
                        "带有{C:attention}靶心{}和{C:attention}手套{}效果",
                    },
                    {
                        "给{C:attention}最左侧{}的小丑牌",
                        "添加{C:attention}橡皮擦{}和{C:money}租用{}效果",
                    },
                },
            },
      c_abn_avalon = {
                -- “阿瓦隆”（Avalon）是一个源自凯尔特神话与《亚瑟王传说》的传奇地名，意为“苹果岛”或“赐福岛”，象征永恒的乐园与庇护所
                name = "阿瓦隆",
                text = {
                    {
                        "如果{C:attention}最右侧{}的小丑牌为{C:rare}稀有{}",
                        "则将其摧毁并生成一张{C:abn_superrare}超稀有{}小丑牌",
                        "带有{C:attention}宫廷传承{}和{C:attention}铲子{}效果",
                    },
                    {
                        "给{C:attention}最左侧{}的小丑牌",
                        "添加{C:abn_eternal}永恒{}和{C:attention}锁链{}效果",
                    },
                },
            },
      c_abn_el_dorado = {
                -- 黄金国（西班牙文：El Dorado）为一个古老传说，最早是始于一个南美仪式，部落族长会在自己的全身涂满金粉，并到山中的圣湖中洗净，而祭司和贵族会将珍贵的黄金和绿宝石投入湖中献给神。
                name = "黄金国",
                text = {
                    {
                        "给{C:attention}最右侧{}的小丑牌",
                        "添加{C:attention}不朽{}、{C:attention}猫眼{}",
                        "和{C:attention}奇数传承{}效果",
                    },
                    {
                        "给{C:attention}最左侧{}的小丑牌",
                        "添加{C:abn_eternal}永恒{}、{C:attention}闪电{}",
                        "和{C:attention}偶数传承{}效果",
                    },
                },
            },
    },
  },
}
