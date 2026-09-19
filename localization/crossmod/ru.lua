return {
    descriptions = {
        Joker = {
            --#region Start of Ortalab Crossmod
            j_abn_curse_mask = {
                name = "Проклятая маска",
                text = {
                    "Когда {C:attention}Блайнд{} выбран, убирает Проклятия со всех Джокеров и Карт",
                    "Получает {C:mult}+#3#{} множ. за каждое Проклятье, убранное с Джокера и",
                    "{C:chips}+#4#{} фишек за каждое Проклятье, убранное с Карты",
                    "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.{} {C:chips}+#2#{} {C:inactive}фишек){}"
                }
            },
            j_abn_anaglyphic_joker = {
                name = "Анаглифический джокер",
                text = {
                    "Добавляет {C:mult}А{}{C:chips}н{}{C:mult}а{}{C:chips}г{}{C:mult}л{}{C:chips}и{}{C:mult}ф{}{C:chips}и{}{C:mult}ч{}{C:chips}е{}{C:mult}с{}{C:chips}к{}{C:mult}и{}{C:chips}й{} к {C:attention}первой{} и {C:attention}последней{} картам в {C:attention}первой сыгранной руке{} в подсчете",
                    "Получает {C:mult}+#3#{} множ. и {C:chips}+#4#{} фишек за каждую {C:mult}А{}{C:chips}н{}{C:mult}а{}{C:chips}г{}{C:mult}л{}{C:chips}и{}{C:mult}ф{}{C:chips}и{}{C:mult}ч{}{C:chips}е{}{C:mult}с{}{C:chips}к{}{C:mult}у{}{C:chips}ю{} карту в вашей полной колоде",
                    "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.,{} {C:chips}+#2#{} {C:inactive}фишек){}"
                }
            },
            j_abn_forsaken_joker = {
                name = "Забытый джокер",
                text = {
                    "Шанс {C:green}#1# к #2#{} дать {C:dark_edition}Перенасыщенный{} выпуск",
                    "сыгранной {C:attention}Погнутой{} карте,",
                    "Шанс {C:green}#3# к #4#{} дать {C:dark_edition}Флюоресцентный{} выпуск",
                    "сыгранной {C:attention}Почтовой{} карте",
                }
            },
            j_abn_lunatic_joker = {
                name = "Джокер-лунатик",
                text = {
                    "Добавляет {C:inactive}Серый{} выпуск подсчитанной {C:attention}четной{}",
                    "карте, в {C:attention}первой руке{} раунда,",
                    "Добавляет {C:inactive}циановую печать{} подсчитанной {C:attention}нечетной{}",
                    "карте, в {C:attention}последней руке{} раунда,",
                }
            },
            j_abn_recursive_joker = {
                name = "Рекурсивный джокер",
                text = {
                    {
                        "Джокеры могут появляться многократно",
                    },
                    {
                        "Джокеры дают {X:chips,C:white}X#1#{} фишек",
                        "за каждую копию этого Джокера",
                    }
                }
            },
            j_abn_joker_jester = {
                name = "Джокершут",
                text = {
                    "{C:common}Обычные{} Джокеры дают {C:chips}+#1#{} фишек",
                    "{C:uncommon}Необычные{} Джокеры дают {C:mult}+#2#{} множ.",
                    "{C:rare}Редкие{} Джокеры дают {X:mult,C:white}X#3#{} множ.",
                }
            },
            --#endregion End of Ortalab Crossmod

            --#region Start of Fortlatro Crossmod
            j_abn_information_overload = {
                name = "Переизбыток информации",
                text = {
                    "{C:attention}Четные{} карты получают {C:spectral}Огненную ауру{} при подсчете",
                    "{C:attention}Нечетные{} карты получают {C:money}Базовую ауру{} при подсчете",
                }
            },
            j_abn_pirate_server = {
                name = "Пиратский сервер",
                text = {
                    "{C:money}Средние патронные{} карты получают {C:abn_brown_seal}коричневую печать{} при подсчете",
                    "{C:purple}ХР Буст{} карты получают {C:dark_edition}Хроматический{} выпуск при подсчете",
                    "Если этот Джокер {C:tarot}Шокирующий{}, перезапускает всех Джокеров {C:attention}без{} {C:dark_edition}выпуска{}",
                }
            },
            j_abn_the_big_cheese = {
                name = "Гигантский сыр",
                text = {
                    "{C:uncommon}Необычные{} и {C:rare}Редкие{} Джокеры {C:attention}бесплатные{},",
                    "но они получают {C:money}Мифический{} выпуск при {C:attention}покупке{}",
                }
            },
            j_abn_the_drink = {
                name = "Напиток",
                text = {
                    {
                        "Если в {C:attention}первой руке{} раунда",
                        "только {C:attention}5{} подсчитываемых карт,",
                        "они все получают {C:tarot}Шокирующий{} выпуск",
                    },
                    {
                        "Если {C:attention}последняя рука{} раунда",
                        "- это {C:attention}Старшая карта{}, добавляет {C:purple}Глитч печать{}",
                        "ко всем {C:attention}не подсчитанным{} картам",
                    }
                }
            },
            j_abn_certified_brainrot = {
                name = "Подтвержденный брейнрот",
                text = {
                    {
                        "{C:attention}Брейнрот{} Джокеры дают",
                        "{X:chips,C:white}^#2#{} фишек и {X:mult,C:white}^#1#{} множ.",
                    },
                    {
                        "Ослабляет всех {C:attention}не Брейнрот{} Джокеров",
                    }
                }
            },
            j_abn_mini_balala = {
                name = "Мини Балала",
                text = {
                    "Когда {C:attention}Джокер{} {C:money}продан{}:",
                    "шанс {C:green}#1# к #2#{} создать {C:mult}Гнома{}",
                    "шанс {C:green}#1# к #3#{} создать {C:purple}Бинтовая базука{}",
                    "шанс {C:green}#1# к #4#{} создать {C:money}Иск FTC",
                }
            },
            j_abn_mango = {
                name = "Манго",
                text = {
                    "#1#",
                    "#2#",
                }
            },
            j_abn_joker_fortnite = {
                name = "Джокер = Фортнайт",
                text = {
                    "Если у вас {C:attention}установлен{} {C:purple}Фортнайт{},",
                    "{X:mult,C:white}X#2#{} множ. за каждого {C:dark_edition}модового{} Джокера,",
                    "иначе {C:mult}+#4#{} множ. за каждого {C:dark_edition}модового{} Джокера",
                    "{C:inactive}(сейчас{} {X:mult,C:white}X#1#{} {C:inactive}множ.,{} {C:mult}+#3#{} {C:inactive}множ.){}"
                }
            },
            j_abn_ugh_jimbo = {
                name = "Угх Джимбо?",
                text = {
                    "Любит поговорить... наверное"
                }
            },
            --#endregion End of Fortlatro crossmod

            --#region Start of AiJ crossmod
            j_abn_narcoleptic_joker = {
                name = "Джокер нарколептик",
                text = {
                    {
                        "{X:chips,C:white}X#1#{} фишек если сыгранная рука",
                        "содержит только {C:spades}Пики{} и {C:clubs}Трефы{}",
                    },
                    {
                        "{X:mult,C:white}X#2#{} множ. если сыгранная рука",
                        "содержит только {C:spades}Пики{} и {C:abn_bow}Бабочки{}",
                    }
                }
            },
            j_abn_spectrum_hell = {
                name = "Спектральный ад",
                text = {
                    "Если сыгранная рука содержит {C:attention}Спектрум{}",
                    "и очки {C:attention}загораются{}, все {C:attention}Джокеры{}",
                    "навсегда получают {X:mult,C:white}X#1#{} множ.",
                }
            },
            j_abn_nova_red_eyes_joker = {
                name = "Красноглазый белый джокер",
                text = {
                    "Если {C:attention}первая рука{} раунда содержит",
                    "только {C:spades}Темные масти{}, все карты в подсчете",
                    "навсегда получают {C:attention}+#1#{} Перезапусков",
                    "и {C:dark_edition}Хтонический{} выпуск",
                }
            },
            j_abn_cossak_joker = {
                name = "Джокер-казак",
                text = {
                    {
                        "{C:attention}Улучшает{} сыгранные {C:abn_snow}Снежинки{} до",
                        "{C:attention}Ледяных{} карт при подсчете",
                    },
                    {
                        "Этот Джокер получает {C:chips}+#2#{} фишек за",
                        "каждую подсчитанную {C:attention}Ледяную{} карту {C:abn_snow}Снежинок{}",
                        "{C:inactive}(сейчас {C:chips}+#1#{} {C:inactive}фишек){}"
                    }
                }
            },
            j_abn_spectrum_hand = {
                name = "Спектральная рука",
                text = {
                    {
                        "Если сыгранная рука содержит {C:attention}Спектрум{},",
                        "{C:attention}Улучшает{} {C:diamonds}Светлые масти{} до",
                        "{C:dark_edition}Серебряных{} {C:attention}Пылких{} карт при подсчете, {C:attention}улучшает{}",
                        "{C:spades}Темные масти{} до {C:dark_edition}Хтонических{} {C:attention}Заряженных{} карт при подсчете",
                    },
                    {
                        "Если этот Джокер с {C:dark_edition}Серебрянным{} выпуском,",
                        "он получает {C:mult}+#1#{} множ. за каждую подсчитанную карту",
                        "Если этот Джокер с {C:dark_edition}Хтоническим{} выпуском,",
                        "он получает {C:chips}+#2#{} фишек за каждую подсчитанную карту",
                        "{C:inactive}(сейчас {C:mult}+#3#{} {C:inactive}множ. {C:chips}+#4#{} {C:inactive}фишек){}"
                    }
                }
            },
            j_abn_celestial_joker = {
                name = "Небесный джокер",
                text = {
                    "Когда {C:attention}Блайнд{} выбран,",
                    "все Джокеры получают {C:chips}+#1#{} фишек",
                }
            },
            j_abn_mod_joker = {
                name = "Мод-джокер",
                text = {
                    "{C:chips}+#2#{} фишек за каждую уникальную {C:attention}масть{},",
                    "которой {C:attention}Дикая{} карта может быть",
                    "{C:inactive}(сейчас {C:chips}+#1#{} {C:inactive}фишек){}",
                }
            },
            --#endregion End of AiJ crossmod

            --#region Start of Paperback crossmod
            j_abn_maltese_cross = {
                name = "Мальтийский крест",
                text = {
                    "Карты {C:attention}Домино{} навсегда",
                    "получают {C:chips}+#1#{} фишек",
                    "за каждый раз, когда ее {C:attention}достоинство{}",
                    "подсчитывалось в этом {C:attention}Блайнде{}",
                }
            },
            j_abn_backup_plan = {
                name = "Запасной план",
                text = {
                    "Перезапускает {C:attention}первую{} подсчитываемую",
                    "карту один раз за каждую",
                    "другую карту в подсчете",
                }
            },
            j_abn_sikhs_joker = {
                name = "Сикхский джокер",
                text = {
                    "Карты дают {X:chips,C:white}X#2#{} фишек",
                    "при подсчете за каждую использованную",
                    "{C:attention}уникальную{} карту {C:tarot}Младшего аркана{}",
                    "{C:inactive}(сейчас{} {X:chips,C:white}X#1#{} {C:inactive}фишек){}",
                }
            },
            j_abn_sol_iii= {
                name = "Сол III",
                text = {
                    "{C:attention}Покерные руки{} дают {C:gold}+#1#{} Вознесилы",
                    "за каждый свой {C:attention}уровень{}",
                }
            },
            j_abn_librarian_joker = {
                name = "Библиотекарь",
                text = {
                    "Когда карта {C:lexica}Лексики{} срабатывает в",
                    "течение {C:attention}Блайнда{}, создает случайную",
                    "{C:dark_edition}Негативную{} {C:calligraphy}Каллиграфическую{} карту",
                }
            },
            --#region End of Paperback crossmod
        }
    }
}