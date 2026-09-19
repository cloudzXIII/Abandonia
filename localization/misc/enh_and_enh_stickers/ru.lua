return {
    descriptions = {
        Enhanced = {
            m_abn_wallpaper = {
                name = "Обойная карта",
                text = {
                    "Получает {C:mult}+#2#{} множ. за каждую {C:attention}печать{}",
                    "в подсчитываемой руке, {C:chips}+#4#{} фишек",
                    "за каждую {C:attention}печать{} в руке",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек, {C:mult}+#3#{C:inactive} множ.)",
                }
            },
            m_abn_reinforcement = {
                name = "Карта сопротивления",
                text = {
                    "{C:mult}+#1#{} множ., {C:chips}+#2#{} фишек,",
                    "и {C:money}$#3#{} за каждую {C:attention}наклейку{}",
                    "среди ваших {C:attention}Джокеров{}",
                    "{C:red,E:1,s:0.85}Самоуничтожается, если множ.",
                    "{C:red,E:1,s:0.85}больше фишек после подсчета"
                }
            },
            m_abn_kinship = {
                name = "Объединяющая карта",
                text = {
                    "Получает {C:white,X:mult}X#2#{} множ. за каждую",
                    "карту с такой же {C:attention}мастью{} и",
                    "{C:dark_edition}выпуском{} как у этой карты",
                    "{C:inactive}(сейчас {C:white,X:mult}X#1#{C:inactive} множ.)"
                }
            },
            m_abn_zen = {
                name = "Дзен карта",
                text = {
                    '{C:mult}+#3#{} множ. когда находится в руке,',
                    'на {C:mult}+#2#{} больше за каждую другую',
                    '{C:attention}Дзен{} карту в руке',
                    '{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.)'
                }
            },
            m_abn_ocean = {
                name = "Океаническая карта",
                text = {
                    "Получает {C:chips}+#2#{} фишек за каждую карту",
                    "в подсчете {C:attention}слева{} от этой карты",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек)"
                }
            },
            m_abn_mountain = {
                name = "Горная карта",
                text = {
                    "Получает {C:mult}+#2#{} множ. за каждую карту",
                    "в подсчете {C:attention}справа{} от этой карты",
                    "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.)"
                }
            },
            m_abn_teatag = {
                name = "Карта с чайным пакетиком",
                text = {
                    "Дает {C:chips}+#1#{} фишек за каждую",
                    "{C:attention,s:0.85}Карту с чайным пакетиком{} в",
                    "вашей {C:attention}полной колоде{}",
                    "{C:inactive}(сейчас {C:chips}+#3#{C:inactive} фишек)",
                    "{C:inactive}({C:attention}#2#{C:inactive} рук осталось)"
                }
            },
            m_abn_teastain = {
                name = "Карта с чайным следом",
                text = {
                    "{C:white,X:mult}X#1#{} множ., дает",
                    "дополнительно {C:white,X:mult}X#2#{} за каждую",
                    "{C:attention,s:0.85}Карта с чайным следом{} в",
                    "вашей {C:attention}полной колоде{}",
                }
            },
            m_abn_polkadot = {
                name = "Карта в горошек",
                text = {
                    "{C:chips}+#1#{} фишек, получает",
                    "{C:chips}+#2#{} фишек при подсчете",
                    "Без достоинства и масти"
                }
            },
            m_abn_petroleum = {
                name = "Нефтяная карта",
                text = {
                    "{C:chips}+#1#{} фишек, {C:money}+$#2#{}",
                    "Превращается в {C:attention}Подожженную{}",
                    "если очки загораются",
                    "Без достоинства и масти"
                }
            },
            m_abn_oilfire = {
                name = "Подожженная карта",
                text = {
                    "{C:mult}+#1#{} множ., {C:red}-$#2#{}",
                    "Шанс {C:green}#3# к #4#{}",
                    "{C:red}самоуничтожиться{}",
                    "Без достоинства и масти"
                }
            },
            m_abn_fossil = {
                name = "Ископаемая карта",
                text = {
                    "{X:mult,C:white}X#1#{} множ., {C:money}+$#2#{}",
                    "Шанс {C:green}#3# к #4#{}",
                    "{C:red}самоуничтожиться{}",
                }
            },
            m_abn_mercurial = {
                name = "Меркуриальная карта",
                text = {
                    "Получает {C:chips}+#2#{} фишек за",
                    "каждую уникальную {C:attention}масть",
                    "в подсчитываемой руке",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек)"
                }
            },
            m_abn_hot_iron = {
                name = "Кованная карта",
                text = {
                    "{X:mult,C:white}X#2#{} множ., пока остается в руке",
                    "Шанс {C:green}#4# к #5#{} дать {C:chips}+#1#{} фишек",
                    "Шанс {C:green}#6# к #7#{} получить {X:mult,C:white}X#3#{} множ.",
                    "{C:inactive}Не подсчитывается, когда сыграна{}"
                }
            },
            m_abn_infra = {
                name = "Инфра карта",
                text = {
                    "Получает {C:mult}+#2#{} множ. и {C:chips}+#4#{} фишек",
                    "за каждую карту в подсчете",
                    "{C:mult}Самоуничтожается{}, если сыграна с",
                    "{C:attention}3{} или менее подсчитываемыми картами",
                    "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.{} {C:chips}+#3# {C:inactive}фишек)",
                }
            },
            m_abn_hazard = {
                name = "Опасная карта",
                text = {
                    "{X:mult,C:white}X#1#{} множ.",
                    "Дополнительно {X:mult,C:white}+X#2#{} множ. за каждую",
                    "другую подсчитываемую Опасную карту",
                    "Шанс {C:green}#3# к #4#{} на {C:attention}перезапуск{}",
                    "Увеличивает {C:attention}требование Блайнда{} на {C:attention}10%{}",
                }
            },
            m_abn_contagion_seal = {
                name = "Зараженная печать",
                text = {
                    "Получает {X:mult,C:white}^#2#{} множ., когда",
                    "эффект {X:mult,C:white}Xмнож{} срабатывает",
                    "{C:inactive}(сейчас {X:mult,C:white}^#1#{C:inactive} множ.)",
                }
            },
            m_abn_contagion_bonus = {
                name = "Зараженная бонусная карта",
                text = {
                    "Дает {X:spectral,C:white}^фишки{}, равные",
                    "числу сыгранных карт",
                }
            },
            m_abn_contagion_mult = {
                name = "Зараженная карта с множителем",
                text = {
                    "{X:mult,C:white}^#1#{} множ.",
                }
            },
            m_abn_monitor = {
                name = "Мониторная карта",
                text = {
                    "Дает {X:mult,C:white}^множ.{}, равный",
                    "числу подсчитываемых карт масти {V:1}#1#{}",
                    "{s:0.8}Масть меняется каждый раунд",
                    "Без достоинства и масти"
                }
            },
            m_abn_cotton = {
                name = "Хлопковая карта",
                text = {
                    "Удваивает {C:planet}планетный{} уровень",
                    "{C:attention}рангов Хлопковых{} карт в руке",
                }
            },
            m_abn_sew = {
                name = "Сшитая карта",
                text = {
                    "Получает {C:chips}+#4#{} фишек и",
                    "{C:mult}+#3#{} множ., когда срабатывает",
                    "Перезапускает {C:attention}Сшитые{} карты по разу",
                    "за каждую сыгранную Сшитую карту",
                    "{C:inactive}(сейчас {C:chips}+#2#{} {C:inactive}фишек, {C:mult}+#1#{} {C:inactive}множ.){}",
                }
            },
            m_abn_darkner = {
                name = "Темнейшая карта",
                text = {
                    "{C:chips}+#1#{} фишек и {C:mult}+#2#{} множ. за каждую",
                    "сыгранную и находящуюся в руке {C:spades}Темную масть{}",
                    "{C:mult}Самоуничтожается{}, если сыграна с {C:attention}#3#{}",
                    "или более {C:diamonds}Светлыми мастями",
                }
            },
            m_abn_lightner = {
                name = "Светлейшая карта",
                text = {
                    "{C:chips}+#1#{} фишек и {C:mult}+#2#{} множ. за каждую",
                    "сыгранную и находящуюся в руке {C:diamonds}Светлую масть{}",
                    "{C:mult}Самоуничтожается{}, если сыграна с {C:attention}#3#{}",
                    "или более {C:spades}Темными мастями",
                }
            },
            m_abn_kintsugi = {
                name = "Кинцуги карта",
                text = {
                    "{C:chips}+#1#{} фишек, {C:mult}+#2#{} множ. и {C:money}$#3#{}",
                    "Шанс {C:green}#4# к #5#{} создать копию этой карты,",
                    "когда другая карта {C:mult}уничтожена{}",
                    "Шанс {C:green}#6# к #7#{} {C:attention}удвоить{}",
                    "значения этой карты",
                }
            },
            m_abn_first_aid = {
                name = "Аптечная карта",
                text = {
                    "Если разыграна с {C:mult}ослабленной{} картой, получает {C:mult}+#4#{} множ.",
                    "Получает {C:chips}+#3#{} фишек, если карта {C:mult}уничтожена{}",
                    "{C:inactive}(сейчас{} {C:mult}+#2#{} {C:inactive}множ.,{} {C:chips}+#1#{} {C:inactive}фишек){}",
                }
            },
            m_abn_plank = {
                name = "Дощатая карта",
                text = {
                    "{C:gold}+#1#{} Вознесилы",
                }
            },
            m_abn_flux = {
                name = "Флюкс карта",
                text = {
                    "{C:purple}+#1#{} к Счету, получает {C:purple}+#2#{} к Счету,",
                    "если участвует в {C:attention}победной руке{}",
                }
            },
            m_abn_discontinued = {
                name = "Снятая с продажи карта",
                text = {
                    "{C:gold}+#3#{} Вознесилы и {C:chips}+#4#{} фишек",
                    "за каждый уникальный {C:attention}Тег{}, полученный в этой партии",
                    "{C:inactive}(сейчас {C:gold}+#1#{C:inactive},{} {C:chips}+#2#{C:inactive})",
                }
            },
            m_abn_honey = {
                name = "Медовая карта",
                text = {
                    {
                        "Эта карта {C:attention}всегда{} вытягиваются в руку",
                        "Если эта карта находится в {C:attention}руке{}",
                        "во время подсчета, {C:attention}сыграйте{} ее",
                    },
                    {
                        "Шанс {C:green}#1# к #2#{} превратить другую карту",
                        "в подсчете в {C:attention}Медовую{} карту"
                    }
                }
            },
                m_abn_bubble = {
                name = "Пузырьковая карта",
                text = {
                    "Дает {C:chips}+#1#{} фишек за каждое {C:attention}уникальное{} {C:dark_edition}улучшение{}",
                    "и {C:mult}+#2#{} множ. за каждый {C:attention}уникальный{} {C:dark_edition}выпуск{} в подсчете",
                    "Если эта карта {C:mult}уничтожена{}, все карты в подсчете получают {C:chips}+#3#{} фишек",
                }
            },
                m_abn_bramble = {
                name = "Оплетеная карта",
                text = {
                    "Если эта карта с {C:inactive}ванильной{} мастью,",
                    "она {C:attention}всегда подсчитывается{}",
                    "Если эта карта с {C:dark_edition}модовой{} мастью,",
                    "повышает уровень руки на {C:attention}#1#{}"
                }
            },
        },
        Other = {
            --#region Enhancement Stickers
            abn_stk_bonus = {
                name = "Бонусный",
                text = {
                    "{C:blue}+#1#{} фишек при подсчете"
                }
            },
            abn_stk_mult = {
                name = "с Множителем",
                text = {
                    "{C:red}+#1#{} множ. при подсчете"
                }
            },
            abn_stk_wild = {
                name = "Дикий",
                text = {
                    "{C:attention}Первая сыгранная карта{} считается",
                    "{C:attention}каждой мастью{} одновременно"
                }
            },
            abn_stk_stone = {
                name = "Каменный",
                text = {
                    "{C:blue}+#1#{} фишек при подсчете",
                    "Все {C:attention}сыгранные карты{} подсчитываются",
                }
            },

            abn_stk_glass = {
                name = "Стеклянный",
                text = {
                    "{X:red,C:white}X#1#{} множ. при подсчете",
                    "Шанс {C:green}#2# к #3#{} уничтожить",
                    "Джокера после {C:attention}полного подсчета{}"
                }
            },
            abn_stk_steel = {
                name = "Стальной",
                text = {
                    "{X:red,C:white}X#1#{} множ. при подсчете",
                }
            },
            abn_stk_gold = {
                name = "Золотой",
                text = {
                    "{C:gold}$#1#{} в конце раунда",
                }
            },
            abn_stk_lucky = {
                name = "Счастливый",
                text = {
                    "Шанс {C:green}#1# к #2#{} дать {C:red}+#3#{} множ.",
                    "Шанс {C:green}#4# к #5#{} дать {C:gold}$#6#{}",
                }
            },      
            abn_stk_fossil = {
                name = "Ископаемый",
                text = {
                    "{X:red,C:white}X#1#{} множ., {C:gold}$#2#",
                    "После подсчета, шанс {C:green}#3# к #4#{}",
                    "{C:red,E:2}самоуничтожится"
                }
            },
            abn_stk_petroleum = {
                name = "Нефтяной",
                text = {
                    "{C:chips}+#1#{} фишек, {C:gold}+$#2#",
                    "Превращается в {C:enhanced}Подожженную{} наклейку,",
                    "если очки {C:red,E:2}загораются"
                }
            },
            abn_stk_oilfire = {
                name = "Подожженный",
                text = {
                    "{C:red}+#1#{} множ., {C:red}-$#2#",
                    "После подсчета, шанс {C:green}#3# к #4#{}",
                    "{C:red,E:2}самоуничтожится"
                }
            },
            abn_stk_mercurial = {
                name = "Меркуриальный",
                text = {
                    "Получает {C:chips}+#1#{} фишек",
                    "за каждую уникальную",
                    "{C:attention}масть{} в подсчете",
                    "{C:inactive}(сейчас {C:chips}+#2#{C:inactive} фишек)",
                }
            },
            abn_stk_kintsugi = {
                name = "Кинцуги",
                text = {
                    "{C:chips}+#1#{} фишек, {C:mult}+#2#{} множ., {C:gold}+$#3#{}",
                    " ",
                    "Шанс {C:green}#6# к #7#{} удвоить",
                    "значения этой наклейки",
                    " ",
                    "Один раз за Анте, шанс {C:green}#4# к #5#{}", 
                    "скопировать этого Джокера после",
                    "уничтожения {C:red,E:2}игральной карты",
                    "{C:inactive}(должно быть место)"
                }
            },
            abn_stk_wallpaper = {
                name = "Обойный",
                text = {
                    "Получает {C:mult}+#2#{} множ. за каждую {C:attention}печать{}",
                    "в подсчитываемой руке, {C:chips}+#4#{} фишек",
                    "за каждую {C:attention}печать{} в руке",
                    "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ., {C:chips}+#3#{C:inactive} фишек)",
                }
            },
            abn_stk_infra = {
                name = "Инфра",
                text = {
                    "Получает {C:mult}+#2#{} множ. и {C:chips}+#4#{} фишек",
                    "за каждую карту в подсчете",
                    "{C:red,E:2}Самоуничтожается{}, если в подсчете",
                    "{C:attention}2{} или меньше карты",
                    "{C:inactive}(сейчас {C:mult}+#3#{C:inactive} множ., {C:chips}+#1#{C:inactive} фишек)",
                }
            },
            abn_stk_hazard = {
                name = "Опасный",
                text = {
                    "{X:mult,C:white}X#1#{} множ.",
                    "Получает {X:mult,C:white}+X#2#{} множ., за каждого другого",
                    "{C:attention}Джокера{} с такой же {C:enhanced}наклейкой{}",
                    "Шанс {C:green}#3# к #4#{} на перезапуск",
                    "{X:blind,C:white}X#5#{} требование Блайнда",
                }
            },
            abn_stk_monitor = {
                name = "Мониторный",
                text = {
                    "{X:mult,C:white}^множ.{}, равный",
                    "числу подсчитываемых {C:dark_edition}<Мастей>",
                }
            },
            abn_stk_monitor_hearts = {
                name = "Мониторный",
                text = {
                    "{X:mult,C:white}^множ.{}, равный",
                    "числу подсчитываемых {C:hearts}#1#",
                }
            },
            abn_stk_monitor_diamonds = {
                name = "Мониторный",
                text = {
                    "{X:mult,C:white}^множ.{}, равный",
                    "числу подсчитываемых {C:diamonds}#1#",
                }
            },
            abn_stk_monitor_clubs = {
                name = "Мониторный",
                text = {
                    "{X:mult,C:white}^множ.{}, равный",
                    "числу подсчитываемых {C:clubs}#1#",
                }
            },
            abn_stk_monitor_spades = {
                name = "Мониторный",
                text = {
                    "{X:mult,C:white}^множ.{}, равный",
                    "числу подсчитываемых {C:spades}#1#",
                }
            },
            abn_stk_reinforcement = {
                name = "Сопротивления",
                text = {
                    "{C:mult}+#1#{} множ., {C:chips}+#2#{} фишек",
                    "и {C:money}$#3#{} за каждую {C:attention}наклейку{}",
                    "среди ваших {C:attention}Джокеров{}",
                    "{C:red,E:1,s:0.85}Самоуничтожается, если множ.",
                    "{C:red,E:1,s:0.85}больше фишек после подсчета"
                }
            },
            abn_stk_darkner = {
                name = "Темнейший",
                text = {
                    "{C:chips}+#1#{} фишек и {C:mult}+#2#{} множ. за каждую",
                    "сыгранную и находящуюся в руке {C:spades}Темную масть{}",
                    "{C:mult}Самоуничтожается{}, если сыграно {C:attention}#3#{}",
                    "или более {C:diamonds}Светлые масти"
                }
            },
            abn_stk_lightner = {
                name = "Светлейший",
                text = {
                    "{C:chips}+#1#{} фишек и {C:mult}+#2#{} множ. за каждую",
                    "сыгранную и находящуюся в руке {C:diamonds}Светлую масть{}",
                    "{C:mult}Самоуничтожается{}, если сыграно {C:attention}#3#{}",
                    "или более {C:spades}Темную масти"
                }
            },
            abn_stk_first_aid = {
                name = "Аптечный",
                text = {
                    "Получает {C:mult}+#2#{} множ., если сыграна {C:mult}ослабленная{} карта",
                    "Получает {C:chips}+#4#{} фишек, если карта {C:mult}уничтожена{}",
                    "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.{} {C:chips}+#3#{} {C:inactive}фишек)",
                }
            },
                abn_stk_flux = {
                name = "Флюкс",
                text = {
                    "{C:purple}+#1#{} к Счету",
                    "Получает {C:purple}+#2#{} к Счету",
                    "на победной руке раунда"
                }
            },
                abn_stk_zen = {
                name = "Дзен",
                text = {
                    "{C:mult}+#1#{} множ.",
                    "Получает {C:mult}+#2#{} множ. за",
                    "каждую карту {C:attention}в руке{}"
                }
            },
                abn_stk_plank = {
                name = "Дощатый",
                text = {
                    "{C:gold}+#1#{} Вознесилы",
                }
            },
            --#endregion
        }
    },
    misc = {
        labels = {
            -- enhancement stickers
            abn_stk_bonus = "Бонусный",
            abn_stk_mult = "Множителя",
            abn_stk_stone = "Каменный",
            abn_stk_glass = "Стеклянный",
            abn_stk_lucky = "Счастливый",
            abn_stk_steel = "Стальной",
            abn_stk_wild = "Дикий",
            abn_stk_gold = "Золотой",
            abn_stk_fossil = "Ископаемый",
            abn_stk_petroleum = "Нефтяной",
            abn_stk_oilfire = "Подожженный",
            abn_stk_mercurial = "Меркуриальный",
            abn_stk_monitor = "Мониторный",
            abn_stk_monitor_hearts = "Мониторный",
            abn_stk_monitor_diamonds = "Мониторный",
            abn_stk_monitor_spades = "Мониторный",
            abn_stk_monitor_clubs = "Мониторный",
            abn_stk_infra = "Инфра",
            abn_stk_hazard = "Опасный",
            abn_stk_kintsugi = "Кинцуги",
            abn_stk_wallpaper = "Обойный",
            abn_stk_reinforcement = "Сопротивления",
            abn_stk_darkner = "Темнейший",
            abn_stk_lightner = "Светлейший",
            abn_stk_first_aid = "Аптечный",
            abn_stk_flux = "Флюкс",
            abn_stk_zen = "Дзен",
            abn_stk_plank = "Дощатый",
        }
    }
}