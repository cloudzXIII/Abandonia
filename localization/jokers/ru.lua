return {
    descriptions = {
        Joker = {
            --#region A
            j_abn_1_2_joker_even = {
                name = "1, 2, джокер",
                text = {
                    "Когда {C:red}четная{} карта сброшена,",
                    "уничтожает ее, и добавляет ее",
                    "{C:attention}достоинство{} к {C:chips}фишкам{} этого Джокера",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек)",
                    "{C:inactive,s:0.8}(меняется на {C:blue,s:0.8}нечетные{C:inactive,s:0.8} в след. раунде)",
                }
            },
            j_abn_1_2_joker_odd = {
                name = "1, 2, джокер",
                text = {
                    "Когда {C:blue}нечетная{} карта сброшена,",
                    "уничтожает ее, и добавляет ее",
                    "{C:attention}достоинство{} к {C:chips}фишкам{} этого Джокера",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек)",
                    "{C:inactive,s:0.8}(меняется на {C:red,s:0.8}четные{C:inactive,s:0.8} в след. раунде)",
                }
            },
            j_abn_10_4_joker = {
                name = "10-4 Джокер",
                text = {
                    "Сыгранные {C:attention}10{} дают {C:mult}+#1#{} множ.",
                    "Сыгранные {C:attention}4{} дают {C:chips}+#2#{} фишек"
                },
            },
            j_abn_7_slot = {
                name = "Джокер-слоты",
                text = {
                    {
                        "{C:attention}7-ки{} повышают {C:planet}планетный{} уровень",
                        "своего {C:attention}ранга{} при подсчете один раз",
                        "за каждую подсчитанную {C:attention}7-ку{}",
                    },
                    {
                        "Если у вас ровно {C:attention}7 Джокеров{},",
                        "{C:attention}7-ки{} навсегда получают {C:mult}+#1#{} множ. при",
                        "подсчете за каждую подсчитанную {C:attention}7-ку{}",
                    }
                }
            },
            j_abn_a_jesters_hat = {
                name = "Шутовская шляпа",
                text = {
                    {
                        "Если сыгранная рука содержит по",
                        "{C:attention}2 {C:inactive}ванильные{} и {C:dark_edition}модовые{} масти,",
                        "этот Джокер получает их удвоенное",
                        "{C:attention}достоинство{}, как {C:mult}множ.",
                        "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.)"
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Винтажный{},",
                        "{C:attention}перезапускает{} все карты в подсчете",
                    }
                }
            },
            j_abn_abandonia = {
                name = "Абандония",
                text = {
                    {
                        "Сыгранные карты дают {C:white,X:mult}X#1#{} множ.",
                        "и {C:white,X:chips}X#2#{} фишек при подсчете",
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Заброшенный{}, все",
                        "подсчитываемые карты навсегда",
                        "получают {C:mult}+#3#{} множ. и {C:chips}+#4#{} фишек",
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Винтажный{},",
                        "все Джокеры навсегда получают",
                        "{C:mult}+#3#{} множ. и {C:chips}+#4#{} фишек",
                    }
                },
            },
            j_abn_abysmal_joker = {
                name = "Бездонный джокер",
                text = {
                    {
                        "Значения {C:dark_edition}Хтонических{} карт увеличиваются",
                        "в {C:attention}X#1#{} раза при подсчете"
                    },
                    {
                        "Если сыгранная рука содержит только",
                        "{C:edition}Хтонические{} карты и очки {C:attention}загораются{},",
                        "Создает {C:dark_edition}Негативные модовые{} расходники",
                        "в количестве подсчитываемых карт",
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Хтонический{},",
                        "сыгранные {C:attention}6-ки{} увеличивают свой {C:attention}планетный",
                        "{C:attention}уровень{} на {C:attention}#2#{} при подсчете"
                    }
                }
            },
            j_abn_advertisement_joker = {
                name = "Рекламный джокер",
                text = {
                    {
                        "Этот Джокер получает {X:mult,C:white}X#3#{} множ.",
                        "каждый раз, когда {C:solid_state}Твердотельная{}",
                        "карта использована",
                    },
                    {
                        "Этот Джокер получает {C:chips}+#4#{} фишек",
                        "каждый раз, когда {C:program_pack}Программная{}",
                        "карта использована",
                        "{C:inactive}(сейчас{} {X:mult,C:white}X#1#{} {C:inactive}множ.,{} {C:chips}+#2#{} {C:inactive}фишек){}",
                    }
                }
            },
            j_abn_aesthetic_joker = {
                name = "Эстетичный джокер",
                text = {
                    {
                        "{C:chips}+#1#{} фишек за каждое {C:attention}уникальное{}",
                        "{C:attention}улучшение{}, подсчитанное за эту партию",
                        "{C:inactive}(сейчас{} {C:chips}+#2#{} {C:inactive}фишек){}",
                    },
                    {
                        "Если этот Джокер с {C:dark_edition}выпуском{},",
                        "{C:enhanced}улучшенные{} карты дают {C:red}множ.{},",
                        "равный их {C:attention}достоинству{} при подсчете"
                    }
                }
            },
            j_abn_agent_jimbo = {
                name = "Агент Джимбо 006",
                text = {
                    {
                        "Все {C:attention}расходники{} стоят",
                        "{C:attention}вдвое{} больше, но получают {C:attention}случайный{}",
                        "{C:dark_edition}выпуск{} при покупке",
                    },
                    {
                        "Когда {C:attention}6-ка{} подсчитывается, она получает",
                        "{X:chips,C:white}X#2#{} фишек за каждый уникальный",
                        "{C:dark_edition}выпуск{} среди ваших расходников",
                        "{C:inactive}(сейчас{} {X:chips,C:white}X#1#{} {C:inactive}фишек){}",
                    }
                }
            },
            j_abn_alchemical_joker = {
                name = "Алхимик",
                text = {
                    "Этот Джокер дает {X:mult,C:white}X#1#{} множ.",
                    "за каждое уникальное {C:attention}улучшение{},",
                    "{C:dark_edition}выпуск{}, {C:attention}печать{} и {C:attention}наклейку",
                    "в подсчитываемой руке",
                },
            },
            j_abn_aliasing_joker = {
                name = "Лесенчатый джокер",
                text = {
                    {
                        "Добавляет {C:dark_edition}Блестящий{}, {C:dark_edition}Перламутровый{}",
                        "или {C:dark_edition}Переливающийся{} выпуск к",
                        "первой подсчитанной {C:attention}номерной{} карте",
                        "в {C:attention}первой{} и {C:attention}последней{} руке раунда",
                    },
                    {
                        "Карты с {C:dark_edition}выпуском{} дают",
                        "{C:money}$#1#{} при подсчете"
                    }
                }
            },
            j_abn_alter_suits = {
                name = "Альтернативные масти",
                text = {
                    {
                        "Если подсчитываемая рука содержит",
                        "{C:abn_snow}Снежинку{}, {C:abn_penumbra}Полутень{}, {C:abn_tie}Галстук{} и {C:abn_bow}Бабочку{},",
                        "этот Джокер получает {C:mult}множ.{}, равный",
                        "сумме {C:attention}достоинств{} этих карт",
                    },
                    {
                        "Если подсчитываемая рука",
                        "не содержит {C:inactive}ванильных{} мастей,",
                        "этот Джокер получает {C:chips}+#3#{} фишек",
                        "{C:inactive}(сейчас{} {C:mult}+#2#{} {C:inactive}множ.{} {C:chips}+#1#{} {C:inactive}фишек){}",
                    }
                }
            },
            j_abn_alternate_outfit = {
                name = "Альтернативный наряд",
                text = {
                    {
                        "Этот Джокер получает {C:mult}+#2#{} множ., если",
                        "сыгранная рука содержит {C:attention}#4#{}",
                        "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.)"
                    },
                    {
                        "Если сыгранная рука - это",
                        "{C:attention,s:0.8}#4#{s:0.8} из {C:abn_chalice,s:0.8}Чаш{s:0.8}, подсчитанные карты получают {C:mult,s:0.8}+#3#{s:0.8} множ.",
                        "{C:attention,s:0.8}#4#{s:0.8} из {C:abn_coin,s:0.8}Монет{s:0.8}, подсчитанные карты получают {C:money,s:0.8}$#3#{}",
                        "{C:attention,s:0.8}#4#{s:0.8} из {C:abn_baton,s:0.8}Дубин{s:0.8}, подсчитанные карты получают {C:white,X:mult,s:0.8}X#6#{s:0.8} множ.",
                        "{C:attention,s:0.8}#4#{s:0.8} из {C:abn_sword,s:0.8}Мечей{s:0.8}, подсчитанные карты получают {C:chips,s:0.8}+#5#{s:0.8} фишек",
                    }
                }
            },
            j_abn_amateur_artist = {
                name = "Художник-любитель",
                text = {
                    {
                        "Когда рука сыграна, добавляет",
                        "копию {C:attention}первой{} подсчитанной",
                        "{C:attention}Объединяющей карты{} в колоду и",
                        "вытянуть ее {C:attention}в руку",
                    },
                    {
                        "Если подсчитываемая рука содержит",
                        "только {C:attention}Объединяющие карты{}, превращает",
                        "столько же карт в колоде в",
                        "{C:attention}копии{} подсчитываемых карт",
                        "{C:attention,s:0.8}Старшая карта{s:0.8} не в счет"
                    }
                }
            },
            j_abn_ambigram = {
                name = "Амбиграмма",
                text = {
                    "Сыгранные карты дают",
                    "{C:mult}+#1#{} множ. при подсчете, если",
                    "сыгранная рука {C:attention}симметричная{}",
                    "{C:inactive}(напр.: {C:attention}4 3 5 3 4{C:inactive})",
                }
            },
            j_abn_amplifier = {
                name = "Сотовая вышка",
                text = {
                    "{C:inactive}Ванильные{} масти с {C:dark_edition}модовыми{} {C:attention}улучшениями{}",
                    "дают на {C:attention}50%{} больше {C:chips}фишек{} и {C:mult}множ.{},",
                    "{C:attention}100%{}, если с {C:dark_edition}модовыми{} мастями"
                }
            },
            j_abn_ancient_prophet = {
                name = "Древний пророк",
                text = {
                    {
                        "Перезапускает все сыгранные",
                        "{C:red}ослабленные{} или {C:attention}перевернутые{} карты",
                    },
                    {
                        "{C:red}Ослабленные{} или {C:attention}перевернутые{}",
                        "карты дают {C:mult}+#1#{} множ. и {C:chips}+#2#{} фишек",
                        "при подсчете"
                    }
                }
            },
            j_abn_ancient_tapestry = {
                name = "Старинный гобелен",
                text = {
                    {
                        "{C:attention}Обойные карты{} подмешиваются",
                        "наверх вашей колоды",
                    },
                    {
                        "Если {C:attention}подсчитываемая рука{} состоит",
                        "только из {C:inactive}ванильных{} печатей, получает",
                        "{V:1}#3#{}, равный количеству",
                        "{C:attention}подсчитываемых карт{}"
                    },
                    {
                        "Если {C:attention}подсчитываемая рука{} состоит",
                        "только из {C:dark_edition}модовых{} печатей, получает",
                        "{B:1,C:white}x#3#{}, равный количеству",
                        "{C:attention}подсчитываемых карт{} и",
                        "{C:attention}переворачивает{} этого Джокера",
                        "{C:inactive}(сейчас {V:1}+#1#{C:inactive} #3#,{} {B:1,C:white}X#2#{C:inactive} #3#){}",
                    }
                }
            },
            j_abn_annihilated_joker = {
                name = "Аннигиляция",
                text = {
                    "Каждые {C:attention}#1#{} {C:inactive}[#2#]{} уничтоженных {C:attention}Джокера{},",
                    "создает случайную карту {C:calamity_cards}Бедствия{}",
                    "{C:inactive}(должно быть место)",
                }
            },
            j_abn_ansatz_joker = {
                name = "Анзац джокер",
                text = {
                    "Этот Джокер получает {C:chips}+#2#{} фишек за",
                    "каждую {C:attention}нечетную{} и {C:mult}+#4#{} множ. за",
                    "каждую {C:attention}четную{} карту в {C:attention}#5#е{}",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек, {C:mult}+#3#{C:inactive} множ.)"
                }
            },
            j_abn_answer_sheet = {
                name = "Анкета",
                text = {
                    "Этот Джокер получает {C:mult}+#2#{} множ., когда",
                    "{C:green}вероятность{} на {C:attention}расходнике{} успешно",
                    "срабатывает, получает {C:chips}+#1#{} фишек, если",
                    " успешно срабатывает на {C:attention}Джокере{}",
                    "{C:inactive}(сейчас {C:chips}+#3#{C:inactive} фишек, {C:mult}+#4#{C:inactive} множ.)"
                }
            },
            j_abn_ante_up = {
                name = "Ставки повышаются!",
                text = {
                    {
                        "Карты {C:attention}в руке{} дают",
                        "свое {C:attention}удвоенное{} достоинство",
                        "как {C:red}множ.{}"
                    },
                    {
                        "{C:attention}+2{} к победному Анте",
                    }
                }
            },
            j_abn_antikythera_mechanism = {
                name = "Антикитерский механизм",
                text = {
                    {
                        "Этот Джокер получает",
                        "{X:mult,C:white}X#2#{} множ., каждый раз, когда",
                        "{C:program_pack}Программная{} карта использована",
                        "{C:inactive}(сейчас{} {X:mult,C:white}X#1#{} {C:inactive}множ.)",
                    },
                    {
                        "{C:attention}Икопаемые{} и {C:attention}Стальные{} карты",
                        "не могут быть {C:red}ослаблены{}",
                        "или {C:red}уничтожены{}"
                    }
                }
            },
            j_abn_anxious_gimbo = {
                name = "Тревожный Гимбо",
                text = {
                    "Каждая сыгранная {C:attention}2-ка{},",
                    "{C:attention}3-ка{}, {C:attention}5-ка{}, {C:attention}7-ка{}, {C:attention}11-ка{} или",
                    "{C:attention}13-ка{} дает {X:chips,C:white}X#1#{} фишек и",
                    "{C:mult}+#2#{} множ. при подсчете",
                }
            },
            j_abn_apprentice_wizard = {
                name = "Ученик волшебника",
                text={
                    "Этот Джокер получает {X:mult,C:white}X#1#{} множ., когда",
                    "{C:dark_edition}модовая{} {C:spectral}спектральная{} карта используется,",
                    "сбрасывается, когда {C:inactive}ванильная{} {C:spectral}спектральная{}",
                    "карта используется",
                    "{C:inactive}(сейчас {X:mult,C:white}X#2#{C:inactive} множ.)",
                },
            },
            j_abn_archaic_joker = {
                name = "Архаичный джокер",
                text = {
                    "Этот Джокер получает {C:chips}+#1#{} фишек и",
                    "{C:mult}+#2#{} множ., когда {C:attention}Блайнд{} побежден",
                    "с {C:attention}нечетным{} количеством карт",
                    "{C:inactive}(сейчас {C:chips}+#3#{} {C:inactive}фишек,{} {C:mult}+#4#{} {C:inactive}множ.{}{C:inactive})",
                }
            },
            j_abn_archibald = {
                name = "Арчибальд",
                text = {
                    "Этот Джокер получает {X:chips,C:white}X#2#{} фишек,",
                    "если сыгранная рука содержит",
                    "подсчитываемые {C:attention}четные{} карты",
                    "{C:inactive}(сейчас {C:white,X:chips}X#1#{C:inactive} фишек){}",
                }
            },
            j_abn_arkham = {
                name = "Аркхэм",
                text = {
                    {
                        "{V:1}#5#{} дают {X:chips,C:white}X#1#{} фишек",
                        "и {C:white,X:mult}X#7#{} множ. при подсчете, фишки",
                        "увеличиваются на {X:chips,C:white}X#2#{} и множ.",
                        "на {C:white,X:mult}X#8#{} когда {V:1}#6#{} подсчитаны",
                        "{s:0.8}масть меняется каждый раунд",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "{V:1}#5#{} навсегда получают",
                        "{C:chips}+#4#{} фишек и {C:mult}+#3#{} множ.",
                        "за каждую карту {C:attention}в руке{}",
                    }
                }
            },
            j_abn_armageddon_road = {
                name = "В Армагеддон",
                text = {
                    {
                        "Когда {C:attention}Большой Блайнд{} побежден,",
                        "уничтожает все имеющиеся карты {C:continent}Континентов",
                        "и за каждую уничтоженную карту создает",
                        "{C:dark_edition}Негативную{} карту {C:calamity_cards}Бедствия{}"
                    },
                    {
                        "Когда {C:attention}Большой Блайнд{} побежден,",
                        "уничтожает все имеющиеся карты {C:tarot}Таро",
                        "и за каждую уничтоженную создает",
                        "{C:dark_edition}Негативный{} {C:weather_report}Прогноз погоды{}"
                    }
                }
            },
            j_abn_artistic_difference = {
                name = "Арт-контраст",
                text = {
                    "Если {C:attention}первая рука{} раунда",
                    "не содержит карт {C:attention}с лицом{},",
                    "создает карту {C:planet}Планеты{} этой руки",
                    "{C:inactive}(должно быть место)"
                }
            },
            j_abn_artistic_interpretation = { -- I did this art :D (cloudzXIII)
                name = "Художественная интерпретация",
                text = {
                    "Этот Джокер получает {C:chips}+#2#{} фишек за",
                    "каждую {C:attention}последовательно{} разыгранную",
                    "руку с той же {C:attention}покерной рукой{}",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек)"
                }
            },
            j_abn_ascended_joker = {
                name = "Вознесенный джокер",
                text = {
                    {
                        "{C:gold}+#1#{} Вознесилы",
                    },
                    {
                        "Если у вас есть {C:attention}Джокер{},",
                        "карты дают {C:gold}+#2#{} Вознесилы",
                        "при подсчете",
                    }
                }
            },
            j_abn_assassin_joker = {
                name = "Джокер-ассасин",
                text = {
                    "Когда рука сыграна, уничтожает",
                    "карту с {C:attention}наименьшим{} достоинством",
                    "и дает {C:money}$#3#{} и этот Джокер",
                    "получает {C:chips}+#2#{} фишек",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек)",
                }
            },
            j_abn_astro_joker = {
                name = "Астро джокер",
                text = {
                    {
                        "{C:astro_cards}Астро{} карты всегда",
                        "{C:green}срабатывают"
                    },
                    {
                        "Шанс {C:green}#1# к #2#{}, что этот {C:attention}Джокер",
                        "будет {C:red}уничтожен{} в конце раунда",
                    }
                }
            },
            j_abn_asylum_joker = {
                name = "Психбольной",
                text = {
                    {
                        "{C:attention}#2#{} карта {C:attention}принудительно",
                        "выбираются всегда",
                    },
                    {
                        "{C:attention}Принудительно выбранные{}",
                        "карты дают {X:chips,C:white}^#1#{} фишек",
                        "при подсчете"
                    }
                }
            },
            j_abn_attack_777 = {
                name = "Атака 777",
                text = {
                    {
                        "{X:mult,C:white}X#3#{} множ., если сыгранная рука",
                        "содержит только {C:hearts}Черви{} и {C:diamonds}Бубны{}",
                    },
                    {
                        "Шанс {C:green}#1# к #2#{} перезапустить",
                        "каждую {C:attention}сыгранную{} карту",
                    }
                }
            },
            j_abn_authenticated_graded_joker = {
                name = "Аутентифицированный джокер",
                text = {
                    {
                        "{C:dark_edition}Винтажные{} карты дают {C:chips}+фишки{} и {C:mult}+множ.,",
                        "равные уровню самой высокоуровневой",
                        "{C:attention}руки{} при подсчете",
                        "{C:inactive}(сейчас {C:attention}#1#{C:inactive}, {C:chips}+#2# {C:inactive}фишек, {C:mult}+#3# {C:inactive}множ.)"
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Винтажный{},",
                        "все {C:dark_edition}Винтажные{} игральные карты",
                        "подмешиваются наверх вашей колоды"
                    }
                }
            },
            j_abn_autostereogram_joker = {
                name = "Автостереограмма",
                text = {
                    {
                        "Получает {X:red,C:white}X#1#{} множ. за каждую подсчитанную",
                        "{C:attention}нечетную{} карту с совпадающими {C:dark_edition}выпусками{}",
                    },
                    {
                        "Получает {X:chips,C:white}X#2#{} фишек за каждую подсчитанную",
                        "{C:attention}четную{} карту с совпадающими {C:dark_edition}выпусками{}",
                        "{C:inactive}(сейчас {X:red,C:white}X#3#{C:inactive} множ., {X:blue,C:white}X#4#{C:inactive} фишек)",
                    }
                }
            },
            j_abn_avalanche_joker = {
                name = "Лавина",
                text = {
                    "{X:mult,C:white}X#1#{} множ., если сыгранная",
                    "рука содержит подсчитываемую",
                    "{C:abn_snow}Снежинку{} и карту любой",
                    "другой {C:attention}масти",
                }
            },
            j_abn_aviator = {
                name = 'Авиатор',
                text = {
                    "Этот джокер получает",
                    "{X:mult,C:white}X#2#{} множ. если {C:planet}уровень{}",
                    "сыгранной руки {C:attention}#3#{} или более",
                    "{C:inactive}(сейчас {X:mult,C:white}X#1#{C:inactive} множ.)"
                }
            },
            j_abn_awakening_oopart = {
                name = "Неуместный артефакт",
                text = {
                    {
                        "Карты {C:planet}Планет{} и {C:program_pack}Программные{} карты",
                        "становятся {C:dark_edition}Негативными{} при покупке",
                    },
                    {
                        "Использование карты {C:planet}Планеты{} и {C:program_pack}Программной{}",
                        "карты дает {C:attention}Стальным{} картам в руке",
                        "{C:mult}+#1#{} множ. и {C:chips}+#2#{} фишек",
                    }
                }
            },
            --#endregion




            --#region B
            j_abn_baba_joker = {
                name = "Баба - это Джокер",
                text = {
                    {
                        "{C:blue}+#1#{} фишек и {C:red}+#2#{} множ.",
                        "за каждый {C:weather_report}Прогноз погоды{},",
                        "использованный в этой партии",
                        "{C:inactive}(сейчас {C:blue}+#3#{C:inactive} и {C:red}+#4#{C:inactive})",
                    },
                    {
                        "{C:weather_report}Прогнозы погоды{}",
                        "продаются за {C:gold}$5"
                    }
                }
            },
            j_abn_backrooms_joker = {
                name = "Закулисье реальности",
                text = {
                    {
                        "Блайнды {C:attention}скрыты{},",
                        "когда {C:attention}Блайнд{} побежден, создает",
                        "{C:purple}Параллель редкого{} Джокера с",
                        "{C:abn_perishable}Портящийся{} и {C:money}Прокатный{}",
                    },
                    {
                        "Если этот Джокер с {C:dark_edition}выпуском{},",
                        "{C:purple}Параллель редкие{} Джокеры дают",
                        "{X:mult,C:white}X#1#{} множ."
                    }
                }
            },
            j_abn_bad_director = {
                name = "Плохой режиссёр",
                text = {
                    "{C:attention}Босс-блайнды{} можно",
                    "перебросить за {C:money}$#1#{} и",
                    "увеличить цену переброса на {C:money}$1{}"
                }
            },
            j_abn_badformat_joker = {
                name = "Неверный формат",
                text = {
                    "{C:diamonds}Светлые масти{} дают {X:chips,C:white}^#1#{} фишек",
                    "и {X:mult,C:white}^#2#{} множ. при подсчете",
                }
            },
            j_abn_balakiren = {
                name = "Балакирен",
                text = {
                    {
                        "{C:attention}Нечетные{} карты дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#3#{}",
                        "когда {C:attention}нечетная{} карта подсчитывается",
                    },
                    {
                        "{C:attention}Четные{} карты дают {X:chips,C:white}X#2#{} фишек",
                        "при подсчете, фишки увеличиваются на {X:chips,C:white}X#4#{}",
                        "когда {C:attention}четная{} карта подсчитывается",
                    }
                }
            },
            j_abn_balance_brandon = {
                name = "Брендон баланса",
                text = {
                    {
                        "Превращает эффекты {C:mult}+множ.{} игральных",
                        "карт в {X:mult,C:white}Xмнож.{} в отношении {X:mult,C:white}X#1#",
                    },
                    {
                        "Если этот Джокер {C:attention}С множителем{},",
                        "улучшения {C:attention}множителя{} также",
                        "срабатывают, пока находятся в руке",
                    }
                }
            },
            j_abn_balatro_64 = {
                name = "Балатро 64",
                text = {
                    {
                        "Если в {C:attention}победной руке{} только {C:spades}Темные масти{},",
                        "получает {X:mult,C:white}X#5#{} множ. за каждую карту в подсчете",
                        "Если в {C:attention}победной руке{} только {C:diamonds}Светлые масти{},",
                        "получает {X:chips,C:white}X#6#{} фишек за каждую карту в подсчете",
                        "{C:inactive}(сейчас{} {X:mult,C:white}X#3#{} {C:inactive}множ.,{} {X:chips,C:white}X#4#{} {C:inactive}фишек){}"
                    },
                    {
                        "Если {C:attention}победная рука{} содержит {C:attention}оба цвета{} масти,",
                        "все Джокеры получают {C:mult}+#1#{} множ. и {C:chips}+#2#{} фишек",
                    }
                }
            },
            j_abn_balatro_mod_manager = {
                name = "Балатро Мод Менеджер",
                text = {
                    {
                        "Когда {C:attention}Босс-блайнд{} побежден,",
                        "каждый Джокер получает",
                        "случайное {C:attention}Улучшение{}"
                    },
                    {
                        "Каждый раз, когда Джокер",
                        "меняет {C:attention}Улучшение{}, он",
                        "получает {C:gold}+#1#{} Вознесилы"
                    }
                }
            },
            j_abn_balatro_the_movie = {
                name = "Балатро в кино",
                text = {
                    {
                        "Увеличивает {C:attention}требование Блайнда{}",
                        "на {X:attention,C:white}X#10#{} за каждый побежденный",
                        "{C:attention}Блайнд{} в этой партии",
                    },
                    {
                        "Получает {X:mult,C:white}X#6#{} множ. за каждую",
                        "уникальную сыгранную {C:attention}покерную руку{},",
                        "Получает {X:chips,C:white}X#7#{} фишек за каждую {C:attention}повторяющуюся{} руку,",
                        "Получает {C:mult}+#8#{} множ. и {C:chips}+#9#{} фишек за каждое",
                        "уникальное {C:attention}улучшение{} в подсчитываемой руке",
                        "{C:inactive}(сейчас {X:attention,C:white}X#5#{}{C:inactive}, {X:mult,C:white}X#1#{}{C:inactive}, {X:chips,C:white}X#2#{}{C:inactive}, {C:mult}+#3#{C:inactive}, {C:chips}+#4#{C:inactive})"
                    },
                    {
                        "Если сыгранная рука содержит хотя бы",
                        "по одной карте каждой {C:inactive}ванильной{} масти,",
                        "повышает {C:planet}планетный{} уровень {C:attention}рангов{}",
                        "всех карт в подсчете на {C:attention}4{}",
                    }
                }
            },
            j_abn_balatro_university = {
                name = "Balatro University",
                text = {
                    {
                        "Все Джокеры получают {C:mult}+#1#{} множ. и {C:chips}+#2#{} фишек,",
                        "когда {C:gold}${} получены в течение {C:attention}Блайнда",
                    },
                    {
                        "Если есть {C:attention}Джокер-мажор{},",
                        "{C:attention}повышает уровень{} рук с {C:attention}Золотыми{} картами",
                    },
                    {
                        "Если есть {C:attention}Слот-машина{},",
                        "перезапускает сыгранные {C:gold}золотые печати{}",
                    }
                }
            },
            j_abn_ballistic_glass_joker = {
                name = "Баллистическое стекло",
                text = {
                    {
                        "{C:attention}Стеклянные{} карты не {C:attention}ломаются",
                    },
                    {
                        "{C:attention}Стеклянные{} карты {C:attention}в руке",
                        "дают {X:mult,C:white}X#1#{} множ.",
                    },
                    {
                        "{C:attention}Стеклянные{} карты дают {X:chips,C:white}X#2#{} фишек",
                        "и {C:money}-$#3#{} при подсчете",
                    }
                }
            },
            j_abn_barb_wire_joker = {
                name = "Колючая проволока",
                text = {
                    {
                        "Первая подсчитанная {C:attention}4-ка",
                        "получает {C:abn_black_seal}черную печать{}",
                    },
                    {
                        "Шанс {C:green}#1# к #2#{}",
                        "{C:red}уничтожить{} сброшенные",
                        "карты"
                    }
                }
            },
            j_abn_bark_joker = {
                name = "Джокер на коре",
                text = {
                    "Этот Джокер получает {X:mult,C:white}X#2#{} множ.",
                    "и {C:gold}+#4#{} Вознесилы, когда",
                    "{C:attention}Дощатая{} карта подсчитывается",
                    "{C:inactive}(сейчас{} {X:mult,C:white}X#1#{} {C:inactive}множ.,{} {C:gold}+#3#{} {C:inactive}Вознес.){}",
                }
            },
            j_abn_basiquat_joker = {
                name = "Покрас Лампас",
                text = {
                    {
                        "Если рука содержит {C:attention}четное{} количество",
                        "подсчитываемых карт, дает {C:chips}фишки{}, равные",
                        "{C:attention}удвоенной{} {C:money}цене продажи{} всех ваших Джокеров",
                    },
                    {
                        "Если рука содержит {C:attention}нечетное{} количество",
                        "подсчитываемых карт, дает {C:mult}множ.{}, равный",
                        "{C:attention}удвоенной{} {C:money}цене продажи{} всех ваших Джокеров",
                    }
                }
            },
            j_abn_bellman_joker = {
                name = "Портье джокер",
                text = {
                    {
                        "Дает {C:chips}+#1#{} фишек и {C:mult}+#2#{} множ.,",
                        "если слоты {C:attention}расходников{} заполнены",
                    },
                    {
                        "Если {C:attention}Блайнд{} побежден с",
                        "заполненными слотами {C:attention}расходников{},",
                        "получает {C:chips}+#3#{} фишек и {C:mult}+#4#{} множ.",
                    }
                }
            },
            j_abn_best_employ = {
                name = "Сотрудник месяца",
                text = {
                    "Этот Джокер получает {C:white,X:mult}X#2#{} множ.",
                    "за каждого побежденного {C:attention}Босс-блайнда{}",
                    "{C:inactive}(сейчас {X:mult,C:white}X#1#{C:inactive} множ.)",
                }
            },
            j_abn_bestfriend_photograph = {
                name = "Фотография лучшего друга",
                text = {
                    "Первая разыгранная {C:attention}номерная{}",
                    "карта дает {X:chips,C:white}X#1#{} фишек",
                    "при подсчете"
                }
            },
            j_abn_beyond_the_rainbow = {
                name = "Радужная призма",
                text = {
                    {
                        "Этот Джокер получает {X:mult,C:white}X#2#{} множ. за каждую",
                        "уникальную {C:attention}масть{} в {C:attention}Спектрумной{} руке",
                        "{C:inactive}(сейчас{} {X:mult,C:white}X#1#{} {C:inactive}множ.){}"
                    },
                    {
                        "Если этот Джокер с {C:dark_edition}выпуском{},",
                        "Шанс {C:green}#3# к #4#{}, что карта",
                        "создаст {C:attention}Двойной тег{} при подсчете",
                    }
                }
            },
            j_abn_bibliophile = {
                name = "Библиофилия",
                text = {
                    "{C:attention}+2{} слота расходников",
                    "Когда {C:attention}Босс-блайнд{} побежден,",
                    "Получает {X:mult,C:white}X#5#{} множ., если есть карта {C:lexica}Лексики{}",
                    "Получает {C:mult}+#6#{} множ., если есть {C:program_pack}Программная{} карта",
                    "Получает {C:chips}+#8#{} фишек, если есть {C:weather_report}Прогноз погоды{}",
                    "Получает {X:chips,C:white}X#7#{} фишек, если есть карта {C:calamity_cards}Бедствия{}",
                    "{C:inactive}(сейчас {X:mult,C:white}X#1#{} {C:inactive}множ.,{} {C:mult}+#2#{} {C:inactive}множ.,{} {X:chips,C:white}X#3#{} {C:inactive}фишек,{} {C:chips}+#4#{} {C:inactive}фишек){}"
                }
            },
            j_abn_big_baffoon = {
                name = "Крутой окер", -- this is an intentional misspelling of "Buffoon", kinda like Sanic (Big Sonic)
                text = {
                    "Этот Джокер получает {C:chips}+#2#{} фишек,",
                    "если {C:attention}Блайнд{} побежден",
                    "на {C:attention}последней руке{} раунда",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек)"
                }
            },
            j_abn_big_otis = {
                name = "Большой Отис",
                text = {
                    "{C:mult}+#2#{} множ. и {C:chips}+#1#{} фишек,",
                    "если {C:attention}подсчитываемая рука{}",
                    "имеет больше {C:attention}#3#{} карт и",
                    "и состоит только из {C:dark_edition}модовых мастей",
                }
            },
            j_abn_big_raff = {
                name = 'Рифф-биг',
                text = {
                    {
                        "{C:common}Обычные{} и {C:uncommon}Необычные{} Джокеры",
                        "больше не появляются в лавке",
                    },
                    {
                        "Когда {C:attention}блайнд{} выбран,",
                        "создает {C:rare}Редкого{} Джокера",
                        "{C:inactive}(должно быть место)",
                    }
                }
            },
            j_abn_billiard_14 = {
                name = "Бильярд 14",
                text = {
                    "Шанс {C:green}#1# к #2#{}, что сыгранная",
                    "{C:attention}14-ка{} создаст {C:solid_state}Твердотельную{}",
                    "карту при подсчете",
                    "{C:inactive}(должно быть место)",
                }
            },
            j_abn_bio_blueprint = {
                name = "Био-чертеж",
                text = {
                    {
                        "{C:attention}Игральные карты{} можно переместить",
                        "из руки в {C:attention}слоты расходников{}",
                    },
                    {
                        "Карты с таким же {C:attention}достоинством{},",
                        "как и хранимые карты, могут дать",
                        "{C:dark_edition}специальный бонус{} при подсчете",
                        "{C:inactive}(сейчас {C:red}+#1# {C:inactive}множ., {C:chips}+#2# {C:inactive}фишек)",
                    }
                }
            },
            j_abn_bios_joker = {
                name = "BIOS ДЖОКЕР",
                text = {
                    "Карты {C:planet}Планет{} перезапускаются",
                    "один раз при использовании"
                }
            },
            j_abn_bitcoin_joker = {
                name = "Биткоин",
                text = {
                    "Когда {C:astro_cards}Астро{} карта {C:red}проваливается{},",
                    "этот Джокер получает {C:chips}+#4#{} фишек",
                    "и {C:money}$#2#{} к {C:attention}цене продажи{}",
                    "Когда {C:astro_cards}Астро{} карта {C:green}срабатывает{},",
                    "этот Джокер получает {C:mult}+#3#{} множ.",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек, {C:mult}+#5#{C:inactive} множ.)",
                },
            },
            j_abn_black_forest = {
                name = "Темный лес",
                text = {
                    "{C:dark_edition}Модовые{} {C:spades}Темные масти{}",
                    "дают {C:mult}+#1#{} множ. при подсчете"
                }
            },
            j_abn_blackhat_joker = {
                name = "Джокер со шляпой",
                text = {
                    "Каждая сыгранная карта дает",
                    "{C:chips}+#1#{} фишек при подсчете, если",
                    "{C:program_pack}Программная{} карта есть {C:attention}в руке",
                    "и {C:mult}+#2#{} множ., за каждую {C:solid_state}Твердотельную{}",
                    "карту {C:attention}в руке"
                }
            },
            j_abn_blessed_joker = {
                name = "Благословенный джокер",
                text = {
                    "Первая подсчитанная {C:dark_edition}Фольговая{} карта",
                    "получает {C:abn_violet_seal}пурпурную печать{}",
                    "Первая подсчитанная {C:dark_edition}Голографическая{} карта",
                    "получает {C:abn_brown_seal}коричневую печать{}",
                    "Первая подсчитанная {C:dark_edition}Полихромная{} карта",
                    "получает {C:mult}красную печать{}"
                }
            },
            j_abn_bloke_joker = {
                name = "Обычный парень",
                text = {
                    "Каждая {C:attention}#1#{} и",
                    "{C:attention}#2#{} перезапускается",
                    "{C:attention}#3#{} дополнительных раза"
                }
            },
            j_abn_blood_money = {
                name = "Кровавые деньги",
                text = {
                    "Карты получают {X:mult,C:white}X#1#{} множ. при подсчете,",
                    "теряете {C:money}$#2#{} за каждую сыгранную карту,",
                    "{C:mult}уничтожает{} все сыгранные карты, если",
                    "ваши {C:money}${} достигли {C:money}$0{} или меньше",
                }
            },
            j_abn_bloody_comedian = {
                name = "Кровавый комик",
                text = {
                    {
                        "Когда {C:attention}Блайнд{} выбран,",
                        "уничтожает Джокера слева и",
                        "создает случайного {C:attention}Комика{}",
                    },
                    {
                        "{C:attention}Комики{} дают {X:mult,C:white}X#1#{} множ.",
                    }
                },
            },
            j_abn_bodyguard_joker = {
                name = "Телохранитель",
                text = {
                    "Получает {C:mult}+#2#{} множ. за каждую",
                    "подсчитываемую {C:attention}Перевернутую{} карту",
                    "{C:attention}Переворачивает{} все {C:attention}Перевернутые{}",
                    "карты при подсчете",
                    "Сыгранные, но не подсчитанные карты",
                    "становятся {C:attention}Перевернутыми{}",
                    "{C:inactive}(сейчас {C:mult}+#1#{} {C:inactive}множ.){}",
                }
            },
            j_abn_bokeh_joker = {
                name = "Боке джокер",
                text = {
                    {
                        "Перед подсчетом уничтожает все",
                        "сыгранные, но {C:attention}не подсчитанные{} карты",
                    },
                    {
                        "Этот Джокер получает {C:chips}+#2#{} фишек",
                        "за каждую {C:attention}нечетную{} и {C:mult}+#4#{} множ. за",
                        "каждую {C:attention}четную{} уничтоженную карту",
                        "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек, {C:mult}+#3#{C:inactive} множ.)"
                    }
                }
            },
            j_abn_mult_to_chips = {
                name = 'Бонус Бредли',
                text = {
                    "Когда другой Джокер дает {C:mult}множ.{},",
                    "этот Джокер дает этот множ. как {C:chips}фишки{}",
                    --"{s:0.7,C:inactive}(Не работает на Джокеров, дающих множ. после срабатывания других Джокеров){}"
                }
            },
            j_abn_bonus_buffoon = {
                name = "Бонусный Скоморох",
                text = {
                    "{C:attention}Улучшенные{} карты дают {X:mult,C:white}X#4#{} множ.",
                    "за каждого имеющегося {C:attention}Комика{}",
                    "Шанс {C:green}#1# к #2#{} быть {C:red}уничтоженным{}",
                    "в конце раунда",
                    "{C:inactive}(сейчас{} {X:mult,C:white}X#3#{} {C:inactive}множ.){}",
                }
            },
            j_abn_bonus_power_joker = {
                name = "Бонусная сила",
                text = {
                    "Сыгранные {C:attention}Бонусные карты{} дают",
                    "{C:money}$#1#{}, {C:chips}+#3#{} фишек и {C:mult}+#2#{} множ.",
                    "при подсчете"
                }
            },
            j_abn_bootleg_joker = {
                name = "Контрабандный джокер",
                text = {
                    "Дает {X:chips,C:white}X#2#{} фишек, если",
                    "сыгранная рука - это {C:attention}#1#{}",
                    "только с {C:dark_edition}модовыми{} мастями",
                }
            },
            j_abn_boozy_joker = {
                name = "Пьяный джокер",
                text = {
                    {
                        "Можете {C:blue}играть{}",
                        "или {C:red}сбрасывать{}",
                        "до {C:attention}6{} карт"
                    },
                    {
                        "{C:attention}6-карточные{} руки",
                        "дают {C:money}$#1#{}"
                    }
                }
            },
            j_abn_bouba_joker = {
                name = "Боба джокер",
                text = {
                    {
                        "Этот Джокер получает {C:chips}+#2#{} фишек",
                        "за каждую {C:attention}Нечетную{}",
                        "карту в подсчете"
                    },
                    {
                        "Увеличивает бонус на {C:chips}+#3#{} фишек",
                        "за каждую карту {C:lexica}Лексики{} в руке,",
                        "когда {C:attention}Босс-блайнд{} побежден",
                        "{C:inactive}(сейчас{} {C:chips}+#1#{} {C:inactive}фишек)",
                    }
                }
            },
            j_abn_boulevard_of_alters = {
                name = "Бульвар альтернатив",
                text = {
                    {
                        "Когда {C:rare}Редкий{} Джокер срабатывает,",
                        "все {C:common}Обычные{} Джокеры получают {C:chips}+#1#{} фишек"
                    },
                    {
                        "Когда {C:uncommon}Необычный{} Джокер срабатывает,",
                        "все {C:rare}Редкие{} Джокеры получают {X:mult,C:white}X#2#{} множ."
                    },
                    {
                        "Когда {C:common}Обычный{} Джокер срабатывает,",
                        "все {C:uncommon}Необычные{} Джокеры получают {X:chips,C:white}X#3#{} фишек"
                    }
                }
            },
            j_abn_bowie = {
                name = "Боуи",
                text = {
                    "Джокеры с {C:dark_edition}Выпуском{}",
                    "дают {X:mult,C:white}X#1#{} множ.",
                }
            },
            j_abn_braile_joker = {
                name = "Джокер Брайля",
                text = {
                    {
                        "Шанс {C:green}#1# к #2#{}, что карты",
                        "вытянутся {C:attention}лицом вниз{}",
                    },
                    {
                        "{C:attention}Перевернутые{} карты дают",
                        "{X:mult,C:white}X#3#{} множ. при подсчете"
                    }
                }
            },
            j_abn_bravais_joker = {
                name = "Радужный кристалл",
                text = {
                    {
                        "Если сыгранная рука содержит {C:attention}Спектрум{},",
                        "получает {C:chips}+#3#{} фишек за каждую подсчитанную {C:attention}Дикую{} карту,",
                        "получает {C:mult}+#4#{} множ. за каждую подсчитанную {C:attention}Меркуриальную{} карту",
                        "{C:inactive}(сейчас{} {C:mult}+#2#{} {C:inactive}множ.,{} {C:chips}+#1#{} {C:inactive}фишек)",
                    },
                    {
                        "Если этот Джокер с {C:dark_edition}выпуском{},",
                        "{C:attention}Дикие{} карты получают {C:chips}+#3#{} фишек",
                        "и {C:attention}Меркуриальные{} карты получают {C:mult}+#4#{} множ.",
                    }
                }
            },
            j_abn_brothers_memento = {
                name = "Память о брате",
                text = {
                    "Первый сыгранный {C:attention}Туз",
                    "дает {X:mult,C:white}X#1#{} множ.",
                    "при подсчете",
                }
            },
            j_abn_brulio_buffoon = {
                name = "Скоморох Брулио",
                text = {
                    {
                        "{C:abn_chalice}Чаши{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#2#{}",
                        "когда {C:abn_chalice}Чаша{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "сыгранные {C:abn_chalice}Чаши{} навсегда получают",
                        "{C:mult}+#3#{} множ. за каждый {C:planet}планетный{} уровень",
                        "{C:attention}ранга{} в подсчитываемой руке"
                    }
                }
            },
            j_abn_bubbly_comedian = {
                name = "Пузырьковый комик",
                text = {
                    "Этот Джокер получает {C:mult}+#4#{} множ.,",
                    "{C:chips}+#5#{} фишек и {C:money}+$#6#{}, когда",
                    "{C:attention}Комик{} срабатывает",
                    "{s:0.8,C:attention}Пузырьковый комик{s:0.8} не считается",
                    "{C:inactive}(сейчас {C:mult}+#1#{}{C:inactive}, {C:chips}+#2#{}{C:inactive}, {C:money}$#3#{}{C:inactive})"
                }
            },
            j_abn_bubbly_joker = {
                name = "Пузырьковый джокер",
                text = {
                    "Получает {X:mult,C:white}X#1#{} множ., когда {C:attention}Пузырьковая{} карта {C:attention}добавлена{}",
                    "Получает {X:chips,C:white}X#2#{} фишек, когда {C:attention}Пузырьковая{} карта {C:mult}уничтожена{}",
                    "{C:inactive}(сейчас{} {X:mult,C:white}X#3#{} {C:inactive}множ.{}, {X:chips,C:white}X#4#{} {C:inactive}фишек){}",
                }
            },
            j_abn_buccaneer_joker = {
                name = "Буканьер",
                text = {
                    {
                        "{C:abn_anchor}Якори{} имеют",
                        "шанс {C:green}#1# к #2#{} дать {C:gold}$#3#{}",
                        "и шанс {C:green}#4# к #5#{} дать {C:red}+#6#{} множ.",
                    },
                    {
                        "При выборе карты {C:abn_anchor}Якоря{}, выбор",
                        "не может быть отменен, до тех пор, пока карты",
                        "не будут {C:red}сброшены{} или {C:blue}сыграны"
                    }
                }
            },
            j_abn_busybee = {
                name = "Обитель пчла",
                text = {
                    "{C:attention}Съедобные{} Джокеры никогда не съедаются",
                    "Перезапускает {C:attention}самого правого{}",
                    "{C:attention}Съедобного{} Джокера и теряете {C:money}$#3#",
                }
            },
            --#endregion





            --#region C
            j_abn_caesar = {
                name = "Цезарь",
                text = {
                    {
                        "{C:abn_crown}Короны{} навсегда получают {C:chips}+#5#{} фишек",
                        "и {C:mult}+#6#{} множ. за каждую имеющуюся",
                        "карту {C:continent}Континента{} при подсчете",
                    },
                    {
                        "Этот Джокер получает {C:chips}+#1#{} фишек",
                        "и {C:white,X:mult}X#2#{} множ., когда очки {C:attention}загораются{}",
                        "{C:inactive}(сейчас {C:chips}+#3#{C:inactive} фишек, {C:white,X:mult}X#4#{C:inactive} множ.)",
                    }
                }
            },
            j_abn_caffeinated_joker = {
                name = "Джокер на кофеине",
                text = {
                    {
                        "{C:mult}Ослабляет{} все карты после первой руки раунда",
                        "Перезапускает сыгранные {C:red}красные печати{} по разу",
                        "за каждую сыгранную {C:mult}красную печать{}",
                    },
                    {
                        "{C:mult}Уничтожает{} все подсчитываемые",
                        "карты {C:attention}С чайным следом{}",
                        "и получает {X:mult,C:white}X#2#{} множ.",
                        "{C:inactive}(сейчас{} {X:mult,C:white}X#1#{} {C:inactive}множ.)",
                    }
                }
            },
            j_abn_calendar = {
                name = "Календарь",
                text = {
                    "{C:astro_cards}Астро{} карты всегда",
                    "{C:green}срабатывают{} в течение раунда"
                }
            },
            j_abn_camorrista = {
                name = "Мафиозник",
                text = {
                    "Когда {C:attention}Блайнд{} выбран,",
                    "крадет {C:money}$#3#{} {C:attention}цены продажи{} со всех Джокеров,",
                    "Этот Джокер получает {X:mult,C:white}X#2#{} множ.",
                    "за каждый украденный {C:money}$#3#{}",
                    "{C:inactive}(сейчас {X:mult,C:white}X#1#{C:inactive} множ.)",
                }
            },
            j_abn_canvas_joker = {
                name = "Холст",
                text = {
                    "Сыгранные карты с {C:dark_edition}модовыми{}",
                    "мастями дают {C:chips}+#1#{} фишек и",
                    "{C:mult}+#2#{} множ. при подсчете"
                }
            },
            j_abn_carnaval_joker = {
                name = "Карнавальный джокер",
                text = {
                    "Все подсчитываемые карты получают {C:mult}+#1#{} множ.,",
                    "если подсчитываемая рука содержит {C:abn_penumbra}Полутени{},",
                    "другую {C:spades}Темную{} и {C:diamonds}Светлую{} масти",
                }
            },
            j_abn_carnival_comedian = {
                name = "Карнавальный комик",
                text = {
                    "{C:abn_superrare}Супер редкие{} Джокеры могут появится в лавке",
                    "Этот Джокер получает {X:mult,C:white}X#2#{} множ. каждый раз,",
                    "когда куплен {C:abn_superrare}Супер редкий{} Джокер",
                    "{C:inactive}(сейчас {X:mult,C:white}X#1#{C:inactive} множ.)",
                }
            },
            j_abn_castle_jester = {
                name = "Придворный шут",
                text = {
                    "Если после подсчета в руке есть карта {C:continent}Континента{},",
                    "добавляет достоинство всех {C:attention}лицевых{} карт",
                    "в руке к {C:mult}множ.{} этого Джокера",
                    "Добавляет {C:attention}достоинство{} всех {C:attention}номерных{} карт",
                    "в руке к {C:chips}фишкам{} этого Джокера",
                    "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ., {C:chips}+#2#{C:inactive} фишек)"
                }
            },
            j_abn_cataract_joker = {
                name = "Катаракта",
                text = {
                    "Когда вы играете {C:attention}#1#{} из:",
                    "{C:abn_snow}Снежинок{}: {X:chips,C:white}X#2#{} фишек",
                    "{C:abn_penumbra}Полутеней{}: {X:mult,C:white}X#3#{} множ.",
                    "{C:abn_tie}Галстуков{}: балансирует {C:chips}фишки{} и {C:mult}множ.{}",
                    "{C:abn_bow}Бабочек{}: меняет местами {C:chips}фишки{} и {C:mult}множ.{}",
                }
            },
            j_abn_cenobite_joker = {
                name = "Джокер-ценобит",
                text = {
                    "Если сыгранная рука - это {C:attention}#1#{},",
                    "добавляет {C:dark_edition}Хтонический{} выпуск",
                    "к первой и последней карте",
                    "{C:diamonds}светлой масти{} в подсчете"
                },
            },
            j_abn_certified_joker = {
                name = "Сертифицированный джокер",
                text = {
                    "Сыгранные {C:attention}#1#ы{} дают {X:mult,C:white}X#2#{} множ.",
                    "и {X:chips,C:white}X#3#{} фишек при подсчете"
                }
            },
            j_abn_cheerful_joker = {
                name = "Улыбчивый джокер",
                text = {
                    "Этот Джокер получает {C:gold}+#2#{} Вознесилы,",
                    "если {C:attention}6-ти карточная{} рука сыграна",
                    "{C:inactive}(сейчас {C:gold}+#1#{C:inactive} Вознес.)"
                }
            },
            j_abn_child_drawing = {
                name = "Детский рисунок",
                text = {
                    "{C:attention}Номерные{} карты",
                    "дают {C:white,X:mult}X#1#{} множ.",
                    "при подсчете",
                }
            },
            j_abn_chip_stone = {
                name = "Каменные фишки",
                text = {
                    "Сыгранные {C:attention}Каменные{} карты",
                    "становятся {C:dark_edition}Фольговыми{} и",
                    "получают {C:chips}+#1#{} фишек при подсчете",
                }
            },
            j_abn_chocolate_coin = {
                name = 'Шоколадная монетка',
                text = {
                    {
                        "Если сыгранная рука содежит только {C:attention}Золтые{} {C:abn_coin}Монеты{},",
                        "дает базовый {C:mult}множ.{} этой руки как {C:money}${}",
                    },
                    {
                        "{C:attention}Медовые{} {C:abn_coin}Монеты{} дают",
                        "свои {C:chips}фишки{}, как {C:mult}множ.{}",
                    }
                }
            },
            j_abn_chubby_joker = {
                name = "Пухлый джокер",
                text = {
                    "Получает {C:chips}+#3#{} фишек {C:mult}+#4#{} множ.,",
                    "когда {C:attention}Блайнд{} выбран c полностью",
                    "заполненными {C:attention}слотами расходников",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек и {C:mult}+#2#{C:inactive} множ.)"
                }
            },
            j_abn_classified_joker = {
                name = "Классифицированный джокер",
                text = {
                    {
                        "При покупке все карты и Джокеры",
                        "становятся {C:attention}перевернутыми{}",
                    },
                    {
                        "Заплати {C:money}$#1#{}, чтобы {C:attention}перевернуть{}",
                        "выбранную карту или Джокера",
                        "и получить {C:chips}+#2#{} фишек",
                        "{C:inactive}(сейчас {C:chips}+#3#{C:inactive} фишек)"
                    }
                }
            },
            j_abn_claus = {
                name = "Клаус",
                text = {
                    "Перезапускает {C:attention}первую{} подсчитанную карту",
                    "один раз за каждую оставшуюся {C:attention}руку",
                }
            },
            j_abn_cloten = {
                name = "Клотен",
                text = {
                    "{C:attention}Бонусные{} карты дают {X:chips,C:white}Xфишки{},",
                    "равные своему {C:attention}достоинству{} при подсчете",
                    "{C:attention}Перезапускает{} все {C:attention}Бонусные{} карты",
                }
            },
            j_abn_cloud_screamer = {
                name = "Крик в небо",
                text = {
                    "Первая сыгранная карта",
                    "навсегда получает {C:mult}+#1#{} множ.",
                    "при подсчете",
                }
            },
            j_abn_clown_degree = {
                name = "Клоунская степень",
                text = {
                    {
                        "Карты с {C:attention}печатями{} тасуются",
                        "наверх вашей колоды",
                    },
                    {
                        "Если карта с {C:attention}печатью{} {C:mult}уничтожена{}, добавляет",
                        "эту {C:attention}печать{} к другой карте без {C:attention}печати{}",
                    }
                }
            },
            j_abn_clown_funk = {
                name = "Фанк-клоун",
                text = {
                    {
                        "Если {C:attention}первая рука{} раунда - это",
                        "{C:attention,s:0.8}Флеш{s:0.8} из {C:abn_chalice,s:0.8}Чаш{s:0.8}, добавляет {C:dark_edition,s:0.8}Блестящий{s:0.8} к {C:attention,s:0.8}самому левому{s:0.8} Джокеру",
                        "{C:attention,s:0.8}Стрит{s:0.8} из {C:abn_coin,s:0.8}Монет{s:0.8}, добавляет {C:dark_edition,s:0.8}Перламутровый{s:0.8} к {C:attention,s:0.8}самому левому{s:0.8} Джокеру",
                        "{C:attention,s:0.8}Фулл-хаус{s:0.8} из {C:abn_baton,s:0.8}Дубин{s:0.8}, добавляет {C:dark_edition,s:0.8}Переливающийся{s:0.8} к {C:attention,s:0.8}самому левому{s:0.8} Джокеру",
                        "{C:attention,s:0.8}Пять одного вида{s:0.8} из {C:abn_sword,s:0.8}Мечей{s:0.8}, добавляет {C:dark_edition,s:0.8}Хроматический{s:0.8} к {C:attention,s:0.8}самому левому{s:0.8} Джокеру",
                    },
                    {
                        "Если этот Джокер с {C:dark_edition}выпуском{},",
                        "Джокеры с {C:dark_edition}Выпуском{} не могут быть уничтожены",
                    }
                }
            },
            j_abn_clown_vision = {
                name = "Зрение клоуна",
                text = {
                    {
                        "Этот Джокер получает {C:mult}+#2#{} множ., если",
                        "сыгранная рука содержит {C:attention}#4#{}",
                        "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.)"
                    },
                    {
                        "Если сыгранная рука - это",
                        "{C:attention,s:0.8}#4#{s:0.8}, содержащий {C:abn_chalice,s:0.8}Чашу{s:0.8}, все {C:attention,s:0.8}Джокеры{s:0.8} получают {C:mult,s:0.8}+#3#{s:0.8} множ.",
                        "{C:attention,s:0.8}#4#{s:0.8}, содержащий {C:abn_coin,s:0.8}Монету{s:0.8}, все {C:attention,s:0.8}Джокеры{s:0.8}",
                        "получают {C:money,s:0.8}$#3#{s:0.8} к цене продажи",
                        "{C:attention,s:0.8}#4#{s:0.8}, содержащий {C:abn_baton,s:0.8}Дубину{s:0.8}, шанс {C:green,s:0.8}#6# к #7#{}",
                        "{s:0.8}создать случайный {C:attention,s:0.8}расходник{}",
                        "{C:attention,s:0.8}#4#{s:0.8} содержащий {C:abn_sword,s:0.8}Меч{s:0.8}, все {C:attention,s:0.8}Джокеры{s:0.8} получают {C:chips,s:0.8}+#5#{s:0.8} фишек",
                    }
                }
            },
            j_abn_clowns_soul = {
                name = "Душа клоуна",
                text = {
                    "Заплатите {C:money}$#1#{}, чтобы {C:green}перебросить{} выбранного Джокера",
                    "{C:inactive,s:0.8}({C:attention,s:0.8}Наклейки{C:inactive,s:0.8} и {C:dark_edition,s:0.8}Выпуск{C:inactive,s:0.8} остаются){}"
                }
            },
            j_abn_codding_error_even = {
                name = "Ошибка в коде",
                text = {
                    "Перезапускает все сыгранные",
                    "карты с {C:red}четным{} достоинством",
                    "{C:inactive,s:0.8}(Меняется на {C:blue,s:0.8}Нечетный{C:inactive,s:0.8} в след. раунде)",
                }
            },
            j_abn_codding_error_odd = {
                name = "Ошибка в коде",
                text = {
                    "Перезапускает все сыгранные",
                    "карты с {C:blue}нечетным{} достоинством",
                    "{C:inactive,s:0.8}(Меняется на {C:red,s:0.8}Четный{C:inactive,s:0.8} в след. раунде)",
                }
            },
            j_abn_coercive_comedian = {
                name = "Принуждающий комик",
                text = {
                    {
                        "Можете {C:blue}играть{} и {C:red}сбрасывать{}",
                        "до {C:attention}6{} карт"
                    },
                    {
                        "Этот Джокер получает {X:mult,C:white}X#2#{} множ.",
                        "за каждую уникальную подсчитанную {C:attention}номерную{} карту,",
                        "Получает {C:chips}+#4#{} фишек за каждую сыгранную руку",
                        "{C:inactive}(сейчас {C:chips}+#3# {C:inactive}фишек, {X:mult,C:white}X#1#{} {C:inactive}множ.)",
                    }
                }
            },
            j_abn_collectible_joker = {
                name = "Коллекционный джокер",
                text = {
                    "Получает {C:chips}+#8#{} фишек за каждого уникального {C:common}Обычного{} Джокера, полученного за эту партию",
                    "Получает {C:mult}+#7#{} множ. за каждого уникального {C:uncommon}Необычного{} Джокера, полученного за эту партию",
                    "Получает {X:mult,C:white}X#5#{} множ. за каждого уникального {C:rare}Редкого{} Джокера, полученного за эту партию",
                    "Получает {X:mult,C:white}X#6#{} фишек за каждого уникального {C:legendary}Легендарного{} Джокера, полученного за эту партию",
                    "{C:inactive}(сейчас {X:mult,C:white}X#1#{} {C:inactive}множ.{} {C:mult}+#3#{} {C:inactive}множ.,{} {X:chips,C:white}X#2#{} {C:inactive}фишек,{} {C:chips}+#4#{} {C:inactive}фишек){}"
                }
            },
            j_abn_color_anomia = {
                name = "Цветовая агнозия",
                text = {
                    {
                        "{C:program_pack}Программные{} карты теперь {C:attention}бесплатные{}",
                    },
                    {
                        "Если сыгранная рука содержит {C:attention}Спектрум{}",
                        "только с {C:attention}номерными{} картами, повышает",
                        "{C:planet}планетный{} уровень {C:attention}рангов{} всех сыгранных карт",
                    },
                    {
                        "Если у этого Джокера есть {C:dark_edition}выпуск{},",
                        "получает {C:chips}+#2#{} фишек за каждую использованную {C:program_pack}Программную{} карту",
                        "{C:inactive}(сейчас{} {C:chips}+#1#{} {C:inactive}фишек){}"
                    }
                    --[[unlock = {
                        "Улучшите карту с",
                        "{C:attention}четным достоинством{} до"
                        "карты {C:mult}с множителем{}"
                    }--]]
                }
            },
            j_abn_color_cascade = {
                name = "Каскад цветов",
                text = {
                    "Все руки считаются {C:attention}Флешем{}",
                }
            },
            j_abn_colour_vortex = {
                name = "Цветной вихрь",
                text = {
                    "{C:white,X:mult}X#1#{} множ., если {C:attention}первая покерная{}",
                    "рука в раунде - это {C:attention}#2#{}",
                }
            },
            j_abn_combo_maker = {
                name = 'Комбинатор',
                text = {
                    "Этот Джокер получает {C:white,X:mult}X#2#{} множ.",
                    "за каждую {C:attention}последовательно{} сыгранную руку,",
                    "имеющую хотя бы {C:attention}1 номерную карту{}",
                    "{C:inactive}(сейчас {C:white,X:mult}X#1#{C:inactive} множ.)",
                },
            },
            j_abn_comedic_audience = {
                name = "Комедийная аудитория",
                text = {
                    "Когда {C:attention}Блайнд{} выбран,",
                    "уничтожает {C:attention}самого левого{} Джокера и",
                    "создает Джокера такой же {C:attention}редкости{}",
                }
            },
            j_abn_comedy_gold = { -- to relocalise
                name = 'Золотой Комик',
                text = {
                    "{C:attention}+1{} {C:chips}Play{} Limit",
                    "If your hand is Composed of Only {C:attention}Gold{} cards",
                    "Double your current {C:money}${} and each {C:attention}Gold{} card gains",
                    "{X:mult,C:white}X#3#{} Mult and {C:gold}+#4#{} Asc. Power for each {C:money}$20{} you have",
                    "After playing {C:attention}#2#{} hands of {C:attention}6{} Gold cards",
                    "{C:mult}destroy{} this Joker and {C:attention}double{} your Joker slots",
                    "{C:attention}#1#{}{C:inactive}/{}{C:attention}#2#{}",
                }
            },
            j_abn_communist_bear = {
                name = "Мишка-коммунист",
                text = {
                    "Перезапускает все",
                    "сыгранные карты {C:attention}с лицом{}",
                    "и уничтожает их",
                    "{C:attention}после{} подсчета",
                },
            },
            j_abn_composite_charles = {
                name = "Составной Чарльз",
                text = {
                    "Сыгранные {C:attention}#1#{}, {C:attention}#2#{}, {C:attention}#3#{},",
                    "{C:attention}#4#{} и {C:attention}#5#{} дают",
                    "{X:chips,C:white}X#6#{} фишек при подсчете",
                }
            },
            j_abn_composite_creechie = {
                name = "Композитная Creechie",
                text = {
                    "Карты с {C:attention}Улучшением{} или",
                    "{C:dark_edition}Выпуском{} дают {X:mult,C:white}X#4#{} множ.",
                    "за каждого имеющегося {C:attention}Комика{}",
                    "Шанс {C:green}#1# к #2#{} быть уничтоженным в конце раунда",
                    "{C:inactive}(сейчас{} {X:mult,C:white}X#3#{} {C:inactive}множ.){}",
                }
            },
            j_abn_computerworm_joker = {
                name = "Компьютерный червь",
                text = {
                    {
                        "Когда {C:attention}Блайнд{} выбран, {C:red}уничтожает{}",
                        "{C:attention}самого левого{} Джокера и создает {C:dark_edition}Негативную{}",
                        "копию этого Джокера без {C:abn_eternal}Вечный{}",
                    },
                    {
                        "Этот Джокер получает {X:mult,C:white}^#3#{} множ. и",
                        "{X:chips,C:white}^#4#{} фишек за каждую свою копию",
                        "{C:inactive}(сейчас{} {X:mult,C:white}^#1#{} {C:inactive}множ.,{} {X:chips,C:white}^#2#{} {C:inactive}фишек){}",
                    },
                    {
                        "{C:red,E:1}Вы проиграете{}, если у вас будет {C:attention}3{}",
                        "или более копии этого Джокера",
                    }
                }
            },
            j_abn_confirm_joker = {
                name = "Джокер с галочкой",
                text = {
                    {
                        "Создает случайный {C:attention}Тег{}",
                        "в конце раунда",
                    },
                    {
                        "Получите {C:money}$#1#{}, если",
                        "{C:abn_hazard}Тег Бедствия{} получен",
                    }
                }
            },
            j_abn_conrad_joker = {
                name = "Джокер Конрад",
                text = {
                    {
                        "{C:abn_tie}Галстуки{} дают {X:chips,C:white}X#1#{} фишек",
                        "при подсчете, фишки увеличиваются на {X:chips,C:white}X#2#{}",
                        "когда {C:abn_tie}Галстук{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "сыгранные {C:abn_tie}Галстуки{} навсегда",
                        "получают {C:money}$#3#{} при подсчете"
                    }
                }
            },
            j_abn_conspiracy_joker = {
                name = "Конспирологический джокер",
                text = {
                    {
                        "На {C:attention}Четных{} руках, переворачивает и перемешивает всех Джокеров",
                        "Если Джокер срабатывает, пока {C:attention}перевернут{},",
                        "этот Джокер получает {C:mult}+#3#{} множ.",
                    },
                    {
                        "На {C:attention}Нечетных{} руках, переворачивает всех Джокеров лицом вверх",
                        "Если Джокер срабатывает, пока повернут {C:attention}лицом вверх{},",
                        "этот Джокер получает {C:chips}+#4#{} фишек",
                        "{C:inactive}(сейчас{} {C:mult}+#2#{} {C:inactive}множ., {C:chips}+#1# {C:inactive}фишек)",
                    }
                }
            },
            j_abn_construction_joker = {
                name = "Строитель",
                text = {
                    "{C:attention}Стальные{} карты дают",
                    "{C:chips}+#1#{} фишек при подсчете",
                    "{C:attention}Каменные{} карты дают",
                    "{X:mult,C:white}X#2#{} множ. при подсчете",
                }
            },
            j_abn_consumable_tag = {
                name = "Тег расходника",
                text = {
                    "Когда {C:attention}Тег{} получен, создает тег {C:inactive}ванильного{} расходника",
                    "Получает {X:mult,C:white}X#2#{} множ., когда тег дает {C:attention}Набор расходников{}",
                    "{C:inactive}(сейчас:{} {X:mult,C:white}X#1#{} {C:inactive}множ.{C:inactive})",
                }
            },
            j_abn_contagion_joker = {
                name = "Джокер-инфекция",
                text = {
                    "Шанс {C:green}#1# in #2#{}, что карта с {C:attention}печатью{} получит {C:purple}зараженную печать{}",
                    "Шанс {C:green}#3# in #4#{}, что {C:attention}улучшенная{} карта превратится в {C:purple}Зараженную бонусную карту{}",
                    "Шанс {C:green}#5# in #6#{}, что карта с {C:dark_edition}выпуском{} превратится в {C:purple}Зараженную карту с множителем{}",
                    "Другие {C:abn_plagued}Чумные{} Джокеры дают {X:mult,C:white}^#7#{} множ.",
                }
            },
            j_abn_contract_from_below = {
                name = "Договор с преисподней",
                text = {
                    {
                        "{C:nightshift_cards}Полночные{} карты всегда",
                        "появляются в {C:spectral}Спектральных{} наборах",
                    },
                    {
                        "Когда {C:attention}Блайнд{} выбран, добавляет",
                        "{C:purple}Сосуд{}, {C:abn_perishable}Портящийся{} и {C:dark_edition}Хтонический{}",
                        "к {C:attention}самому левому{} Джокеру",
                    }
                }
            },
            j_abn_cookie_joker = {
                name = 'Джокер-печенье',
                text = {
                    {
                        "Когда {C:attention}Медовая{} добавляется в руку из-за своего эффекта,",
                        "получает {C:gold}+#1#{} Вознесилы за каждую добавленную {C:attention}Медовую{} карту",
                    },
                    {
                        "Если в руке есть и карта {C:attention}С чайным следом{}",
                        "и {C:attention}Медовая{} карта, этот Джокер получает {C:mult}множ.{},",
                        "равный {C:attention}удвоенному достоинству{} карт в подсчете",
                        "{C:inactive}(сейчас{} {C:gold}+#2#{} {C:inactive}Вознесилы, {C:mult}+#3#{} {C:inactive}множ.{C:inactive})",
                    }
                }
            },
            j_abn_corbin_clown = {
                name = "Клоун Корбин",
                text = {
                    {
                        "{C:abn_sword}Мечи{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#2#{}",
                        "когда {C:abn_sword}Меч{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "все карты {C:attention}в руке{}",
                        "навсегда получают {C:chips}+#3#{} фишек",
                        "при подсчете {C:abn_sword}Меча{}"
                    }
                }
            },
            j_abn_corpuscular_joker = {
                name = "Корпускулярный джокер",
                text = {
                    "{C:dark_edition}Фольговые{} Джокеры дают {C:mult}+#1#{} множ.,",
                    "{C:dark_edition}Фольговые{} Карты дают свое {C:attention}удвоенное{}",
                    "достоинство как {C:mult}множ.",
                }
            },
            j_abn_corrupted_virtue = {
                name = "Испорченная добродетель",
                text = {
                    "Если {C:attention}первая рука{} раунда - это",
                    "одна {C:attention}13{}, уничтожить ее и",
                    "создать {C:nightshift_cards}Полночную{} карту",
                    "{C:inactive}(должно быть место)",
                }
            },
            j_abn_cosmic_light = {
                name = "Звёздный свет",
                text = {
                    "Сыгранные карты с {C:dark_edition}модовыми{}",
                    "{C:diamonds}Светлыми{} мастями дают {C:mult}+#1#{} множ.",
                    "при подсчете"
                }
            },
            j_abn_costard = {
                name = "Костард",
                text = {
                    {
                        "Получает {X:chips,C:white}^#2#{} фишек, когда",
                        "карта {C:planet}планеты{} использована",
                        "{C:inactive}(сейчас {X:chips,C:white}^#1#{} {C:inactive}фишек)",
                    },
                    {
                        "В {C:attention}лавке{} всегда есть",
                        "{C:attention}Меганебесный набор"
                    }
                }
            },
            j_abn_couple_goals = {
                name = "Парочка",
                text = {
                    "Этот Джокер получает {C:white,X:mult}X#2#{} множ.,",
                    "если рука содержит подсчитываемые",
                    "{C:attention}нечетные{} и {C:attention}четные{} карты",
                    "{C:inactive}(сейчас {X:mult,C:white} X#1# {} {C:inactive}множ.){}",
                }
            },
            j_abn_cowboy_poker = {
                name = "Ковбойский покер",
                text = {
                    {
                        "Когда {C:attention}Большой Блайнд{} побежден,",
                        "{C:attention}расходники{} в руке получают разные {C:dark_edition}выпуски",
                    },
                    {
                        "Получите {C:money}$#1#{} в конце раунда",
                        "Оплата повышается на {C:money}$#2#{} за каждый",
                        "уникальный {C:dark_edition}выпуск{} расходника",
                        "{C:inactive}(сейчас{} {C:money}$#1#{C:inactive})",
                    }
                }
            },
            j_abn_crass_joker = {
                name = "Грубый джокер",
                text = {
                    {
                        "Если {C:attention}Джокер{} с {C:dark_edition}выпуском{} куплен,",
                        "этот Джокер получает {C:chips}+#1#{} фишку за",
                        "каждый {C:gold}${} его {C:attention}цены",
                    },
                    {
                        "Если {C:attention}Джокер{} куплен {C:attention}бесплатно{},",
                        "этот Джокер получает {C:chips}+#1#{} фишку за каждый",
                        "{C:gold}${} его {C:attention}оригинальной цены",
                        "{C:inactive}(сейчас {C:chips}+#2#{C:inactive} фишек)"
                    }
                }
            },
            j_abn_crease_joker = {
                name = "Джокер с заломом",
                text = {
                    "{X:attention,C:white}X#1#{} к размеру руки,",
                    "Размер выбора сброса",
                    "уменьшен до {C:red}#2#{}",
                }
            },
            j_abn_creechie_buffoon = {
                name = "Скоморох Creechie",
                text = {
                    "Карты с {C:dark_edition}Выпуском{} дают {X:mult,C:white}X#4#{} множ.",
                    "за каждого имеющегося {C:attention}Комика{}",
                    "Шанс {C:green}#1# к #2#{} быть уничтоженным в конце раунда",
                    "{C:inactive}(сейчас{} {X:mult,C:white}X#3#{} {C:inactive}множ.){}",
                }
            },
            j_abn_crimson_neko = {
                name = "Багровый Неко",
                text = {
                    "{C:attention}Счастливые{} карты не могут быть ослаблены",
                    "Этот Джокер получает {X:chips,C:white}X#2#{} фишек",
                    "каждый раз, когда {C:attention}Счастливая{}",
                    "карта {C:green}удачно{} срабатывает",
                    "{C:inactive}(сейчас {X:chips,C:white}X#1#{C:inactive} фишек)",
                }
            },
            j_abn_crossword_puzzle = {
                name = "Кроссворд",
                text = {
                    "Этот Джокер получает {X:chips,C:white}X#2#{} фишек каждый",
                    "раз, когда карта {C:lexica}Лексики{} активируется",
                    "{C:red}Сбрасывается{}, если карта {C:lexica}Лексики{} продана",
                    "{C:inactive}(сейчас {X:chips,C:white}X#1#{C:inactive} фишек)",
                }
            },
            j_abn_crybaby = {
                name = "Плачущий мальчик",
                text = {
                    "Игральные карты навсегда",
                    "получают {C:mult}+#1#{} множ.,",
                    "когда {C:attention}сброшены",
                }
            },
            j_abn_cupon_joker = {
                name = "Купон?..",
                text = {
                    "{C:attention}Расходники{}, которые могут воздействовать только",
                    "на {C:attention}1{} цель, теперь могут",
                    "воздействовать на {C:attention}2{}",
                }
            },
            j_abn_curtis_clown = {
                name = "Клоун Кертис",
                text = {
                    {
                        "{C:abn_sword}Мечи{} дают {X:chips,C:white}X#1#{} фишек",
                        "при подсчете, фишки увеличиваются на {X:chips,C:white}X#2#{}",
                        "когда {C:abn_sword}Меч{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "все карты {C:attention}в руке{}",
                        "навсегда получают {C:mult}+#3#{} множ.",
                        "при подсчете {C:abn_sword}Меча{}"
                    }
                }
            },
            j_abn_cyber_half = {
                name = "Наполовину киборг",
                text = {
                    "{C:attention}Стальные карты{} дают",
                    "свое {C:attention}удвоенное{} достоинство как",
                    "{C:chips}фишки{}, пока находятся в руке",
                }
            },
            --#endregion





            --#region D
            j_abn_daddy_warbucks = {
                name = "Джобаксы",
                text = {
                    "Сыгранные карты дают",
                    "{C:chips}+#1#{} фишек при подсчете,",
                    "если рука сыграна",
                    "с {C:money}$#2#{} или более",
                }
            },
            j_abn_dagonet = {
                name = "Дагонет",
                text = {
                    "{C:attention}Стальные{} карты в руке",
                    "дают {C:gold}+#1#{} Вознесилы"
                }
            },
            j_abn_dangerlet = {
                name = "Дэнджерлет",
                text = {
                    "Сыгранные карты дают {C:chips}+#1#{} фишек,",
                    "{C:mult}+#2#{} множ., {X:mult,C:white}X#3#{} множ. и",
                    "{C:money}$#4#{} при подсчете, и",
                    "имеют шанс {C:green}#5# к #6#{}",
                    "быть {C:mult}уничтоженными",
                }
            },
            j_abn_daredevil = {
                name = "Сорвиголова",
                text = {
                    {
                        "Все {C:attention}сыгранные карты",
                        "подсчитываются",
                    },
                    {
                        "Перезапускает {C:attention}перевернутые{} карты",
                        "один раз за каждую {C:attention}перевернутую{}",
                        "карту в подсчете"
                    },
                    {
                        "Если есть {C:attention}Дублер{},",
                        "повышает {C:planet}планетный{} уровень {C:attention}рангов{}",
                        "всех {C:attention}перевернутых{} карт в подсчете",
                    }
                }
            },
            j_abn_dark_magokert = {
                name = "Темный Маджокер",
                text = {
                    "Карты с {C:spades}темной мастью{}",
                    "перемешиваются наверх",
                    "вашей {C:attention}колоды{}",
                }
            },
            j_abn_dark_stallion = {
                name = "Темный жеребец",
                text = {
                    "Этот Джокер получает {C:chips}+#4#{} фишек",
                    "и {C:mult}+#2#{} множ. когда другой",
                    "{C:attention}Джокер{} срабатывает",
                    "{C:inactive}(сейчас {C:chips}+#3#{C:inactive} фишек, {C:mult}+#1#{C:inactive} множ.)"
                }
            },
            j_abn_dark_tie = {
                name = "Темный галстук",
                text = {
                    {
                        "Этот Джокер получает {C:money}$#6#{} и",
                        "{C:mult}+#2#{} множ., если сыгранная рука",
                        "содержит {C:attention}#3#{}",
                        "{C:inactive}(сейчас {C:money}$#5#{C:inactive}, {C:mult}+#1#{C:inactive})"
                    },
                    {
                        "Если рука, содержащая",
                        "{C:attention}#3#{} содержит как минимум",
                        "один {C:abn_tie}Галстук{}, {C:abn_tie}Галстуки{}",
                        "получают {C:money}+$#4#{} и {C:mult}+#4#{} множ. при подсчете",
                        "за каждую {C:spades}Темную масть{} в подсчете"
                    }
                }
            },
            j_abn_darkest_joker = {
                name = "Темнейший джокер",
                text = {
                    "Этот Джокер получает {C:mult}+#3#{} множ. за каждую",
                    "подсчитываемую {C:spades}Темную масть{} с {C:dark_edition}Выпуском{}",
                    "Получает {C:chips}+#4#{} фишек за каждую",
                    "подсчитываемую {C:spades}Темную масть{} с {C:attention}Улучшением{}",
                    "{C:inactive}(сейчас {C:mult}+#1#{} {C:inactive}множ.,{} {C:chips}+#2#{} {C:inactive}фишек){}",
                }
            },
            j_abn_darknet_joker = {
                name = "Джокер из Даркнета",
                text = {
                    {
                        "Если сыгранная рука - это {C:attention}Разделяй и властвуй{}",
                        "содержащий только {C:attention}номерные{} карты,",
                        "они все становятся {C:dark_edition}Побитными{}",
                    },
                    {
                        "Этот Джокер получает {X:mult,C:white}X#1#{} множ. за каждую",
                        "подсчитываемую карту в {C:attention}Разделяй и властвуй{}",
                        "{C:inactive}(сейчас{} {X:mult,C:white}X#2#{} {C:inactive}множ.)",
                    }
                }
            },
            j_abn_daybreak_aurora = {
                name = "Рассвет Авроры",
                text = {
                    "{C:dark_edition}Голографические{} карты дают {C:chips}+#2#{} фишек при подсчете,",
                    "{C:dark_edition}Голографические{} Джокеры дают {C:chips}+#1#{} фишек,",
                    "{C:attention}Удваивает{} количество получаемых фишек,",
                    "если этот Джокер {C:dark_edition}Голографический{}",
                }
            },
            j_abn_dead_or_alive = {
                name = "Живым или мертвым",
                text = {
                    "Когда {C:attention}#1#{} масти {V:1}#2#{} разыграна,",
                    "навсегда {C:attention}удваивает{} ее {C:chips}фишки{}",
                    "и получает {C:money}${}, равные ее достоинству",
                    "{s:0.8}Карта меняется каждый раунд",
                },
            },
            j_abn_deceitful_joker = {
                name = "Обманчивый джокер",
                text = {
                    "{X:mult,C:white}X#1#{} множ.",
                    "Когда {C:attention}Босс-блайнд{} побежден,",
                    "добавляет {C:attention}Перевернутая{} всем картам",
                    "{C:attention}случайной{} имеющейся масти",
                }
            },
            j_abn_deck_o_cards = {
                name = "Колода карт",
                text = {
                    "Когда {C:attention}игральная карта{}",
                    "добавляется в колоду, этот Джокер",
                    "получает {C:chips}фишки{}, равные ее {C:attention}достоинству{}",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек)"
                }
            },
            j_abn_decollage_joker = {
                name = "Джокер-деколлаж",
                text = {
                    {
                        "Дает {X:mult,C:white}Хмнож.{}, равный",
                        "числу {C:attention}уникальных{} мастей",
                        "в подсчитываемой руке"
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Голографический{},",
                        "все карты получают {C:mult}+#1#{} множ.",
                        "при подсчете"
                    }
                }
            },
            j_abn_defective_pixel_joker = {
                name = "Битый пиксель",
                text = {
                    "Этот Джокер получает {C:mult}+#2#{} множ.,",
                    "если сыгранная рука содержит",
                    "{C:attention}нечетное{} количество подсчитываемых карт",
                    "{C:inactive}(сейчас {C:mult}+#1#{} {C:inactive}множ.){}",
                }
            },
            j_abn_degraded_data_joker = {
                name = "Разрушенные данные",
                text = {
                    "Получает {C:mult}+#4#{} множ., когда {C:purple}Зараженная бонусная{} карта подсчитывается",
                    "Получает {X:mult,C:white}X#5#{} множ., когда карта с {C:purple}Зараженной печатью{} подсчитывается",
                    "Получает {X:mult,C:white}^#6#{} множ., когда {C:purple}Зараженная карта с множителем{} подсчитывается",
                    "{C:inactive}(сейчас{} {C:mult}#1#{} {C:inactive}множ.,{} {X:mult,C:white}X#2#{} {C:inactive}множ.,{} {X:mult,C:white}^#3#{} {C:inactive}множ.)",
                }
            },
            j_abn_demolition_expert = {
                name = "Demolition Expert",
                text = {
                    "{X:mult,C:white}X#1#{} множ.",
                    "{C:red}Уничтожает{} самого левого",
                    "Джокера после игры руки",
                    --"{s:0.8}#2# excluded"
                }
            },
            j_abn_demon_sphere = {
                name = "Сфера демона",
                text = {
                    {
                        "Сыгранные карты с",
                        "{C:dark_edition}модовым{} {C:attention}достоинством{} дают",
                        "{C:gold}+#1#{} Вознесилы при подсчете",
                    },
                    {
                        "Сыгранные карты имеют",
                        "шанс {C:green}#2# к #3#{} быть",
                        "{C:red}уничтоженными{} после подсчета"
                    }
                }
            },
            j_abn_depresor_joker = {
                name = "Депрессор",
                text = {
                    {
                        "{C:attention}Первая{} разыгранная {C:spades}Темная масть{}",
                        "становится {C:dark_edition}Негативной{}",
                    },
                    {
                        "Этот Джокер получает {C:chips}+#6#{} фишек и",
                        "{C:mult}+#5#{} множ. за каждую разыгранную {C:dark_edition}Негативную{} {C:spades}Темную масть{}",
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Негативный{},",
                        "получает {X:mult,C:white}X#4#{} множ. за каждую сыгранную {C:dark_edition}Негативную{} карту",
                        "{C:inactive}(сейчас {C:chips}+#3#{} {C:inactive}фишек,{} {C:mult}+#2#{} {C:inactive}множ.,{} {X:mult,C:white}X#1#{} {C:inactive}множ.){}"
                    }
                }
            },
            j_abn_deranged_imposter = {
                name = "Безумный самозванец",
                text = {
                    {
                        "Получает {C:red}+#1#{} множ. за каждую подсчитанную карту",
                        "с совпадающими {C:attention}достоинством{} и {C:enhanced}улучшением{},",
                        "но разными {C:planet}мастями",
                    },
                    {
                        "Получает {C:blue}+#2#{} фишек за каждую подсчитанную карту",
                        "с совпадающими {C:attention}мастью{} и {C:enhanced}улучшением{},",
                        "но разными {C:planet}достоинствами",
                        "{C:inactive}(сейчас {C:red}+#3#{C:inactive} множ., {C:blue}+#4#{C:inactive} фишек)",
                    }
                }
            },
            j_abn_destination_unknown = {
                name = "Пункт назначения неизвестен",
                text = {
                    {
                        "Когда {C:attention}Блайнд{} выбран,",
                        "Этот Джокер получает {C:chips}+#3#{} фишек",
                        "за каждое недостающее {C:attention}достоинство{}",
                        "в вашей полной колоде"
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Заброшенный{},",
                        "получает дополнительные {X:chips,C:white}X#4#{} фишек",
                        "за недостающие {C:attention}достоинства{}",
                        "{C:inactive}(сейчас {X:chips,C:white}X#1#{} {C:inactive}фишек,{} {C:chips}+#2#{} {C:inactive}фишек){}",
                    }
                }
            },
            j_abn_detonation_button = {
                name = "Кнопка детонации",
                text = {
                    {
                        "{C:attention}Бонусные{}, {C:attention}Дикие{}",
                        "{C:attention}Стальные{} и карты {C:attention}с Множителем{}",
                        "навсегда получают {C:white,X:mult}X#1#{} множ.",
                        "при подсчете",
                    },
                    {
                        "{C:red}Самоуничтожается{}, если рука",
                        "не содержит представленные карты",
                    }
                }
            },
            j_abn_device_joker = {
                name = "#1#",
                text = {
                    {
                        "{C:attention}#2#{} карта никогда не",
                        "уничтожается от своего {C:attention}эффекта{}",
                    },
                    {
                        "Если {C:attention}первая рука{} раунда",
                        "содержит только {V:1}#3# масти{}, улучшает",
                        "их до {C:attention}#2#{} карта",
                    },
                    {
                        "Если каждая карта в руке уже {C:attention}#2#{},",
                        "добавляет {C:dark_edition}#4#{} выпуск к ним",
                        "и {C:attention}переворачивает{} этого Джокера",
                    }
                }
            },
            j_abn_devil_fruit = {
                name = "Дьявольскй плод",
                text = {
                    {
                        "Когда {C:attention}Блайнд{} выбран,",
                        "добавляет {C:dark_edition}#3#{}",
                        "{C:attention}самому правому{} Джокеру",
                    },
                    {
                        "Шанс {C:green}#1# к #2#{}, что",
                        "эта карта будет уничтожена",
                        "в конце раунда",
                    }
                }
            },
            j_abn_digital_currency = {
                name = "Цифровая валюта",
                text = {
                    "Сыгранные {C:attention}карты{}",
                    "навсегда получают",
                    "{C:money}+$#1#{} при подсчете",
                }
            },
            j_abn_dimitri_jester = {
                name = "Шут Димитрий",
                text = {
                    {
                        "{C:diamonds}Бубны{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#2#{}",
                        "когда {C:diamonds}Бубна{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "{C:diamonds}Бубны{} добавляют {C:money}$#3#{} к {C:attention}цене продажи{}",
                        "всем {C:attention}Джокерам{} при подсчете"
                    }
                }
            },
            j_abn_dirac = {
                name = "Дирак",
                text = {
                    {
                        "{C:dark_edition}Негативные{} {C:dark_edition}модовые{} карты и",
                        "Джокеры не могут быть {C:mult}ослаблены{}"
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Негативный{},",
                        "увеличивает {C:attention}размер руки{} на {C:attention}+#5#{}"
                    },
                    {
                        "Получает {X:chips,C:white}X#2#{} фишек за каждую",
                        "{C:dark_edition}модовую Негативную{} карту в подсчете",
                        "Получает {X:mult,C:white}X#4#{} множ. за каждого",
                        "{C:dark_edition}модового Негативного{} Джокера",
                        "{C:inactive}(сейчас:{} {X:chips,C:white}X#1#{} {C:inactive}фишек, {X:mult,C:white}X#3#{} {C:inactive}множ.{}",
                    }
                }
            },
            j_abn_forsake_joker = {
                name = "Вышедший из строя",
                text = {
                    "Получите {C:money}$#1#{}, когда {C:dark_edition}Заброшенный{} выпуск срабатывает,",
                    "если это произошло на {C:attention}игральной карте{},",
                    "получает фишки, равные ее {C:attention}удвоенному{} достоинству",
                    "получает {C:mult}+#4#{} множ., если на {C:attention}Джокере{}",
                    "{C:inactive}(сейчас{} {C:mult}+#3#{} {C:inactive}множ., {C:chips}+#2# {C:inactive}фишек)",
                }
            },
            j_abn_discontinued_joker = {
                name = "Снятый с продажи",
                text = {
                    {
                        "Создает случайный {C:attention}Тег{}",
                        "когда {C:attention}Блайнд{} пропущен",
                    },
                    {
                        "Сыгранные {C:attention}Снятые с продажи{} карты",
                        "навсегда получают {C:mult}+#1#{} множ., за каждый",
                        "уникальный {C:attention}Тег{} полученные в этой партии",
                        "{C:inactive}(Получат {C:mult}+#2#{C:inactive})"
                    }
                }
            },
            j_abn_dnr_joker = {
                name = "Не реанимировать",
                text = {
                    "Когда {C:attention}улучшенные{} карты подсчитываются,",
                    "{C:mult}уничтожает{} их, и {C:attention}Джокеры",
                    "навсегда получают {X:mult,C:white}X#1#{} множ.",
                }
            },
            j_abn_dorcelessness = {
                name = "Опустошенный",
                text = {
                    "Перезапускает {C:attention}соседних{}",
                    "{C:attention}перевернутых{} Джокеров"
                }
            },
            j_abn_double_dip = {
                name = 'Двойное погружение',
                text = {
                    "Этот Джокер дает базовые {C:chips}фишки{} и",
                    "{C:red}множ.{} сыгранной покерной руки",
                }
            },
            j_abn_double_entendre = {
                name = "Двойное дно",
                text = {
                    "{C:white,X:mult}X#1#{} множ. на {C:attention}четных руках{},",
                    "{C:white,X:chips}X#2#{} фишек на {C:attention}нечетных руках{}",
                }
            },
            j_abn_double_hubble = {
                name = 'Дабл Хаббл',
                text = {
                    '{C:mult}+#1#{} множ., если {C:attention}покерная',
                    '{C:attention}рука{} была сыграна {C:attention}четное{}',
                    'количество раз'
                }
            },
            j_abn_double_king = {
                name = "Двойной король",
                text = {
                    {
                        "{C:attention}Короли{} не дают свои {C:chips}фишки{} при подсчете,",
                        "{C:mult}Уничтожает{} сыгранного {C:attention}Короля{} при подсчете и",
                        "получает его {C:attention}удвоенное достоинство{}, как {C:chips}фишки{}",
                        "{C:inactive}(сейчас {C:chips}+#1#{} {C:inactive}фишек)",
                    },
                    {
                        "Если у вас есть {C:attention}Костлявый{}, он становится",
                        "{C:dark_edition}Негативным{} в конце раунда и дает",
                        "{C:mult}+#2#{} множ. за каждую карту в подсчете",
                    }
                }
            },
            j_abn_drawcia = {
                name = "Дросия",
                text = {
                    {
                        "Руки только из {C:dark_edition}модовых{}",
                        "мастей {C:attention}всегда подсчитываются{}"
                    },
                    {
                        "Получает {X:mult,C:white}X#2#{} множ. за каждую",
                        "{C:attention}уникальную{} масть, если не было",
                        "сыграно {C:inactive}ванильных{} мастей",
                        "{C:inactive}(сейчас:{} {X:mult,C:white}X#1#{} {C:inactive}множ.{C:inactive})",
                    }
                }
            },
            j_abn_dreamstalker_joker = {
                name = "Дримсталкер",
                text = {
                    {
                        "Если у вас {C:attention}Четное{} количество {C:mult}Сбросов{},",
                        "{C:diamonds}Светлые{} масти дают {C:mult}+#1#{} множ. при подсчете",
                        "за каждую карту {C:spades}Темной{} масти подсчитанную до этого",
                    },
                    {
                        "Если у вас {C:attention}Нечетное{} количество {C:mult}Сбросов{},",
                        "{C:spades}Темные{} масти дают {C:mult}+#1#{} множ. при подсчете",
                        "за каждую карту {C:diamonds}Светлой{} масти подсчитанную до этого",
                    }
                }
            },
            j_abn_dreamtime_sphinx = {
                name = "Сонный сфинкс",
                text = {
                    {
                        "Этот Джокер получает {C:chips}+#2#{} фишек,",
                        "когда {C:attention}Ископаемая карта{} подсчитывается",
                    },
                    {
                        "Повышает {C:planet}планетный{} уровень {C:attention}рангов{}",
                        "карт с {C:dark_edition}Темным{} выпуском"
                    },
                    {
                        "Если {C:attention}Ископаемая карта{} {C:mult}уничтожена{},",
                        "дает ее {C:attention}достоинство{} как {C:mult}множ.",
                        "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек, {C:mult}+#3#{} {C:inactive}множ.{})"
                    }
                }
            },
            j_abn_drifter_joker = {
                name = "Дрифтер",
                text = {
                    {
                        "Карты в {C:attention}первом сбросе{} раунда,",
                        "становятся {C:attention}Ископаемыми картами{}",
                    },
                    {
                        "Карты {C:attention}Без достоинства возвращаются{}",
                        "в руку, если сыграны в первый раз",
                    }
                }
            },
            j_abn_dryeraser_board = {
                name = "Маркерная доска",
                text = {
                    "{X:red,C:white}X#1#{} множ., если все",
                    "сыгранные карты и карты",
                    "в руке - это {C:spades}#2#{}",
                }
            },
            j_abn_dual_identity = {
                name = "Двойная идентичность",
                text = {
                    "{X:mult,C:white}X#1#{} множ., если у вас",
                    "{C:attention}четное{} количество Джокеров",
                    "{C:attention}двух разных{} редкостей",
                }
            },
            j_abn_dungeon_crawler = {
                name = "Обитатель подземелья",
                text = {
                    {
                        "Заплатите {C:money}$#1#{}, чтобы получить {C:attention}+1{} слот джокера",
                        "Повышает {C:attention}победный Анте{} на {C:attention}+1{} за",
                        "каждого Джокера выше {C:attention}5-го{}"
                    },
                    {
                        "Джокеры и карты с {C:inactive}ванильным{} {C:dark_edition}выпуском{}",
                        "дают {C:gold}+#2#{} Вознесилы"
                    },
                    {
                        "Если карта с {C:inactive}ванильной{} мастью",
                        "и {C:dark_edition}выпуском{} совпадает с {C:dark_edition}выпуском{}",
                        "этого Джокера, он получает {C:gold}+#4#{} Вознесилы",
                        "{C:inactive}(сейчас {C:gold}+#5#{} {C:inactive}Вознес.){}",
                    }
                }
            },
            --#endregion





            --#region E
            j_abn_early_sketch = {
                name = "Ранний концепт",
                text = {
                    {
                        "Если {C:attention}первая рука{} раунда содержит",
                        "только {C:dark_edition}Винтажные {C:attention}Объединяющие карты{},",
                        "рука подсчитается с уровнем",
                        "на {C:attention}#1#{} больше настоящего",
                    },
                    {
                        "Руки, содержащие только",
                        "{C:dark_edition}Винтажные {C:attention}Объединяющие карты{}",
                        "не могут {C:red}понизить уровень{}"
                    }
                }
            },
            j_abn_eccentric_artist = {
                name = "Eccentric Artist",
                text = {
                    {
                        "{C:attention}Объединяющие{} карты с {C:inactive}ванильными",
                        "{C:attention}мастью{} и {C:attention}выпуском{} дают",
                        "{C:chips}+#1#{} фишек и {C:mult}+#2#{} множ. при подсчете",
                    },
                    {
                        "{C:attention}Объединяющие{} карты с {C:dark_edition}модовыми",
                        "{C:attention}мастью{} и {C:attention}выпуском{} дают",
                        "{C:chips}+#3#{} фишек и {C:mult}+#4#{} множ. при подсчете",
                    },
                    {
                        "Дает {C:chips}+#5#{} фишек и {C:mult}+#6#{} множ.,",
                        "если ваша {C:attention}полная колода{} содержит",
                        "только {C:attention}Объединяющие{} карты"
                    }
                }
            },
            j_abn_edgesketch_joker = {
                name = "Джокер-рисовалка",
                text = {
                    "Получает {C:mult}+#3#{} множ., когда",
                    "{C:attention}самый правый{} Джокер срабатывает",
                    "Получает {C:chips}+#4#{} фишек, когда",
                    "{C:attention}самый левый{} Джокер срабатывает",
                    "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ., {C:chips}+#2#{C:inactive} фишек)",
                }
            },
            j_abn_edition_anonymous = {
                name = "Анонимный выпуск",
                text = {
                    {
                        "Когда карта с {C:dark_edition}выпуском{}",
                        "подсчитывается, {C:attention}случайно меняет{}",
                        "ее {C:dark_edition}выпуск{}"
                    },
                    {
                        "Когда {C:attention}Блайнд{} побежден,",
                        "{C:attention}случайно меняет{} {C:dark_edition}выпуски{}",
                        "всех ваших Джокеров"
                    },
                    {
                        "Каждая карта или Джокер, поменявший",
                        "{C:dark_edition}выпуск{}, получают {C:mult}+#1#{} множ.",
                        "и {C:chips}+#2#{} фишек"
                    }
                }
            },
            j_abn_edition_design_joker = {
                name = "Издание и дизайн",
                text = {
                    {
                        "Когда {C:attention}Джокер{} с {C:dark_edition}выпуском{}",
                        "куплен, получает {C:mult}множ.{}",
                        "основанный на его {C:legendary}редкости",
                        "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.)",
                    },
                    {
                        "{C:common,s:0.8}Обычный{s:0.8}: {C:red,s:0.8}+#2#{s:0.8} множ.",
                        "{C:uncommon,s:0.8}Необычный{s:0.8}: {C:red,s:0.8}+#3#{s:0.8} множ.",
                        "{C:rare,s:0.8}Редкий{s:0.8}: {C:red,s:0.8}+#4#{s:0.8} множ.",
                        "{C:abn_superrare,s:0.8}Супер редкий{s:0.8}: {C:red,s:0.8}+#5#{s:0.8} множ.",
                        "{C:abn_parallelrare,s:0.8}Параллель-редкий{s:0.8}: {C:red,s:0.8}+#6#{s:0.8} множ.",
                        "{C:legendary,s:0.8}Легендарный{s:0.8}: {C:red,s:0.8}+#7#{s:0.8} множ.",
                        "{C:abn_virusrare,s:0.8}Вирусный{s:0.8}: {C:red,s:0.8}+#8#{s:0.8} множ.",
                    }
                }
            },
            j_abn_editional_tag = {
                name = "Тег выпусков",
                text = {
                    {
                        "Получает {X:mult,C:white}X#2#{} множ., когда {C:attention}Тег{} получен,",
                        "если этот тег - {C:dark_edition}модовый{}, {C:attention}Снятые с продажи{}",
                        "карты получают {C:money}$#4#{} и {C:mult}+#3#{} множ."
                    },
                    {
                        "Если этот Джокер с {C:dark_edition}Выпуском{},",
                        "когда другой Джокер получает {C:dark_edition}Выпуск{} с {C:attention}тега{},",
                        "одна случайная {C:attention}Снятая с продажи{} карта получает такой же {C:dark_edition}Выпуск{}",
                        "{C:inactive}(сейчас: {X:mult,C:white}X#1#{} {C:inactive}множ.)"
                    }
                }
            },
            j_abn_efo_joker = {
                name = "Почтовый купон",
                text = {
                    {
                        "Шанс {C:green}#1# к #2#{} скопировать первую",
                        "сыгранную {C:attention}Штампованную карту{} в руку"
                    },
                    {
                        "{C:attention}Штампованные карты{} дают",
                        "{C:gold}+#3#{} Вознесилы при подсчете"
                    },
                    {
                        "Если в сыгранной руке {C:attention}5{} или более {C:attention}штампов{},",
                        "этот Джокер получает {X:mult,C:white}X#4#{} множ. и",
                        "{C:gold}+#5#{} Вознесилы за каждую карту в подсчете",
                        "{C:inactive}(сейчас: {X:mult,C:white}X#6#{} {C:inactive}множ., {C:gold}+#7#{} {C:inactive}Вознес.)",
                    }
                }
            },
            j_abn_egg_arrival = {
                name = "Яйцо в чате",
                text = {
                    {
                        "Добавляет {C:money}$#1#{} к {C:attention}цене продажи",
                        "всех {C:attention}Джокеров{}, когда",
                        "{C:weather_report}Прогноз погоды{} использован",
                    },
                    {
                        "Перезапускает {C:attention}Джокеров{}",
                        "с ценой продажи не менее {C:money}$#2#",
                    }
                }
            },
            j_abn_elated_joker = {
                name = "Окрыленный джокер",
                text = {
                    {
                        "Руки, содержащие {C:attention}4{} или более",
                        "мастей не могут быть ослаблены"
                    },
                    {
                        "Этот Джокер получает {C:chips}+#4#{} за каждую",
                        "сброшенную уникальную {C:attention}масть{},",
                        "получает {C:mult}+#2#{} множ. за каждую",
                        "сыгранную уникальную {C:attention}масть{}",
                        "{C:inactive}(сейчас {C:chips}+#3#{C:inactive} фишек, {C:mult}+#1#{C:inactive} множ.)",
                    }
                }
            },
            j_abn_electrocuted_joker = {
                name = "Удар током",
                text = {
                    {
                        "{C:attention}#1#{} и {C:attention}#2#{}",
                        "перезапускаются при подсчете"
                    },
                    {
                        "Шанс {C:green}#3# к #4#{} {C:red}уничтожить{}",
                        "{C:attention}#1#{} и {C:attention}#2#{} при подсчете"
                    }
                }
            },
            j_abn_elementalist_joker = {
                name = "Джокер-элементалист",
                text = {
                    {
                        "Повышает уровень сыгранной",
                        "руки, если она содержит",
                        "{C:attention}6{} или более мастей",
                    },
                    {
                        "Если {C:attention}покерная рука{} - это",
                        "{C:attention}Инверс-спектрум{}, повышает",
                        "{C:planet}планетный{} уровень {C:attention}рангов{}",
                        "всех подсчитанных карт"
                    }
                }
            },
            j_abn_elevator = {
                name = "Лифт",
                text = {
                    "Сыгранные карты",
                    "увеличивают свое достоинство",
                    "на {C:attention}1{} после подсчета",
                }
            },
            j_abn_emergency_contact = {
                name = "Экстренный контакт",
                text = {
                    "После {C:attention}#1#{} раундов,",
                    "{C:attention}продайте{} этого Джокера, чтобы создать",
                    "открытого {C:rare}Редкого{} {C:abn_perishable}Портящегося{}",
                    "Джокера из вашей коллекции",
                    "{C:inactive}(сейчас {C:attention}#2#{C:inactive}/{C:inactive}#1#)"
                }
            },
            j_abn_ena_joker = {
                name = "Эна-джокер",
                text = {
                    {
                        "Карты с {C:inactive}ванильными{} мастями",
                        "и {C:dark_edition}модовыми {C:attention}улучшениями{} дают",
                        "{C:white,X:chips}X#1#{} фишек при подсчете",
                    },
                    {
                        "Этот Джокер получает {C:chips}+#3#{} фишек",
                        "за каждое {C:dark_edition}модовое{}",
                        "{C:enhanced}улучшение{} в подсчитываемой руке",
                        "{C:inactive}(сейчас {C:chips}+#2#{C:inactive} фишек)"
                    }
                }
            },
            j_abn_enchanted_night = {
                name = "Дивная ночь",
                text = {
                    "Перезапускает все сыгранные",
                    "{C:spades}Темные масти{} с {C:dark_edition}выпуском{}",
                }
            },
            j_abn_enigma_comedian = {
                name = "Энигма-комик",
                text = {
                    {
                        "Когда {C:attention}Блайнд{} выбран,",
                        "создает {C:attention}1{} {C:dark_edition}Перламутрового{}",
                        "{C:inactive}Ванильного{} Джокера",
                        "{C:inactive}(должно быть место)",
                    },
                    {
                        "{X:mult,C:white}^#1#{} множ. и {X:chips,C:white}^#2#{} фишек,",
                        "за каждого сработавшего",
                        "{C:inactive}ванильного{} Джокера"
                    }
                }
            },
            j_abn_enrage_joker = {
                name = "Яростный джокер",
                text = {
                    "{C:white,X:chips}X#1#{} фишек,",
                    "{C:attention}#2#{} карт принудительно",
                    "выбираются всегда",
                }
            },
            j_abn_entitled_fool = {
                name = "Так называемый \"Дурак\"",
                text = {
                    "Этот Джокер получает {X:chips,C:white}X#1#{} фишек",
                    "или {X:mult,C:white}X#2#{} множ. каждый раз, когда",
                    "подсчитывается такое же количество",
                    "{C:chips}нечетных{} или {C:mult}четных{} {C:attention}Плиточных{} карт,",
                    "более одного раза за раунд",
                    "{C:inactive}(сейчас {X:chips,C:white}X#3#{C:inactive} фишек, {X:mult,C:white}X#4#{C:inactive} множ.)"
                }
            },
            j_abn_entropic_clubs = {
                name = "Энтропийные трефы",
                text = {
                    "Уничтожает все {C:clubs}Трефы{} при подсчете,",
                    "этот Джокер получает их {C:chips}фишки{}",
                    "{C:inactive}(сейчас{} {C:chips}+#1#{} {C:inactive}фишек)",
                }
            },
            j_abn_entropic_diamonds = {
                name = "Энтропийные бубны",
                text = {
                    "Уничтожает все {C:diamonds}Бубны{} при подсчете,",
                    "этот Джокер получает их {C:chips}фишки{}",
                    "{C:inactive}(сейчас{} {C:chips}+#1#{} {C:inactive}фишек)",
                }
            },
            j_abn_entropic_hearts = {
                name = "Энтропийные черви",
                text = {
                    "Уничтожает все {C:hearts}Черви{} при подсчете,",
                    "этот Джокер получает их {C:chips}фишки{}",
                    "{C:inactive}(сейчас{} {C:chips}+#1#{} {C:inactive}фишек)",
                }
            },
            j_abn_entropic_spades = {
                name = "Энтропийные пики",
                text = {
                    "Уничтожает все {C:spades}Пики{} при подсчете,",
                    "этот Джокер получает их {C:chips}фишки{}",
                    "{C:inactive}(сейчас{} {C:chips}+#1#{} {C:inactive}фишек)",
                }
            },
            j_abn_envy = {
                name = "Зависть",
                text = {
                    {
                        "Все возможные {C:attention}Джокеры{} становятся",
                        "{C:abn_eternal}Вечными{} при покупке"
                    },
                    {
                        "{X:mult,C:white}X#1#{} множ. на {C:attention}второй руке{} раунда,",
                        "увеличивается на {X:mult,C:white}X#2#{} за каждый раз,",
                        "когда вы не сыграли вашу",
                        "{C:attention}самую высокоуровневую покерную руку{}",
                    }
                }
            },
            j_abn_epic_joker = {
                name = "Эпический джокер",
                text = {
                    "Этот Джокер получает {X:mult,C:white}X#2#{} множ.",
                    "за каждую {C:attention}номерную{} карту",
                    "выше {C:attention}10{}, разыгранную в {C:attention}Флеше{}",
                    "{C:inactive}(сейчас{} {X:mult,C:white}X#1#{} {C:inactive}множ.)",
                }
            },
            j_abn_equationerror = {
                name = "Ошибка в уравнении",
                text = {
                    {
                        "Шанс {C:green}#3# к #4#{}, что этот",
                        "Джокер получит {C:chips}+#5#{} фишек и",
                        "{C:mult}+#6#{} множ. при подсчете карты",
                        "{C:inactive}(сейчас {C:chips}+#1# {C:inactive}фишек, {C:mult}+#2# {C:inactive}множ.)",
                    },
                    {
                        "Когда рука сыграна, шанс {C:green}#3# к #4#{}",
                        "{C:attention}удвоить{} {C:chips}фишки{} этого Джокера",
                        "{C:attention,s:0.8}Старшая карта{C:inactive,s:0.8} не в счет"
                    },
                    {
                        "Удваивает свои {C:chips}фишки{} и {C:mult}множ.{},",
                        "когда {C:attention}Джокер{} {C:red}уничтожен{}",
                    }
                },
            },
            j_abn_erratic_joker = {
                name = "Неустойчивый джокер",
                text = {
                    {
                        "Каждая сыгранная карта",
                        "{C:attention}случайно{} меняет масть перед подсчетом",
                    },
                    {
                        "Этот Джокер получает {C:chips}+#1#{} фишек,",
                        "когда карта меняет масть",
                        "{C:inactive}(сейчас {C:chips}+#2#{C:inactive} фишек)",
                    }
                }
            },
            j_abn_erwyd = {
                name = "Эрвид",
                text = {
                    {
                        "Получает {X:chips,C:white}^#2#{} фишек, когда",
                        "карта {C:tarot}Таро{} использована",
                        "{C:inactive}(сейчас {X:chips,C:white}^#1#{} {C:inactive}фишек)",
                    },
                    {
                        "В {C:attention}лавке{} всегда есть",
                        "{C:attention}Меганабор аркана"
                    }
                }
            },
            j_abn_escuderia_joker = {
                name = "Гербовый джокер",
                text = {
                    "Дает {C:mult}+#1#{} множ.",
                    "за каждую {C:attention}уникальную наклейку{}",
                    "среди ваших {C:attention}Джокеров{}",
                    "{C:inactive}(сейчас {C:mult}+#2#{} {C:inactive} множ.)",
                }
            },
            j_abn_eternian_joker = {
                name = "Этернианский джокер",
                text = {
                    "{C:gold}+#1#{} Вознесилы за каждый",
                    "уникальный тип {C:attention}расходника{} в руке",
                    "{C:inactive}(сейчас {C:gold}+#2#{C:inactive} Вознес.)",
                }
            },
            j_abn_even_stephen = {
                name = "Четнутый Стивен",
                text = {
                    "Разыгранные карты с",
                    "{C:attention}четным{} достоинством дают",
                    "{C:mult}+#1#{} множ. при подсчете",
                }
            },
            j_abn_evenly_steven = {
                name = "Более четный Стивен",
                text = {
                    "Сыгранные {C:attention}карты{}",
                    "с {C:attention}четным{} достоинством",
                    "навсегда получают",
                    "{C:chips}+#1#{} фишек при подсчете",
                }
            },
            j_abn_example_joker = {
                name = "Пример Джокера",
                text = {
                    "Создает карту {C:sigils}Символа{} для",
                    "последней {C:attention}покерной руки{}",
                    "раунда",
                }
            },
            j_abn_executioner = {
                name = "Палач",
                text = {
                    "Карты {C:attention}в руке{} навсегда",
                    "получают {C:chips}+#1#{} фишек,",
                    "когда {C:attention}игральная карта{}",
                    "уничтожается",
                }
            },
            j_abn_explorer_joker = {
                name = "Исследователь",
                text = {
                    {
                        "{C:abn_shield}Щиты{}, {C:abn_crown}Короны{}, {C:abn_coin}Монеты{},",
                        "{C:diamonds}Бубны{} и {C:abn_talon}Талоны{} получают {C:chips}+#6#{} фишек",
                        "и {C:mult}+#7#{} множ. за каждую имеющуюся",
                        "карту {C:continent}Континента{} при подсчете"
                    },
                    {
                        "Карты {C:continent}Континентов{} продаются за {C:money}$#5#{},",
                        "Этот Джокер получает {C:chips}+#2#{} фишек и {C:mult}+#4#{} множ.",
                        "за каждую проданную карту {C:continent}Континента{}",
                        "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек, {C:mult}+#3#{C:inactive} множ.)"
                    }
                }
            },
            j_abn_eye_exam = {
                name = "Таблица Сивцева",
                text = {
                    "Заплати {C:money}$#1#{}, чтобы исправить все",
                    "{C:attention}перевернутые{} карты в руке",
                }
            },
            j_abn_exciton_event = {
                name = "Экситонное событие",
                text = {
                    "Когда карта {C:planet}Планеты{} использована,",
                    "повышает уровень случайной",
                    "{C:attention}покерной руки{} на {C:attention}#3#{},",
                    "Шанс {C:green}#1# к #2#{} уничтожить",
                    "{C:attention}75%{} вашей {C:attention}полной колоды"
                }
            },
            --#endregion





            --#region F
            j_abn_facial_recognition = {
                name = "Распознавание лиц",
                text = {
                    {
                        "Этот Джокер получает {X:red,C:white}X#1#{} множ.",
                        "за каждое {C:attention}уникальное достоинство{} среди",
                        "подсчитываемых {C:attention}перевернутых{} карт",
                    },
                    {
                        "Если этот {C:attention}Джокер{} {C:attention}перевернутый{},",
                        "вместо этого он получает {C:blue}фишки{}, равные",
                        "значениям {C:blue}фишек{} {C:attention}подсчитываемых",
                        "{C:attention}перевернутых{} карт",
                        "{C:inactive}(сейчас {X:red,C:white}X#2#{C:inactive} множ. {C:blue}+#3#{C:inactive} фишек)",
                    }
                }
            },
            j_abn_faded_graffiti = {
                name = "Исчезающее граффити",
                text = {
                    "Повышает уровень {C:attention}Флеша{},",
                    "когда уровень другой",
                    "руки {C:attention}повышается{}",
                }
            },
            j_abn_failed_test = {
                name = "Проваленный тест",
                text = {
                    "Если сыгранная рука - это",
                    "{C:attention}#1#{},",
                    "все карты в подсчете дают",
                    "свои {C:chips}фишки{} как {C:white,X:mult}Xмнож.{}",
                    "{C:inactive,s:0.8}({C:attention,s:0.8}покерная рука{s:0.8,C:inactive} меняется каждую руку)"
                }
            },
            j_abn_fairytale_book = {
                name = "Книга сказок",
                text = {
                    "{C:legendary,E:1}Легендарные{} Джокеры могут",
                    "появиться в {C:attention}лавке",
                }
            },
            j_abn_fanart_joker = {
                name = "Джокер из fan-art",
                text = {
                    "{X:mult,C:white}X#1#{} множ., если",
                    "у вас {C:attention}Нечетное{}",
                    "количество Джокеров",
                }
            },
            j_abn_fanfiction_comedian = {
                name = "Комик из фанфика",
                text = {
                    {
                        "Этот Джокер получает {X:mult,C:white}X#2#{} множ.",
                        "за каждую {C:attention}уникальную{} карту {C:attention}без масти{} в подсчете",
                        "{C:inactive}(сейчас{} {X:mult,C:white}X#1#{} {C:inactive}множ.){}",
                    },
                    {
                        "Карты {C:attention}без масти{} дают {C:mult}+#4#{} множ.",
                        "и {C:chips}+#3#{} фишек за каждую {C:attention}уникальную{}",
                        "карту {C:attention}без масти{} в подсчете",
                    },
                    {
                        "{C:attention}Перезапускает{} карты {C:attention}без масти{}",
                        "по разу за каждую {C:attention}уникальную{}",
                        "карту {C:attention}без масти{} в подсчете",
                    }
                }
            },
            j_abn_faruk_jester = {
                name = "Шут Фарук",
                text = {
                    {
                        "{C:spades}Пики{} дают {X:chips,C:white}X#1#{} фишек",
                        "при подсчете, фишки увеличиваются на {X:chips,C:white}X#2#{}",
                        "когда {C:spades}Пика{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "{C:spades}Пики{} навсегда получают",
                        "{C:mult}+#3#{} множ. за каждую карту {C:attention}в руке{}"
                    }
                }
            },
            j_abn_fatal_silhouette = {
                name = "Роковой силуэт",
                text = {
                    "Первая сыгранная карта со",
                    "{C:diamonds}светлой мастью{} и {C:abn_silver_seal}серебряной печатью{}",
                    "дает {C:white,X:chips}X#1#{} фишек при подсчете",
                }
            },
            j_abn_feline_joker = {
                name = "Кошачий джокер",
                text = {
                    "Случайным образом дает {C:chips}+#2#{} фишек,",
                    "{C:white,X:mult}X#1#{} множ. или {C:money}$#3#{}"
                }
            },
            j_abn_felix_joker = {
                name = 'Феликс',
                text = {
                    "Когда {C:attention}Блайнд{} побежден,",
                    "превращает {C:attention}расходники{} в руке",
                    "в {C:spectral}Спектральные{} карты",
                }
            },
            j_abn_feste = {
                name = "Фестер",
                text = {
                    "Создает {C:dark_edition}Негативную{}",
                    "{C:nightshift_cards}Полночную{} карту, когда",
                    "{C:attention}Блайнд{} выбран",
                }
            },
            j_abn_feste2 = { -- cuz we already have Feste lol
                name = "Фесте",
                text = {
                    "Сыгранные {C:attention}Дикие{} карты дают",
                    "{X:mult,C:white}^#1#{} множ. или {X:chips,C:white}^#2#{} фишек",
                    "при подсчете"
                }
            },
            j_abn_figurehead = {
                name = "Прыгающая голова",
                text = {
                    "Перезапускает всех",
                    "{C:legendary,E:1}Легендарных{} Джокеров"
                }
            },
            j_abn_final_showdown = {
                name = "Последняя схватка",
                text = {
                    {
                        "{C:attention}Босс-блайнды{} заменены",
                        "{C:legendary,E:1}Шоудаун{}{C:attention} Босс-блайндами{}",
                    },
                    {
                        "Получает {C:attention}+#1#{} слот джокеров",
                        "когда {C:legendary,E:1}Шоудаун{}{C:attention} Босс-блайнд{}",
                        "побежден"
                    }
                }
            },
            j_abn_finalmix = {
                name = "Final Mix",
                text = {
                    "Этот Джокер получает {C:white,X:mult}X#2#{} множ.",
                    "за каждый уникальный {C:attention}Модификатор карт{}",
                    "на подсчитываемых {C:hearts}Червах{}",
                    "{C:inactive}(сейчас {C:white,X:mult}X#1#{C:inactive} множ.)"
                }
            },
            j_abn_fit_to_shape = {
                name = "По форме",
                text = {
                    "{C:attention}4-х карточные{} руки дают",
                    "{X:chips,C:white}^#1#{} фишек и {X:mult,C:white}^#2#{} множ.",
                }
            },
            j_abn_flawed_imitation = {
                name = "Некачественная подделка",
                text = {
                    {
                        "{C:attention}Джокеры{} могут появляться многократно",
                    },
                    {
                        "Джокеры дают {X:mult,C:white}X#1#{} множ.",
                        "за каждую копию этого Джокера",
                    }
                }
            },
            j_abn_flotsam_joker = {
                name = "Потерпевший кораблекрушение",
                text = {
                    "Если сыгранная рука содержит {C:attention}Флеш{},",
                    "карты {C:attention}в руке{} с такой",
                    "же {C:attention}мастью{} также подсчитываются"
                }
            },
            j_abn_for_sale_joker = {
                name = "Продается",
                text = {
                    "Когда рука разыграна, получает",
                    "{C:chips}фишки{}, равные сумме {C:attention}цен продажи{}",
                    "всех ваших {C:attention}Джокеров",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек)",
                }
            },
            j_abn_force_encounter = {
                name = "Вынужденная встреча",
                text = {
                    {
                        "Дает {C:chips}+#1#{} фишек, когда",
                        "срабатывает эффект {C:mult}+множ.{}",
                        "другого {C:attention}Джокера{}"
                    },
                    {
                        "Фишки увеличиваются на {C:chips}+#2#{},",
                        "когда {C:attention}Блайнд{} побежден"
                    }
                }
            },
            j_abn_foreign_advert = {
                name = "Иностранная реклама",
                text = {
                    "Когда рука сыграна, этот",
                    "Джокер получает {C:white,X:mult}X#2#{} множ. за каждое",
                    "{C:inactive}ванильное{} {C:attention}улучшение{} и {C:white,X:chips}X#4#{}",
                    "фишек за каждое {C:dark_edition}модовое{} {C:attention}улучшение{}",
                    "в подсчитываемой руке",
                    "{C:inactive}(сейчас {C:white,X:mult}X#1#{C:inactive} множ., {C:white,X:chips}X#3#{C:inactive} фишек)"
                }
            },
            j_abn_foreign_id = {
                name = "Загран-паспорт",
                text = {
                    "Этот Джокер получает {C:attention}достоинство{}",
                    "подсчитанных карт с {C:dark_edition}модовыми{}",
                    "мастями как {C:mult}множ.{}",
                    "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.)"
                }
            },
            j_abn_foreign_license = {
                name = "Иностранные права",
                text = {
                    "{X:chips,C:white}X#1#{} фишек, если в",
                    "вашей полной колоде не",
                    "менее {C:attention}#2#{} улучшенных карт",
                    "{C:inactive}(сейчас {C:attention}#3#{C:inactive})",
                }
            },
            j_abn_foreign_thunk = {
                name = "ForeignThunk",
                text = {
                    {
                        "Если {C:attention}первая карта в подсчете{}",
                        "имеет {C:attention}Ванильное {C:enhanced}улучшение{},",
                        "добавляет соответствующую ему {C:enhanced}Наклейку",
                        "к {C:attention}самому правому{} Джокеру"
                    },
                    {
                        "Если {C:enhanced}Наклейка{} Джокера совпадает",
                        "с {C:inactive}Ванильным {C:attention}улучшением{} подсчитанной карты,",
                        "{C:attention}она{} получает {C:purple}+#1#{} к Счету"
                    }
                }
            },
            j_abn_forgemaster_joker = {
                name = "Кузнец",
                text = {
                    {
                        "Сыгранные, но {C:attention}не подсчитанные{}",
                        "карты улучшаются до {C:attention}Кованных{} карт",
                    },
                    {
                        "Все {C:attention}Кованные{} карты",
                        "подсчитываются, когда сыграны"
                    }
                }
            },
            j_abn_forgotten_joker = {
                name = "Забытый джокер",
                text = {
                    {
                        "{C:attention}Анте{} увеличивается",
                        "{C:attention}вдвое{} быстрее"
                    },
                    {
                        "Когда улучшаете {C:inactive}ванильную{} руку, создает",
                        "случайный {C:dark_edition}Негативный{} {C:inactive}ванильный{} расходник",
                        "Когда улучшаете {C:dark_edition}модовую{} руку, создает",
                        "случайный {C:dark_edition}Негативный{} {C:dark_edition}модовый{} расходник",
                    },
                    {
                        "Когда {C:inactive}ванильная{} рука с уровнем {C:attention}2{} или более сыграна,",
                        "{C:mult}уменьшает{} ее уровень и получает {C:attention}утроенные{} потерянные {C:chips}фишки{},",
                        "Когда {C:dark_edition}модовая{} рука с уровнем {C:attention}2{} или более сыграна,",
                        "{C:mult}уменьшает{} ее уровень и получает {C:attention}утроенный{} потерянный {C:mult}множ.{},",
                        "{C:inactive}(сейчас{} {C:chips}+#1#{} {C:inactive}фишек,{} {C:mult}+#2#{} {C:inactive}множ.){}",
                    },
                }
            },
            j_abn_fortlatro = {
                name = "Fortlatro",
                text = {
                    {
                        "{C:inactive}Ванильные{} расходники и",
                        "Джокеры больше {C:attention}не{} появляются",
                    },
                    {
                        "Когда {C:chips}Малый Блайнд{} выбран,",
                        "создает случайный {C:dark_edition}модовый{} расходник",
                        "Когда {C:attention}Большой Блайнд{} выбран,",
                        "создает случайного {C:dark_edition}модового{} Джокера"
                    },
                    {
                        "Получает {X:chips,C:white}X#2#{} фишек, за каждый {C:attention}уникальный",
                        "{C:dark_edition}модовый{C:attention} расходник{}, использованный за партию",
                        "Получает {X:mult,C:white}X#4#{} множ., за каждого {C:attention}уникального",
                        "{C:dark_edition}модового{C:attention} Джокера{}, полученного за партию",
                        "{C:inactive}(сейчас{} {X:chips,C:white}X#1#{} {C:inactive}фишек, {X:mult,C:white}X#3#{} {C:inactive}множ.)",
                    }
                }
            },
            j_abn_fortune_joker = {
                name = "Джокер фортуны",
                text = {
                    {
                        "Повышает {C:planet}планетный{} уровень {C:attention}рангов{}",
                        "всех подсчитываемых {C:attention}Счастливых{} карт",
                    },
                    {
                        "Перезапускает подсчитываемые {C:attention}Счастливые{} карты,",
                        "когда они {C:green}успешно{} активируются",
                    }
                }
            },
            j_abn_fractured_identity_joker = {
                name = "Раздробленная личность",
                text = {
                    "{C:attention}Золотые{} карты или карты {C:Steel}С множителем{}",
                    "дают {X:chips,C:white}^#1#{} фишек при подсчете,",
                    "{C:attention}Стеклянные{} или {C:attention}Каменные{} карты",
                    "дают {X:mult,C:white}^#2#{} множ. при подсчете",
                }
            },
            j_abn_fraser_jester = {
                name = "Шут Фрейзер",
                text = {
                    "{C:attention}+#1#{} к размеру руки",
                },
            },
            j_abn_fraud_soul = {
                name = "Душа-обманка",
                text = {
                    "Когда {C:attention}Блайнд{} выбран,",
                    "Карты {C:tarot}Таро{} в руке дают {C:attention}самому правому{} Джокеру {C:chips}+#1#{} фишек",
                    "Карты {C:planet}Планет{} в руке дают {C:attention}самому правому{} Джокеру {C:mult}+#2#{} множ.",
                    "{C:spectral}Спектральные{} карты в руке дают {C:attention}самому правому{} Джокеру {X:mult,C:white}+X#3#{} множ.",
                    "Карты {C:sigils}Символов{} в руке дают {C:attention}самому правому{} Джокеру {X:chips,C:white}+X#4#{} фишек",
                    "{C:astro_cards}Астро{} карты в руке дают {C:attention}самому правому{} Джокеру {C:money}$#5#{}",
                    "Карты {C:abn_calamity}Бедствий{} в руке удваивают все значения этого Джокера",
                    "{C:nightshift_cards}Полночные{} карты в руке дают {C:attention}случайной{} карте в руке {C:attention}+#6#{} перезапусков",
                }
            },
            j_abn_fraudulent_mod_joker = {
                name = "Мошеннический мод",
                text = {
                    {
                        "Этот Джокер получает {C:mult}+#1#{} множ. за",
                        "каждую подсчитанную {C:attention}Сшитую{}",
                        "{C:abn_tie}Галстук{} или {C:abn_bow}Бабочку{}",
                    },
                    {
                        "Этот Джокер получает {C:chips}+#2#{} фишек за",
                        "каждую подсчитанную {C:attention}Хлопковую{}",
                        "{C:abn_tie}Галстук{} или {C:abn_bow}Бабочку{}",
                        "{C:inactive}(сейчас{} {C:mult}+#3#{} {C:inactive}множ.,{} {C:chips}+#4#{} {C:inactive}фишек){}"
                    }
                }
            },
            j_abn_freddy_jester = {
                name = "Шут Фредди",
                text = {
                    {
                        "{C:abn_penumbra}Полутени{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#2#{}",
                        "когда {C:abn_penumbra}Полутень{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "сыгранные {C:abn_penumbra}Полутени{} навсегда",
                        "получают {C:chips}+#3#{} фишек при подсчете"
                    }
                }
            },
            j_abn_frenemy_joker = { -- to relocalise
                name = "Недруг",
                text = {
                    {
                        "{C:attention}Четные{} карты при подсчете дают",
                        "{X:mult,C:white}X#1#{} множ. за каждого {C:common}Обычного{} Джокера",
                        "{X:mult,C:white}X#2#{} множ. за каждого {C:uncommon}Необычного{} Джокера",
                        "{X:mult,C:white}X#3#{} множ. за каждого {C:rare}Редкого{} Джокера",
                        "{X:mult,C:white}X#4#{} множ. за каждого {C:abn_superrare}Супер редкого{} Джокера",
                        "{X:mult,C:white}X#5#{} множ. за каждого {C:legendary}Легендарного{} Джокера",
                        "{X:mult,C:white}X#6#{} множ. за каждого {C:abn_parallelrare}Параллель-редкого{} Джокера",
                    },
                    {
                        "{C:attention}Нечетные{} карты при подсчете дают",
                        "{X:chips,C:white}X#7#{} фишек за каждого {C:common}Обычного{} Джокера",
                        "{X:chips,C:white}X#8#{} фишек за каждого {C:uncommon}Необычного{} Джокера",
                        "{X:chips,C:white}X#9#{} фишек за каждого {C:rare}Редкого{} Джокера",
                        "{X:chips,C:white}X#10#{} фишек за каждого {C:abn_superrare}Супер редкого{} Джокера",
                        "{X:chips,C:white}X#11#{} фишек за каждого {C:legendary}Легендарного{} Джокера",
                        "{X:chips,C:white}X#12#{} фишек за каждого {C:abn_parallelrare}Параллель-редкого{} Джокера",
                    },
                    {
                        "Если у вас есть {C:attention}6{} Джокеров разных {C:attention}редкостей{},",
                        "уменьшает {C:attention}размер Блайндов{} на {C:attention}98%{}",
                    }
                }
            },
            j_abn_friend_jimbo = {
                name = "Друг Джимбо",
                text = {
                    {
                        "Когда {C:spades}Темная масть{} {C:mult}уничтожается{},",
                        "создает {C:attention}Каменную{} карту",
                    },
                    {
                        "Если уничтоженная карта - {C:abn_black_seal}Темнейшая{},",
                        "получает {C:chips}фишки{}, равные ее {C:attention}достоинству",
                        "{C:inactive}(сейчас{} {C:chips}+#1#{} {C:inactive}фишек){}",
                    }
                }
            },
            j_abn_frigid_joker = {
                name = "Замороженный джокер",
                text = {
                    "Игральные карты с мастью",
                    "{C:abn_snow}#2#{} дают {C:mult}+#1#{} множ.",
                    "при подсчете",
                }
            },
            j_abn_from_pixel_to_dust = {
                name = "От пикселя до пыли",
                text = {
                    "Сыгранные, но {C:attention}не подсчитанные{}",
                    "карты дают свое {C:attention}удвоенное{}",
                    "{C:attention}достоинство{}, как {C:mult}множ.{}, затем",
                    "{C:mult}самоуничтожается{}",
                }
            },
            j_abn_front_to_cover = {
                name = "Со всех сторон",
                text = {
                    {
                        "Сыгранные, но не подсчитанные {C:attention}перевернутые{}",
                        "карты возвращаются в колоду",
                    },
                    {
                        "Когда {C:attention}перевернутая{} карта подсчитывается,",
                        "получает {C:blue}фишки{}, равные ее достоинству"
                    }
                }
            },
            j_abn_frontier_joker = {
                name = "Джокер на рубеже веков",
                text = {
                    {
                        "Получите {C:money}$#1#{} за каждый имеющийся",
                        "{C:attention}расходник{} в конце раунда",
                    },
                    {
                        "Добавить {C:money}$#2#{} к {C:attention}цене продажи",
                        "каждого {C:attention}Джокера{}, когда",
                        "карта {C:continent}Континента{} использована"
                    }
                }
            },
            j_abn_full_jester = {
                name = "Полный дурак",
                text = {
                    {
                        "Если сыгранная рука составлена из",
                        "{C:attention}6{} или более мастей, этот Джокер получает",
                        "{C:white,X:mult}X#2#{} множ. за каждую подсчитанную масть"
                    },
                    {
                        "Если сыгранная рука составлена из {C:attention}5{} мастей",
                        "и карты {C:attention}без масти{}, этот Джокер получает",
                        "{C:white,X:chips}X#4#{} фишек за каждую подсчитанную масть",
                        "{C:inactive}(сейчас {C:white,X:chips}X#3#{C:inactive} фишек, {C:white,X:mult}X#1#{C:inactive} множ.)"
                    }
                }
            },
            j_abn_funambulist = {
                name = "Канатоходец",
                text = {
                    "{C:mult}+#1#{} множ. за каждого {C:attention}Джокера{} {C:attention}слева{}",
                    "{C:chips}+#2#{} фишек за каждого {C:attention}Джокера{} {C:attention}справа{}",
                    "{C:inactive}(сейчас {C:mult}+#3#{C:inactive}, {C:chips}+#4#{C:inactive})"
                }
            },
            --#endregion





            --#region G
            j_abn_gabagool_sandwhich = {
                name = "Сэндвич с ветчиной",
                text = {
                    "Когда Джокер срабатывет,",
                    "дает ему {C:chips}+#3#{} фишек,",
                    "Шанс {C:green}#1# к #2#{} быть",
                    "{C:attention}съеденным{} в конце раунда",
                }
            },
            j_abn_gambit = {
                name = "Гамбит",
                text = {
                    {
                        "Меняет текущие {C:chips}фишки{} с",
                        "текущими {C:attention}очками{} местами и",
                        "умножает оба числа на {X:black,C:white}X#1#"
                    },
                    {
                        "Каждая карта имеет",
                        "шанс {C:green}#2# к #3#{} уничтожится",
                        "при подсчете"
                    },
                    {
                        "Каждая уничтоженная карта",
                        "увеличивает множитель этого Джокера",
                        "на {X:black,C:white}#4#X{} и вы вытягиваете",
                        "копию уничтоженной карты в руку"
                    }
                }
            },
            j_abn_garth = {
                name = "Гарт",
                text = {
                    {
                        "{C:abn_arrow}Стрелы{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#2#{},",
                        "когда {C:abn_arrow}Стрела{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "сыгранные {C:abn_arrow}Стрелы{} навсегда",
                        "получают {C:purple}+#3#{} к Счету при подсчете"
                    }
                }
            },
            j_abn_gachapon = {
                name = "Гасяпон",
                text = {
                    "Потеряйте {C:money}-$#1#{}, когда {C:attention}Блайнд{} выбран",
                    "Шанс {C:green}#2# к #3#{} создать случайного {C:green}Необычного{} Джокера,",
                    "шанс {C:green}#4# к #5#{} создать случайного {C:red}Редкого{} Джокера,",
                    "{C:red}Самоуничтожается при $0{}",
                    "{C:inactive}(должно быть место)",
                }
            },
            j_abn_gag_flower = {
                name = "Цветок-брызгалка",
                text = {
                    "Этот Джокер получает {C:mult}+#5#{} множ. и {C:chips}+#4#{} фишек",
                    "за каждую подсчитанную карту, если",
                    "сыгранная рука содержит {C:attention}#1#",
                    "{C:inactive}(сейчас {C:mult}+#3#{C:inactive} множ., {C:chips}+#2#{C:inactive} фишек)",
                }
            },
            j_abn_gagman_joker = {
                name = "Приколист",
                text = {
                    "Карты {C:attention}В горошек{} сохраняют свои",
                    "{C:attention}достоинство{} и {C:attention}масть{}",
                }
            },
            j_abn_galactic_consciousness = { -- to relocalise
                name = "Галактический разум",
                text = {
                    {
                        "Джокеры и карты с {C:dark_edition}выпуском{} дают",
                        "разные {C:attention}эффекты{} когда срабатывают:"
                    },
                    {
                        "{C:dark_edition}Блестящие{} {C:attention}Джокеры/Карты{} дают {C:mult}+#1#{} множ. при подсчете",
                        "{C:dark_edition}Перламутровые{} {C:attention}Джокеры/Карты{} дают {X:chips,C:white}X#2#{} фишек при подсчете",
                        "{C:dark_edition}Переливающиеся{} {C:attention}Джокеры/Карты{} дают {X:mult,C:white}X#3#{} множ. при подсчете",
                        "{C:dark_edition}Хроматические{} {C:attention}Джокеры/Карты{} дают {X:chips,C:white}^#4#{} фишек при подсчете",
                    },
                }
            },
            j_abn_galactic_night = {
                name = "Ночь галактик",
                text = {
                    "Дает {X:mult,C:white}Xмнож.{}, равный",
                    "уровню сыгранной {C:attention}руки{}"
                }
            },
            j_abn_gallows_joker = {
                name = "Виселичный джокер",
                text = {
                    "Шанс {C:green}#1# к #2#{} создать",
                    "{C:tarot}Висельника{}, когда карты",
                    "{C:attention}с лицом{} уничтожаются",
                }
            },
            j_abn_garden_gnome = {
                name = "Садовый гном",
                text = {
                    "{C:spades}Пики{} и {C:clubs}Трефы",
                    "имеют шанс {C:green}#1# к #2#",
                    "стать {C:dark_edition}Негативными{}",
                    "при подсчете"
                }
            },
            j_abn_geiger_joker = {
                name = "Счетчик Гейгера",
                text = {
                    "{C:attention}Номерные{} {C:attention}Опасные{} карты",
                    "дают {C:gold}+#1#{} Вознесилы при подсчете за каждый раз,",
                    "когда ее {C:attention}достоинство{} было подсчитано в этой руке",
                }
            },
            j_abn_genetically_modified_food = {
                name = "ГМО джокер",
                text={
                    "Когда Джокер {C:attention}куплен{} или {C:attention}продан{},",
                    "этот Джокер получает {C:chips}фишки{}, равные",
                    "{C:money}цене{} {C:dark_edition}модовых{} {C:attention}Съедобных Джокеров{} и {C:mult}множ.{},",
                    "равный {C:money}цене{} {C:inactive}ванильных{} {C:attention}Джокеров",
                    "{C:inactive}(сейчас {C:chips}+#1# {C:inactive}фишек, {C:mult}+#2# {C:inactive}множ.)",
                },
            },
            j_abn_genocide_route = {
                name = "Путь геноцида",
                text = {
                    {
                        "{C:mult}Уничтожает{} имеющихся Джокеров при покупке",
                        "Получает {X:mult,C:white}X#3#{} множ. и {X:chips,C:white}X#4#{} фишек",
                        "за каждого {C:mult}уничтоженного{} Джокера",
                        "{C:inactive}(сейчас {X:mult,C:white}X#1#{} {C:inactive}множ.,{} {X:chips,C:white}X#2#{} {C:inactive}фишек){}",
                    },
                    {
                        "Делает это {C:attention}еще раз{}, когда",
                        "{C:abn_superrare}Супер редкий{} {C:attention}Джокер{} получен",
                    },
                    {
                        "Когда {C:attention}Блайнд{} выбран, создает случайного",
                        "{V:1}#5#{} Джокера с {C:dark_edition}#6#{} выпуском",
                    }
                }
            },
            j_abn_gerrymandering = {
                name = "Джерримендеринг",
                text = {
                    "Перезапускает все сыгранные",
                    "карты с мастью {V:1}#1#{}",
                    "{s:0.8}масть меняетсяя в конце раунда",
                }
            },
            j_abn_getter_robo = {
                name = "Геттер Робо!",
                text = {
                    "{X:mult,C:white}X#1#{} множ., {X:chips,C:white}X#2#{} фишек и {X:attention,C:white}X#3#{} {C:attention}требование Блайнда{}",
                    "{C:attention}Удваивает{} звои значения после",
                    "победы над {C:attention}Босс-блайндом{}",
                },
            },
            j_abn_ghost_in_the_machine = {
                name = "Призрак в машине",
                text = {
                    "Создает случайную {C:dark_edition}Негативную{}",
                    "{C:spectral}Спектральную{} карту каждый раз,",
                    "когда {C:solid_state}Твердотельная{} карта использована",
                }
            },
            j_abn_giacomo_king = {
                name = "Король шутов Джакомо",
                text = {
                    "Сыгранные {C:attention}11{}, {C:attention}12{}, {C:attention}13{}",
                    "и {C:attention}14{} {C:diamonds}Бубен{} и {C:clubs}Треф{} ",
                    "дают {C:white,X:mult}^#1#{} множ. при подсчете",
                    "{s:0.8}Этот джокер переворачивается, когда срабатывает{}"
                }
            },
            j_abn_giacomo_hidden = {
                name = "Скрытый негодяй Джакомо",
                text = {
                    "Сыгранные {C:attention}11{}, {C:attention}12{}, {C:attention}13{}",
                    "и {C:attention}14{} {C:hearts}Черв{} и {C:spades}Пик{} ",
                    "дают {C:white,X:mult}^#1#{} множ. при подсчете",
                    "{s:0.8}Этот джокер переворачивается, когда срабатывает{}"
                }
            },
            j_abn_gimbo = {
                name = "Гимбо",
                text = {
                    "Этот Джокер получает {C:mult}+#2#{} Mult",
                    "когда a {C:attention}2{}, {C:attention}3{},",
                    "{C:attention}5{} or {C:attention}7{} is scored",
                    "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}Mult)"
                }
            },
            j_abn_glasgow_smile = {
                name = "Глазгоуская улыбка",
                text = {
                    "Сыгранные карты {C:spades}темной масти{}",
                    "в {C:attention}первой{} и {C:attention}последней{} руке раунда",
                    "становятся {C:dark_edition}Хтоническими{} и {C:attention}перевернутыми{}",
                }
            },
            j_abn_glass_bonus = {
                name = "Стеклянный бонус",
                text = {
                    {
                        "Если сыгранная рука содержит и {C:attention}Стеклянную{}",
                        "и {C:attention}Бонусную{} карту, обе получают",
                        "{C:gold}+#1#{} Asc. Power and {C:purple}+#2#{} Score",
                    },
                    {
                        "{C:enhanced}Стеклянную{} {C:attention}Джокеры{} получают {X:mult,C:white}X#3#{} множ., {C:enhanced}Бонусные{}",
                        "{C:attention}Джокеры{} получают {X:chips,C:white}X#4#{} фишек, когда срабатывают"
                    },
                    {
                        "Когда {C:attention}Большой блайнд{} выбран,",
                        "создает последнюю использованную в",
                        "этой партии {C:crepuscular}Сумеречную{} карту",
                        "{C:inactive}(сейчас{} {C:crepuscular}#5#{}{C:inactive})"
                    }
                }
            },
            j_abn_glass_gold = {
                name = "Стеклянное золото",
                text = {
                    {
                        "Если сыгранная рука содержит и {C:attention}Стеклянную{}",
                        "и {C:attention}Золотую{} карту, обе получают",
                        "{C:gold}+#1#{} Вознесилы и {C:purple}+#2#{} к Счету",
                    },
                    {
                        "{C:enhanced}Стеклянные{} {C:attention}Джокеры{} получают {X:mult,C:white}X#3#{} множ., {C:enhanced}Золотые{}",
                        "{C:attention}Джокеры{} получают {X:chips,C:white}X#4#{} фишек, когда срабатывают"
                    },
                    {
                        "Когда {C:attention}Большой блайнд{} выбран,",
                        "создает последнюю использованный в",
                        "этой партии {C:weather_report}Прогноз погоды{}",
                        "{C:inactive}сейчас:{} {C:weather_report}#5#{}"
                    }
                }
            },
            j_abn_glass_stone = {
                name = "Стеклянный камень",
                text = {
                    {
                        "Если сыгранная рука содержит и {C:attention}Каменную{}",
                        "и {C:attention}Стеклянную{} карту, обе получают",
                        "{C:gold}+#1#{} Вознесилы и {C:purple}+#2#{} к Счету",
                    },
                    {
                        "{C:enhanced}Каменные{} {C:attention}Джокеры{} получают {X:mult,C:white}X#3#{} множ., {C:enhanced}Стеклянные{}",
                        "{C:attention}Джокеры{} получают {X:chips,C:white}X#4#{} фишек, когда срабатывают"
                    },
                    {
                        "Когда {C:attention}Большой блайнд{} выбран,",
                        "создает последнюю использованную в",
                        "этой партии {C:calligraphy}Калиграфическую{} карту",
                        "{C:inactive}сейчас:{} {C:calligraphy}#5#{}"
                    }
                }
            },
            j_abn_globalist_joker = {
                name = "Глобалист",
                text = {
                    {
                        "Когда карта {C:continent}Континента{} использована,",
                        "создает {C:attention}случайный{} {C:dark_edition}Негативный{} расходник"
                    },
                    {
                        "После использования {C:attention}#4#{} {C:inactive}[#1#]{} карт {C:continent}Континентов{}, добавляет",
                        "{C:attention}Штамп{} каждой карте в подсчете в следующем сыгранном {C:attention}Спектруме{}",
                    },
                    {
                        "Этот Джокер получает {X:mult,C:white}X#2#{} множ. за каждую использованную",
                        "в этой партии {C:attention}уникальную{} карту {C:continent}Континента{}",
                        "{C:inactive}(сейчас: {X:mult,C:white}X#3#{} {C:inactive}множ.)",
                    }
                }
            },
            j_abn_glossy_joker = {
                name = "Блестящий джокер",
                text = {
                    {
                        "{X:mult,C:white}X#1#{} множ, когда",
                        "{C:dark_edition}Блестящий{} выпуск подсчитывается",
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Блестящий{},",
                        "получает {C:mult}+#3#{} множ., когда",
                        "{C:dark_edition}Блетящий{} выпуск подсчитывается",
                        "{C:inactive}(сейчас {C:mult}+#2#{} {C:inactive}множ.){}",
                    }
                }
            },
            j_abn_gluttony = {
                name = "Чревоугодие",
                text = {
                    {
                        "Все возможные {C:attention}Джокеры{} становятся",
                        "{C:abn_eternal}Вечными{} при покупке"
                    },
                    {

                        "{X:mult,C:white}X#1#{} множ. на {C:attention}первой руке{} раунда,",
                        "затем уничтожает все имеющиеся {C:attention}расходники{},",
                        "увеличивается на {X:mult,C:white}X#2#{} множ. за каждуый",
                        "уникальный уничтоженный {C:attention}расходник{}",
                    }
                }
            },
            j_abn_gold_7 = {
                name = "Золотая 7",
                text = {
                    {
                        "Разыгранные {C:attention}7{} становятся",
                        "{C:attention}Золотыми{} при подсчете",
                    },
                    {
                        "Разыгранные {C:attention}Золотые{} карты",
                        "дают свое {C:attention}удвоенное{} достоинство",
                        "как {C:mult}множ.{} при подсчете",
                    }
                }
            },
            j_abn_gold_lucky = {
                name = "Счастливое золото",
                text = {
                    {
                        "Если сыгранная рука содержит и {C:attention}Золотую{}",
                        "и {C:attention}Счастливую{} карту, обе получают",
                        "{C:gold}+#1#{} Вознесилы и {C:purple}+#2#{} к Счету",
                    },
                    {
                        "{C:enhanced}Золтые{} {C:attention}Джокеры{} получают {X:mult,C:white}X#3#{} множ., {C:enhanced}Счастливые{}",
                        "{C:attention}Джокеры{} получают {X:chips,C:white}X#4#{} фишек, когда срабатывают"
                    },
                    {
                        "Когда {C:attention}Большой блайнд{} выбран,",
                        "создает последнюю использованную в",
                        "этой партии карту {C:continent}Континента{}",
                        "{C:inactive}сейчас:{} {C:continent}#5#{}"
                    }
                }
            },
            j_abn_goldcartridge_joker = {
                name = "Золотой картридж",
                text = {
                    "Джокеры, чья {C:attention}цена продажи{} ниже,",
                    "чем у этого Джокера, дают {X:mult,C:white}X#1#{} множ.,",
                    "Получает {C:money}$#2#{} к {C:attention}цене продажи{}",
                    "а конце каждого раунда",
                }
            },
            j_abn_golden_apple = {
                name = "Золотое яблоко",
                text = {
                    {
                        "Когда {C:attention}Блайнд{} выбран,",
                        "убирает все {C:abn_perishable}Портящиеся{} наклейки",
                    },
                    {
                        "{C:abn_eternal}Вечные{} Джокеры могут быть проданы"
                    }
                }
            },
            j_abn_gone_on_vacation = {
                name = "В отпуске",
                text = {
                    "Сыгранные карты навсегда получают",
                    "{C:chips}+#1#{} фишек и {C:mult}+#2#{} множ. за",
                    "каждый {C:attention}пустой{} слот Джокера",
                    "при подсчете",
                }
            },
            j_abn_goody_two_shoes = {
                name = "Гуди в сапожках",
                text = {
                    {
                        "Когда {C:attention}Блайнд{} выбран,",
                        "{C:attention}потеряйте все сбросы{} и",
                        "получите столько же {C:blue}рук{}",
                    },
                    {
                        "{C:red}Ослабленные{} карты",
                        "дают {C:money}$#1#{}, когда",
                        "разыграны"
                    }
                }
            },
            j_abn_goth_gabe = {
                name = "Гот Гейб",
                text = {
                    "Этот Джокер получает {X:red,C:white}X#2#{} множ.,",
                    "если сыгранная рука содержит",
                    "только {C:spades}темные масти{}",
                    "{C:inactive}(сейчас {X:mult,C:white}X#1#{} {C:inactive}множ.){}",
                }
            },
            j_abn_grampa_joker = {
                name = "Дед джокер",
                text = {
                    "Добавляет {C:dark_edition}Винтажный{} выпуск",
                    "к первой карте в подсчете",
                    "на {C:attention}последней руке{} раунда",
                }
            },
            j_abn_grapheme_joker = {
                name = "Графемный джокер",
                text = {
                    {
                        "Добавляет {C:dark_edition}Негативный{} выпуск к",
                        "{C:attention}первой{} подсчитанной {C:diamonds}Светлой масти{}",
                    },
                    {
                        "Этот Джокер получает {C:chips}+#6#{} фишек",
                        "и {C:mult}+#5#{} множ. за каждую {C:dark_edition}Негативную{}",
                        "подсчитанную {C:diamonds}Светлую масть{}",
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Негативный{},",
                        "получает {X:mult,C:white}X#4#{} множ. за каждую сыгранную {C:dark_edition}Негативную{} карту",
                        "{C:inactive}(сейчас {X:mult,C:white}X#1#{} {C:inactive}множ.,{} {C:mult}+#2#{} {C:inactive}множ.,{} {C:chips}+#3#{} {C:inactive}фишек){}",
                    }
                }
            },
            j_abn_green_horn = {
                name = "Зеленый рог",
                text = {
                    "{C:white,X:mult}X#1#{} множ.,",
                    "Ты не можешь играть руку с",
                    "{C:attention}самым большим уровнем{}",
                    "{C:inactive}(сейчас - {C:attention}#2#{C:inactive})"
                }
            },
            j_abn_greygoo_joker = {
                name = "Серая жижа",
                text = {
                    "Если {C:attention}первая рука{} раунда",
                    "содержит только карты {C:abn_suitless}Нулей{},",
                    "навсегда добавить их копии в колоду",
                    "и сразу {C:attention}вытянуть{} в руку",
                }
            },
            j_abn_gris_gris_joker = {
                name = 'Гри-гри',
                text = {
                    "{C:blue}Синяя{} и {C:purple}Фиолетовая{} {C:attention}печати{}",
                    "{C:attention}срабатывают{}, когда сыграны"
                }
            },
            j_abn_gtp_joker = {
                name = "GTP Джокер",
                text = {
                    "{X:mult,C:white}X#1#{} базовый множ. и {X:chips,C:white}X#2#{} базовые фишки",
                    "за каждую одинаковую последовательно",
                    "сыгранную руку в течение раунда,",
                    "кроме {C:attention}Старшей карты",
                }
            },
            j_abn_gtp_joker_after = {
                name = "GTP Joker",
                text = {
                    "{X:mult,C:white}X#1#{} базовый множ. и {X:chips,C:white}X#2#{} базовые фишки",
                    "за каждую одинаковую последовательно",
                    "сыгранную руку в течение раунда,",
                    "кроме {C:attention}Старшей карты",
                    "{C:inactive}(Предыдущая рука: {C:attention}#3#{C:inactive})"
                }
            },
            --#endregion





            --#region H
            j_abn_hammerspace_joker = {
                name = "Карманный джокер",
                text = {
                    "{C:attention}+2{} слота расходников",
                    "Когда {C:attention}Босс-блайнд{} побежден,",
                    "Получает {X:mult,C:white}X#5#{} множ., если есть карта {C:sigils}Символа{}",
                    "Получает {C:mult}+#6#{} множ., если есть {C:astro_cards}Астро{} карта",
                    "Получает {C:chips}+#8#{} фишек, если есть карта {C:tarot}Таро{}",
                    "Получает {X:chips,C:white}X#7#{} фишек, если есть {C:spectral}Спектральная{} карта",
                    "{C:inactive}(сейчас {X:mult,C:white}X#1#{} {C:inactive}множ.,{} {C:mult}+#2#{} {C:inactive}множ.,{} {X:chips,C:white}X#3#{} {C:inactive}фишек,{} {C:chips}+#4#{} {C:inactive}фишек){}"
                }
            },
            j_abn_hand_puppet = {
                name = "Ручная кукла",
                text = {
                    "Этот Джокер получает {C:attention}удвоенное{}",
                    "достоинство карт с {C:dark_edition}выпуском{}",
                    "в руке как {C:mult}Множ.{}",
                    "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.)"
                }
            },
            j_abn_handbook_of_a_conman = {
                name = "Пособие по мошенничеству",
                text = {
                    {
                        "Удваивает {C:chips}фишки{} и {C:mult}множ.{}",
                        "всех покерных рук"
                    },
                    {
                        "{C:mult}Ослабляет{} всех не",
                        "{C:abn_plagued}Чумных{} Джокеров"
                    }
                }
            },
            j_abn_haphazard_joker = {
                name = "Непредсказуемый джокер",
                text = {
                    {
                        "Сыгранные {C:attention}улучшенные{} {C:attention}четные{}",
                        "карты дают {X:mult,C:white}X#4#{} множ. при подсчете,",
                        "увеличивает бонус на {X:mult,C:white}X#3#{},",
                        "когда карта подсчитывается"
                    },
                    {
                        "Сыгранные {C:attention}четные{} карты",
                        "имеют шанс {C:green}#1# к #2#{} создать",
                        "{C:abn_hazard}тег бедствия{} при подсчете",
                    }
                }
            },
            j_abn_hard_and_dry = {
                name = "Бескомпромиссный джокер",
                text = {
                    "Блайнды {C:attention}скрыты{},",
                    "{C:attention}Удваивает{} значения {C:attention}самого левого{} Джокера,",
                    "когда {C:attention}Блайнд{} побежден",
                }
            },
            j_abn_harlequin_joker = {
                name = "Арлекин",
                text = {
                    {
                        "Если {C:attention}первая{} карта в подсчете - {C:attention}четная{},",
                        "а {C:attention}последняя{} - {C:attention}нечетная:"
                    },
                    {
                        "Создает {C:dark_edition}Негативную{} карту {C:sigils}Символа{},",
                        "если у них совпадает {C:enhanced}Улучшение",
                    },
                    {
                        "Создает {C:dark_edition}Негативную{} {C:solid_state}Твердотельную{} карту",
                        "если у них совпадает {C:dark_edition}Выпуск",
                    },
                    {
                        "Создает {C:dark_edition}Негативную{} карту {C:lexica}Лексики{}",
                        "если у них совпадает {C:attention}печать",
                    }
                }
            },
            j_abn_haunted_recording = {
                name = "Последняя запись",
                text = {
                    "Этот Джокер получает {X:mult,C:white}X#2#{} множ.",
                    "за каждую {C:attention}последовательно{} ",
                    "сыгранную руку без {C:attention}#3#",
                    "{C:inactive}(сейчас {X:mult,C:white}X#1#{C:inactive} множ.)",
                }
            },
            j_abn_hawk = {
                name = "Хок",
                text = {
                    {
                        "{C:mult}Уничтожает{} первую карту в подсчете,",
                        "Если она {C:attention}четная{}, все карты в подсчете получают {C:mult}+#5#{}",
                        "множ. и этот Джокер получает {X:mult,C:white}X#3#{} множ.,",
                        "Если она {C:attention}нечетная{}, все карты получают {C:chips}+#6#{} фишек",
                        "и этот Джокер получает {X:chips,C:white}X#4#{} фишек",
                        "{C:inactive}(сейчас{} {X:mult,C:white}X#1#{} {C:inactive}множ.{} {X:chips,C:white}X#2#{} {C:inactive}фишек){}",
                    },
                    {
                        "Если {C:attention}победная рука{} содержит",
                        "и {C:attention}нечетные{} и {C:attention}четные{} карты, повышает",
                        "{C:planet}планетный{} уровень {C:attention}рангов{} всех карт в подсчете",
                    },
                }
            },
            j_abn_hazard_cryptid = {
                name = "Опасный криптид",
                text = {
                    "Этот Джокер получает {C:mult}+#4#{} множ., если",
                    "сыгранная рука содержит {C:abn_hazard}Опасную{} карту",
                    "и {C:dark_edition}неулучшенную{} карту,",
                    "Шанс {C:green}#1# к #2#{} {C:mult}уничтожить{}",
                    "все карты в подсчете и этого Джокера",
                    "{C:inactive}(сейчас{} {C:mult}+#3#{} {C:inactive}множ.)"
                }
            },
            j_abn_hd_joker = {
                name = "HD Джокер",
                text = {
                    {
                        "{C:common}Обычные{} Джокеры без {C:dark_edition}выпуска{}",
                        "не могут быть {C:red}ослаблены{} или {C:red}уничтожены{}",
                    },
                    {
                        "{C:uncommon}Необычные{} и {C:rare}Редкие{} Джокеры",
                        "больше не появляются в {C:green}лавке{}"
                    }
                }
            },
            j_abn_health_stickers = {
                name = "Наклейки здоровья",
                text = {
                    "Когда {C:attention}Блайнд{} побежден,",
                    "добавляет случайную {C:green}позитивную{} {C:attention}наклейку{}",
                    "к {C:attention}самому левому{} Джокеру",
                }
            },
            j_abn_heart_of_glass = {
                name = "Стеклянное сердце",
                text = {
                    {
                        "{C:attention}Стеклянные карты{} дают {C:white,X:chips}X#1#{} фишек",
                        "при подсчете, и всегда {C:attention}разбиваются",
                    },
                    {
                        "Этот Джокер получает {C:chips}+#2#{} фишек за",
                        "каждую уничтоженную {C:attention}Стеклянную карту{} {C:hearts}Червей{}",
                        "{C:inactive}(сейчас {C:chips}+#3#{C:inactive} фишек)"
                    }
                }
            },
            j_abn_hieroglyph = {
                name = "Иероглиф",
                text = {
                    "Карты, {C:attention}не участвующие{}",
                    "в подсчете, становятся",
                    "{C:attention}Ископаемыми картами{}, когда сыграны"
                }
            },
            j_abn_hipster = {
                name = "Хипстер",
                text = {
                    "Карты с {C:dark_edition}модовыми",
                    "{C:attention}достоинствами{} навсегда получают",
                    "{C:mult}+#1#{} множ. при подсчете",
                }
            },
            j_abn_holy_mountain = {
                name = "Святая гора",
                text = {
                    {
                        "Первая {C:abn_snow}Снежинка{} в {C:attention}#5#{}",
                        "становится {C:dark_edition}Солнечной{} при подсчете"
                    },
                    {
                        "Получает {C:mult}+#4#{} множ. и {C:chips}+#2#{} фишек",
                        "за каждую {C:dark_edition}Солнечную{} подсчитанную карту",
                        "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ., {C:chips}+#3#{C:inactive} фишек)"
                    },
                    {
                        "Когда не {C:attention}Негативный{} {C:weather_report}Прогноз погоды{}",
                        "уничтожается, создает его {C:dark_edition}Негативную{} копию"
                    }
                }
            },
            j_abn_hot_mult_in_your_area = {
                name = "Множитель, 100 метров от вас",
                text = {
                    {
                        "{C:dark_edition}Модовые{} расходники в",
                        "руке дают {X:mult,C:white}X#1#{} множ.",
                    },
                    {
                        "Когда рука сыграна,",
                        "шанс {C:green}#2# к #3#{} {C:red}уничтожить{}",
                        "имеющиеся {C:dark_edition}модовые{} расходники",
                    }
                }
            },
            j_abn_housing_crisis = {
                name = "Жилищный кризис",
                text = {
                    {
                        "Если {C:attention}первая{} сыгранная рука - это {C:attention}#1#{},",
                        "составленный из {C:attention}2 четных{} и {C:attention}3 нечетных{} карт,",
                        "получите {C:gold}$#2#{} и этот Джокер получает {C:red}+#3#{} множ. и {C:blue}+#4#{} фишек",
                    },
                    {
                        "Если {C:attention}вторая{} сыгранная рука - это {C:attention}#1#{},",
                        "составленный из {C:attention}2 нечетных{} и {C:attention}3 четных{} карт,",
                        "получите {C:gold}$#5#{} и этот Джокер получает {C:red}+#6#{} множ. и {C:blue}+#7#{} фишек",
                    },
                    {
                        "Если {C:attention}третья{} сыгранная рука - это {C:attention}#1#{}",
                        "составленный из {C:attention}2{} {C:diamonds}Светлых{} и {C:attention}3{} {C:spades}Темных{} мастей,",
                        "{C:planet}повышает уровень{} этой {C:attention}покерной руки{}",
                    },
                    {
                        "{C:inactive}(сейчас {C:red}+#8#{C:inactive} множ., {C:blue}+#9#{C:inactive} фишек)",
                    }
                }
            },
            j_abn_hunter_license = {
                name = "Лицензия Охотника",
                text = {
                    "Получите {C:money}$#1#{} при покупке",
                    "{C:mult}Самоуничтожается{}, если у вас {C:money}$0{}",
                }
            },
            j_abn_hustler_joker = {
                name = "Аферист",
                text = {
                    "{C:money}+$#1#{}, {C:chips}+#3#{} фишек и",
                    "{C:mult}+#2#{} множ., если сыгранная рука",
                    "содержит и {C:abn_bow}Бабочки{} и {C:abn_tie}Галстуки{}",
                }
            },
            --#endregion





            --#region I
            j_abn_i_am_not_joker = {
                name = "Нет, я не Джокер",
                text = {
                    {
                        "Когда {C:attention}Босс-блайнд{} побежден,",
                        "{C:attention}самый левый{} Джокер",
                        "становится {C:attention}перевернутым{}",
                    },
                    {
                        "Получает {C:mult}+#2#{} множ. когда",
                        "{C:attention}перевернутый{} Джокер срабатывает",
                        "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.)",
                    },
                    {
                        "Если эта карта {C:attention}перевернута{},",
                        "преобразует первую карту в подсчете",
                        "в {C:attention}Опасную карту{}",
                    }
                }
            },
            j_abn_ichor = {
                name = "Ихорный джокер",
                text = {
                    "Каждый {C:dark_edition}#2#{} Джокер",
                    "дает {C:white,X:mult}X#1#{} множ."
                }
            },
            j_abn_id_staff = {
                name = "Бейдж сотрудника",
                text = {
                    "Когда карта {C:attention}с лицом{} {C:mult}уничтожена{},",
                    "Улучшает {C:attention}самую левую{} карту в руке",
                    "до {C:attention}Опасной{} карты"
                }
            },
            j_abn_identigram_joker = {
                name = "Идентиграмма",
                text = {
                    {
                        "Получает {X:red,C:white}X#1#{} множ. за каждую подсчитанную",
                        "{C:attention}нечетную{} карту с разными {C:dark_edition}выпусками{}",
                    },
                    {
                        "Получает {X:chips,C:white}X#2#{} фишек за каждую подсчитанную",
                        "{C:attention}четную{} карту с разными {C:dark_edition}выпусками{}",
                        "{C:inactive}(сейчас {X:red,C:white}X#3#{C:inactive} множ., {X:blue,C:white}X#4#{C:inactive} фишек)",
                    }
                }
            },
            j_abn_ill_gotten_gains = {
                name = "Незаконная прибыль",
                text = {
                    "{C:abn_tie}Галстуки{} дают {C:money}$#1#{} при подсчете",
                    "Дает {C:money}$#2#{} вместо этого, если",
                    "подсчитываемый {C:abn_tie}Галстук{} {C:attention}улучшен{}",
                }
            },
            j_abn_illegal_ante = {
                name = "Незаконный Анте",
                text = {
                    "В течение {C:attention}Четных{} Анте, {C:attention}удваивает{} все {C:green,E:1}вероятности",
                    "В течение {C:attention}Нечетных{} Анте, {C:attention}удваивает{} все получаемые {C:money}${}",
                }
            },
            j_abn_immolation_joker = {
                name = "Сожжение Джокера",
                text = {
                    "{C:attention}Подожженные{} карты не",
                    "{C:mult}уничтожаются{}, когда срабатывают",
                }
            },
            j_abn_improved_joker = {
                name = "Улучшенный джокер",
                text = {
                    {
                        "{X:mult,C:white}X#1#{} множ. {C:attention}перед{} подсчетом,",
                        "если {C:attention}подсчитываемая рука{} содержит",
                        "ровно {C:attention}5{} карт"
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "карты дают {C:gold}+#2#{} Вознесилы",
                        "при подсчете",
                    }
                }
            },
            j_abn_inescapable_encounter = {
                name = "Неизбежная встреча",
                text = {
                    "Карты получают {C:chips}фишки{}, равные",
                    "их {C:attention}достоинствоу{} при подсчете,",
                    "{C:mult}Пропуски{} отключены",
                }
            },
            j_abn_inferno_comedian = {
                name = "Инфернальный комик",
                text = {
                    {
                        "Карты дают {C:white,X:mult}X#1#{} множ.",
                        "при подсчете",
                    },
                    {
                        "Если очки {C:attention}загораются{},",
                        "Добавить {C:dark_edition}Солнечный{} выпуск случайному Джокеру,",
                        "и улучшить все карты в руке до:",
                        "{C:dark_edition}Солнечных{} {C:attention}Подожженных{} карт",
                    },
                    {
                        "{C:attention}Подожженные{} карты дают {C:white,X:mult}X#1#{} множ.",
                        "{C:attention}Подожженные{} карты при {C:mult}уничтожении дают",
                        "этому Джокеру свое {C:attention}достоинство{} как {C:mult}множ.",
                        "{C:inactive}(сейчас{} {C:mult}+#2#{} {C:inactive}множ.)",
                    }
                }
            },
            j_abn_ink_depleted_joker = {
                name = "Исчерпанные чернила",
                text = {
                    "Если {C:attention}первая рука{} раунда - это {C:attention}Фулл-хаус{},",
                    "добавляет {C:dark_edition}Фольговый{} выпуск и {C:abn_orange_seal}оранжевую печать{}",
                    "к подсчитываемым {C:diamonds}Светлым мастям{},",
                    "добавляет {C:dark_edition}Фольговый{} выпуск и {C:abn_pink_seal}розовую печать",
                    "к подсчитываемым {C:spades}Темным мастям{}",
                }
            },
            j_abn_inkblot_test = { -- potentially rework?
                name = "Тест Роршаха",
                text = {
                    {
                        "Карта с {C:attention}наименьшим{} достоинством",
                        "{C:attention}принудительно{} выбирается всегда",
                    },
                    {
                        "{C:attention}Принудительно{} выбранные карты",
                        "всегда подсчитываются"
                    }
                }
            },
            j_abn_insolvent_comedian = {
                name = "Несостоятельный комик",
                text = {
                    "Все Джокеры получают {C:chips}+#1#{} фишек",
                    "и {C:mult}+#2#{} множ., если сыгранная рука",
                    "совпадает с {C:attention}финальной рукой{}",
                    "в {C:attention}предыдущем{} раунде",
                    "{C:inactive}(сейчас {C:attention}#4#{C:inactive})",
                }
            },
            j_abn_insomniac_joker = {
                name = "Бессонный джокер",
                text = {
                    "Этот Джокер получает",
                    "{C:chips}+#2#{} фишек каждый раз, когда",
                    "карта {C:planet}Планеты{} использована",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек)",
                }
            },
            j_abn_intergalactic_joker = {
                name = "Межгалактический джокер",
                text = {
                    "Улучшает Вознесилу {C:attention}каждой{} покерной руки,",
                    "содержащейся в сыгранной руке на {C:gold}+#1#{},",
                    "если имеешь {C:attention}соответствующую",
                    "карту {C:planet}Планеты{} этой руки"
                }
            },
            j_abn_interminable_joker = {
                name = "Рекурсия",
                text = {
                    "Если у тебя {C:attention}6{} или более {C:attention}Джокеров{},",
                    "каждый дает {X:mult,C:white}X#1#{} множ.",
                }
            },
            j_abn_inventory_joker = {
                name = "Инвентарный джокер",
                text = {
                    "Когда {C:attention}Блайнд{} выбран,",
                    "получает {C:chips}+#2#{} фишек за",
                    "каждый имеющийся {C:attention}расходник{}",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек)",
                }
            },
            j_abn_invisible_ink_joker = {
                name = "Невидимые чернила",
                text = {
                    "Если сыгранная рука содержит {C:attention}Спектрум{}",
                    "только из {C:attention}Счастливых{} карт",
                    "Этот Джокер получает {C:mult}+#3#{} множ. за каждую уникальную {C:attention}масть",
                    "и {X:chips,C:white}X#4#{} фишек за каждую карту в подсчете",
                    "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.,{} {X:chips,C:white}X#2#{} {C:inactive}фишек)",
                }
            },
            j_abn_ironworks = {
                name = "Металлургия",
                text = {
                    {
                        "Дает {X:mult,C:white}X#3#{} множ.",
                        "за каждую {C:attention}Кованную карту",
                        "в вашей {C:attention}полной колоде",
                        "{C:inactive}(сейчас {X:mult,C:white}X#4#{C:inactive} множ.)",
                    },
                    {
                        "Дает {X:chips,C:white}X#1#{} фишек",
                        "за каждую {C:attention}Стальную карту",
                        "в вашей {C:attention}полной колоде",
                        "{C:inactive}(сейчас {X:chips,C:white}X#2#{C:inactive} фишек)",
                    }
                }
            },
            j_abn_ishihara_joker = {
                name = "Ишихара джокер",
                text = {
                    "Получает {C:chips}фишки{}, {C:attention}равные{} достоинству",
                    "подсчитанных {C:dark_edition}Негативных{} карт",
                    "со {C:diamonds}Светлой мастью{}",
                    "{C:inactive}(сейчас{} {C:chips}+#1#{} {C:inactive}фишек)",
                }
            },
            j_abn_isocromatic_joker = {
                name = "Изохроматический джокер",
                text = {
                    "{C:dark_edition}Фользовые{} карты получают {C:attention}+#2#{} Перезапусков при подсчете,",
                    "{C:planet}Планетный{} уровень {C:attention}рангов{} {C:dark_edition}Голографических{}",
                    "карт увеличивается на {C:attention}#3#{} при подсчете,",
                    "{C:dark_edition}Полихромные{} карты получают {C:chips}+#1#{} фишек при подсчете",
                }
            },
            --#endregion





            --#region J
            j_abn_j_for_joker = {
                name = "Д значит Джокер",
                text = {
                    "{X:mult,C:white}X#1#{} множ., если",
                    "все слоты джокеров {C:attention}заняты",
                },
            },
            j_abn_j_jimbob = {
                name = "Д'Джимбо",
                text = {
                    {
                        "{C:attention}Каменные{}, {C:attention}Стеклянные{}, {C:attention}Счастливые{} и",
                        "карты {C:attention}с Множителем{} дают {X:chips,C:white}X#2#{} фишек при подсчете",
                    },
                    {
                        "{C:attention}Стальные{}, {C:attention}Бонусные{}, {C:attention}Золотые{}",
                        "и {C:attention}Дикие{} карты дают {X:mult,C:white}X#1#{} множ. при подсчете",
                    }
                }
            },
            j_abn_jack_of_all_trades = {
                name = "Валет на все руки",
                text = {
                    {
                        "Сыгранные, но не подсчитанные",
                        "не {C:attention}#3#ы{} дают {C:white,X:mult}X#1#{} множ.",
                        "за каждую уникальную {C:attention}масть #3#а{},",
                        "сброшенную в этой партии",
                        "{C:inactive}(Даст {C:white,X:mult}X#4#{C:inactive} множ.)",
                    },
                    {
                        "{C:red,E:1}Самоуничтожается{} после подсчета,",
                        "если сыгранная рука не содержит {C:attention}#3#{}",
                    }
                }
            },
            j_abn_jakdos = {
                name = "Джакдос",
                text = {
                    "{X:mult,C:white}X#1#{} множ.",
                    "{C:mult}Ослабляет{} не {C:dark_edition}Хтонические{}",
                    "карты при подсчете"
                }
            },
            j_abn_jamie = {
                name = "Джейми",
                text = {
                    "Повышает уровень",
                    "сыгранной {C:attention}покерной руки{}",
                }
            },
            j_abn_jenga_joker = {
                name = "Дженга джокер",
                text = {
                    {
                        "Когда этот джокер будет {C:red}уничтожен{}, создает",
                        "его копию с дополнительным {X:mult,C:white}X#2#{} множ.",
                        "{C:inactive}(сейчас {X:mult,C:white}X#1#{C:inactive} множ.)"
                    },
                    {
                        "{C:red}Самоуничтожается{}, если очки {C:attention}вдвое",
                        "превышают требование блайнда"
                    }
                }
            },
            j_abn_jennia = {
                name = "Дженниа",
                text = {
                    {
                        "{C:abn_rose}Розы{} дают {X:chips,C:white}X#1#{} фишек",
                        "при подсчете, фишки увеличиваются на {X:chips,C:white}X#2#{}",
                        "когда {C:abn_rose}Роза{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "{C:abn_rose}Розы{} навсегда получают {C:mult}+#3#{} множ.",
                        "при подчете за каждую {C:abn_rose}Розу{},",
                        "подсчитанную в этом блайнде"
                    }
                }
            },
            j_abn_jenson = {
                name = "Дженсон",
                text = {
                    {
                        "{C:abn_suitless}Нули{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#2#{}",
                        "когда {C:abn_suitless}Нуль{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "сыгранные {C:abn_suitless}Нули{} навсегда",
                        "получают {C:mult}+#3#{} множ. каждую оставшуюся",
                        "руку при подсчете"
                    }
                }
            },
            j_abn_jerry_jester = {
                name = "Шут Джерри",
                text = {
                    {
                        "{C:abn_leaf}Листья{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличиваются на {X:mult,C:white}X#2#{}",
                        "когда {C:abn_leaf}Лист{} подсчитывается",
                    },
                    {
                        "Если у вас есть {C:attention}Джокер{}, все",
                        "карты {C:attention}в руке{} получают {C:chips}фишки{},",
                        "равные наивысшему достоинству среди подсчитанных",
                        "{C:abn_leaf}Листов{}, когда {C:abn_leaf}Лист{} подсчитывается",
                    }
                }
            },
            j_abn_jester_vs_jester = {
                name = "Шут VS Шут",
                text = {
                    {
                        "Если у вас {C:attention}четное{} количество {C:inactive}(редкость){} Джокеров,",
                        "{C:attention}четные{} карты дают {C:inactive}(награда 1){} при подсчете",
                        "Если у вас {C:attention}нечетное{} количество {C:inactive}(редкость){} Джокеров,",
                        "{C:attention}нечетные{} карты дают {C:inactive}(награда 2){} при подсчете",
                    },
                    {
                        "{C:inactive,s:0.8}(напр.: Редкость: награда 1 или награда 2)",
                        "{C:common}Обычный{}: {C:chips}+#1#{} или {C:chips}+#2#{} фишек",
                        "{C:uncommon}Необычный{}: {X:mult,C:white}X#3#{} или {X:mult,C:white}X#4#{} множ.",
                        "{C:rare}Редкий{}: {X:chips,C:white}X#5#{} или {X:chips,C:white}X#6#{} фишек",
                    }
                }
            },
            -- for localisers, this a Joker based on Jevil from Deltarune, and it has a random effect based on the number of unique suits in played hand
            -- The effects are in misc.dictionary and are abn_unique_suit_1, abn_unique_suit_2 etc.
            j_abn_jevil = {
                name = "{C:abn_j}Д{C:abn_e}ж{C:abn_v}е{C:abn_i}в{C:abn_l}и{C:abn_e}л{} Безумный Шут",
                text = {
                    "Разыграйте {C:blue}руку{}, любую руку!",
                    "{E:1,s:0.8,C:purple}\"Я МОГУ ВСЕ!\"",
                }
            },
            j_abn_jfool = {
                name = "Джей-шут",
                text = {
                    {
                        "Сыгранные {C:attention}Нечетные{} карты дают {C:white,X:mult}Xмнож.{}, равный",
                        "количеству сыгранных {C:attention}Нечетных{} карт",
                    },
                    {
                        "Сыгранные {C:attention}Четные{} карты дают {C:white,X:mult}Xмнож.{}, равный",
                        "количеству сыгранных {C:attention}Четных{} карт",
                    }
                }
            },
            j_abn_jimbo = {
                name = "Джимбо",
                text = {
                    {
                        "{C:hearts}Черви{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#2#{}",
                        "когда {C:hearts}Черва{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "{C:hearts}Черви{} навсегда получают",
                        "{C:mult}+#3#{} множ. перед подсчетом"
                    }
                }
            },
            j_abn_jimbo_10 = {
                name = "Джимбо 10",
                text = {
                    {
                        "Этот Джокер получает {C:chips}+#4#{} фишек",
                        "и {C:white,X:mult}X#2#{} множ.,",
                        "когда {C:attention}10{} подсчитывается",
                        "{C:inactive}(сейчас {C:chips}+#3#{C:inactive} фишек, {X:mult,C:white}X#1#{C:inactive} множ.)",
                    },
                    {
                        "Получите {C:money}$#5#{} за каждую",
                        "{C:attention}10{} в вашей {C:attention}полной колоде",
                        "в конце каждого раунда",
                        "{C:inactive}(сейчас {C:money}$#6#{}{C:inactive})",
                    }
                }
            },
            j_abn_jimbo_inscryption = {
                name = "Джимбо из Inscryption",
                text = {
                    "Каждая {C:attention}9{} и {C:attention}3{}",
                    "в руке дает {C:white,X:mult}X#1#{} множ.",
                }
            },
            j_abn_jimbos_love_letter = {
                name = "Любовное письмо Джимбо",
                text = {
                    "{C:hearts}Черви{} в руке участвуют в подсчете",
                    "Один раз за раунд, если сыгранная рука",
                    "содержит {C:attention}Флеш{} из {C:hearts}Червей{},",
                    "повышает {C:planet}планетный{} уровень {C:attention}рангов{}",
                    "всех подсчитанных карт",
                }
            },
            j_abn_jinxie = {
                name = "Джинкси",
                text = {
                    {
                        "{C:abn_rose}Розы{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#2#{}",
                        "когда {C:abn_rose}Роза{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "{C:abn_rose}Розы{} навсегда получают {C:mult}+#3#{} множ.",
                        "при подчете за каждую {C:abn_rose}Розу{},",
                        "подсчитанную в этом блайнде"
                    }
                }
            },
            j_abn_jjjokea = {
                name = "J.J.Jokea",
                text = {
                    {
                        "Если {V:1}первая сыгранная рука{} - это",
                        "{C:attention}#1#{}, копирует {C:attention}улучшение{},",
                        "{C:dark_edition}выпуск{} и {C:red}печать{} с",
                        "{C:attention}правой{} карты на {C:attention}левую{}"
                    },
                    {
                        "Если {V:2}вторая сыгранная рука{} - это",
                        "{C:attention}#2#{}, каждая карта",
                        "получает новый {C:tarot}Штамп"
                    },
                    {
                        "Если {V:2}вторая сыгранная рука{} - это",
                        "{C:attention}#3#{}, каждая карта в подсчете",
                        "получает {C:attention}Дощатая{}, {C:dark_edition}Хроматическая{},",
                        "и {C:red}красную печать"
                    }
                }
            },
            j_abn_joe_kert = {
                name = "Джо Керт",
                text = {
                    "Карты {C:attention}без улучшений{}",
                    "дают {C:mult}+#1#{} множ. при подсчете"
                },
            },
            j_abn_joerror = {
                name = "Джоошибка",
                text = {
                    "Джокеры дают {X:mult,C:white}X#1#{} множ.,",
                    "{C:red,E:1}Самоуничтожается после подсчета{}"
                }
            },
            j_abn_joke_22 = {
                name = "Шутка 22",
                text = {
                    {
                        "Если {C:attention}покерная рука{} - {C:dark_edition}ванильная{},",
                        "получает {C:red}множ.{}, равный сумме {C:attention}подсчитываемых{}",
                        "достоинств с {C:dark_edition}модовыми{} мастями",
                    },
                    {
                        "Если {C:attention}покерная рука{} - {C:dark_edition}модовая{},",
                        "получает {C:blue}фишки{}, равный сумме {C:attention}подсчитываемых{}",
                        "достоинств с {C:dark_edition}ванильными{} мастями",
                        "{C:inactive}(сейчас {C:red}+#1#{C:inactive} множ.,{} {C:blue}+#2#{C:inactive} фишек){}",
                    }
                }
            },
            j_abn_joker_ai = {
                name = "Искуственный интелект",
                text = {
                    {
                        "{C:attention}1{} карта {C:attention}принудительно",
                        "выбирается всегда",
                    },
                    {
                        "{C:attention}Принудительно{} выбранные",
                        "карты навсегда получают {C:chips}+#1#{} фишек и",
                        "{C:mult}+#2#{} множ. при подсчете"
                    }
                }
            },
            j_abn_joker_besties = {
                name = "Подружки Джокера",
                text = {
                    {
                        "Джокеры/карты с {C:inactive}выпуском 1{} получают",
                        "{C:inactive}выпуск 2{}, когда срабатывают",
                        "Джокеры/карты получают {C:chips}+#1#{} фишек,",
                        "когда меняют {C:dark_edition}выпуск{}",
                    },
                    {
                        "{C:inactive}(напр.: выпуск 1 -> выпуск 2)",
                        "{C:dark_edition}Фольговый{} -> {C:dark_edition}Голографический{}",
                        "{C:dark_edition}Голографический{} -> {C:dark_edition}Полихромный{}",
                        "{C:dark_edition}Полихромный{} -> {C:dark_edition}Хроматический{}",
                    }
                }
            },
            j_abn_joker_blast = {
                name = "Джокер-бласт",
                text = {
                    "Этот Джокер получает {C:chips}+#1#{} фишек",
                    "и {C:mult}+#2#{} множ. за каждого",
                    "{C:attention}последовательного Блайнда{},",
                    "побежденного за {C:attention}одну{} руку",
                    "{C:inactive}(сейчас {C:chips}+#3#{C:inactive} фишек, {C:mult}+#4#{C:inactive} множ.){}"
                },
            },
            j_abn_joker_collector = {
                name = "Джокер коллекционер",
                text = {
                    "Этот Джокер получает {C:chips}+#1#{} фишек",
                    "за каждого уникального Джокера,",
                    "{C:attention}купленного{} в этой партии,",
                    "Дает {C:white,X:mult}X#3#{} множ. если ты",
                    "купил {C:attention}10{} или более Джокеров",
                    "{C:inactive}(сейчас {C:chips}+#2#{C:inactive} фишек)"
                }
            },
            j_abn_joker_deck = {
                name = "Джокер-колода",
                text = {
                    "Дает {C:mult}+#2#{} множ. за",
                    "каждую четную карту и",
                    "{C:chips}+#1#{} фишек{} за каждую",
                    "нечетную карту в оставшейся колоде",
                    "{C:inactive}(сейчас {C:mult}+#3#{C:inactive} множ., {C:chips}+#4#{C:inactive} фишек)"
                }
            },
            j_abn_joker_ena = {
                name = "Джокер Ена",
                text = {
                    {
                        "Карты с {C:inactive}ванильными{} мастями",
                        "и {C:dark_edition}модовыми {C:attention}улучшениями{} дают",
                        "{C:white,X:mult}X#1#{} множ. при подсчете"
                    },
                    {
                        "Этот Джокер получает {C:mult}+#3#{} множ.",
                        "за каждое уникальное {C:dark_edition}модовое{}",
                        "{C:enhanced}улучшение{} в подсчитываемой руке",
                        "{C:inactive}(сейчас {C:mult}+#2#{C:inactive} множ.)"
                    }
                }
            },
            j_abn_joker_family = {
                name = "Семейное фото",
                text = {
                    "Если у вас есть {C:common}Обычный{}, {C:uncommon}Необычный{},",
                    "{C:rare}Редкий{} и {C:attention}Комик{} Джокеры:",
                    "Уменьшает {C:attention}требование Блайнда{} на {C:attention}50%{}",
                    "и дает {X:mult,C:white}X#2#{} множ. за каждую {C:attention}уникальную{}",
                    "{C:attention}редкость{} среди ваших {C:attention}Джокеров{}",
                    "{C:inactive}(сейчас{} {X:mult,C:white}X#1#{} {C:inactive}множ.){}",
                }
            },
            j_abn_joker_forge = {
                name = "Joker Forge",
                text = {
                    "Карты дают сумму {C:gold}цен продажи{}",
                    "всех имеющихся Джокеров как",
                    "{C:red}множ.{} при подсчете",
                    "{C:inactive}(сейчас {C:red}+#1# {C:inactive}множ.)"
                }
            },
            j_abn_joker_form = {
                name = "Джокер формы",
                text = {
                    "Сыгранные {C:attention}8{} или {C:attention}2",
                    "дают {C:chips}+#1#{} фишек и",
                    "{C:mult}+#2#{} множ. при подсчете",
                },
            },
            j_abn_joker_in_hiding = {
                name = "Прятки",
                text = {
                    {
                        "{C:attention}Переворачивает{} и добавляет {C:dark_edition}Голографический{} выпуск",
                        "{C:attention}Джокерам{}, выбранным из {C:attention}Бустерных наборов{}",
                    },
                    {
                        "{C:attention}Перевернутые{} Джокеры и Карты",
                        "дают {C:money}$#1#{}",
                    }
                }
            },
            j_abn_joker_invoice = {
                name = "Счет джокера",
                text = {
                    "{C:mult}+#1#{} множ.,",
                    "если рука сыграна",
                    "с {C:money}$#2#{} или меньше",
                }
            },
            j_abn_jokers_knight = {
                name = "Jokers Knight",
                text = {
                    {
                        "Сыгранные {C:attention}Стриты{} считаются {C:attention}Стрит-флешами{}",
                        "Сыгранные {C:attention}Стрит-флешами{} считаются {C:attention}Империум-флешами{}",
                    },
                    {
                        "Эсли этот Джокер {C:attention}Дикий{},",
                        "получает {C:chips}+#5#{} фишек и {C:mult}+#6#{} множ. за каждую",
                        "масть, которой считается {C:attention}Дикая{} карта"
                    },
                    {
                        "Эсли этот Джокер {C:attention}Объединяющий{},",
                        "получает {X:chips,C:white}X0.025{} фишек и {X:mult,C:white}X0.025{} множ. за каждую карту",
                        "с одинаковыми {C:attention}мастью{} и {C:dark_edition}выпуском{} в сыгранной руке",
                        "{C:inactive}(сейчас {C:chips}+#1#{} {C:inactive}фишек{} {C:mult}+#2#{} {C:inactive}множ.{} {X:chips,C:white}X#3#{} {C:inactive}фишек{} {X:mult,C:white}X#4#{} {C:inactive}множ.{C:inactive})",
                    }
                }
            },
            j_abn_joker_midnight = {
                name = "Джокер в 3 часа ночи",
                text = {
                    {
                        "Ослабляет все {C:diamonds}светлые масти{}"
                    },
                    { "Когда {C:attention}Блайнд{} выбран,",
                        "добавляет {C:dark_edition}#3#{}",
                        "{C:attention}самому левому{} Джокеру"
                    },
                    {
                        "Дает {C:mult}+#1#{} множ. за каждого",
                        "Джокера или карту с {C:dark_edition}#3#{}",
                        "в вашей {C:attention}полной колоде{}",
                        "{C:inactive}(сейчас {C:mult}+#2#{C:inactive} множ.)",
                    }
                }
            },
            j_abn_joker_note = {
                name = "Тетрадь Джокера",
                text = {
                    "За каждую карту с {C:attention}печатью{}",
                    "в подсчете этот Джокер:",
                    "получает {C:red}+#1#{} множ., если карта {C:attention}четная{}",
                    "получает {C:blue}+#2#{} фишек, если карта {C:attention}нечетная{}",
                    "{C:inactive}(сейчас {C:red}+#3#{C:inactive} множ., {C:blue}+#4#{C:inactive} фишек)",
                }
            },
            j_abn_joker_of_destruction = {
                name = "Джокер разрушения",
                text = {
                    "Если {C:attention}первая рука{} раунда",
                    "содержит {C:attention}4{} карты, уничтожает их и",
                    "создает {C:dark_edition}призывающиу{} {C:spectral}Спектральную{} карту",
                }
            },
            j_abn_joker_of_recca = {
                name = "Джокер Рекки",
                text = {
                    {
                        "{C:spades}Темнейшие{}/{C:diamonds}Светлейшие{} Джокеры",
                        "не будут уничтожены руками с большим",
                        "количеством противоположных мастей"
                    },
                    {
                        "{C:dark_edition}Реверс {C:spades}Темнейшие{} карты дают {C:chips}+#1#{} фишек и {C:mult}+#2#{} множ.",
                        "{C:dark_edition}Реверс {C:diamonds}Светлейшие{} карты дают {C:chips}+#3#{} фишек и {C:mult}+#4#{} множ."
                    },
                    {
                        "Если этот Джокер с {C:dark_edition}Заброшенным{} выпуском,",
                        "он получает {X:mult,C:white}X#5#{} множ. за каждую",
                        "{C:spades}Темнейшую{} карту и {X:chips,C:white}X#6#{} фишек за",
                        "каждую {C:diamonds}Светлейшую{} карту в подсчете",
                        "{C:inactive}(сейчас {X:mult,C:white}X#7#{C:inactive} множ., {X:chips,C:white}X#8#{C:inactive} фишек)"
                    }
                },
            },
            j_abn_joker_of_the_week = {
                name = "Джокер недели",
                text = {
                    "Когда {C:attention}Блайнд{} побежден с",
                    "{C:attention}нечетным{} количеством {C:attention}Джокеров{},",
                    "Этот Джокер получает {C:white,X:mult}X#2#{} множ.,",
                    "иначе получает {C:white,X:chips}X#4#{} фишек",
                    "{C:inactive}(сейчас {C:white,X:mult}X#1#{C:inactive} множ., {C:white,X:chips}X#3#{C:inactive} фишек)"
                }
            },
            j_abn_joker_of_the_weekend = {
                name = "Джокер выходного дня",
                text = {
                    "когда {C:attention}нечетный Блайнд{} побежден,",
                    "Этот Джокер получает {C:white,X:mult}X#2#{} множ.,",
                    "когда {C:attention}четный Блайнд{} побежден,",
                    "Этот Джокер получает {C:white,X:chips}X#4#{} фишек",
                    "{C:inactive}(сейчас {C:white,X:mult}X#1#{C:inactive} множ., {C:white,X:chips}X#3#{C:inactive} фишек)"
                }
            },
            j_abn_joker_once_again = {
                name = "И снова джокер",
                text = {
                    "Добавляет {C:abn_white_seal}белую печать{}",
                    "первой {C:attention}карте{} в подсчете",
                }
            },
            j_abn_joker_rave = {
                name = "Джокер-рейв",
                text = {
                    {
                        "При выборе {C:attention}Блайнда{},",
                        "{C:attention}переворачивает{} всех Джокеров",
                        "и карты без издания"
                    },
                    {
                        "Этот Джокер получает {C:chips}+#2#{} фишек,",
                        "когда {C:attention}перевернутая{} карта подсчитывается,",
                        "Получает {C:mult}+#4#{} множ. когда",
                        "{C:attention}перевернутый{} Джокер срабатывает",
                        "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек, {C:mult}+#3#{C:inactive} множ.)"
                    },
                    {
                        "Если у этого Джокера есть {C:dark_edition}издание{},",
                        "{C:attention}перезапускает{} все сыгранные",
                        "{C:attention}перевернутые{} карты"
                    }
                }
            },
            j_abn_joker_reloaded = {
                name = "Перезаряженный джокер",
                text = {
                    "В конце каждого раунда,",
                    "все Джокеры получают {C:mult}+#1#{} множ.",
                    "и {C:chips}+#2#{} фишек за каждый уникальный",
                    "{C:dark_edition}выпуск{} среди {C:attention}расходников{}",
                }
            },
            j_abn_joker_republic = {
                name = "Республика \"Джокер\"",
                text = {
                    {
                        "Когда выбран {C:attention}Большой Блайнд{},",
                        "создает карту {C:continent}Континента",
                        "{C:inactive}(должно быть место)",
                    },
                    {
                        "Когда карта {C:continent}Континента{} использована,",
                        "повышает достоинство следующей подсчитанной карты"
                    }
                }
            },
            j_abn_joker_scroll = {
                name = "Свиток Джокера",
                text = {
                    {
                        "Если у вас {C:attention}четное{} количество Джокеров",
                        "с одинаковой {C:money}ценой продажи{}, добавляет {C:dark_edition}Винтажный{}",
                        "выпуск к подсчитываемым {C:attention}четным{} картам в {C:attention}Фулл-хаусе{}",
                    },
                    {
                        "Если у вас {C:attention}нечетное{} количество Джокеров",
                        "с одинаковой {C:money}ценой продажи{}, добавляет {C:dark_edition}Винтажный{}",
                        "выпуск к подсчитываемым {C:attention}нечетным{} картам в {C:attention}Фулл-хаусе{}",
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Заброшенный{},",
                        "он получает {X:mult,C:white}X#2#{} множ. за",
                        "каждую подсчитанную {C:dark_edition}Винтажную{} карту",
                        "{C:inactive}(сейчас{} {X:mult,C:white}X#1#{} {C:inactive}множ.){}"
                    }
                }
            },
            j_abn_joker_tile = {
                name = "Плиточный джокер",
                text = {
                    "Получает {X:chips,C:white}X#2#{} фишек за каждую {C:attention}последовательную{}",
                    "руку, в которой {C:attention}совпадает{} количество",
                    "Джокеров и подсчитываемых карт",
                    "{C:inactive}(сейчас {} {X:chips,C:white}X#1#{} {C:inactive}фишек)",
                }
            },
            j_abn_joker_totebag = {
                name = "Шоппер",
                text = {
                    {
                        "Когда {C:attention}Блайнд{} выбран,",
                        "получает {C:mult}+#2#{} множ. и {C:chips}+#1#{} фишек за каждый",
                        "расходник с совпадающим названием",
                    },
                    {
                        "Если у всех расходников",
                        "{C:attention}разный{} {C:dark_edition}Выпуск{}, удваивает",
                        "{C:chips}фишки{} и {C:mult}множ.{} этого Джокера",
                        "{C:inactive}(сейчас {C:mult}+#4#{} {C:inactive}множ.,{} {C:chips}+#3#{} {C:inactive}фишек){}"
                    }
                }
            },
            j_abn_joker_tv = {
                name = "Джокер ТВ",
                text = {
                    {
                        "Когда {C:program_pack}Программная{} карта использована,",
                        "добавить {C:money}$#1#{} к {C:attention}цене продажи{} всем {C:attention}Джокерам{}",
                        "и {C:diamonds}Светлые масти{} навсегда получают {C:mult}+#2#{} множ.",
                    },
                    {
                        "Когда {C:planet}Ранговая планета{} использована,",
                        "все {C:spades}Темные масти{} навсегда получают {C:mult}+#2#{} множ."
                    }
                }
            },
            j_abn_joker_unlimited = {
                name = "Безграничный джокер",
                text = {
                    {
                        "Этот Джокер получает {X:red,C:white}X#1#{} множ.",
                        "за каждую разыгранную руку",
                        "в течение {C:attention}Босс-блайнда",
                        "{C:inactive}(сейчас {X:mult,C:white}X#2#{C:inactive} множ.)",
                    },
                    {
                        "Когда {C:attention}Босс-блайнд{} побежден,",
                        "{C:attention}копирует{} все карты в",
                        "вашей {C:attention}полной колоде{}",
                    }
                }
            },
            j_abn_jokerge = {
                name = "Джокердж",
                text = {
                    "{C:attention}Удваивает{} значения всех Джокеров",
                }
            },
            j_abn_jokerian_dogma = {
                name = "Джокерская догма",
                text = {
                    "Сыгранные {C:attention}улучшенные{} карты с",
                    "{C:dark_edition}модовым{} {C:dark_edition}Выпуском{} дают",
                    "{C:gold}+#1#{} Вознесилы при подсчете"
                }
            },
            j_abn_jokers_mixtape_grey = {
                name = "Микстейп Джокера",
                text = {
                    "Дает {C:chips}+10{} фишек за каждого имеющегося {C:attention}Джокера{}",
                    "{s:0.8}Эффект зависит от текущего выпуска",
                }
            },
            j_abn_jokers_mixtape_black = {
                name = "Микстейп Джокера",
                text = {
                    "Дает {C:white,X:mult}X1{} множ. за каждого имеющегося {C:attention}Джокера{}",
                    "{s:0.8}Эффект зависит от текущего выпуска",
                }
            },
            j_abn_jokers_mixtape_red = {
                name = "Микстейп Джокера",
                text = {
                    "Перезапускает всех Джокеров",
                    "{s:0.8}Эффект зависит от текущего выпуска",
                }
            },
            j_abn_jokers_mixtape_blue = {
                name = "Микстейп Джокера",
                text = {
                    "{C:white,X:chips}X3{} фишек",
                    "{s:0.8}Эффект зависит от текущего выпуска",
                }
            },
            j_abn_jokers_mixtape_yellow = {
                name = "Микстейп Джокера",
                text = {
                    "Дает {C:white,X:mult}Xмнож.{}, равный количеству карт в подсчете",
                    "{s:0.8}Эффект зависит от текущего выпуска",
                }
            },
            j_abn_jokertopia = {
                name = "Джокертопия",
                text = {
                    {
                        "Все карты {C:continent}Континентов{}",
                        "теперь {C:attention}бесплатные{}",
                    },
                    {
                        "Если есть карта {C:continent}Континента{},",
                        "Каждый Джокер дает {C:mult}+#1#{} множ.",
                        "за каждую уникальную масть в {C:attention}#2#{}",
                    }
                }
            },
            j_abn_jokester = {
                name = "Джокестер",
                text = {
                    {
                        "{s:0.8}{C:hearts,s:0.8}Черви{s:0.8} становятся {C:abn_leaf,s:0.8}Листиками{} при подсчете",
                        "{s:0.8}{C:spades,s:0.8}Пики{s:0.8} становятся {C:abn_bell,s:0.8}Колокольчиками{} при подсчете",
                        "{s:0.8}{C:diamonds,s:0.8}Бубны{s:0.8} становятся {C:abn_acorn,s:0.8}Желудями{} при подсчете",
                        "{s:0.8}{C:clubs,s:0.8}Трефы{s:0.8} становятся {C:abn_florette,s:0.8}Цветами{} при подсчете",
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Коллодиевый{},",
                        "он получает {C:mult}+#2#{} множ. и {C:money}$#2#{}",
                        "{C:attention}цены продажи{}, когда масть меняется",
                        "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.)",
                    }
                }
            },
            j_abn_jolly_roger = {
                name = "Веселый Роджер",
                text = {
                    "Можете {C:attention}выбрать{} {C:attention}дополнительную{} карту,",
                    "когда выбираете {C:attention}росходуемое{} из {C:attention}наборов{}",
                    "{C:money}Продажа{} расходника дает один из следующих эффектов:",
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
                name = "Веселый воксельный джокер",
                text = {
                    "{X:chips,C:white}X#1#{} фишек, если сыгранная",
                    "{C:attention}покерная рука{} - это {C:attention}#2#"
                }
            },
            j_abn_jorg = {
                name = "Джорг",
                text = {
                    "{C:mult}Сброшенные{} карты дают {X:mult,C:white}X#1#{} множ.",
                    "на {C:attention}следующей{} сыгранной руке",
                }
            },
            j_abn_jorick = {
                name = "Джорик",
                text = {
                    "{X:mult,C:white}X#1#{} множ. и {X:chips,C:white}X#2#{} фишек,",
                    "если осталось {C:attention}0{} сбросов",
                },
            },
            j_abn_july_jester = {
                name = "Шутиха Джулия",
                text = {
                    {
                        "{C:abn_suitless}Нули{} дают {X:chips,C:white}X#1#{} фишек",
                        "при подсчете, фишки увеличиваются на {X:chips,C:white}X#2#{}",
                        "когда {C:abn_suitless}Нуль{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "сыгранные {C:abn_suitless}Нули{} навсегда",
                        "получают {C:money}$#3#{} за каждую оставшуюся",
                        "руку при подсчете"
                    }
                }
            },
            j_abn_jurian = {
                name = "Юриан",
                text = {
                    "{C:mult}Сброшенные{} карты дают {X:chips,C:white}X#1#{} фишек",
                    "на {C:attention}следующей{} сыгранной руке",
                }
            },
            --#endregion





            --#region K
            j_abn_kefka = {
                name = "Кефка",
                text = {
                    {
                        "{C:diamonds}Светлые масти{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#2#{}",
                        "когда {C:diamonds}Светлая масть{} подсчитывается",
                    },
                    {
                        "Повышает {C:planet}планетный{} уровень",
                        "{C:attention}рангов{} всех подсчитанных карт",
                        "в {C:attention}победной руке{} раунда"
                    }
                }
            },
            j_abn_khonsu_joker = {
                name = "Хонсу-джокер",
                text = {
                    {
                        "Если первая рука раунда - это {C:attention}Пара{},",
                        "содержащая и {C:diamonds}Светлые{} и {C:spades}Темные{} масти,",
                        "Подсчитываемые карты получают {C:diamonds}Светлый{} и",
                        "{C:dark_edition}Темный{} выпуск соответственно",
                    },
                    {
                        "Если этот Джокер с {C:dark_edition}Светлым{} выпуском,",
                        "{C:diamonds}Светлые{} масти в подсчете дают свое",
                        "удвоенное {C:attention}достоинство{} как {C:mult}множ.{}",
                    },
                    {
                        "Если этот Джокер с {C:dark_edition}Темным{} выпуском,",
                        "{C:spades}Темные{} масти в подсчете дают свое",
                        "удвоенное {C:attention}достоинство{} как {C:mult}множ.{}",
                    }
                }
            },
            j_abn_kiki_joker = {
                name = "Кики джокер",
                text = {
                    {
                        "Этот Джокер получает {C:mult}+#2#{} множ.",
                        "за каждую {C:attention}Четную{}",
                        "карту в подсчете"
                    },
                    {
                        "Увеличивает бонус на {C:mult}+#3#{} множ.",
                        "за каждую карту {C:lexica}Лексики{} в руке,",
                        "когда {C:attention}Босс-блайнд{} побежден",
                        "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.)",
                    }
                }
            },
            j_abn_king_of_games = {
                name = "Король игр",
                text = {
                    "Один раз за {C:attention}Анте{} создает карту",
                    "с выбранным {C:attention}достоинством{}, {C:attention}мастью{} и {C:dark_edition}улучшением{}",
                    "и добавляет ее в вашу руку",
                }
            },
            j_abn_klyde_clown = {
                name = "Клоун Клайд",
                text = {
                    {
                        "{C:abn_coin}Монеты{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#2#{}",
                        "когда {C:abn_coin}Монета{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "сыгранные {C:abn_coin}Монеты{} навсегда",
                        "получают {C:money}$#3#{} за каждую {C:abn_coin}Монету{}",
                        "в подсчитываемой руке"
                    }
                }
            },
            --#endregion





            --#region L
            j_abn_la_bete_noire = {
                name = "{f:abn_m6x11}La  Bête  Noire",
                text = {
                    {
                        "Ваши {C:purple}очки{} скрыты",
                    },
                    {
                        "Добавляет {C:attention}+#1#{} к финишному анте",
                        "за каждую карту {C:attention}Бедствия{}",
                        "использованную в этой партии"
                    },
                    {
                        "Получает {C:gold}+#2#{} Вознесилы,",
                        "когда рука сыграна с картой",
                        "{C:attention}Бедствия{} в руке",
                        "{C:inactive}(сейчас {C:gold}+#3#{C:inactive} Вознес.)"
                    },
                    {
                        "Когда вы продаете {C:spectral}Спектральную{} карту,",
                        "создает случайную карту {C:attention}Бедствия{}"
                    }
                }
            },
            j_abn_late_pass = {
                name = "Поздний пропуск",
                text = {
                    "{C:chips}+#1#{} фишек, но",
                    "всегда срабатывает",
                    "{C:attention}последним{}"
                }
            },
            j_abn_lawn_joker = {
                name = "Газонный джокер",
                text = {
                    {
                        "{C:abn_rose}Розы{}, {C:clubs}Трефы{}, {C:abn_leaf}Листы{}",
                        "и {C:abn_florette}Цветы{} навсегда получают",
                        "{C:chips}+#5#{} фишек и {C:mult}+#6#{} множ. при подсчете",
                        "за каждую имеющуюся",
                        "карту {C:continent}Континента{}"
                    },
                    {
                        "Этот Джокер получает {C:chips}+#2#{} фишек и",
                        "{C:mult}+#4#{} множ. за каждый",
                        "использованный {C:weather_report}Прогноз погоды",
                        "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек, {C:mult}+#3#{C:inactive} множ.)",
                    }
                }
            },
            j_abn_legends_remade = {
                name = "Легенды: Ремейк",
                text = {
                    "Если у вас есть {C:legendary}Легендарный{} Джокер,",
                    "{C:money}продайте{} этого {C:attention}Джокера{}, чтобы создать",
                    "любого {C:legendary}Легендарного{} Джокера из вашей коллекции",
                }
            },
            j_abn_light_collage = { -- TO relocalise (oh hell naw)
                name = "Светлый коллаж",
                text = {
                    {
                        "Этот Джокер получает {C:chips}+#1#{} фишек, когда",
                        "{C:dark_edition}Фольговая{} карта подсчитывается, {C:mult}+#2#{} множ.,",
                        "когда {C:dark_edition}Блестящая{} карта подсчитывается",
                        "{C:inactive}(сейчас {C:chips}+#7#{C:inactive} фишек, {C:mult}+#8#{C:inactive} множ.)"
                    },
                    {
                        "Когда карта {C:sigils}Символа{} использована,",
                        "шанс {C:green}#5# к #6#{} превратить",
                        "случайную карту {C:attention}без выпуска{} в",
                        "вашей колоде в {C:dark_edition}Фольговую{} карту,",
                        "Шанс {C:green}#5# к #6#{} шанс на {C:dark_edition}Блестящую{} карту",
                    }
                }
            },
            j_abn_livestream_joker = {
                name = "Livestream Joker",
                text = {
                    "{C:dark_edition}Модовые{} достоинства {C:attention}в руке",
                    "дают {C:attention}X#1#{} своих {C:chips}фишек{}"
                }
            },
            j_abn_living_card = {
                name = "Живая карта",
                text = {
                    "Карты, {C:attention}не участвовавшие{} в подсчете",
                    "навсегда получают {C:chips}+#2#{} фишек",
                    "и {C:mult}+#1#{} множ., когда сыграны"
                }
            },
            j_abn_loki = {
                name = "Локи",
                text = {
                    "Когда {C:attention}Комик{} срабатывает,",
                    "все другие {C:attention}не Комики{}",
                    "навсегда получают {C:mult}+#1#{} множ.",
                }
            },
            j_abn_losers_dice = {
                name = "Лузерский кубик",
                text = {
                    "Сыгранные и подсчитанные {C:attention}2-ки{}",
                    "дают {C:mult}+#2#{} множ. за каждого",
                    "имеющегося {C:common}Обычного{} Джокера",
                    "{C:inactive}(Даст {C:mult}+#1#{C:inactive} множ.)"
                }
            },
            j_abn_lost_media = {
                name = "Лост-медиа",
                text = {
                    "Этот Джокер получает {X:mult,C:white}X#2#{} множ.",
                    "за каждую недостающую {C:attention}масть{}",
                    "в вашей полной колоде",
                    "{C:inactive}(сейчас {X:mult,C:white} X#1# {} {C:inactive}множ.){}",
                    "{C:inactive,s:0.8}(Недостает: #3#){}",
                }
            },
            j_abn_lotion_joker = {
                name = "Лосьон",
                text = {
                    "Убирает {C:attention}улучшение{} с сыгранных или",
                    "сброшенных {C:attention}Нефтяных{} и {C:attention}Каменных{} карт,",
                    "получает {C:chips}+#2#{} фишек за каждую",
                    "карту, востановленную таким образом",
                    "{C:inactive}(сейчас{} {C:chips}+#1#{} {C:inactive}фишек)",
                }
            },
            j_abn_lucky_glass = {
                name = "Счастиливое стекло",
                text = {
                    {
                        "Если сыгранная рука содержит и {C:attention}Счастливую{}",
                        "и {C:attention}Стеклянную{} карту, обе получают",
                        "{C:gold}+#1#{} Вознесилы и {C:purple}+#2#{} к Счету",
                    },
                    {
                        "{C:enhanced}Счастливые{} {C:attention}Джокеры{} получают {X:mult,C:white}X#3#{} множ., {C:enhanced}Стеклянные{}",
                        "{C:attention}Джокеры{} получают {X:chips,C:white}X#4#{} фишек, когда срабатывают"
                    },
                    {
                        "Когда {C:attention}Большой блайнд{} выбран,",
                        "создает последнюю использованную в",
                        "этой партии {C:glyphs}Глифовую{} карту",
                        "{C:inactive}сейчас:{} {C:glyphs}#5#{}"
                    }
                }
            },
            j_abn_lorenz = {
                name = "Лоренс",
                text = {
                    {
                        "{C:abn_acorn}Желуди{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#2#{},",
                        "когда {C:abn_acorn}Желуди{} подсчитываются",
                    },
                    {
                        "{C:abn_acorn}Желуди{} дают {C:chips}+#3#{} фишек",
                        "за каждую {C:attention}редкость{} имеющихся",
                        "Джокеров при подсчете"
                    }
                }
            },
            j_abn_Liam = {
                name = "Лиам",
                text = {
                    {
                        "{C:abn_acorn}Желуди{} дают {X:chips,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:chips,C:white}X#2#{},",
                        "когда {C:abn_acorn}Желуди{} подсчитываются",
                    },
                    {
                        "{C:abn_acorn}Желуди{} дают {C:purple}+#3#{} к Счету",
                        "за каждую {C:attention}редкость{} имеющихся",
                        "Джокеров при подсчете"
                    }
                }
            },
            j_abn_lucky_mult = {
                name = "Счастливый множитель",
                text = {
                    {
                        "Если сыгранная рука содержит и {C:attention}Счастливую{}",
                        "и карту {C:attention}с Множителем{}, обе получают",
                        "{C:gold}+#1#{} Вознесилы и {C:purple}+#2#{} к Счету",
                    },
                    {
                        "{C:enhanced}Счастливые{} {C:attention}Джокеры{} получают {X:mult,C:white}X#3#{} множ., {C:attention}Джокеры{}",
                        "{C:enhanced}с Множителем{} получают {X:chips,C:white}X#4#{} фишек, когда срабатывают",
                    },
                    {
                        "Когда {C:attention}Большой блайнд{} выбран,",
                        "создает последнюю использованную в",
                        "этой партии {C:paradox}Парадоксальную{} карту",
                        "{C:inactive}сейчас:{} {C:paradox}#5#{}"
                    }
                }
            },
            j_abn_lucky_socks = {
                name = "Счастливые носочки",
                text = {
                    {
                        "Этот Джокер получает {C:mult}+#1#{} множ., если",
                        "сыгранная рука содержит {C:attention}Пару{}",
                    },
                    {
                        "{C:attention}Счастливые{} карты в {C:attention}Паре{}",
                        "{C:green}активируются{} гарантированно",
                        "{C:inactive}(сейчас {C:mult}+#2#{C:inactive} множ.)",
                    }
                }
            },
            j_abn_lucky_stone = {
                name = "Счастливый камень",
                text = {
                    {
                        "Если сыгранная рука содержит и {C:attention}Каменную{}",
                        "и {C:attention}Счастливую{} карту, обе получают",
                        "{C:gold}+#1#{} Вознесилы и {C:purple}+#2#{} к Счету",
                    },
                    {
                        "{C:enhanced}Каменные{} {C:attention}Джокеры{} получают {X:mult,C:white}X#3#{} множ., {C:enhanced}Счастливые{}",
                        "{C:attention}Джокеры{} получают {X:chips,C:white}X#4#{} фишек, когда срабатывают"
                    },
                    {
                        "Когда {C:attention}Большой блайнд{} выбран,",
                        "создает последнюю использованную в",
                        "этой партии {C:artistry_cards}Художественную{} карту",
                        "{C:inactive}сейчас:{} {C:artistry_cards}#5#{}"
                    }
                }
            },
            j_abn_lucrative_joker = {
                name = "Джокер-мажор",
                text = {
                    {
                        "Убирает лимит {C:money}процентов{} и {C:tarot}удвоения{}",
                    },
                    {
                        "{C:attention}Золотые{} карты и карты с {C:gold}золотой печатью{}",
                        "тасуются наверх вашей колоды",
                    },
                    {
                        "Если есть {C:attention}Слот-машина{}, удваивает",
                        "получаемые {C:gold}${} с {C:attention}Золтых{} карт и {C:attention}печатей",
                    }
                }
            },
            j_abn_luftballon_joker = {
                name = "Шарик",
                text = {
                    {
                        "Когда {C:attention}9{} подсчитывается,",
                        "получает {C:red}+#1#{} множ. за каждую {C:attention}9",
                        "в вашей {C:attention}полной колоде",
                        "{C:inactive}(сейчас {C:red}+#3#{C:inactive} множ.)"
                    },
                    {
                        "Если разыграно {C:attention}#2#",
                        "только из {C:attention}9{}, повышает",
                        "уровень руки {C:attention}9{} раз"
                    }
                }
            },
            j_abn_lunar_conspiracy = {
                name = "Лунный заговор",
                text = {
                    {
                        "Получает {C:chips}+#3#{} фишек и {C:red}+#4#{} множ.,",
                        "когда вы играете {C:attention}руку,",
                        "соответствующую какой-либо",
                        "карте {C:planet}Планеты{} в руке,",
                        "{C:inactive}(сейчас {C:blue}+#1#{C:inactive} фишек и {C:red}+#2#{C:inactive} множ.)",
                    }
                }
            },
            --#endregion





            --#region M
            j_abn_m_earl = {
                name = "М. Эрл",
                text = {
                    "Уменьшает {C:attention}требование Блайнда{}",
                    "на {C:attention}90%{}"
                }
            },
            j_abn_mad_petr = {
                name = "Безумный Петр",
                text = {
                    "Перезапускает всех {C:attention}Джокеров{}",
                    "за каждый уникальный расходник {C:attention}в руке{}",
                    "{C:inactive}(сейчас{} {C:attention}#1#{} {C:inactive}Перезапусков)",
                }
            },
            j_abn_mad_professor = {
                name = "Безумный профессор",
                text = {
                    "Каждая сыгранная {C:attention}карта{}",
                    "навсегда получает {C:blue}+#1#{} фишек за каждый",
                    "подсчет ее {C:attention}достоинства{} в этой {C:attention}руке",
                    "{C:inactive}напр.: \"2\",\"4\",\"2\",\"4\"",
                    "{C:inactive}= {C:chips}+1{C:inactive},{C:chips}+1{C:inactive},{C:chips}+2{C:inactive},{C:chips}+2{C:inactive}"
                }
            },
            j_abn_magician_tag = {
                name = "Магический тег",
                text = {
                    "Когда вы {C:green}перебрасываете{} лавку,",
                    "также {C:green}перебрасывает{} все",
                    "имеющиеся теги"
                }
            },
            j_abn_mainframe_joker = {
                name = "Мэйнфрейм джокер",
                text = {
                    "Этот Джокер получает {C:mult}+#4#{} множ.,",
                    "когда {C:solid_state}Твердотельная{} карта использована",
                    "Получает {C:chips}+#2#{} фишек, когда",
                    "{C:program_pack}Программная{} карта использована",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек, {C:mult}+#3#{C:inactive} множ.)"
                }
            },
            j_abn_malefactor_comedian = {
                name = "Злодейский комик",
                text = {
                    "Получает {C:chips}фишки{}, {C:attention}равные{} достоинству подсчитанных Светлых мастей",
                    "Получает {C:mult}множ.{}, {C:attention}равный{} достоинству подсчитанных Темных мастей",
                    "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ., {C:chips}+#2# {C:inactive}фишек)",
                }
            },
            j_abn_malicious_code_joker = {
                name = "Вредоносный код",
                text = {
                    {
                        "Шанс {C:green}#1# к #2#{} преобразовать",
                        "карту {C:attention}с Множителем{} в",
                        "{C:purple}Зараженную карту с множителем{}",
                        "при подсчете",
                    },
                    {
                        "Шанс {C:green}#1# к #2#{} преобразовать",
                        "{C:attention}Бонусную{} карту в",
                        "{C:purple}Зараженную бонусную карту{}",
                        "при подсчете",
                    }
                }
            },
            j_abn_malicious_entity = {
                name = "Вредоносная сущность",
                text = {
                    "Когда сыграна {C:attention}первая рука{} раунда,",
                    "уничтожает {C:attention}самую левую{} карту",
                    "в подсчете и получает {C:white,X:mult}X#2#{} множ.",
                    "{C:inactive}(сейчас {X:mult,C:white} X#1# {C:inactive} множ.)",
                }
            },
            j_abn_malware_joker = {
                name = "Вредоносный джокер",
                text = {
                    "Перезапускает всех {C:attention}Джокеров{},",
                    "Каждый Джокер имеет",
                    "шанс {C:green}#1# к #2#{} быть",
                    "{C:red}уничтоженным{} каждую руку",
                }
            },
            j_abn_mana = {
                name = "Мана",
                text = {
                    "Добавляет {C:dark_edition}Солнечный{} к первому подсчитанному",
                    "{C:attention}Тузу{} и {C:attention}2{} на",
                    "{C:attention}первой руке{} раунда"
                }
            },
            j_abn_manga_panel_joker = {
                name = "Джокер из манги",
                text = {
                    "{C:spades}Темные масти{} дают",
                    "{X:chips,C:white}^#1#{} фишек и {X:mult,C:white}^#2#{} множ.",
                    "при подсчете",
                }
            },
            j_abn_map_joker = {
                name = "Карта джокера",
                text = {
                    {
                        "{C:attention}Тузы{} навсегда получают",
                        "{C:chips}+#1#{} фишек и {C:mult}+#2#{} множ. за каждую имеющуюся",
                        "карту {C:continent}Континента{} при подсчете",
                    },
                    {
                        "Получаемы фишки и множ. увеличиваются",
                        "на {C:chips}+#3#{} фишек и {C:mult}+#4#{} множ., когда",
                        "карта {C:continent}Континента{} использована"
                    }
                }
            },
            j_abn_mardi_gras = {
                name = "Джокер Марди Гра",
                text = {
                    "Выбираете {C:attention}1{} дополнительную",
                    "карту из наборов {C:tarot}аркана{}",
                }
            },
            j_abn_mariner_joker = {
                name = "Моряк",
                text = {
                    "Создает случайную {C:attention}Ранговую{}",
                    "{C:planet}Планету{} каждый раз, когда",
                    "карта {C:continent}Континентов{} использована",
                }
            },
            j_abn_marionette_joker = {
                name = "Марионетка",
                text = {
                    {
                        "{C:attention}#3#{} карт принудительно",
                        "выбираются всегда",
                    },
                    {
                        "Этот Джокер получает {C:white,X:mult}X#2#{} множ.",
                        "за каждую подсчитанную карту",
                        "{C:inactive}(сейчас {C:white,X:mult}X#1#{C:inactive} множ.)"
                    }
                }
            },
            j_abn_market_crash = {
                name = "Крах рынка",
                text = {
                    {
                        "Когда вы получаете {C:money}${}, уменьшает",
                        "получаемое до {C:money}$1{} и получает",
                        "{C:attention}удвоенное{} количество потерянных {C:money}${}, как {C:mult}множ.{}",
                        "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.)",
                    },
                    {
                        "Когда {C:attention}продан{}, получите",
                        "все потерянные {C:money}${}",
                        "{C:inactive}(Вернет {C:money}$#2#{C:inactive})"
                    }
                }
            },
            j_abn_marmalade_sandwhich = {
                name = "Сэндвич с мармеладом",
                text = {
                    "Когда Джокер срабатывет,",
                    "дает ему {X:mult,C:white}+X#3#{} множ.,",
                    "Шанс {C:green}#1# к #2#{} быть",
                    "{C:attention}съеденным{} в конце раунда",
                }
            },
            j_abn_marmalize_joker = {
                name = "Мармалайз",
                text = {
                    {
                        "Когда {C:attention}Блайнд{} выбран,",
                        "все {C:attention}Джокеры{} навсегда получают",
                        "{C:mult}+#1#{} множ. и {C:chips}+#2#{} фишек",
                    },
                    {
                        "Джокеры не могут быть {C:mult}ослаблены{}",
                        "или иметь {C:abn_perishable}наклеек{}",
                    }
                }
            },
            j_abn_marques_the_joker = {
                name = "Маркиз",
                text = {
                    {
                        "Сыгранные {C:attention}Золотые{} карты навсегда",
                        "получают {X:mult,C:white}X#1#{} множ. и",
                        "{C:chips}+#2#{} фишек при подсчете",
                    },
                    {
                        "Сыгранные не {C:attention}Золотые{} карты",
                        "{C:red}ослабляются{} при подсчете",
                    }
                }
            },
            j_abn_mateo_mime = {
                name = "Мим Матео",
                text = {
                    {
                        "{C:abn_coin}Монеты{} дают {X:chips,C:white}X#1#{} фишек",
                        "при подсчете, фишки увеличиваются на {X:chips,C:white}X#2#{}",
                        "когда {C:abn_coin}Монета{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "повышает {C:planet}планетный{} уровень {C:attention}ранга{}",
                        "всех подсчитанных {C:abn_coin}Монет",
                    }
                }
            },
            j_abn_maurice_jester = {
                name = "Шут Маурис",
                text = {
                    {
                        "{C:hearts}Черви{} дают {X:chips,C:white}X#1#{} фишек",
                        "при подсчете, фишки увеличиваются на {X:chips,C:white}X#2#{}",
                        "когда {C:hearts}Черва{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "сыгранные {C:hearts}Черви{} навсегда",
                        "получают {C:white,X:mult}X#3#{} множ. при подсчете"
                    }
                }
            },
            j_abn_maxwell_joker = {
                name = "Максвелл",
                text = {
                    "Карты и Джокеры с {C:dark_edition}#2#{}",
                    "дают {X:chips,C:white}X#1#{} фишек"
                }
            },
            j_abn_meatkin = {
                name = 'Meatkin Joker',
                text = {
                    "Когда {C:attention}стальная карта{} подсчитывается,",
                    "каждая не стальная карта в подсчете",
                    "навсегда получает {X:mult,C:white}+X#1#{} множ."
                },
                --[[unlock = {
                    "Улучшите как минимум {C:attention}четверть{}",
                    "вашей колоды до {C:attention}Стальных{} карт"
                }--]]
            },
            j_abn_meddlesome_naidemoc = {
                name = "Назойливый Кимок",
                text = {
                    {
                        "Карты меняют {C:attention}масть{} после подсчета:",
                        "{C:diamonds,s:0.8}Бубны{s:0.8} -> {C:spades,s:0.8}Пики{s:0.8} -> {C:hearts,s:0.8}Черви{s:0.8} -> {C:clubs,s:0.8}Трефы",
                        "{s:0.8} -> {C:abn_arrow,s:0.8}Стрелы{s:0.8} -> {C:abn_anchor,s:0.8}Якори{s:0.8} -> {C:abn_rose,s:0.8}Розы{s:0.8} -> {C:abn_shield,s:0.8}Щиты{}",
                    },
                    {
                        "Этот Джокер получает {C:chips}+#3#{} фишек и",
                        "{C:mult}+#4#{} множ., когда карта меняет {C:attention}масть{}",
                        "{C:inactive}(сейчас{} {C:mult}+#2#{} {C:inactive}множ.,{} {C:chips}+#1#{} {C:inactive}фишек){}"
                    }
                }
            },
            j_abn_melnibone_comedian = {
                name = "Мелнибонский комик",
                text = {
                    "Получает {X:mult,C:white}X#3#{} множ. когда Джокер {C:attention}продан{}",
                    "Получает {C:chips}+#4#{} фишек, когда Джокер {C:mult}уничтожен{}",
                    "{C:inactive}(сейчас{} {X:mult,C:white}X#1#{} {C:inactive}множ.,{} {C:chips}+#2#{} {C:inactive}фишек){}",
                    "{C:attention}Проданные{} и {C:mult}уничтоженные{} Джокеры больше не могут быть найдены",
                }
            },
            j_abn_melted_joker = {
                name = "Расплавленный джокер",
                text = {
                    {
                        "Когда {C:attention}Блайнд{} выбран,",
                        "добавляет {C:money}Прокатный{} к",
                        "самому левому Джокеру",
                    },
                    {
                        "{C:money}Прокатные{} Джокеры дают",
                        "{X:mult,C:white}X#2#{} множ. и {C:money}$#1#{}"
                    }
                }
            },
            j_abn_melty_joker = {
                name = "Поплывший джокер",
                text = {
                    "{C:attention}Самая левая{} сыгранная",
                    "карта навсегда получает",
                    "достоинство {C:attention}самой правой{}",
                    "карты как {C:chips}фишки{}, и затем",
                    "{C:attention}самая правая{} карта уничтожается"
                }
            },
            j_abn_memory_dump_joker = {
                name = "Дамп памяти",
                text = {
                    {
                        "Джокеры получают {X:mult,C:white}X#1#{} множ.",
                        "каждую подсчитанную руку"
                    },
                    {
                        "Размер подсчитываемой руки должен",
                        "быть больше чем {C:attention}#2#{}",
                        "{C:inactive}(Меняется на размер наибольшой разыгранной руки)",
                        "{C:inactive}(Сбрасывается при победе над Блайндом)"
                    }
                }
            },
            j_abn_menacing_clown = {
                name = "Зловещий клоун",
                text = {
                    "Когда {C:attention}Блайнд{} выбран,",
                    "уничтожает Джокера справа и",
                    "добавляет {C:dark_edition}#1#{}, {C:dark_edition}#2#{},",
                    "или {C:dark_edition}#3#{} Джокеру слева",
                },
            },
            j_abn_meta_joker = {
                name = "Метаджокер",
                text = {
                    "Дает {C:white,X:mult}X#1#{} множ. за",
                    "каждую {C:attention}уникальную редкость{}",
                    "среди ваших {C:attention}Джокеров{}",
                    "{C:inactive}(сейчас {X:mult,C:white}X#2#{C:inactive} множ.)",
                }
            },
            j_abn_metalizing_joker = { -- to relocalise
                name = 'Металлизация',
                text = {
                    "{C:attention}+1{} {C:chips}Play{} Limit",
                    "If your hand is Composed of Only {C:attention}Steel{} cards",
                    "Each {C:attention}Steel{} card gains {C:gold}+#3#{} Asc. Power per scoring card",
                    "After playing {C:attention}#2#{} hands of {C:attention}6{} Steel cards",
                    "{C:mult}destroy{} this Joker and {C:attention}double{} your Handsize",
                    "{C:attention}#1#{}{C:inactive}/{}{C:attention}#2#{}",
                }
            },
            j_abn_metallic_upgrade = {
                name = "Металлический апгрейд",
                text = {
                    "{C:attention}Первое{} подсчитанное {C:inactive}ванильное{} {C:dark_edition}Улучшение{} в {C:attention}Спектрумной{} руке",
                    "дает это {C:dark_edition}улучшение{} {C:attention}самому левому{} Джокеру",
                    "Если {C:attention}Спектрумная{} рука сыграна из {C:attention}5 Ванильных{} {C:dark_edition}Улучшений{},",
                    "все сыгранные карты навсегда получают {C:chips}+#1#{} фишек и {C:mult}+#2#{} множ.",
                    "и все Джокеры получают {C:purple}+#3#{} к Счету",
                }
            },
            j_abn_metropolitan_joker = {
                name = "Метрополитен",
                text = {
                    "{X:mult,C:white}X#1#{} множ. за каждую карту",
                    "{C:attention}#2#{} в вашей {C:attention}полной колоде{}",
                    "{C:inactive}(сейчас {X:mult,C:white}X#3#{C:inactive} множ.)"
                }
            },
            j_abn_mike_jester = {
                name = "Шут Майк",
                text = {
                    {
                        "{C:abn_bow}Бабочки{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#2#{}",
                        "когда {C:abn_bow}Бабочка{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "{C:abn_bow}Бабочки{} уравнивают {C:chips}фишки{}",
                        "и {C:mult}множ.{} на {C:white,X:abn_plasma}#3#%{} при подсчете"
                    }
                }
            },
            j_abn_mikhail_jester = {
                name = "Шут Михаил",
                text = {
                    {
                        "{C:abn_bow}Бабочки{} дают {X:chips,C:white}X#1#{} фишек",
                        "при подсчете, фишки увеличиваются на {X:chips,C:white}X#2#{}",
                        "когда {C:abn_bow}Бабочка{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{}, {C:abn_bow}Бабочки{}",
                        "навсегда получают {C:mult}+#3#{} множ. при подсчете",
                        "за каждый имеющийся {C:attention}расходник{}",
                    }
                },
            },
            j_abn_mindflayer = {
                name = "Пожиратель разума",
                text = {
                    "Сыгранные {C:attention}перевернутые{}",
                    "карты навсегда получают",
                    "{C:mult}+#1#{} множ. при подсчете",
                }
            },
            j_abn_minimalist_joker = {
                name = "Минималистичный джокер",
                text = {
                    "Все {C:common}Обычные{} Джокеры дают {X:mult,C:white}X#1#{} множ.",
                    "{C:mult}Самоуничтожается{}, если Джокер {C:money}продан{}",
                    "{C:attention}Расходники{} продаются за {C:money}$0{}",
                }
            },
            j_abn_minimus = {
                name = "Минимус",
                text = {
                    "{C:attention}Номерные{} карты с достоинством",
                    "ниже {C:attention}5{} дают",
                    "{X:mult,C:white}X#1#{} множ. и {X:chips,C:white}X#2#{} фишек при подсчете",
                }
            },
            j_abn_misplaced_texture = {
                name = 'Не та текстура',
                text = {
                    "Все карты {C:attention}с лицом{}",
                    "считаются {C:attention}номерными",
                    "картами",
                }
            },
            j_abn_missing_texture = {
                name = 'Потерянная текстура',
                text = {
                    "Превращает все сыгранные",
                    "карты в {C:attention}Туз{}",
                    "перед подсчетом"
                }
            },
            j_abn_mitch_jester = {
                name = "Шут Митч",
                text = {
                    {
                        "{C:abn_tie}Галстуки{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#2#{}",
                        "когда {C:abn_tie}Галстук{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "{C:abn_tie}Галстуки{} навсегда получают {C:attention}+#3#{} перезапуск",
                        "за каждый имеющийся {C:attention}расходник{}",
                    }
                }
            },
            j_abn_moai_joker = {
                name = "Моаи",
                text = {
                    "Сыгранные {C:attention}Каменные карты{}",
                    "навсегда получают {C:mult}+#1#{} множ.",
                    "и {C:money}+$#2#{} при подсчете",
                }
            },
            j_abn_moe_joker = {
                name = "Мо",
                text = {
                    "Карты {C:attention}В горошек{} в руке",
                    "так же подсчитываются,",
                    "Карты {C:attention}В горошек{} навсегда",
                    "получают {C:mult}+#1#{} множ. при подсчете"
                }
            },
            j_abn_moirologist_joker = {
                name = "Джокер-плакальщик",
                text = {
                    {
                        "Когда {C:attention}Блайнд{} выбран,",
                        "добавляет случайному Джокеру {C:enhanced}Хрупкость{}"
                    },
                    {
                        "Когда Джокер уничтожен, получите {C:gold}$#1#",
                        "и бонус на основе редкости уничтоженного Джокера:",
                        "{C:common}Обычный{}: {C:blue}+#9#{C:inactive}[+#2#]{} фишек",
                        "{C:uncommon}Необычный{}: {C:red}+#10#{C:inactive}[+#3#]{} множ.",
                        "{C:rare}Редкий{}: {X:chips,C:white}X#11#{C:inactive}[X#4#]{} фишек",
                        "{C:abn_superrare}Супер редкий{}: {X:red,C:white}X#12#{C:inactive}[X#5#]{} множ.",
                        "{C:legendary}Легендарный{}: {C:gold}+#13#{C:inactive}[+#6#]{} Вознесилы",
                        "{C:abn_parallelrare}Параллель редкий{}: {C:attention}+#14#{C:inactive}[+#7#]{} перезапусков",
                        "{s:0.8}$, получаемые за уничтоженных Джокеров растут на {C:gold,s:0.8}+$#8#{s:0.8}",
                        "{s:0.8}после победы над {C:attention,s:0.8}Босс-блайндом"
                    }
                }
            },
            j_abn_money_talk = {
                name = "Деньги решают",
                text = {
                    {
                        "Когда {C:attention}Босс-блайнд{} побежден,",
                        "добавляет {C:money}$#2#{} к {C:attention}цене продажи",
                        "каждому {C:attention}расходнику{} в руке",
                    },
                    {
                        "Бонус увеличивается на {C:money}$#1#{},",
                        "когда {C:attention}Босс-блайнд{} побежден",
                    }
                }
            },
            j_abn_monitor_joker = {
                name = "Мониторный джокер",
                text = {
                    {
                        "Вы можете играть или сбрасывать",
                        "до {C:attention}6{} карт",
                    },
                    {
                        "Первая сыгранная рука с {C:attention}6 картами{}",
                        "и {C:attention}Мониторной картой{} повышает достоинство",
                        "сыгранных карт на {C:attention}1{},",
                        "Сыгранные карты навсегда получают",
                        "{X:chips,C:white}X#1#{} фишек при подсчете",
                    }
                }
            },
            j_abn_monkey_buisness = {
                name = "Мартышкин труд",
                text = {
                    "{C:attention}Расходники{} могут иметь",
                    "{C:dark_edition}выпуски"
                }
            },
            j_abn_monocromator_joker = {
                name = "Монохромный джокер",
                text = {
                    {
                        "Если сыгранная рука содержит {C:attention}Стрит{},",
                            "получает {C:chips}+#3#{} фишек за каждую",
                        "{C:attention}уникальную{} подсчитываемую {C:attention}масть{}"
                    },
                    {
                        "Если сыгранная рука содержит {C:attention}Стрит Спектрум{},",
                            "получает {C:mult}множ.{}, равный {C:attention}достоинству{}",
                        "каждой {C:dark_edition}модовой{} масти"
                    },
                    {
                        "Если сыгранная рука содержит {C:attention}Стрит Спектрум{}",
                        "без {C:inactive}ванильных{} мастей, все {C:spades}Темные{}",
                        "масти получают {C:dark_edition}Темный{} выпуск",
                        "{C:inactive}(сейчас:{} {C:mult}+#1#{} {C:inactive}множ., {C:chips}+#2#{} {C:inactive}фишек)",
                    }
                }
            },
            j_abn_moon_joker = {
                name = "Лунный джокер",
                text = {
                    "Этот Джокер получает {C:mult}+#2#{} множ.",
                    "каждый раз, когда карта",
                    "{C:planet}Планеты{} используется",
                    "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.)",
                }
            },
            j_abn_motocross_joker = {
                name = "Мотокросс-джокер",
                text = {
                    {
                        "Получает {X:red,C:white}X#1#{} множ.,",
                        "когда {C:attention}#2#{} подсчитываются",
                        "{C:inactive}(Масть меняется после игры руки)",
                        "{C:inactive}(сейчас {X:red,C:white}X#3#{C:inactive} множ.)",
                    },
                    {
                        "{C:attention}Дикие карты{} получают",
                        "{C:gold}+$#4#{} и {C:chips}+#5#{} фишек при подсчете",
                        "за каждую {C:attention}Дикую карту{}",
                        "в вашей полной колоде",
                    }
                }
            },
            j_abn_movie_poster = {
                name = "Movie Poster",
                text = {
                    "Дает {C:attention}+1{} к размеру руки за каждую",
                    "{C:attention}Стальную{} карту в руке"
                }
            },
            j_abn_mult_disco = {
                name = "Диск с множителем",
                text = {
                    {
                        "{X:mult,C:white}X#1#{} множ. за каждую подсчитанную",
                        "{C:dark_edition}Негативную{} карту {C:attention}с Множителем{}",

                    },
                    {
                        "Получает {C:mult}+#2#{} множ. за каждую подсчитанную",
                        "карту {C:attention} с Множителем {C:spades}Темной{} масти",
                        "{C:inactive}(сейчас {C:mult}+#3#{C:inactive} множ.)"
                    }
                }
            },
            j_abn_mult_glass = {
                name = "Стеклянный множитель",
                text = {
                    {
                        "Если сыгранная рука содержит и карту {C:attention}с Множителем{}",
                        "и {C:attention}Стеклянную{} карту, обе получают",
                        "{C:gold}+#1#{} Вознесилы и {C:purple}+#2#{} к Счету",
                    },
                    {
                        "{C:attention}Джокеры{} {C:enhanced}с Множителем{} получают {X:chips,C:white}X#3#{} фишек, {C:enhanced}Стеклянные{}",
                        "{C:attention}Джокеры{} получают {X:chips,C:white}X#4#{} фишек, когда срабатывают"
                    },
                    {
                        "Когда {C:attention}Большой блайнд{} выбран,",
                        "создает последнюю использованную в",
                        "этой партии {C:program_pack}Программную{} карту",
                        "{C:inactive}сейчас:{} {C:program_pack}#5#{}"
                    }
                }
            },
            j_abn_chips_to_mult = {
                name = 'Множ Метью',
                text = {
                    "Когда другой Джокер дает {C:chips}фишки{},",
                    "этот Джокер дает эти фишки как {C:mult}множ.{}",
                    --"{s:0.7,C:inactive}(Не работает на Джокеров, дающих фишки после срабатывания других Джокеров){}"
                }
            },
            j_abn_mult_speed = {
                name = 'Множитель скорости',
                text = {
                    "Карты в {C:attention}четных руках{} навсегда получают {C:mult}+#1#{} множ. при подсчете",
                    "Карты в {C:attention}нечетных руках{} навсегда получают {C:chips}+#2#{} фишек при подсчете",
                    "Карты в {C:attention}последней руке раунда{} навсегда получают {C:money}$#3#",
                }
            },
            j_abn_mult_stone = {
                name = "Каменный множитель",
                text = {
                    "{C:attention}Каменные{} карты получают {C:red}красную печать{}",
                    "и {C:mult}+#1#{} множ. при подсчете",
                }
            },
            j_abn_mutually_assured_destruction = {
                name = "Взаимное уничтожение",
                text = {
                    {
                        "Любые {C:legendary}редкости{} могут",
                        "появится в {C:attention}лавке",

                    },
                    {
                        "{C:red}Уничтожает{} всех имеющихся {C:attention}Джокеров{},",
                        "если в {C:attention}лавке{} не было",
                        "куплено никаких {C:attention}Джокеров{}",
                        "{C:inactive}(Может уничтожить {C:abn_eternal}Вечных{C:inactive} Джокеров)",
                        "{C:inactive}Состояние: {B:1,C:white}#1#"
                    }
                }
            },
            --#endregion





            --#region N
            j_abn_naneinf_joker = {
                name = "NANEINF Джокер",
                text = {
                    "Растущие Джокеры растут в {C:attention}два{} раза быстрее",
                    "Перезапускает {C:attention}первого{} растущего Джокера",
                }
            },
            j_abn_napping_joker = {
                name = "Сонный джокер",
                text = {
                    "Карты {C:planet}Планет{} дают",
                    "на {C:chips}#1#%{} больше фишек",
                    "Превращется в {C:attention}Дремающего джокера{}",
                    "после {C:attention}9 {C:inactive}[#2#]{} использованных",
                    "карт {C:planet}Планет{}"
                }
            },
            j_abn_nasreddin = {
                name = "Насреддин",
                text = {
                    "{C:attention}Счастливые{} карты дают",
                    "{X:mult,C:white}^#1#{} множ., {X:chips,C:white}^#2#{} фишек или",
                    "{C:gold}+#3#{} Вознесилы при подсчете"
                }
            },
            j_abn_negative_suit = {
                name = "Негативный костюм",
                text = {
                    "Дает {C:chips}+#1#{} фишек",
                    "за каждую карту с {C:dark_edition}#3#{}",
                    "в вашей {C:attention}полной колоде",
                    "{C:inactive}(сейчас {C:chips}#2#{C:inactive} фишек)",
                }
            },
            j_abn_nerd_joker = {
                name = "Ботан",
                text = {
                    "Если в вашей {C:attention}подсчитываемой руке{}",
                    "четное количество нечетных карт,",
                    "получает {C:chips}фишки{}, равные {X:blue,C:white}X#1#{}",
                    "{C:attention}суммы{} достоинств карт",
                    "{C:inactive}(сейчас {C:blue}+#2#{C:inactive} фишек)",
                }
            },
            j_abn_newestia = {
                name = "Ньюэстия",
                text = {
                    {
                        "Карты дают {X:chips,C:white}X#1#{} фишек,",
                        "{X:mult,C:white}X#2#{} множ. и",
                        "{X:gold,C:white}X#3#{} Вознесилы при подсчете",
                    },
                    {
                        "Если у вас есть {C:attention}Абандония{},",
                        "карты дают {C:gold}+#4#{} Вознесилы",
                        "при подсчете",
                    }
                }
            },
            j_abn_newground_joker = {
                name = "Джокер с Newgrounds",
                text = {
                    "Этот Джокер получает {C:mult}+#3#{} множ.",
                    "и {C:chips}+#4#{} фишек, когда",
                    "{C:attention}Блайнд{} выбран",
                    "{C:inactive}(сейчас {C:mult}+#1#{}{C:inactive} множ., {C:chips}+#2#{} {C:inactive}фишек)"
                }
            },
            j_abn_nicotine_joker = {
                name = "Никотиновый джокер",
                text = {
                    "{C:chips}+#1#{} фишек",
                    "{C:inactive}(Удваивается, если очки загораются)"
                }
            },
            j_abn_night_comedian = {
                name = "Ночной комик",
                text = {
                    {
                        "{C:attention}Улучшенные{} карты получают {C:chips}+#5#{} фишек и",
                        "{C:mult}+#6#{} множ. за кажду карту с таким же {C:attention}улучшением{} при подсчете",
                        "Карты с {C:dark_edition}Выпуском{} получают {C:chips}+#6#{} фишек и",
                        "{C:mult}+#5#{} множ. за кажду карту с таким же {C:dark_edition}Выпуском{} при подсчете",
                    },
                    {
                        "Этот Джокер получает {C:chips}+#4#{} фишек за каждую подсчитанную",
                        "{C:attention}Улучшенную{} карту, {X:mult,C:white}X#3#{} множ. за каждую карту с {C:dark_edition}Выпуском{}",
                        "{C:inactive}(сейчас{} {X:mult,C:white}X#2#{} {C:inactive}множ., {C:chips}+#1# {C:inactive}фишек)",
                    }
                }
            },
            j_abn_nightstalker = {
                name = "Ночной охотник",
                text = {
                    {
                        "Все сыгранные карты {C:spades}темной масти{}",
                        "становятся {C:dark_edition}#3#{} при подсчете",
                    },
                    {
                        "Дает {X:mult,C:white} X#1# {} множ.",
                        "за каждую карту с {C:dark_edition}#3#{}",
                        "в вашей {C:attention}полной колоде",
                        "{C:inactive}(сейчас {X:mult,C:white} X#2# {C:inactive} множ.)",
                    }
                },
            },
            j_abn_noir_joker = {
                name = "Нуар джокер",
                text = {
                    {
                        "Добавляет {C:attention}Перевернутая{} ко всем {C:spades}Темным{} мастям",
                        "в руке, когда {C:diamonds}Светлая{} масть подсчитывается",
                    },
                    {
                        "Этот Джокер получает {C:mult}+#3#{} множ. и",
                        "{C:chips}+#4#{} фишек за каждую подсчитанную {C:attention}Перевернутую{} карту",
                        "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ., {C:chips}+#2#{} {C:inactive}фишек)",
                    }
                }
            },
            j_abn_noneuclidean_joker = {
                name = "Неевклидовый джокер",
                text = {
                    "Когда другой Джокер получает {C:chips}фишки{} или {C:mult}множ.{},",
                    "этот Джокер получает то же {C:attention}удвоенное{} количество",
                    "{C:inactive}(сейчас{} {C:chips}+#1#{} {C:inactive}фишек,{} {C:mult}+#2#{} {C:inactive}множ.){}",
                }
            },
            j_abn_number_44 = {
                name = "Номер 44",
                text = {
                    "Когда {C:attention}Блайнд{} выбран,",
                    "Дает {C:attention}#1#{} слота джокера и",
                    "заполняет их {C:attention}Джокерами",
                }
            },
            j_abn_nuruomino_joker = {
                name = "Нуруомино джокер",
                text = {
                    {
                        "{C:spades}Темные{} масти в руке получают {C:chips}+#1#{} фишек,",
                        "когда {C:program_pack}Программная{} карта использована",
                    },
                    {
                        "Повышает {C:planet}планетный{} уровень {C:attention}рангов{} карт в",
                        "{C:attention}первом{} сыгранном {C:attention}Стрите{} из {C:spades}Темных мастей{} ",
                    }
                }
            },
            --#endregion





            --#region O
            j_abn_obmij = {
                name = "Обмижд",
                text = {
                    "Дает {C:white,X:mult}Xмнож.{}, равный",
                    "числу имеющихся {C:attention}Джокеров{}",
                }
            },
            j_abn_obra_dinn = {
                name = "Обра Динн",
                text = {
                    {
                        "{C:diamonds}Светлые масти{} дают {C:mult}+1{} множ. за каждую",
                        "{C:spades}Темную масть{}, уничтоженную за эту партию",
                        "{C:inactive}(сейчас{} {C:mult}+#1#{C:inactive})",
                    },
                    {
                        "{C:spades}Темные масти{} дают {C:mult}+1{} множ.",
                        "за каждую {C:diamonds}Светлую масть{}, уничтоженную за эту партию",
                        "{C:inactive}(сейчас{} {C:mult}+#2#{C:inactive})",
                    }
                }
            },
            j_abn_odd_couple = {
                name = "Странная парочка",
                text = {
                    "Каждый сыгранный {C:attention}Туз{} или {C:attention}номерная{}",
                    "карта дают свое достоинство",
                    "как {C:mult}множ.{} при подсчете",
                }
            },
            j_abn_oddball_todd = {
                name = "Нечетнутый Тодд",
                text = {
                    "Разыгранные карты с",
                    "{C:attention}нечетным{} достоинством дают",
                    "{C:chips}+#1#{} фишек при подсчете",
                }
            },
            j_abn_oddly_thomas = {
                name = "Более нечетный Томас",
                text = {
                    "Сыгранные {C:attention}карты{}",
                    "с {C:attention}нечетным{} достоинством",
                    "навсегда получают",
                    "{C:chips}+#1#{} фишек при подсчете",
                }
            },
            j_abn_oiled_joker = {
                name = "Масляный джокер",
                text = {
                    {
                        "Если {C:attention}первый сброс{} раунда",
                        "содержит {C:abn_black_seal}Нефтяную{} карту,",
                        "она не {C:attention}поглощается{}",
                    },
                    {
                        "Сыгранные {C:abn_black_seal}Нефтяные{} карты дают {C:money}$#1#{},",
                        "{C:mult}+#2#{} множ. и {C:chips}+#3#{} фишек",
                    }
                }
            },
            j_abn_oilsplash = {
                name = "Всплеск масла",
                text = {
                    {
                        "Сыгранные, но {C:attention}не подсчитанные{}",
                        "карты становятся {C:abn_black_seal}Нефтяными{}",
                    },
                    {
                        "Если очки {C:attention}загораются{},",
                        "{C:abn_black_seal}Нефтяные{} карты не",
                        "превращаются в {C:abn_black_seal}Подожженные",
                    }
                }
            },
            j_abn_old_as_dirt = {
                name = 'Стар как мир',
                text = {
                    "Этот Джокер получает {C:white,X:mult}X#1#{} множ.",
                    "за каждый {C:money}$1{} ниже {C:red}$0{}",
                    "{C:inactive}(сейчас {C:white,X:mult}X#2#{C:inactive} множ.)"
                }
            },
            j_abn_old_growth_joker = {
                name = "Старовозрастный джокер",
                text = {
                    "Этот Джокер получает {C:mult}множ.{}, равный",
                    "{C:attention}утроенному{} {C:attention}достоинству{} подсчитанных",
                    "{C:attention}номерных{} {C:attention}Дощатых{} карт",
                    "и {C:gold}+#3#{} Вознесилы",
                    "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.,{} {C:gold}+#2#{} {C:inactive}Вознес.){}",
                }
            },
            j_abn_old_scratch = {
                name = "Старый Скретч",
                text = {
                    {
                        "Первая подсчитываемая {C:attention}#1#-ка{} получает",
                        "{C:dark_edition}Хтонический{} выпуск"
                    },
                    {
                        "Подсчитываемые {C:attention}#1#-ки{} с {C:dark_edition}Хтоническим{}",
                        "выпуском становятся {C:attention}Темнейшими{}"
                    },
                    {
                        "{C:attention}#2#{} из {C:attention}#1#-ок{} дает",
                        "свои утроенные {C:chips}фишки{} и {C:mult{}множ."
                    }
                }
            },
            j_abn_omaha_joker = {
                name = "Омаха-холдем",
                text = {
                    "Этот Джокер получает {C:mult}+#2#{} множ. за",
                    "{C:attention}каждую{} покерную комбинацию в руке,",
                    "содержащую {C:attention}5{} подсчитываемых карт",
                    "{C:inactive}(сейчас {C:mult}+#1#{} {C:inactive}множ.)"
                }
            },
            j_abn_oopsy_daisy = {
                name = "Упси Дейзи",
                text = {
                    "{C:attention}+#1#{} слотов расходников",
                    "Этот и все будущие Джокеры помещаются в {C:attention}слоты расходников{}",
                    "Если этот Джокер {C:mult}продан или уничтожен,",
                    "{C:mult}уничтожает{} всех {C:attention}Джокеров{} в {C:attention}слотах расходников{}",
                }
            },
            j_abn_origiri_triplets = {
                name = "Трио онигири",
                text = {
                    "Этот Джокер получает {C:chips}+#4#{} фишек, {C:mult}+#3#{} множ.",
                    "и {C:money}$#5#{} к {C:attention}цене продажи{}, если сумма {C:attention}достоинств{}",
                    "в подсчитываемой руке делится на {C:attention}3{}",
                    "{C:inactive}(напр.: {C:attention}3{C:inactive}, {C:attention}6{C:inactive}, {C:attention}9{C:inactive}, {C:attention}12{C:inactive})",
                    "{C:inactive}(сейчас {C:chips}+#2#{} {C:inactive}фишек, {C:mult}+#1#{} {C:inactive}множ.{C:inactive}){}",
                }
            },
            j_abn_orphic_joker = {
                name = "Угловой джокер",
                text = {
                    {
                        "Если вы играете {C:attention}#1#{} с",
                        "{C:hearts}Червами{}, {C:diamonds}Бубнами{}, {C:spades}Пиками{} и {C:clubs}Трефами{},",
                        "повышает уровень {C:attention}покерной руки{} и",
                        "получает {C:mult}+#2#{} множ.",
                        "{C:inactive}(сейчас {C:mult}+#4#{C:inactive} множ.)",
                    },
                    {
                        "Если вы играете {C:attention}#1#{} с",
                        "{C:abn_star}Звездами{}, {C:abn_moon}Лунами{}, {C:abn_crown}Коронами{} и {C:abn_talon}Талонами{},",
                        "повышает {C:planet}планетный{} уровень {C:attention}ранга{}",
                        "каждой {C:attention}подсчитанной{} карты и",
                        "получает {C:chips}+#3#{} фишек",
                        "{C:inactive}(сейчас {C:chips}+#5#{C:inactive} фишек)",
                    }
                }
            },
            j_abn_outdated_joker = {
                name = "Устаревший джокер",
                text = {
                    "Этот Джокер получает {C:chips}+#1#{} фишек и",
                    "{C:mult}+#2#{} множ., когда {C:attention}Блайнд{} побежден",
                    "с {C:attention}четным{} количеством карт",
                    "{C:inactive}(сейчас {C:chips}+#3#{} {C:inactive}фишек,{} {C:mult}+#4#{} {C:inactive}множ.){}",
                }
            },
            --#endregion





            --#region P
            j_abn_paint_by_numbers = {
                name = "Рисунок по номерам",
                text = {
                    {
                        "Если {C:attention}первая рука{} составлена только",
                        "из {C:attention}номерных {C:abn_suitless}Нулевых{} карт,",
                        "{C:attention}перезапускает{} все карты и",
                        "{C:attention}повышает уровень{} сыгранной руки"
                    },
                    {
                        "Если {C:attention}вторая рука{} составлена только",
                        "из {C:attention}номерных {C:attention}не Нулевых{} карт,",
                        "{C:attention}перезапускает{} все карты и",
                        "{C:attention}повышает уровень{} сыгранной руки"
                    }
                }
            },
            j_abn_painyatta = {
                name = "Пеиньятта",
                text = {
                    "Когда {C:attention}Ваучер{} куплен,",
                    "получите еще {C:attention}#1#{} случайных",
                    "Ваучера {C:money}бесплатно{}",
                }
            },
            j_abn_palindromic_beetle = {
                name = "Палиндромный жук",
                text = {
                    "Если {C:attention}полная рука{} - {C:attention}палиндром",
                    "и составлена и из {C:diamonds}Светлых{} и из {C:spades}Темных{} мастей,",
                    "повышает {C:planet}планетный{} уровень {C:attnention}рангов{} каждой {C:attention}подсчитанной{} карты",
                    "на количество {C:attention}повторений{} этого {C:attention}достоинства{} в руке",
                }
            },
            j_abn_pandemonium_jester = {
                name = "Пандемониум",
                text = {
                    "При покупке дает {C:attention}Подожженный{} всем Джокерам",
                    "Когда Блайнд побежден, каждый {C:attention}Подожженный{} Джокер",
                    "получает {X:mult,C:white}X#1#{} множ. за каждый раунд в руке",
                }
            },
            j_abn_pankert = {
                name = "Панкрат",
                text = {
                    "{C:white,X:chips}^#1#{} фишек, если",
                    "у вас есть {C:attention}4{} или более",
                    "расходника {C:attention}в руке{}",
                }
            },
            j_abn_paradox_chip = {
                name = "Парадоксальная фишка",
                text = {
                    "{C:attention}Номерные карты{},",
                    "достоинство которых больше {C:attention}10{},",
                    "дают свое достоинство как {C:red}множ.",
                }
            },
            j_abn_parkateo = {
                name = "Паркатео",
                text = {
                    "{C:attention}Расходники{} в руке дают {X:mult,C:white}X#1#{} множ.",
                }
            },
            j_abn_parq = {
                name = "П'арк",
                text = {
                    "Уменьшает {C:attention}требование Блайнда{} на {C:attention}#1#%{}",
                    "за каждый уникальный расходник {C:attention}в руке{}",
                    "{C:inactive}(сейчас {C:attention}#2#%{C:inactive})",
                }
            },
            j_abn_patient_zero = {
                name = "Нулевой пациент",
                text = {
                    "Когда {C:attention}Блайнд{} выбран,",
                    "добавляет {C:green}позитивную{} наклейку",
                    "к {C:attention}самому правому{} Джокеру",
                }
            },
            j_abn_paywall_joker = {
                name = "Платный доступ",
                text = {
                    "{C:attention}Перезапускает{} {C:attention}случайного{} Джокера и",
                    "забирает {C:money}${}, {C:attention}равные{} его {C:money}цене продажи{},",
                    "{C:mult}Самоуничтожается{}, если у вас {C:money}$0{} или меньше",
                }
            },
            j_abn_pearls_of_worlds = {
                name = "Жемчужины миров",
                text = {
                    "Получает {C:chips}фишки{}, равные",
                    "{C:attention}количеству{} букв в",
                    "описании сработавшего {C:attention}Джокера",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек)"
                }
            },
            j_abn_pedro_joker = {
                name = "Мой друг Джокер",
                text = {
                    "Когда {C:attention}Блайнд{} побежден,",
                    "{C:mult}уничтожает{} Джокера с наименьшей {C:money}ценой продажи{} и",
                    "добавляет {C:attention}8X{} его {C:money}стоимости{} этому Джокеру",
                    "как {C:chips}фишки{} и {C:mult}множ.{}",
                    "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.,{} {C:chips}+#2#{} {C:inactive}фишек){}",
                }
            },
            j_abn_peel_off = {
                name = "Отслоение",
                text = {
                    "Когда {C:attention}Блайнд{} выбран,",
                    "убирает все {C:attention}наклейки{} со всех",
                    "Джокеров и получает {C:white,X:mult}X#2#{} множ.",
                    "за каждую убранную наклейку",
                    "{C:inactive}(сейчас {X:mult,C:white} X#1# {} {C:inactive}множ.){}",
                }
            },
            j_abn_pentomino_joker = {
                name = "Пентамино джокер",
                text = {
                    {
                        "{C:diamonds}Светлые{} масти в руке получают {C:chips}+#1#{} фишек,",
                        "когда {C:program_pack}Программная{} карта использована",
                    },
                    {
                        "Повышает {C:planet}планетный{} уровень {C:attention}рангов{} карт в",
                        "{C:attention}первом{} сыгранном {C:attention}Стрите{} из {C:diamonds}Светлых мастей{} ",
                    }
                }
            },
            j_abn_penultimate_joker = {
                name = "Предпоследний джокер",
                text = {
                    {
                        "Перезапускает все сыгранные карты",
                        "со {C:diamonds}светлой мастью{} один раз",
                        "за каждое уникальное {C:attention}улучшение{}",
                        "на картах с {C:spades}темной мастью"
                    },
                    {
                        "Перезапускает все сыгранные карты",
                        "с {C:spades}темной мастью{} один раз",
                        "за каждое уникальное {C:attention}улучшение{}",
                        "на картах со {C:diamonds}светлой мастью"
                    }
                }
            },
            j_abn_percy = {
                name = "Перси",
                text = {
                    {
                        "Этот Джокер {C:attention}всегда{} находится {C:attention}слева{}",
                        "Когда Джокер {C:attention}срабатывает{}, получает {C:chips}фишки{}",
                        "в соответствии с его {C:attention}редкостью{}:",
                        "{C:common}Обычный{}: {C:chips}+#1#{} фишек",
                        "{C:uncommon}Необычный{}: {C:chips}+#2#{} фишек",
                        "{C:rare}Редкий{}: {C:chips}+#3#{} фишек",
                        "{C:legendary}Легендарный{}: {C:chips}+#4#{} фишек",
                    },
                    {
                        "Если у вас есть {C:attention}Пьеро{},",
                        "{C:attention}перезапускает{} каждого Джокера",
                        "за каждую {C:attention}редкость{}",
                        "{C:inactive}(сейчас{} {C:chips}+#5#{} {C:inactive}фишек)",
                    }
                }
            },
            j_abn_perfidious_comedian = {
                name = "Вероломный комик",
                text = {
                    "{C:attention}Четные{} и {C:attention}Нечетные{} карты с {C:attention}печатью{} в руке подсчитываются",
                    "Когда {C:attention}Четная{} карта с {C:attention}печатью{} подсчитывается, получает {C:mult}множ.{}, равные ее {C:attention}достоинству{}",
                    "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.,{} {C:chips}+#2#{} {C:inactive}фишек){}"
                }
            },
            j_abn_periodic_table = {
                name = "Периодическая таблица",
                text = {
                    "Создает {C:periodic}Периодическую{} карту",
                    "для сыгранной {C:attention}покерной руки{},",
                    "если очки {C:attention}загораются{}",
                }
            },
            j_abn_perrrkeo = {
                name = "Перрркео",
                text = {
                    "Балансирует {C:white,X:abn_plasma}#3#%{C:inactive}",
                    "{C:mult}множ.{} и {C:chips}фишки{},",
                    "Добавляет {C:white,X:abn_plasma}#2#%{} за каждый",
                    "расходник {C:attention}в руке",
                }
            },
            j_abn_phasetransfer_joker = {
                name = "Фазовый переводчик",
                text = {
                    "Преобразует эффекты {C:mult}+множ.{} Джокеров",
                    "в {C:gold}+Вознесилы{} в отношении {C:gold}X#1#"
                }
            },
            j_abn_phonechat_joker = {
                name = "Чат с Джокером",
                text = {
                    "Получает {C:chips}+#3#{} фишек, когда",
                    "Джокер {C:attention}справа{} срабатывает",
                    "Получает {C:mult}+#4#{} множ., когда",
                    "Джокер {C:attention}слева{} срабатывает",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек, {C:mult}+#2#{C:inactive} множ.)",
                }
            },
            j_abn_photoalbum = {
                name = "Фото-альбом",
                text = {
                    "Этот Джокер получает {C:chips}+#2#{} фишек",
                    "за каждую карту {C:attention}с лицом{} в руке,",
                    "когда {C:attention}номерная{} карта подсчитана",
                    "Сбрасывается, если сыгранная рука",
                    "содержит карту {C:attention}с лицом{}",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек){}"
                }
            },
            j_abn_photodegradation = {
                name = "Фотодеградация",
                text = {
                    {
                        "Если сыгранная рука содержит {C:attention}Спектрум{}, этот Джокер",
                        "получает {C:chips}+#4#{} фишек и {C:mult}+#5#{} множ.",
                        "за каждую карту {C:attention}в руке{} с одинаковыми {C:attention}мастями",
                    },
                    {
                        "Если этот Джокер с {C:dark_edition}выпуском{},",
                        "получает {X:mult,C:white}X#6#{} множ. за совпадающие масти",
                        "{C:inactive}(сейчас{} {X:mult,C:white}X#3#{} {C:inactive}множ.,{} {C:mult}+#2#{} {C:inactive}множ.,{} {C:chips}+#1#{} {C:inactive}фишек){}"
                    }
                }
            },
            j_abn_pierre = {
                name = "Pierre",
                text = {
                    {
                        "Этот Джокер {C:attention}всегда{} находится {C:attention}справа{}",
                        "Когда Джокер {C:attention}срабатывает{}, получает {C:mult}множ.{}",
                        "в соответствии с его {C:attention}редкостью{}:",
                        "{C:common}Обычный{}: {C:mult}+#1#{} множ.",
                        "{C:uncommon}Необычный{}: {C:mult}+#2#{} множ.",
                        "{C:rare}Редкий{}: {C:mult}+#3#{} множ.",
                        "{C:legendary}Легендарный{}: {C:mult}+#4#{} множ.",
                    },
                    {
                        "Если у вас есть {C:attention}Перси{},",
                        "{C:attention}перезапускает{} каждую карту в",
                        "подсчете за каждую {C:attention}редкость{}",
                        "{C:inactive}(сейчас{} {C:mult}+#5#{} {C:inactive}множ.)",
                    }
                }
            },
            j_abn_pincushion_joker = {
                name = "Джокер-игольница",
                text = {
                    {
                        "Перезапускает Джокера {C:attention}слева{}",
                    },
                    {
                        "Получает {X:mult,C:white}X#2#{} множ., когда Джокер перезапускается",
                        "{C:inactive}(сейчас{} {X:mult,C:white}X#1#{} {C:inactive}множ.)",
                    }
                }
            },
            j_abn_pixelgrid_joker = {
                name = "Пиксельная сетка",
                text = {
                    "Этот Джокер получает {C:mult}+#2#{} множ.,",
                    "если сыгранная рука содержит",
                    "{C:attention}четное{} количество подсчитываемых карт",
                    "{C:inactive}(сейчас {C:mult}+#1#{} {C:inactive}множ.){}",
                }
            },
            j_abn_planet_joker = {
                name = "Планета джокер",
                text = {
                    "Если {C:attention}Босс-блайнд{} побежден",
                    "за {C:attention}одну{} руку, повысить",
                    "уровень всех {C:legendary,E:1}покерных рук",
                    "на {C:attention}#1#{} уровень",
                }
            },
            j_abn_planet_rejok = {
                name = "Планета рекожд",
                text = {
                    "Дает {C:mult}множ.{} и {C:chips}фишки",
                    "всех {C:attention}типов рук{}, содержащихся",
                    "в сыгранной руке"
                }
            },
            j_abn_planetarian_joker = {
                name = "Планетарианец",
                text = {
                    {
                        "При использовании карты {C:planet}Планеты{},",
                        "получает значения ее фишек и множ.",
                        "{C:inactive}(сейчас {C:blue}+#1#{C:inactive} и {C:red}+#2#{C:inactive})",
                    },
                    {
                        "После использования {C:attention}#3# {C:inactive}[#4#]{}",
                        "уникальных {C:abn_tie}Ранговых планет{},",
                        "создает {C:spectral}Черную Дыру{}",
                        "{C:inactive}(должно быть место)",
                    }
                }
            },
            j_abn_planetary_joker = {
                name = "Планетарный джокер",
                text = {
                    "Создает карту {C:planet}Планеты{}",
                    "для сыгранной {C:attention}покерной руки{}",
                    "в {C:attention}финальной руке{} раунда",
                }
            },
            j_abn_planetoid_joker = {
                name = "Планетоид",
                text = {
                    "Добавляет {C:abn_orange_seal}оранжевую печать{}",
                    "на самую левую карту в подсчете",
                    "в вашем первом разыгранном {C:attention}Стрите"
                }
            },
            j_abn_plank_joker = {
                name = "Дощатый джокер",
                text = {
                    "{C:attention}Дощатые{} карты",
                    "получают {C:gold}+#1#{} Вознесилы",
                    "при подсчете",
                }
            },
            j_abn_plastic_joker = {
                name = "Пластиковый джокер",
                text = {
                    "Когда {C:abn_black_seal}Нефтяная{} карта превращается в {C:abn_black_seal}Подожженную{},",
                    "Повышает {C:planet}планетный{} уровень",
                    "{C:attention}наименьшего{} достоинства {C:attention}в руке{}",
                }
            },
            j_abn_plug_in_joker = {
                name = "Розетка",
                text = {
                    "Получает {C:mult}+#4#{} множ., когда карта {C:attention}с Множителем{} подсчитывается",
                    "Получает {C:chips}+#5#{} фишек, когда {C:attention}Бонусная{} карта подсчитывается",
                    "Получает {C:gold}+#6#{} Вознесилы, когда {C:attention}Дощатая{} карта подсчитывается",
                    "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.,{} {C:chips}+#2#{} {C:inactive}фишек,{} {C:gold}+#3#{} {C:inactive}Вознес.){}",
                }
            },
            j_abn_polychameleon = {
                name = "Полихамелеон",
                text = {
                    {
                        "{C:dark_edition}Голографические{} Джокеры дают {X:mult,C:white}X#1#{} множ.",
                        "{C:dark_edition}Полихромные{} Джокеры дают {C:mult}+#2#{} множ.",
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Голографический{},",
                        "он получает {X:chips,C:white}X#3#{} фишек,",
                        "когда {C:dark_edition}Голографический{} или",
                        "{C:dark_edition}Полихромный{} Джокер срабатывает",
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Полихромный{},",
                        "он получает {C:chips}+#4#{} фишек,",
                        "когда {C:dark_edition}Голографический{} или",
                        "{C:dark_edition}Полихромный{} Джокер срабатывает",
                        "{C:inactive}(сейчас{} {X:chips,C:white}X#6#{} {C:inactive}фишек,{} {C:chips}+#5#{} {C:inactive}фишек){} ",
                    }
                }
            },
            j_abn_polyolic_joker = {
                name = "Переливчатый джокер",
                text = {
                    {
                        "Все сыгранные карты {C:diamonds}светлой масти{}",
                        "становятся {C:dark_edition}#3#{} при подсчете",
                    },
                    {
                        "Дает {X:mult,C:white} X#1# {} множ.",
                        "за каждую карту с {C:dark_edition}#3#{}",
                        "в вашей {C:attention}полной колоде",
                        "{C:inactive}(сейчас {X:mult,C:white} X#2# {C:inactive} множ.)",
                    }
                }
            },
            j_abn_pong_joker = { -- I dont know who write this way but u scare me. with love, Marffe
                name = "Понг джокер",
                text = {
                    "Если сыгранный {C:attention}Стрит{} содержит только",
                    "{C:spades}Темные масти{}, этот Джокер получает",
                    "{X:chips,C:white}X#4#{} фишек, получает {X:mult,C:white}X#3#{} множ.",
                    "если {C:attention}Стрит{} содержит только {C:diamonds}Светлые масти{}",
                    "{C:inactive}(сейчас{} {X:mult,C:white}X#1#{} {C:inactive}множ.,{} {X:chips,C:white}X#2#{} {C:inactive}фишек){}",
                }
            },
            j_abn_ponzi = {
                name = "Понзи",
                text = {
                    "Потеряйте {C:money}$#1#{} за каждую сыгранную карту,",
                    "Каждая карта получает {C:mult}множ.{}",
                    "равный {C:attention}потерянным{} $ при подсчете"
                }
            },
            j_abn_porke = {
                name = "Порке",
                text = {
                    "Джокеры дают {X:chips,C:white}X#1#{} фишек",
                    "за каждый уникальный расходник {C:attention}в руке{}",
                    "{C:inactive}(сейчас {X:chips,C:white}X#2#{} {C:inactive}множ.){}",
                }
            },
            j_abn_portal_joker = {
                name = "Джокер из Portal",
                text = {
                    "{C:attention}Стриты{} могут идти",
                    "в обратную сторону",
                    "{C:inactive}(напр.: {C:attention}Д К Т 2 3{C:inactive})",
                }
            },
            j_abn_power_four = {
                name = "Суперчетвёрка",
                text = {
                    "Перезапускает все карты в руках,",
                    "которые содержат {C:attention}4{} или более {C:attention}масти{},",
                    "этот Джокер получает {X:mult,C:white}X#2#{} множ.",
                    "за каждую использованную уникальную масть",
                    "{C:inactive}(сейчас {X:mult,C:white}X#1#{C:inactive} множ.)",
                }
            },
            j_abn_ppe_joker = {
                name = "СИЗ-Джокер",
                text = {
                    "{X:mult,C:white}X#1#{} множ. за",
                    "каждого {C:red}ослабленного{} Джокера",
                    "{C:inactive}(сейчас {X:mult,C:white}X#2#{C:inactive} множ.)"
                }
            },
            j_abn_pracheo = {
                name = "Прачео",
                text = {
                    "Перезапускает карты {C:attention}1{} раз",
                    "за каждый уникальный расходник {C:attention}в руке{}",
                    "{C:inactive}(сейчас{} {C:attention}#1#{} {C:inactive}Перезапусков)",
                }
            },
            j_abn_prehistoric_joker = {
                name = "Доисторический джокер",
                text = {
                    "Этот Джокер получает {C:white,X:mult}X#2#{} множ., когда",
                    "{C:attention}Каменная карта{} подсчитывается, и {C:white,X:chips}X#4#{} фишек,",
                    "когда {C:attention}Ископаемая карта{} подсчитывается",
                    "{C:inactive}(сейчас {C:white,X:chips}X#3#{C:inactive} фишек, {C:white,X:mult}X#1#{C:inactive} множ.)",
                }
            },
            j_abn_prenatural_joker = {
                name = "Предъестественный джокер",
                text = {
                    {
                        "Сыгранные {C:attention}улучшенные{} {C:attention}нечетные{}",
                        "карты дают {X:chips,C:white}X#4#{} фишек при подсчете,",
                        "увеличивает бонус на {X:chips,C:white}X#3#{}, когда",
                        "карта подсчитывается"
                    },
                    {
                        "Разыгранные {C:attention}нечетные{} карты",
                        "имеют шанс {C:green}#1# к #2#{} создать",
                        "{C:attention}Ваучер{} при подсчете",
                    }
                }
            },
            j_abn_prime_paul = {
                name = "Простой Пол",
                text = {
                    "Сыгранные {C:attention}#1#{}, {C:attention}#2#{}, {C:attention}#3#{},",
                    "{C:attention}#4#{}, {C:attention}#5#{} и {C:attention}#6#{} дают",
                    "{X:mult,C:white}X#7#{} множ. при подсчете"
                }
            },
            j_abn_primogeniture_joker = {
                name = "Первенец",
                text = {
                    {
                        "{C:common}Обычные{} Джокеры {C:money}бесплатные{}",
                        "{C:common}Обычные{} Джокеры",
                        "дают {X:mult,C:white}X#1#{} множ.",
                    },
                    {
                        "Если у вас есть {C:attention}Джокер{},",
                        "этот Джокер получает {C:chips}+#2#{} фишек,",
                        "когда {C:common}Обычный{} Джокер срабатывает",
                        "{C:inactive}(сейчас{} {C:chips}+#3#{} {C:inactive}фишек){} ",
                    }
                }
            },
            j_abn_prizefighter_inferno = {
                name = "Сезонный чемпион Инферно",
                text = {
                    "Получает {X:chips,C:white}X#3#{} фишки, когда",
                    "{C:attention}Тег{} срабатывает, получает {X:mult,C:white}X#4#{} множ.,",
                    "если это был {C:abn_hazard}Тег бедствия",
                    "{C:inactive}(сейчас {X:chips,C:white}X#1#{C:inactive} фишек, {X:mult,C:white}X#2#{C:inactive} множ.)"
                }
            },
            j_abn_prizefighter_joker = {
                name = "Сезонный чемпион",
                text = {
                    {
                        "Если {C:attention}размер{} сыгранной руки больше {C:attention}#1#{},",
                        "получает {C:chips}+#2#{} фишек и {C:mult}+#3#{} множ.",
                        "{C:inactive}(сейчас {C:chips}+#4#{C:inactive} фишек и {C:mult}+#5#{C:inactive} множ.)"

                    },
                    {
                        "Если {C:attention}размер{} сыгранной руки {C:attention}вдвое{} больше {C:attention}#1#{},",
                        "{C:attention}удваивает{} {C:chips}фишки{} и {C:mult}множ.{} этого Джокера",
                        "{C:inactive}(Размер руки сбрасывается, когда Блайнд побежден)"
                    }
                }
            },
            j_abn_propagator_joker = {
                name = "Вирусный джокер",
                text = {
                    "Карты дают {X:mult,C:white}^2.0{} множ. при подсчете за каждую",
                    "карту с такими же {C:attention}достоинством{} и {C:attention}мастью{},",
                    "Шанс {C:green}#1# к #2#{} создать",
                    "копию {C:attention}первой{} карты в подсчете",
                }
            },
            j_abn_proxy_joker = {
                name = 'Прокси-джокер',
                text = {
                    "Если все ваши Джокеры - {C:dark_edition}модовые{}",
                    "и сыграна {C:dark_edition}модовая{} {C:attention}рука{}",
                    "только с {C:dark_edition}модовыми{} мастями, этот Джокер",
                    "получает {C:gold}+#1#{} Вознес. за каждую карту в подсчете",
                    "{C:inactive}(сейчас {C:gold}+#2#{C:inactive} Вознес.)",
                }
            },
            j_abn_psychokinesis_joker = {
                name = "Психокинетический джокер",
                text = {
                    {
                        "{C:attention}Стальные{} и {C:attention}Золотые{} карты",
                        "в руке становятся {C:dark_edition}Обратными{}",
                        "на первой руке раунда"
                    },
                    {
                        "{C:dark_edition}Обратные{} карты дают",
                        "{C:gold}$#1#{} при подсчете"
                    }
                }
            },
            j_abn_puddles = {
                name = "Падлз",
                text = {
                    "{X:mult,C:white}X#2#{} множ. за каждого Джокера {C:attention}справа{}",
                    "{C:inactive}(сейчас{} {X:mult,C:white}X#1#{} {C:inactive}множ.){}",
                }
            },
            j_abn_punk_joker = {
                name = "Панк джокер",
                text = {
                    {
                        "Добавляет {C:dark_edition}Негативный{} к",
                        "первой подсчитываемой карте {C:abn_suitless}Нулей{}",
                    },
                    {
                        "Этот Джокер получает {C:white,X:chips}X#2#{} множ. когда",
                        "{C:dark_edition}Негативная{} карта {C:abn_suitless}Нулей{} подсчитана",
                        "{C:inactive}(сейчас {C:white,X:chips}X#1#{C:inactive} фишек)",
                    }
                }
            },
            --#endregion





            --#region Q
            j_abn_qrcode_joker = {
                name = "QR-код",
                text = {
                    "Создает {C:program_pack}Программную{} карту",
                    "когда {C:attention}Блайнд{} выбран",
                    "{C:inactive}(должно быть место)",
                }
            },
            j_abn_quadratic_joker = {
                name = "Прямоугольный джокер",
                text = {
                    {
                        "{C:attention}Стриты{}, содержащие {C:attention}4{} масти получают",
                        "следующие {C:dark_edition}выпуски{}, начиная с {C:attention}наименьшего{} достоинства",
                        "{C:inactive,s:0.8}({C:dark_edition,s:0.8}Блестящий{C:inactive,s:0.8}, {C:dark_edition,s:0.8}Переливающийся{C:inactive,s:0.8}, {C:dark_edition,s:0.8}Перламутровый{C:inactive,s:0.8}, {C:dark_edition,s:0.8}Хроматический{C:inactive,s:0.8})",
                    },
                    {
                        "Карты {C:attention}в руке{} с",
                        "таким же {C:attention}достоинством{} или {C:attention}мастью{}",
                        "как и подсчитываемые карты, так же подсчитываются",
                    }
                }
            },
            --#endregion





            --#region R
            j_abn_rage_baiter = {
                name = "Рейджбайтер",
                text = {
                    "Уменьшает уровень разыгранных {C:attention}покерных рук{}",
                    "и получает {C:chips}+#3#{} фишек и {C:red}+#4#{} множ.",
                    "{C:inactive}(сейчас {C:blue}+#1#{C:inactive} фишек и {C:red}+#2#{C:inactive} множ.)",
                }
            },
            j_abn_ram_joker = {
                name = "RAM-Джокер",
                text = {
                    {
                        "Этот Джокер получает {C:white,X:mult}X#4#{} фишек,",
                        "когда {C:dark_edition}модовый{} расходник продан,",
                        "получает {C:white,X:mult}X#2#{} множ., когда",
                        "{C:inactive}ванильный{} расходник продан,",
                        "{C:inactive}(сейчас {C:white,X:mult}X#1#{} фишек, {C:white,X:mult}X#3#{C:inactive} множ.)"
                    },
                    {
                        "Когда {C:attention}Большой блайнд{} выбран, создает",
                        "последнюю использованную в этой",
                        "партии {C:ram}RAM{} карту",
                        "{C:inactive}(сейчас{} {C:ram}#5#{C:inactive})"
                    }
                }
            },
            j_abn_rampegous_jester = {
                name = "Потрясающий шут",
                text = {
                    {
                        "Если у вас {C:attention}четное{} количество {C:rare}Редких{} Джокеров,",
                        "и {C:attention}четное{} количество карт в подсчете,",
                        "этот и все другие {C:rare}Редкие{} Джокеры получают",
                        "{X:mult,C:white}X#2#{} множ. за каждую карту в подсчете",
                    },
                    {
                        "Если у вас {C:attention}нечетное{} количество {C:common}Обычных{} Джокеров,",
                        "и {C:attention}нечетное{} количество карт в подсчете,",
                        "этот и все другие {C:common}Обычные{} Джокеры получают",
                        "{C:chips}+#1#{} фишек за каждую карту в подсчете",
                    }
                }
            },
            j_abn_rando_jester = {
                name = "Шут Рандо",
                text = {
                    {
                        "{C:clubs}Трефы{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#2#{}",
                        "когда {C:clubs}Трефы{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "{C:clubs}Трефы{} увеличивают шанс",
                        "следующей {C:green}вероятности{} на {C:attention}#3#{}",
                        "{C:inactive,s:0.8}(напр.: {C:green,s:0.8}1 к 4{C:inactive,s:0.8} -> {C:green,s:0.8}2 к 4{C:inactive,s:0.8} -> {C:green,s:0.8}3 к 4{C:inactive,s:0.8})",
                    }
                }
            },
            j_abn_random_encounter = {
                name = "Случайная встреча",
                text = {
                    {
                        "Дает {C:mult}+#1#{} множ. когда",
                        "срабатывает эффект {C:chips}+фишек{}",
                        "другого {C:attention}Джокера{}"
                    },
                    {
                        "Множ. увеличивается на {C:mult}+#2#{},",
                        "когда {C:attention}Блайнд{} побежден"
                    }
                }
            },
            j_abn_ransom_joker = {
                name = "Джокер в заложниках",
                text = {
                    {
                        "Теряете {C:money}$#3#{} за каждого имеющегося",
                        "Джокера в конце раунда",
                    },
                    {
                        "Когда {C:attention}Джокер{} продан",
                        "или уничтожен, шанс {C:green}#1# к #2#{}",
                        "создать Джокера {C:attention}редкостью выше{}"
                    }
                }
            },
            j_abn_ransomware_joker = {
                name = "Вирус-вымогатель",
                text = {
                    "Когда следующий {C:attention}расходник{} используется, применяет один из эффектов:",
                    "{C:tarot}Таро{}: все Джокеры получают {C:chips}+#1#{} фишек и вы теряете {C:money}$#2#",
                    "{C:spectral}Спектральные{}: все Джокеры получают {C:chips}+#3#{} фишек и вы теряете {C:money}$#4#",
                    "{C:abn_calamity}Бедствий{}: значения фишек всех Джокеров увеличены на {X:chips,C:white}^#5#{} и вы теряете {C:money}$#6#",
                    "{C:abn_snow}Прогноз погоды{}: все Джокеры получают {C:mult}+#7#{} множ. и вы теряете {C:money}$#8#",
                    "{C:astro_cards}Астро{}: все Джокеры получают {C:mult}+#9#{} множ. и вы теряете {C:money}$#10#",
                    "{C:nightshift_cards}Полночные{}: значения множ. всех Джокеров увеличены на {X:mult,C:white}^#11#{}",
                }
            },
            j_abn_rectangular_joker = {
                name = "Квадратнейший джокер",
                text = {
                    "Этот Джокер получает {C:gold}+#2#{} Вознесилы,",
                    "если в сыгранной руке",
                    "ровно {C:attention}6{} подсчитываемых карт",
                    "{C:inactive}(сейчас {C:gold}+#1#{C:inactive} Вознес.)"
                }
            },
            j_abn_recycled_joker = {
                name = "Переработка",
                text = {
                    "{C:attention}Сброшенные{} карты",
                    "возвращаются в колоду"
                }
            },
            j_abn_regalia_joker = {
                name = "Регалии джокера",
                text = {
                    {
                        "Получите {C:money}$#1#{}, если {C:attention}покерная рука{} - это",
                        "{C:attention}#2#{} или {C:attention}#3#{}",
                    },
                    {
                        "Если {C:attention}покерная рука{} - это {C:attention}#3#{},",
                        "повысьте {C:planet}планетный{} уровень {C:attention}ранга{}",
                        "всех подсчитанных карт",
                    }
                }
            },
            j_abn_reggy_jester = {
                name = "Шут Регги",
                text = {
                    {
                        "{C:abn_snow}Снежинки{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#2#{}",
                        "когда {C:abn_snow}Снежинка{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "{C:abn_snow}Снежинки{} понижают {C:attention}требование{}",
                        "{C:attention}блайнда{} на {C:attention}#3#%{} при подсчете"
                    }
                }
            },
            j_abn_rekoj_esrever = {
                name = "Рекожд йынтарбо",
                text = {
                    {
                        "{C:attention}Перевернутые{} карты",
                        "переворачиваются после",
                        "их подсчета"
                    },
                    {
                        "Получает {C:mult}+#2#{} множ. и {C:chips}+#3#{} фишек",
                        "за каждую {C:attention}исправленную{}",
                        "таким образом карту",
                        "{C:inactive}(сейчас {C:chips}+#4#{C:inactive} фишек, {C:mult}+#1#{C:inactive} множ.)",
                    }
                }
            },
            j_abn_rereleased_special_collector_edition = {
                name = "Переизданное cпециальное коллекционное издание",
                text = {
                    "Если сыгранная рука содержит карты с {C:dark_edition}выпуском{},",
                    "имеет {C:attention}четное{} кол-во {C:inactive}ванильных{} и",
                    "{C:attention}нечетное{} кол-во {C:dark_edition}модовых выпусков{} и наоборот,",
                    "Этот Джокер получает {C:gold}+#2#{} Вознес., умноженное",
                    "на число {C:attention}четных{} {C:dark_edition}выпусков{}",
                    "{C:inactive}(сейчас {C:gold}+#1# {C:inactive}Вознес.)"
                }
            },
            j_abn_respectable = {
                name = "Респектабельный джокер",
                text = {
                    "Когда первая карта",
                    "{C:attention}без улучшения{} подсчитывается,",
                    "этот Джокер получает ее",
                    "{C:attention}достоинство{} как {C:mult}множ.{}",
                    "{C:inactive}(сейчас {C:mult}+#1#{}{C:inactive} множ.)"
                }
            },
            j_abn_reversecard_joker = {
                name = "Реверс-карта",
                text = {
                    {
                        "Если сыгранная рука содержит и",
                        "{C:attention}перевернутую{} карту и карту {C:attention}лицом вверх{},",
                        "переворачивает все карты в подсчете,",
                    },
                    {
                        "Получает {C:attention}достоинство{} карты, {C:attention}перевернутой лицом вверх{}, как {C:chips}фишки{},",
                        "получает {C:mult}множ.{} вместо фишек для карт, {C:attention}перевернутых лицом вниз{}",
                        "{C:inactive}(сейчас{} {C:mult}+#2#{} {C:inactive}множ.,{} {C:chips}+#1#{} {C:inactive}фишек){}",
                    },
                    {
                        "Если этот Джокер {C:attention}перевернутый{},",
                        "{C:attention}Перевернутые{} карты дают удвоенное",
                        "количество {C:chips}фишек{} и {C:mult}множ.{}",
                    }
                }
            },
            j_abn_richard = {
                name = "Ричард",
                text = {
                    {
                        "1 карта принудительно",
                        "выбирается всегда",
                    },
                    {
                        "Карты, выбранные {C:attention}принудительно{} дают {X:mult,C:white}X#1#{} множ.,",
                        "Перезапускает {C:attention}принудительно{} выбранные карты",
                        "одни раз за каждую карту {C:attention}в руке{}",
                        "с такой же {C:attention}мастью{}",
                    }
                }
            },
            j_abn_ridiculous_joker = {
                name = "Пог",
                text = {
                    {
                        "Если все {C:attention}сыгранные{} карты {C:attention}четные{},",
                        "а все карты {C:attention}в руке{} {C:attention}нечетные{},",
                        "получает {C:mult}множ.{}, равный сумме достоинств всех карт",
                    },
                    {
                        "Если все карты {C:attention}в руке{} {C:attention}четные{},",
                        "а все {C:attention}сыгранные{} карты {C:attention}нечетные{},",
                        "получает {C:chips}фишки{}, равные сумме достоинств всех карт",
                        "{C:inactive}(сейчас {C:red}+#1#{C:inactive} множ., {C:blue}+#2#{C:inactive} фишек)",
                    }
                }
            },
            j_abn_rival_photograph = {
                name = "Фотография соперника",
                text = {
                    "Первая разыгранная {C:attention}номерная{}",
                    "карта дает {X:mult,C:white}X#1#{} множ.",
                    "при подсчете",
                }
            },
            j_abn_robert_jester = {
                name = "Шут Роберт",
                text = {
                    {
                        "{C:clubs}Трефы{} дают {X:chips,C:white}X#1#{} фишек",
                        "при подсчете, фишки увеличиваются на {X:chips,C:white}X#2#{}",
                        "когда {C:clubs}Трефа{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{},",
                        "сыгранные {C:clubs}Трефы{} навсегда",
                        "получают {C:money}$#3#{} за каждый оставшийся",
                        "сброс при подсчете"
                    }
                }
            },
            j_abn_rom_hack_balatro = {
                name = "Пиратская версия",
                text = {
                    "{C:inactive}Ванильные{} Джокеры дают",
                    "{X:mult,C:white}X#1#{} множ., {X:chips,C:white}X#2#{} фишек, и {C:money}$#3#{}",
                }
            },
            j_abn_rorrim = {
                name = 'еинежартО',
                text = {
                    {
                        "Когда {C:attention}Стеклянная{} карта подсчитывается,",
                        "каждая не стеклянная карта в подсчете",
                        "получает {C:chips}+#2#{} фишек и {C:mult}+#1#{} множ.",
                        "за каждую карту в подсчете"
                    },
                    {
                        "Когда {C:attention}Стеклянная карта{} ломается,",
                        "другие карты в подсчете",
                        "{C:attention}удваивают{} свои базовые фишки"
                    }
                }
            },
            j_abn_rough_draft_joker = {
                name = "Грубый набросок",
                text = {
                    "{C:attention}Счастливые{} карты {C:abn_suitless}Нулей{} при подсчете имеют:",
                    "шанс {C:green}#1# к #2#{} получить {C:chips}+#5#{} фишек",
                    "шанс {C:green}#1# к #3#{} получить {C:chips}+#6#{} фишек,",
                    "шанс {C:green}#1# к #4#{} {C:attention}удвоить{}",
                    "{C:chips}фишки{} всех карт в подсчете",
                }
            },
            j_abn_royal_order = {
                name = "Королевский порядок",
                text = {
                    "Если подсчитываемые карты расположены в таком порядке:",
                    "{C:hearts}Черви{} {C:diamonds}Бубны{} {C:clubs}Трефы{} {C:spades}Пики{}",
                    "повышает уровень сыгранной руки на {C:attention}#1#",
                    "и дает {X:mult,C:white}X#2#{} множ.",
                }
            },
            j_abn_rubicante = {
                name = "Рубиканте",
                text = {
                    "{C:attention}Четные{} карты дают {C:mult}множ.{},",
                    "равный их {C:attention}утроенному{} достоинству при подсчете",
                }
            },
            j_abn_ruin_bastion = {
                name = "Разрушенный бастион",
                text = {
                    "Когда {C:attention}Блайнд{} выбран,",
                    "добавляет {C:dark_edition}#1#{}",
                    "{C:attention}самому правому{} Джокеру"
                }
            },
            j_abn_ruination_joker = {
                name = "Разрушительный джокер",
                text = {
                    {
                        "Сыгранные карты дают {X:mult,C:white}^1.8{} множ. и {X:chips,C:white}^1.8{} фишек",
                        "за каждую {C:attention}уникальную{} масть в подсчитываемой руке",
                    },
                    {
                        "Если сыгранная рука содержит {C:attention}Спектрум{},",
                        "{C:attention}повыешает{} {C:planet}планетный{} уровень {C:attention}рангов{} всех карт",
                    },
                    {
                        "Если у этого Джокера есть {C:dark_edition}выпуск{},",
                        "перезапускает все сыгранные карты",
                    }
                }
            },
            j_abn_ruinous_joker = {
                name = "Губительный джокер",
                text = {
                    {
                        "{C:attention}+#1#{} слот губительной силы",
                    },
                    {
                        "Если вы должны {C:red}проиграть забез{}",
                        "из-за карты {C:ruinous_power}Губительной силы{},",
                        "этот Джокер {C:mult}уничтожается{} вместо этого",
                    }
                }
            },
            j_abn_runedelta = {
                name = "Runedelta",
                text = {
                    "Этот Джокер получает {C:mult}+#3#{} множ., если",
                    "{C:attention}победная рука{} содержит только {C:spades}Темные масти{},",
                    "получает {C:chips}+#4#{} фишек, если она содержит только {C:diamonds}Светлые масти{}",
                    "{C:red,s:0.8}самоуничтожается, если рука содержит и темные и светлые масти",
                    "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.,{} {C:chips}+#2#{} {C:inactive}фишек){}",
                }
            },
            j_abn_runedelta_disc2 = {
                name = "Runedelta: Диск 2",
                text = {
                    {
                        "Первая подсчитываемая карта с {C:dark_edition}выпуском{} с {C:inactive}(четность){} достоинством",
                        "перезапускается один раз за каждого Джокера",
                        "с таким же {C:dark_edition}выпуском{}, этот Джокер",
                        "получает {C:inactive}(награду){} за каждый перезапуск",
                    },
                    {
                        "{C:inactive}(напр.: четность: награда)",
                        "{C:attention}Четный{}: {X:mult,C:white}X#3#{} множ.",
                        "{C:attention}Нечетный{}: {X:chips,C:white}X#4#{} фишек",
                        "{C:inactive}(сейчас {X:mult,C:white}X#1#{} {C:inactive}множ., {X:chips,C:white}X#2#{} {C:inactive}фишек){}"
                    },
                    {
                        "Если этот Джокер с {C:dark_edition}выпуском{},",
                        "{C:attention}Джокеры{} с {C:dark_edition}выпуском{}",
                        "не могут быть {C:red}ослаблены{}",
                    }
                }
            },
            j_abn_russian_roulette = {
                name = "Русская рулетка",
                text = {
                    {
                        "Все {C:attention}Наборы{} стоят {C:money}$1{}, но",
                        "расходники имеют шанс {C:green}#1# к #2#{}",
                        "{C:mult}не сработать{}"
                    },
                    {
                        "Все {C:attention}Джокеры{} стоят {C:money}$1{},",
                        "но получают {C:mult}Хрупкий{} при покупке"
                    },
                    {
                        "Когда {C:green}вероятность{} успешно",
                        "срабатывает, получите {C:money}$#3#{}"
                    }
                }
            },
            --#endregion





            --#region S
            j_abn_sacred_bleu = {
                name = 'Священный Блю',
                text = {
                    "Этот Джокер получает {C:white,X:chips}X#2#{} фишек",
                    "за каждую уникальную {C:attention}масть{} и {C:chips}+#4#{} фишек",
                    "за каждое уникальное {C:attention}достоинство{} в сыгранной руке",
                    "{C:inactive}(сейчас {C:chips}+#3#{C:inactive} фишек, {C:white,X:chips}X#1#{} {C:inactive}фишек)",
                },
            },
            j_abn_sacred_rouge = {
                name = 'Священный Ред',
                text = {
                    "Этот Джокер получает {C:white,X:mult}X#2#{} множ.",
                    "за каждую уникальную {C:attention}масть{} и {C:mult}+#4#{} множ.",
                    "за каждое уникальное {C:attention}достоинство{} в сыгранной руке",
                    "{C:inactive}(сейчас {C:mult}+#3#{C:inactive} множ., {C:white,X:mult}X#1#{} {C:inactive}множ.)",
                }
            },
            j_abn_sailor_joker = {
                name = "Матрос",
                text = {
                    {
                        "{C:attention}Нечетные{} карты",
                        "дают {C:chips}+#1#{} фишек, когда",
                        "сыграны, но не подсчитаны"
                    },
                    {
                        "Перезапускает сыгранные",
                        "{C:attention}Океанические{} карты",
                    }
                }
            },
            j_abn_salvation_tag = {
                name = "Тег спасения",
                text = {
                    "Когда {C:inactive}ванильный{} тег получен",
                    "преобразует его в {C:abn_hazard}Бедственный{} вариант",
                }
            },
            j_abn_sanguine_treasure = {
                name = "Сокровище надежды",
                text = {
                    "{C:attention}Золотые{} карты дают",
                    "удвоенное количество своих",
                    "{C:chips}фишек{} и {C:money}денег{} при подсчете",
                }
            },
            j_abn_saturated_joker = {
                name = "Перенасыщенный джокер",
                text = {
                    {
                        "{C:abn_coin}Монеты{}, {C:abn_baton}Дубины{},",
                        "{C:abn_chalice}Чаши{} и {C:abn_sword}Мечи{}",
                        "навсегда получают {C:mult}+#1#{} множ.",
                        "при подсчете",
                    },
                    {
                        "Этот Джокер получает {C:chips}#2#{} фишек",
                        "за каждую подсчитанную карту",
                        "с {C:dark_edition}Винтажным{} выпуском",
                        "{C:inactive}(сейчас {C:chips}+#3#{C:inactive} фишек)",
                    }
                }
            },
            j_abn_savy_joker = {
                name = "Смекалистый джокер",
                text = {
                    "{C:mult}+#1#{} множ., если сыгранная",
                    "рука содержит",
                    "{C:attention}#2# четных{} карт",
                }
            },
            j_abn_scantron_joker = {
                name = "Джокер-бланк",
                text = {
                    "{C:attention}Счестливые{} карты дают {X:chips,C:white}^#1#{} фишек при подсчете",
                    "{C:attention}Бонусные{} карты дают {X:mult,C:white}^#2#{} множ. при подсчете",
                    "{C:attention}Золотые{} карты дают {X:chips,C:white}^#3#{} фишек при подсчете",
                    "{C:attention}Дикие{} карты дают {X:mult,C:white}^#4#{} множ. при подсчете",
                }
            },
            j_abn_scrabble_joker = {
                name = "Эрудит",
                text = {
                    "Этот Джокер получает {X:mult,C:white}X#2#{} множ. каждый",
                    "раз, когда карта {C:lexica}Лексики{} активируется",
                    "{C:red}Сбрасывается{}, если карта {C:lexica}Лексики{} продана",
                    "{C:inactive}(сейчас {X:mult,C:white}X#1#{C:inactive} множ.)",
                }
            },
            j_abn_scrapbook_joker = {
                name = "Альбом для вырезок",
                text = {
                    "Когда {C:attention}Блайнд{} выбран,",
                    "{C:attention}Джокеры{} получают {C:chips}+#1#{} фишек",
                    "за каждую {C:attention}Наклейку{} на нем"
                }
            },
            j_abn_seal_edition_joker = {
                name = "Печатное издание",
                text = {
                    "Каждый Джокер получает {C:mult}+#1#{} множ.",
                    "за каждую уникальную {C:attention}печать{}",
                    "в подсчитываемой руке",
                }
            },
            j_abn_seal_letter = {
                name = "Письмо с печатью",
                text = {
                    "Перезапускает все сыгранные",
                    "карты с {C:red}красной печатью{}",
                }
            },
            j_abn_shadowy_joker = {
                name = "Милая тень",
                text = {
                    "Все карты и наборы в лавке",
                    "продаются с {C:attention}#1#%{} скидкой,",
                    "Все {C:attention}карты{} и {C:attention}Джокеры{}",
                    "перевернуты"
                }
            },
            j_abn_sharpshooter = {
                name = "Стрелок",
                text = {
                    "Перезапускает все сыгранные",
                    "{C:attention}Дикие карты{} за каждую",
                    "{C:attention}Дикую карту{} в подсчете,",
                    "шанс {C:green}#1# к #2#{} уничтожить",
                    "сыгранную {C:attention}Дикую карту{}"
                }
            },
            j_abn_sherlock_joker = {
                name = "Шерлок",
                text = {
                    {
                        "Раскрывает имя",
                        "выбранной {C:attention}перевернутой{} карты",
                        "{C:inactive}(#1#){}",
                    },
                    {
                        "Показывает следующую карту,",
                        "которая будет {C:attention}вытянута",
                        "{C:inactive}(#2#){}",
                    }
                }
            },
            j_abn_shovel_knight = {
                name = "Лопатный рыцарь",
                text = {
                    "Добавляет одну {C:attention}Ископаемую{}",
                    "карту в вашу колоду, когда",
                    "{C:attention}Блайнд{} выбран",
                },
            },
            j_abn_shrewd_joker = {
                name = "Проницательный джокер",
                text = {
                    "{C:chips}+#1#{} фишек, если сыгранная",
                    "рука содержит",
                    "{C:attention}#2# нечетных{} карт",
                }
            },
            j_abn_shy_gall = {
                name = "Стесняшка",
                text = {
                    "Повышает уровень сыгранной",
                    "{C:attention}руки{}, если она содержит",
                    "только {C:attention}перевернутые{} карты"
                }
            },
            j_abn_sigil_joker = {
                name = "Символьный джокер",
                text = {
                    {
                        "Когда {C:attention}Босс-блайнд{} выбран,",
                        "создает карту {C:sigils}Символа{} для",
                        "{C:attention}последней сыгранной{} руки",
                    },
                    {
                        "{C:sigils}Символьные паки{} можно пропустить",
                    }
                }
            },
            j_abn_skinny_joker = {
                name = "Тощий джокер",
                text = {
                    "Получает {C:chips}+#3#{} фишек {C:mult}+#4#{} множ.,",
                    "когда {C:attention}Блайнд{} выбран без",
                    "расходников {C:attention}в руке",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек и {C:mult}+#2#{C:inactive} множ.)"
                }
            },
            j_abn_slippery_joker = {
                name = "Осторожно, скользко!",
                text = {
                    {
                        "Когда {C:weather_report}Прогноз пгоды{} использован,",
                        "добавляет {C:dark_edition}Заброшенный{} выпуск к",
                        "самой {C:attention}низкоранговой{} карте в руке",
                    },
                    {
                        "Этот Джокер получает",
                        "{C:chips}+#4#{} фишек и {C:mult}+#2#{} множ., когда",
                        "{C:dark_edition}Заброшенная{} карта подсчитывается",
                        "{C:inactive}(сейчас {C:chips}+#3#{C:inactive} фишек, {C:mult}+#1#{C:inactive} множ.)",
                    }
                }
            },
            j_abn_slot_machine = {
                name = "Слот-машина",
                text = {
                    {
                        "{C:attention}Перечисленные{} {C:green,E:1,S:1.1}вероятности{} всегда",
                        "{C:green}удаются{}, но стоят {C:money}$5{}, если",
                        "у вас нет {C:attention}Золотого джокера",
                    },
                    {
                        "Если {C:attention}покерная рука{} - это",
                        "{C:attention}#2#{}, перезапускает и повышает",
                        "уровень сыгранной руки",
                    }
                }
            },
            j_abn_sloth = {
                name = "Лень",
                text = {
                    {
                        "Все возможные {C:attention}Джокеры{} становятся",
                        "{C:abn_eternal}Вечными{} при покупке"
                    },
                    {

                        "{X:mult,C:white}X#1#{} множ. на {C:attention}последный руке{} раунда,",
                        "увеличивается на {X:mult,C:white}X#2#{} за каждую уникальную",
                        "{C:attention}покерную руку{}, сыгранную в этой партии",
                    }
                }
            },
            j_abn_snoozing_joker = {
                name = "Дремающий джокер",
                text = {
                    "Карты {C:planet}Планет{} дают",
                    "на {C:red}#1#%{} больше множ.",
                }
            },
            j_abn_snow_comedian = {
                name = "Снежный комик",
                text = {
                    {
                        "Этот Джокер получает {C:mult}+#3#{} множ., если сыгранная",
                        "рука содержит {C:attention}Четную{} карту {C:abn_snow}Снежинок{}",
                        "Этот Джокер получает {C:chips}+#4#{} фишек, если сыгранная рука",
                        "содержит {C:attention}Нечетную{} карту {C:abn_snow}Снежинок{}",
                        "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.,{} {C:chips}+#2#{} {C:inactive}фишек){}"
                    },
                    {
                        "Если сыгранная рука содержит {C:attention}Флеш{},",
                        "только из {C:abn_snow}Снежинок{}, повышает",
                        "{C:planet}планетный{} уровень {C:attention}рангов{}",
                        "всех карт в подсчете"
                    }
                }
            },
            j_abn_snow_route = {
                name = "Гололед",
                text = {
                    "Сыгранные карты с",
                    "мастью {C:abn_snow}Снежинки{} имеют",
                    "шанс {C:green}#1# к #2#{}",
                    "повысить {C:attention}уровень{} сыгранной руки",
                }
            },
            j_abn_spanish_joker = {
                name = "Испанский джокер",
                text = {
                    {
                        "{s:0.8}{C:hearts,s:0.8}Черви{s:0.8} становятся {C:abn_coin,s:0.8}Монетами{} при подсчете",
                        "{s:0.8}{C:diamonds,s:0.8}Бубны{s:0.8} становятся {C:abn_baton,s:0.8}Дубинами{} при подсчете",
                        "{s:0.8}{C:clubs,s:0.8}Трефы{s:0.8} становятся {C:abn_chalice,s:0.8}Чашами{} при подсчете",
                        "{s:0.8}{C:spades,s:0.8}Пики{s:0.8} становятся {C:abn_sword,s:0.8}Мечами{} при подсчете",
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Винтажный{},",
                        "он получает {C:mult}+#2#{} множ. за каждую подсчитанную",
                        "{C:abn_coin}Монету{}, {C:abn_baton}Дубину{}, {C:abn_chalice}Чашу{} или {C:abn_sword}Меч{}",
                        "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.)",
                    }
                }
            },
            j_abn_spare_bikini = {
                name = "Запасное бикини",
                text = {
                    "Этот Джокер получает {C:mult}+#2#{} множ. и",
                    "{C:chips}+#7#{} фишек, если сыгранная рука содержит",
                    "{C:attention}#3#{}, получает {C:gold}+#5#{}",
                    "Вознесилы, если рука содержит",
                    "{C:attention}5{} уникальных {C:attention}мастей{}",
                    "{C:inactive}(сейчас {C:chips}+#6#{C:inactive}, {C:mult}+#1#{C:inactive}, {C:gold}+#4#{C:inactive})"
                }
            },
            j_abn_spare_coat = {
                name = "Запасное пальто",
                text = {
                    {
                        "Этот Джокер получает {C:chips}+#6#{} фишек",
                        "и {C:mult}+#2#{} множ., если сыгранная рука",
                        "содержит {C:attention}#3#{}",
                        "{C:inactive}(сейчас {C:chips}+#5#{C:inactive}, {C:mult}+#1#{C:inactive})"
                    },
                    {
                        "Если рука, содержащая",
                        "{C:attention}#3#{} содержит как",
                        "минимум одну {C:abn_snow}Снежинку{},",
                        "{C:abn_snow}Снежинки{} в руке",
                        "получают {C:purple}+#4#{} к Счету",
                    }
                }
            },
            j_abn_spare_overall = {
                name = "Запасной комбинезон",
                text = {
                    {
                        "Этот Джокер получает {C:red}+#1#{} множ.,",
                        "если сыгранная рука содержит {C:attention}#2#{}",
                        "{C:inactive}(сейчас {C:red}+#3#{C:inactive} множ.)",
                    },
                    {
                        "{C:attention}Нечетные Бонусные{} карты навсегда",
                        "получают {C:chips}+#4#{} фишек при подсчете,",
                        "{C:attention}Четные{} карты {C:attention}с Множителем{} навсегда",
                        "получают {C:mult}+#5#{} множ. при подсчете"
                    }
                }
            },
            j_abn_spare_suit = {
                name = "Запасной костюм",
                text = {
                    "Этот Джокер получает {C:mult}+#2#{} множ.,",
                    "если сыгранная рука содержит {C:attention}#3#{},",
                    "Перезапускает сыгранные {C:attention}Меркуриальные карты{}",
                    "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.)"
                }
            },
            j_abn_spawn_joker = {
                name = "Джокер призыватель",
                text = {
                    {
                        "{C:attention}6{} и {C:attention}4{} становятся",
                        "{C:dark_edition}Негативными{} при подсчете",
                    },
                    {
                        "{C:dark_edition}Негативные{} карты",
                        "дают свое удвоенное достоинство",
                        "как {C:chips}фишки{} при подсчете"
                    },
                    {
                        "шанс {C:green}#1# к #2#{}, что сыгранные",
                        "{C:attention}Инфра{} карты повысят уровень",
                        " сыгранной руки",
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Негативный{} и очки",
                        "{C:attention}загораются{}, все карты {C:attention}в руке{}",
                        "становятся {C:dark_edition}Негативными{}",
                    }
                }
            },
            j_abn_spice_melange = {
                name = "Смесь пряностей",
                text = {
                    "Перезапускает Джокера {C:attention}слева{}",
                    "для {C:attention}#1#{} следующих рук"
                }
            },
            j_abn_spihcneve = {
                name = 'Икшифтеч джокер',
                text = {
                    {
                        "Когда карта {C:mult}с множителем{} подсчитывается,",
                        "карты {C:attention}не с множителем{} в подсчете",
                        "навсегда получают {C:chips}+#1#{} фишек",
                    },
                    {
                        "Когда {C:attention}четные{} карты {C:mult}с множителем{}",
                        "подсчитываются, нечетные карты не с множителем",
                        "в подсчете навсегда получают {C:mult}+#2#{} множ.",
                    }
                },
                --[[unlock = {
                    "Улучшите {C:attention}четную{} карту",
                    "до карты {C:mult}с множителем{}"
                }--]]
            },
            j_abn_spilling_salt = {
                name = "Рассыпая соль",
                text = {
                    "{C:red}Ослабленные{} карты повышают",
                    "{C:planet}планетный{} уровень своего",
                    "{C:attention}ранга{} на {C:attention}1{} при подсчете"
                }
            },
            j_abn_spitting_imagine = {
                name = "Ментальная связь",
                text = {
                    "Получает {C:mult}множ.{} или {C:chips}фишки{} каждый раз,",
                    "когда вы копируете карту с {C:mult}четным",
                    "и {C:chips}нечетным{} рангом соответственно",
                    "{C:inactive}(сейчас {C:mult}+#1# {C:inactive}множ., {C:chips}+#2# {C:inactive}фишек)"
                }
            },
            j_abn_sponge_joker = {
                name = "Губка",
                text = {
                    "{C:attention}Пузырьковые{} карты {C:diamonds}Светлой масти{}",
                    "получают {C:mult}+#1#{} множ.",
                    "{C:attention}Пузырьковые{} карты  {C:spades}Темной масти{}",
                    "получают {C:chips}+#2#{} фишек"
                }
            },
            j_abn_square_rekoj = {
                name = "Квадратный рекожд",
                text = {
                    "Этот Джокер получает {C:chips}+#2#{} фишек",
                    "и {C:white,X:mult}X#4#{} множ. если в разыгранной",
                    "руке ровно {C:attention}4{} подсчитываемые карты",
                    "{C:inactive}(сейчас {C:chips}#1#{C:inactive} фишек, {C:white,X:mult}X#3#{C:inactive} множ.)",
                }
            },
            j_abn_statue_joker = {
                name = "Статуя",
                text = {
                    "Карты {C:attention}без достоинства{} дают этому Джокеру {C:mult}+#2#{} множ. при подсчете",
                    "{C:attention}Каменные{} карты становятся {C:dark_edition}Хроматическими{}",
                    "{C:attention}Нефтяные{} карты становятся {C:dark_edition}Коллодиевыми{}",
                    "карты {C:attention}В горошек{} становятся {C:dark_edition}Блестящими{}",
                    "{C:attention}Подожженные{} карты становятся {C:dark_edition}Заброшенными{}",
                    "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.)",
                }
            },
            j_abn_steel_bonus = {
                name = "Стальной бонус",
                text = {
                    {
                        "Если сыгранная рука содержит и {C:attention}Стальную{}",
                        "и {C:attention}Бонусную{} карту, они получают",
                        "{C:gold}+#1#{} Вознесилы и {C:purple}+#2#{} к Счету",
                    },
                    {
                        "{C:enhanced}Стальные{} {C:attention}Джокеры{} получают {X:mult,C:white}X#3#{} множ., {C:enhanced}Бонусные{}",
                        "{C:attention}Джокеры{} получают {X:chips,C:white}X#4#{} фишек, когда срабатывают"
                    },
                    {
                        "Когда {C:attention}Большой блайнд{} выбран,",
                        "создает последнюю использованную в",
                        "этой партии {C:crimson}Багряную{} карту",
                        "{C:inactive}(сейчас{} {C:crimson}#5#{C:inactive})"
                    }
                }
            },
            j_abn_steel_gold = {
                name = "Стальное золото",
                text = {
                    {
                        "Если сыгранная рука содержит и {C:attention}Стальную{}",
                        "и {C:attention}Золотую{} карту, обе получают",
                        "{C:gold}+#1#{} Вознесилы и {C:purple}+#2#{} к Счету",
                    },
                    {
                        "{C:enhanced}Стальные{} {C:attention}Джокеры{} получают {X:mult,C:white}X#3#{} множ., {C:enhanced}Золотые{}",
                        "{C:attention}Джокеры{} получают {X:chips,C:white}X#4#{} фишек, когда срабатывают"
                    },
                    {
                        "Когда {C:attention}Большой блайнд{} выбран,",
                        "создает последнюю использованную в",
                        "этой партии {C:periodic}Периодическую{} карту",
                        "{C:inactive}(сейчас{} {C:periodic}#5#{C:inactive})"
                    }
                }
            },
            j_abn_stereogram = {
                name = "Стереограмма",
                text = {
                    "{C:attention}Номерные{} карты",
                    "балансируют {C:white,X:abn_plasma}#1#%{} {C:chips}фишек{} и {C:mult}множ.{}",
                    "при подсчете"
                }
            },
            j_abn_sticky_fingers = {
                name = "Липкие пальцы",
                text = {
                    "Карты {C:tarot}Таро{}, {C:planet}Планет{} и {C:spectral}Спектральные{}",
                    "можно {C:attention}сохранить{} из {C:attention}Бкстерных наборов"
                }
            },
            j_abn_stiff_drink = {
                name = "Крепкий напиток",
                text = {
                    {
                        "Когда вы побеждаете {C:attention}Блайнд{} в",
                        "{C:attention}первый раз{}, вместо перехода на",
                        "{C:attention}следующий Блайнд{} он повторяется",
                    },
                    {
                        "Все {C:chips}руки{} и {C:mult}сбросы{}",
                        "считаются и {C:attention}первыми{} и",
                        "{C:attention}последними{} в раунде",
                    }
                }
            },
            j_abn_stone_bonus = {
                name = "Каменный бонус",
                text = {
                    {
                        "Если сыгранная рука содержит и {C:attention}Каменную{}",
                        "и {C:attention}Бонусную{} карту, обе получают",
                        "{C:gold}+#1#{} Вознесилы и {C:purple}+#2#{} к Счету",
                    },
                    {
                        "{C:enhanced}Каменные{} {C:attention}Джокеры{} получают {X:mult,C:white}X#3#{} множ., {C:enhanced}Бонусные{}",
                        "{C:attention}Джокеры{} получают {X:chips,C:white}X#4#{} фишек, когда срабатывают"
                    },
                    {
                        "Когда {C:attention}Большой блайнд{} выбран,",
                        "создает последнюю использованную в",
                        "этой партии карту {C:lexica}Лексики{}",
                        "{C:inactive}сейчас:{} {C:lexica}#5#{}"
                    }
                }
            },
            j_abn_stone_calendar = {
                name = "Каменный календарь",
                text = {
                    {
                        "{C:attention}Каменные{} и {C:attention}Нефтяные{} карты",
                        "сохраняют свои достоинство и масть",
                    },
                    {
                        "Если рука составлена из {C:attention}Каменных карт{}",
                        "с как минимум {C:attention}4{} разными мастями,",
                        "получает {X:chips,C:white}X#1#{} фишек",
                        "{C:inactive}(сейчас {X:blue,C:white}X#2#{C:inactive} фишек)",
                    },
                    {
                        "{C:attention}Нефтяные карты{} имеют шанс {C:green}#3# к #4#{}",
                        "создать {C:astro_cards}Астро карту{}, когда срабатывают",
                        "{C:inactive}(должно быть место)",
                    },
                    {
                        "До следующего Блайнда гарантирует создание {C:astro_cards}Астро карт{},",
                        "если разыграны {C:attention}2{} нечетные {C:attention}Каменные карты{}",
                        "и {C:attention}2{} четные {C:attention}Нефтяные карты{}",
                    }
                }
            },
            j_abn_stone_gold = {
                name = "Каменное золото",
                text = {
                    {
                        "Если сыгранная рука содержит и {C:attention}Каменную{}",
                        "и {C:attention}Золотую{} карту, обе получают",
                        "{C:gold}+#1#{} Вознесилы и {C:purple}+#2#{} к Счету",
                    },
                    {
                        "{C:enhanced}Каменные{} {C:attention}Джокеры{} получают {X:mult,C:white}X#3#{} множ., {C:enhanced}Золотые{}",
                        "{C:attention}Джокеры{} получают {X:chips,C:white}X#4#{} фишек, когда срабатывают"
                    },
                    {
                        "Когда {C:attention}Большой блайнд{} выбран,",
                        "создает последнюю использованную в",
                        "этой партии {C:solid_state}Твердотельную{} карту",
                        "{C:inactive}сейчас:{} {C:solid_state}#5#{}"
                    }
                }
            },
            j_abn_stone_mult = {
                name = "Каменный множитель",
                text = {
                    {
                        "Если сыгранная рука содержит и {C:attention}Каменную{}",
                        "и карту {C:attention}с Множителем{}, обе получают",
                        "{C:gold}+#1#{} Вознесилы и {C:purple}+#2#{} к Счету",
                    },
                    {
                        "{C:enhanced}Каменные{} {C:attention}Джокеры{} получают {X:mult,C:white}X#3#{} множ., {C:attention}Джокеры{}",
                        "{C:enhanced}с Множителем{} получают {X:chips,C:white}X#4#{} фишек, когда срабатывают"
                    },
                    {
                        "Когда {C:attention}Большой блайнд{} выбран,",
                        "создает последнюю использованную в",
                        "эту партию {C:algebraic}Алгебраическую{} карту",
                        "{C:inactive}сейчас:{} {C:algebraic}#5#{}"
                    }
                }
            },
            j_abn_stop_sign = {
                name = "Стоп-знак",
                text = {
                    "{C:attention}Джокеры{} больше не",
                    "появляются в {C:attention}лавке{},",
                    "но ты можешь выбирать",
                    "на {C:attention}2{} карты больше",
                    "во всех {C:attention}наборах шута{}"
                }
            },
            j_abn_streetart_joker = {
                name = "Стритарт",
                text = {
                    "Каменные карты не теряют свои",
                    "{C:attention}достоинство{} и {C:attention}масть{}",
                }
            },
            j_abn_strickland_joker = {
                name = "Джокер Стрикленд",
                text = {
                    "Получает {C:red}+#1#{} множ. за каждую {C:attention}сыгранную карту{}",
                    "Сбрасывается, если очки {C:red,E:2}загораются",
                    "{C:inactive}(сейчас {C:red}+#2#{C:inactive} множ.)"
                }
            },
            j_abn_stuntdouble = {
                name = "Второй каскадер",
                text = {
                    {
                        "{C:mult}+#1#{} множ.,",
                        "{C:attention}-#2#{} к размеру руки",
                    },
                    {
                        "Если у вас есть {C:attention}Каскадер{},",
                        "получает {C:attention}+#3#{} к размеру руки",
                    }
                }
            },
            j_abn_stygian_joker = {
                name = "Стигийский джокер",
                text = {
                    {
                        "Игральные карты с мастью {C:hearts}Черви{}",
                        "имеют шанс {C:green}#3# к #4#{}",
                        "стать {C:dark_edition}Хтоническими{}"
                    },
                    {
                        "Дает {X:mult,C:white}X#1#{} множ.",
                        "за каждую {C:dark_edition}Хтоническую{} карту",
                        "в вашей {C:attention}полной колоде",
                        "{C:inactive}(сейчас {X:mult,C:white}X#2#{C:inactive} множ.)",
                    }
                }
            },
            j_abn_suit_eradication = {
                name = "Искоренение масти",
                text = {
                    {
                        "Уничтожает карты {C:hearts}Червей{}, {C:diamonds}Бубен{},",
                        "{C:spades}Пик{} и {C:clubs}Треф{} при подсчете, получает {C:chips}фишки{},",
                        "равные сумме {C:attention}достоинство{} уничтоженных карт",
                        "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек)",
                    },
                    {
                        "Создает случайную карту с таким",
                        "же {C:attention}достоинством{}, как уничтоженная карта",
                        "с мастью {V:1}Снежинок{}, {V:2}Галстуков{},",
                        "{V:3}Полутеней{} или {V:4}Бабочек{}",
                    }
                }
            },
            j_abn_suit_seal_joker = {
                name = "Печать мастей",
                text = {
                    {
                        "Если в руке есть {C:attention}4 уникальный{} масти",
                        "добавляет {C:abn_violet_seal}пурпурную печать{} всем",
                        "{C:spades}темныйм мастям{} без печати,",
                        "добавляет {C:abn_brown_seal}коричневую печать{} всем",
                        "{C:diamonds}светлым мастям{} без печати",
                    },
                    {
                        "Этот Джокер получает {C:chips}+#4#{} фишек и {C:mult}+#3#{} множ.",
                        "за каждую сыгранную {C:diamonds}светлую масть{} с печатью,",
                        "Получает {C:chips}+#3#{} фишек и {C:mult}+#4#{} множ.",
                        "за каждую сыгранную {C:spades}темную масть{} с печатью",
                        "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.,{} {C:chips}+#2#{} {C:inactive}фишек){}",
                    }
                }
            },
            j_abn_super_eight = {
                name = "Супер Восьмерка",
                text = {
                    {
                        "{C:attention}8-ки{} не могут быть {C:mult}ослаблены{} и",
                        "считаются каждой {C:inactive}ванильной{} мастью"
                    },
                    {
                        "Получает {C:mult}множ.{}, равный {C:attention}удвоенному",
                        "{C:attention}достоинству{} подсчитываемых {C:attention}8-ок{}",
                        "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.{C:inactive})",
                    },
                    {
                        "Этот Джокер {C:mult}уничтожается{}, если",
                        "ни одна {C:attention}8-ка{} не подсчитана,"
                    }
                }
            },
            j_abn_superhero = {
                name = "Супергерой",
                text = {
                    {
                        "Сыгранные {C:attention}перевернутые номерные{}",
                        "карты {C:attention}переворачиваются{} и дают",
                        "свое достоинство как {C:mult}множ.{} при подсчете",
                    },
                    {
                        "Если сыгранная рука содержит {C:attention}#1#{}",
                        "только с картами, повернутыми {C:attention}лицом вниз{},",
                        "создает {C:dark_edition}Негативную{} копию этого Джокера"
                    }
                }
            },
            j_abn_supermember_card = {
                name = "Членская карта",
                text = {
                    "Джокеры дают свою {C:attention}цену продажи{}",
                    "как {C:mult}множ.",
                }
            },
            j_abn_suspicious_icon = {
                name = "Подозрительная иконка",
                text = {
                    "Когда {C:attention}Блайнд{} выбран,",
                    "{C:mult}Уничтожает{} {C:attention}#1#{} не{C:abn_plagued}Чумного{} Джокера",
                    "и создает {C:attention}#1#{} {C:abn_plagued}Чумного{} Джокера",
                }
            },
            j_abn_swag_voucher = {
                name = "Свег-ваучер",
                text = {
                    "Получает {X:red,C:white}X#1#{} множ. и {X:blue,C:white}X#2#{} фишек",
                    "за каждый полученный {C:attention}Ваучер{}",
                    "{C:inactive}(сейчас {X:red,C:white}X#3#{C:inactive} множ.,{} {X:blue,C:white}X#4#{C:inactive} фишек){}",
                }
            },
            j_abn_sweepstakes_card = {
                name = "Лотерейная карта",
                text = {
                    {
                        "Все предметы в лавке",
                        "продаются с {C:attention}#1#%{} скидкой",
                    },
                    {
                        "{C:dark_edition}Модовые{} Джокеры",
                        "стоят {C:money}$1{}",
                    }
                }
            },
            j_abn_symbol_of_peace = {
                name = "Символ мира",
                text = {
                    "{C:enhanced}+#1#{} к лимиту выбора карт,",
                    "{C:blue}+#1#{} рука, {C:red}+#1#{} сброс,",
                    "{C:attention}+#1#{} слот джокеров,",
                    "{C:tarot}+#1#{} слот расходников,",
                    "{C:attention}+#1#{} Ваучер в лавке,",
                    "{C:tarot}+#1#{} Бустерный набор в лавке,",
                    "{C:red}отключает{} {C:attention}Босс-блайнд{}",
                }
            },
            j_abn_synergy_joker = {
                name = "Синергия",
                text = {
                    "Когда другой Джокер получает",
                    "{C:chips}+фишки{} или {C:mult}+множ.{}, дает то же",
                    "количество этому Джокеру",
                    "{C:inactive}(сейчас {C:mult}+#1#{}{C:inactive} множ., {C:chips}+#2#{} {C:inactive}фишек)"
                }
            },
            j_abn_syntha_joker = {
                name = "Джокер-сэмпл",
                text = {
                    "{C:red}+#1#{} множ. за каждую карту",
                    "{C:lexica}Лексики{}, активированную в этой партии",
                    "{C:inactive}(сейчас {C:red}+#2#{C:inactive} множ.)",
                }
            },
            --#endregion





            --#region T
            j_abn_tag_collector = {
                name = "Коллукционер тегов",
                text = {
                    "{C:attention}Теги{} можно купить",
                    "в лавке за {C:money}$#2#",
                }
            },
            j_abn_tag_joker = {
                name = "Тег джокера",
                text = {
                    "Этот Джокер получает {C:white,X:mult}X#2#{} множ.,",
                    "когда {C:attention}Тег{} срабатывает",
                    "{C:inactive}(сейчас {X:mult,C:white}X#1#{C:inactive} множ.)",
                }
            },
            j_abn_talstaff = {
                name = "Талстафф",
                text = {
                    "{X:mult,C:white}X#2#{} множ. за каждого Джокера {C:attention}слева{}",
                    "{C:inactive}(сейчас{} {X:mult,C:white}X#1#{} {C:inactive}множ.){}",
                }
            },
            j_abn_telejoker = {
                name = "Теледжокер",
                text = {
                    "Перезапускает все сыгранные карты, если",
                    "рука - это {C:attention}#1#{} или {C:attention}#2#{},",
                    "содержащие только {C:attention}#3#{} карты"
                }
            },
            j_abn_telisyndrome_joker = {
                name = "Телисиндром",
                text = {
                    {
                        "{X:chips,C:white}^#1#{} фишек за каждое уникальное",
                        "{C:attention}улучшение{} в подсчете",
                    },
                    {
                        "{C:abn_plagued}Чемные{} Джокеры дают {C:mult}+#2#{} множ.",
                        "за каждый {C:attention}уникальный{} {C:dark_edition}выпуск{}",
                        "среди ваших {C:attention}Джокеров{}"
                    }
                }
            },
            j_abn_terminator = {
                name = "Д-800",
                text = {
                    {
                        "{C:attention}Стальные карты{} навсегда",
                        "получают {C:chips}+#1#{} фишек и {C:mult}+#2#{} множ.,",
                        "пока находятся в руке"
                    },
                    {
                        "Уничтожает все сыгранные",
                        "{C:attention}Стальные карты{}",
                    }
                }
            },
            j_abn_tesseract_joker = {
                name = "Тессеракт",
                text = {
                    {
                        "Перемещает {C:attention}самого правого{} Джокера",
                        "в ваши {C:attention}слоты росходуемого,",
                        "когда {C:attention}Босс-блайнд{} побежден",
                    },
                    {
                        "{C:attention}+1{} слот расходников за",
                        "каждую уникальную редкость Джокера",
                        "в {C:attention}слотах расходников{}",
                    }
                }
            },
            j_abn_test_crash_dummy = {
                name = "Краш-тест манекен",
                text = {
                    {
                        "При подсчете улучшает все",
                        "карты в первой {C:attention}Паре{} раунда",
                        "до {C:attention}Опасных{} карт"
                    },
                    {
                        "Когда {C:attention}Опасная{} карта подсчитывается,",
                        "{C:mult}уничтожает{} ее и получает ее {C:attention}достоинство{}, как {C:chips}фишки{}",
                        "{C:inactive}(сейчас {C:chips}+#1#{} {C:inactive}фишек){}",
                    }
                }
            },
            j_abn_tetris_joker = {
                name = "Тетрис",
                text = {
                    "{X:mult,C:white}X#1#{} множ., если",
                    "у вас {C:attention}Четное{}",
                    "количество Джокеров",
                }
            },
            j_abn_that_one_evenly_split = {
                name = "Напополам",
                text = {
                    {
                        "Сыгранные карты с",
                        "{C:attention}нечетным{} достоинством дают",
                        "{C:chips}+#1#{} фишек при подсчете",
                        "{C:inactive}(Т, 9, 7, 5, 3)",
                    },
                    {
                        "Сыгранные карты с",
                        "{C:attention}четным{} достоинством дают",
                        "{C:white,X:mult}X#2#{} множ. при подсчете",
                        "{C:inactive}(10, 8, 6, 4, 2)",
                    }
                }
            },
            j_abn_the_contrarian = {
                name = "Противоположность",
                text = {
                    "Дает {X:mult,C:white}X#1#{} множ. за каждую",
                    "{C:red}ослабленную{} карту в подсчете",
                },
            },
            j_abn_the_feast = {
                name = "The Feast",
                text = {
                    {
                        "При покупке {C:attention}Съедобного{} Джокера",
                        "создает его {C:dark_edition}Негативную{} копию",
                    },
                    {
                        "Когда {C:attention}Съедобного{} Джокер {C:gold}продан{},",
                        "получает {X:red,C:white}X#1#{} множ. за каждый раунд,",
                        "который этот Джокер был в руке",
                    },
                    {
                        "Если он все же съеден, получает",
                        "{X:blue,C:white}X#2#{} фишек за каждый раунд,",
                        "который этот Джокер был в руке",
                        "{C:inactive}(сейчас {X:red,C:white}X#3#{C:inactive} множ., {X:blue,C:white}X#4#{C:inactive} фишек)",
                        "{C:inactive,s:0.8}(Раунды считаются с момента приобретения этого Джокера)"
                    }
                }
            },
            j_abn_the_great_gig_in_the_sky = {
                name = "Большой концерт в небесах",
                text = {
                    {
                        "Если {C:attention}Спектрум{} разыгран без",
                        "каких-либо {C:diamonds}Ванильных {C:spades}мастей{}, этот Джокер",
                        "получает {C:gold}+#2#{} Вознесилы",
                        "{C:inactive}(сейчас {C:gold}+#1#{C:inactive} Вознесилы)",
                    },
                    {
                        "Если этот {C:attention}Джокер{} с {C:dark_edition}выпуском{},",
                        "карты получают {C:gold}+#3#{} Вознесилы",
                        "при подсчете",
                    }
                }
            },
            j_abn_the_joker = {
                name = "ДЖОКЕР",
                text = {
                    "Сыгранные карты уменьшают",
                    "{C:attention}требование Блайнда{}",
                    "на {C:attention}10%{} при подсчете",
                }
            },
            j_abn_the_joker_dance = {
                name = "Танец джокера",
                text = {
                    "Джокеров {C:attention}нельзя{} перемещать",
                    "Когда рука разыграна, {C:attention}тасует{} всех Джокеров",
                    "Все Джокеры получают {C:mult}+#1#{} множ. и {C:chips}+#2#{} фишек",
                }
            },
            j_abn_the_mule = {
                name = "Мул",
                text = {
                    "{C:chips}+#1#{} фишек,",
                    "{C:red}-#2#{} фишка за",
                    "каждый {C:money}$1{} в наличии",
                    "{C:inactive}(сейчас {C:chips}+#3#{C:inactive} фишек)",
                }
            },
            j_abn_tier_list = {
                name = "Тирлист",
                text = {
                    {
                        "Этот Джокер получает бонусы, зависящие",
                        "от {C:attention}редкости последнего полученного{} Джокера:",
                        "{C:inactive}Редкость последнего: {C:attention}#11#{}",
                        "{C:inactive,s:0.8}(сейчас {C:attention,s:0.8}#5#{s:0.8} {C:inactive,s:0.8}перезапусков, {X:mult,C:white,s:0.8}X#3#{C:inactive,s:0.8}, {C:mult,s:0.8}+#2#{C:inactive,s:0.8}, {X:chips,C:white,s:0.8}X#4#{C:inactive,s:0.8}, {C:chips,s:0.8}+#1#{C:inactive,s:0.8})",
                    },
                    {
                        "{C:common,s:0.8}Обычный{s:0.8}: {C:chips,s:0.8}+#6#{s:0.8} фишек",
                        "{C:uncommon,s:0.8}Необычный{s:0.8}: {C:mult,s:0.8}+#7#{s:0.8} множ.",
                        "{C:rare,s:0.8}Редкий{s:0.8}: {X:mult,C:white,s:0.8}+X#8#{s:0.8} множ.",
                        "{C:abn_superrare,s:0.8}Супер редкий{}: {X:chips,C:white,s:0.8}+X#9#{s:0.8} фишек",
                        "{C:purple,s:0.8}Параллель-редкий{}: {C:attention,s:0.8}+#10#{s:0.8} перезапусков",
                        "{C:legendary,s:0.8}Легендарный{s:0.8}: Удвоить все значения",
                    }
                }
            },
            j_abn_tiktoker_joker = {
                name = "Тиктокерша",
                text = {
                    "{C:spades}не Черви{} получают",
                    "{C:mult}+#1#{} множ. за каждую",
                    "подсчитанную {C:hearts}Червь{}"
                }
            },
            j_abn_till_joker = {
                name = "Кассовый джокер",
                text = {
                    "Добавляет {C:abn_grey_seal}серую печать{} к первой {C:attention}номерной{} карте",
                    "в {C:attention}первой руке{} раунда,",
                    "Добавляет {C:gold}золотую печать{} к первой {C:attention}номерной{} карте",
                    "в {C:attention}последней руке{} раунда,",
                }
            },
            j_abn_time_attack = {
                name = "Атака в тайминг",
                text = {
                    {
                        "Все {C:attention}Джокеры{} повышают свои",
                        "значения {C:attention}вдвое{} быстрее"
                    },
                    {
                        "Перезапускает все сыгранные",
                        "карты с {C:dark_edition}изданием",
                    },
                    {
                        "Все Джокеры должны сработать",
                        "до победы над {C:attention}Блайндом{}, иначе",
                        "{C:red}все карты в колоде будут уничтожены{}"
                    }
                }
            },
            j_abn_tiny_waldo = {
                name = "Маленький Валдо",
                text = {
                    "{C:chips}+#1#{} фишек и {C:mult}+#2#{} множ.,",
                    "если подсчитываемая рука состоит из",
                    "{C:attention}#3#{} модовых и {C:attention}#4#{}",
                    "ванильных достоинств"
                }
            },
            j_abn_tlumddo = {
                name = "Жонмтечен джокер",
                text = {
                    {
                        "Когда {C:attention}Бонусная карта{} подсчитывается,",
                        "все не {C:attention}Бонусные{} карты в подсчете",
                        "навсегда получают {C:mult}+#1#{} множ.",
                    },
                    {
                        "Когда {C:attention}нечетная Бонусная карта{} подсчитывается,",
                        "все не {C:attention}Бонусные{} карты в подсчете",
                        "навсегда получают {C:chips}+#2#{} фишек"
                    }
                },
                unlock = {
                    "Получите улучшение {C:attention,E:1}Бонусная{}",
                    "на нечетной номерной карте"
                }
            },
            j_abn_tochic = { -- Chicot backwards
                name = "Окиш",
                text = {
                    "Когда {C:attention}Блайнд{} выбран,",
                    "уменьшает {C:attention}требование Блайнда{} на {C:attention}#1#%{}",
                    "за каждого {C:attention}Джокера{}",
                    "{C:inactive}(сейчас{} {C:attention}#2#%{C:inactive})",
                }
            },
            j_abn_tom = {
                name = "Том",
                text = {
                    "Перезапускает {C:attention}последнюю{} подсчитанную карту",
                    "один раз за каждую осавшуюся {C:attention}руку",
                }
            },
            j_abn_topsy_turvy_joker = {
                name = "Шиворот-навыворот",
                text = {
                    {
                        "Когда {C:dark_edition}Реверс{} карты подсчитываются,",
                        "этот Джокер получает {C:mult}множ.{}, равный",
                        "тому, сколько {C:mult}множ.{} было",
                        "получено после замены, если было получено",
                        "{C:inactive}(сейчас {C:mult}+#1# {C:inactive}множ.)"
                    },
                    {
                        "Если этот Джокер имеет {C:dark_edition}Реверс{}",
                        "выпуск, каждый раз, когда {C:mult}множ.{}",
                        "увеличивается из-за {C:dark_edition}Реверс{} выпуска, он",
                        "будет увеличен в {C:mult}X#2#{} раз"
                    }
                }
            },
            j_abn_totally_naked = {
                name = "Полностью голый",
                text = {
                    "Карты {C:attention}без улучшений{}",
                    "дают {C:mult}+#1#{} множ. и",
                    "{C:chips}+#2#{} фишек при подсчете"
                },
            },
            j_abn_towser = {
                name = "Таусер",
                text = {
                    {
                        "Этот Джокер получает {X:chips,C:white}^#2#{} фишек",
                        "каждый раз, когда {C:spectral}Спектральная{}",
                        "карта использована",
                        "{C:inactive}(сейчас {X:chips,C:white}^#1#{} {C:inactive}фишек)",
                    },
                    {
                        "В {C:attention}лавке{} всегда есть",
                        "{C:attention}Мегаспектральный набор"
                    }
                }
            },
            j_abn_trans_joker = {
                name = "Транс джокер",
                text = {
                    "Когда карта меняет {C:attention}масть{},",
                    "повышает {C:planet}планетный{} уровень",
                    "ее {C:attention}ранга{}",
                }
            },
            j_abn_transvestite_joker = {
                name = 'Трансвестит',
                text = {
                    "Все карты, у которых",
                    "сменилось достоинство или масть получают",
                    "{C:mult}+#1#{} множ. и {C:chips}+#2#{} фишек"
                }
            },
            j_abn_trevulit = {
                name = "Тревулит",
                text = {
                    "{C:attention}Нечетные{} карты дают {C:mult}множ.{},",
                    "равный их {C:attention}утроенному{} достоинству при подсчете",
                }
            },
            j_abn_tri_tag = {
                name = "Три-тег",
                text = {
                    "Когда {C:inactive}ванильный{} тег получен, получает {X:mult,C:white}X#2#{} множ.",
                    "Когда {C:dark_edition}Модовый{} тег получен, получает {X:chips,C:white}X#4#{} фишек",
                    "Когда {C:abn_hazard}Бедственный{} тег получен, получает {C:money}$#5#{}",
                    "{C:inactive}(сейчас:{} {X:mult,C:white}X#1#{} {C:inactive}множ.{} {X:chips,C:white}X#3#{} {C:inactive}фишек{C:inactive})"
                }
            },
            j_abn_triple_nicole = {
                name = 'Трипл Николь',
                text = {
                    '{C:chips}+#1#{} фишек, если {C:attention}покерная',
                    '{C:attention}рука{} была сыграна {C:attention}нечетное{}',
                    'количество раз'
                }
            },
            j_abn_triple_star_license = {
                name = "Трехзвездная лицензия",
                text = {
                    "{X:mult,C:white}X#1#{} множ., {X:chips,C:white}X#2#{} фишек",
                    "{C:mult}Самоуничтожается{}, если",
                    "Джокер {C:attention}продан{}",
                }
            },
            j_abn_triskaidekaphobia = {
                name = 'Трискайдекафобия',
                text = {
                    {
                        "Когда {C:attention}Счастливая{} карта подсчитывается,",
                        "каждая не счастливая карта в подсчете",
                        "удваивает свои базовые {C:chips}фишки{}"
                    },
                    {
                        "Когда {C:attention}13{} подсчитывается,",
                        "получает {C:attention}+#3#{} слот джокера, но",
                        "{X:attention,C:white}X#2#{} к размеру {C:attention}блайнда",
                        "{X:attention,C:white}+X#4#{} к базовому размеру {C:attention}блайнда",
                        "{C:inactive}(сейчас {X:blind,C:white}X#5#{C:inactive} к размеру блайнда){}"
                    }
                }
            },
            j_abn_trojan_joker = {
                name = "Троянский джокер",
                text = {
                    "Когда {C:attention}Блайнд{} выбран, {C:red}уничтожает",
                    "{C:attention}соседних Джокеров{}, и получает",
                    "набранные ими {C:chips}фишки{}, {C:mult}множ.{} и {X:mult,C:white}Хмнож.{}",
                    '{C:inactive}(сейчас {C:chips}+#1#{C:inactive}/{C:mult}+#2#{C:inactive}/{X:mult,C:white}X#3#{C:inactive})',
                }
            },
            j_abn_tronie_joker = {
                name = "Шарж",
                text = {
                    "{C:chips}+#1#{} слот джокеров",
                    "{X:mult,C:white}#2#X{} {C:attention}требование блайндов{}",
                    "Увеличивается на {X:mult,C:white}#3#X{} в конце",
                    "каждого {C:attention}Анте{}",
                }
            },
            j_abn_turf_graffiti = {
                name = "Подпись на стене",
                text = {
                    "Сыгранные карты с",
                    "{C:spades}темной{} мастью дают",
                    "{X:mult,C:white}X#1#{} множ. при подсчете",
                }
            },
            j_abn_tv_evangelist = {
                name = "ТВ-евангелист",
                text = {
                    "Дает {C:chips}+#1#{} фишек, {C:mult}+#2#{} множ. и {C:money}+$#3#{},",
                    "если сыграно 5 {C:attention}ванильных{} карт",
                    "в {C:attention}6-ти карточной{} руке"
                }
            },
            j_abn_twinbo = {
                name = "Сиамбо",
                text = {
                    "{C:attention}+#1#{} слота джокера",
                    "Можете играть только {C:attention}2{} карты за раз",
                    "Сыгранные карты дают {X:mult,C:white}X#2#{} множ.",
                }
            },
            j_abn_tyches_keychain = {
                name = "Брелок Тюхе",
                text = {
                    "Если {C:attention}#1#{}",
                    "разыграна, карты получают",
                    "{V:1}#2#{} #3#",
                    "{C:inactive}(Переключается каждую руку){}"
                }
            },
            --#endregion





            --#region U
            j_abn_uboa = {
                name = "Убоа",
                text = {
                    {
                        "{C:spades}Темные масти{} дают {X:mult,C:white}X#1#{} множ.",
                        "при подсчете, множ. увеличивается на {X:mult,C:white}X#2#{}",
                        "когда {C:spades}Темная масть{} подсчитывается",
                    },
                    {
                        "Повышает {C:planet}планетный{} уровень",
                        "{C:attention}рангов{} всех подсчитанных карт",
                        "в {C:attention}победной руке{} раунда"
                    }
                }
            },
            j_abn_ulam_joker = {
                name = "Пупырчатый джокер",
                text = {
                    {
                        "Этот Джокер получает {C:mult}множ.{} и {C:chips}фишки{}, равные",
                        "разнице в достоинстве {C:attention}первой{} и",
                        "{C:attention}последней{} карт в подсчете в {C:attention}Спектрумной{} руке",
                        "{C:inactive}(сейчас{} {C:mult}+#2#{} {C:inactive}множ.,{} {C:chips}+#1#{} {C:inactive}фишек){}"
                    },
                    {
                        "Если этот Джокер с {C:dark_edition}выпуском{},",
                        "получает {C:attention}удвоенную{} разницу достоинств",
                    }
                }
            },
            j_abn_ultimo_joker = {
                name = "Ультима джокер",
                text = {
                    "Перезапускает все сыгранные карты",
                    "один раз за каждое уникальное",
                    "{C:attention}улучшение{} в подсчете"
                }
            },
            j_abn_underblackcloudz = {
                name = "Под черным облаком",
                text = {
                    {
                        "Перезапускает все эффекты",
                        "{C:weather_report}Прогнозов погоды{}"
                    },
                    {
                        "Этот Джокер получает {C:chips}+#4#{} фишек, {C:mult}+#2#{} множ.",
                        "и {C:money}$#6#{} к {C:attention}цене продажи{}, когда",
                        "{C:weather_report}Прогноз погоды{} {C:attention}срабатывает",
                    },
                    {
                        "Получите {C:money}$#5#{}, когда {C:weather_report}Прогноз погоды{}",
                        "самоуничтожается, не сработав",
                        "{C:inactive}(сейчас {C:chips}+#3#{C:inactive} фишек, {C:mult}+#1#{C:inactive} множ.)",
                    }
                }
            },
            j_abn_under_construction = {
                name = "На ремонте",
                text = {
                    "Когда {C:attention}Босс-блайнд{} побежден,",
                    "{C:attention}продайте{} этого Джокера, чтобы создать",
                    "{C:attention}любого{} Джокера из вашей коллекции",
                    "{C:inactive,s:0.8}(можно создать только {C:common,s:0.8}Обычного{C:inactive,s:0.8}, {C:uncommon,s:0.8}Необычного{C:inactive,s:0.8} или {C:rare,s:0.8}Редкого{C:inactive,s:0.8})",
                }
            },
            j_abn_undiscovered_sunset = {
                name = "Неизведанный закат",
                text = {
                    {
                        "Первая {C:abn_penumbra}Полутень{} в {C:attention}#5#{}",
                        "становится {C:dark_edition}Солнечной{} при подсчете"
                    },
                    {
                        "Получает {C:mult}+#4#{} множ. и {C:chips}+#2#{} фишек",
                        "за каждую {C:dark_edition}Солнечную{} подсчитанную карту",
                        "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ., {C:chips}+#3#{C:inactive} фишек)"
                    },
                    {
                        "Карты {C:continent}Континентов{} становятся",
                        "{C:dark_edition}Негативными{} после покупки"
                    }
                }
            },
            j_abn_unendy_wendy = {
                name = "Неприятная Венди",
                text = {
                    {
                        "Перезапускает все",
                        "сыгранные {C:attention}номерные{} карты",
                    },
                    {
                        "Ослабляет все карты {C:attention}с лицом{}"
                    }
                }
            },
            j_abn_unfamiliar_joker = {
                name = "Незнакомый джокер",
                text = {
                    "{C:dark_edition}Модовые{} карты {C:attention}Без достоинства{} дают",
                    "{X:chips,C:white}2X{} своих {C:chips}фишек{} при подсчете"
                }
            },
            j_abn_unhinged_umar = {
                name = "Расстроенный Умар",
                text = {
                    {
                        "Превращает эффекты {C:chips}+фишек{} игральных",
                        "карт в {X:chips,C:white}Xфишки{} в отношении {X:chips,C:white}X#1#",
                    },
                    {
                        "Если этот Джокер {C:attention}Бонусный{},",
                        "{C:attention}Бонусные{} улучшения также",
                        "срабатывают, пока находятся в руке",
                    }
                }
            },
            j_abn_union_jack = {
                name = "Соединенные штаты джокера",
                text = {
                    "Перезапускает все сыгранные карты,",
                    "если сыгранная рука содержит",
                    "и {C:attention}Бонусную карту{} и",
                    "{C:attention}карту с Множителем{}"
                }
            },
            j_abn_usury_joker = {
                name = "Ростовщик",
                text = {
                    {
                        "{C:abn_tie}Галстуки{}, {C:abn_bow}Бабочки{} и {C:clubs}Трефы",
                        "становятся {C:attention}Счастливыми{}, при подсчете",
                        "Теряете {C:gold}-$#1#{}, когда",
                        "{C:attention}Счастливая карта{} срабатывает"
                    },
                    {
                        "Можете взять до",
                        "{C:red}-$#2#{} в долг",
                    }
                }
            },
            --#endregion





            --#region V
            j_abn_van_joker = {
                name = "Ван Джокер",
                text = {
                    "{C:attention}+#1#{} слот ваучеров",
                    "в {C:green}лавке"
                }
            },
            j_abn_vaporwave_joker = {
                name = "Вейпорвейв-джокер",
                text = {
                    {
                        "Сыгранные и сброшенные карты с {C:dark_edition}#2#{}",
                        "навсегда получают {C:chips}+#1#{} фишек за каждую",
                        "сыгранную или сброшенную карту"
                    },
                    {
                        "Если это Джокер {C:dark_edition}#2#{}, Джокеры",
                        "с {C:dark_edition}#2#{} дают {C:white,X:chips}X#3#{} фишек"
                    }
                }
            },
            j_abn_venom_comedian = {
                name = "Комик-веном",
                text = {
                    {
                        "Если сыгранная рука содержит {C:attention}Спектрум{},",
                        "этот Джокер содержит {C:attention}бонусы{} при подсчете {C:inactive}(масти){}",
                    },
                    {
                        "{C:abn_tie,s:0.8}Галстуки{s:0.8}: {C:mult,s:0.8}+#5#{s:0.8} множ.",
                        "{C:abn_bow,s:0.8}Бабочки{s:0.8}: {X:chips,C:white,s:0.8}X#6#{s:0.8} фишек",
                        "{C:abn_snow,s:0.8}Снежинки{s:0.8}: {X:mult,C:white,s:0.8}X#7#{s:0.8} множ.",
                        "{C:abn_penumbra,s:0.8}Полутени{s:0.8}: {C:chips,s:0.8}+#8#{s:0.8} фишек",
                        "{C:inactive}(сейчас {X:mult,C:white}X#2#{C:inactive}, {C:mult}+#1#{} {C:inactive},{} {X:chips,C:white}X#4#{C:inactive}, {C:chips}+#3#{} {C:inactive}){}"
                    },
                    {
                        "Если этот Джокер с {C:dark_edition}выпуском{},",
                        "повышает уровень рук, содержащих",
                        "{C:attention}Спектрум{} на {C:attention}2{}",
                    }
                }
            },
            j_abn_vintage_joker = {
                name = "Винтажный джокер",
                text = {
                    {
                        "{C:attention}Повышает уровень первой сыгранной руки{},",
                        "если она не {C:attention}секретная{} и составлена",
                        "только из {C:attention}ванильных{} мастей"
                    },
                    {
                        "Если этот Джокер с {C:dark_edition}Винтажным{} выпуском,",
                        "каждый раз, когда рука {C:attention}повышает уровень{},",
                        "{C:attention}повышает уровень{} другой {C:attention}случайной{} руки",
                    }
                }
            },
            j_abn_vitamin_joker = {
                name = "Витамины",
                text = {
                    {
                        "Карты с {C:attention}печатью{} навсегда",
                        "получают {C:chips}+#1#{} фишек и {C:mult}+#2#{} множ.",
                        "при подсчете"
                    },
                    {
                        "Шанс {C:green}#3# к #4#{}, что эта карта",
                        "будет {C:attention}съедена{} после разыгрывания руки"
                    }
                },
            },
            j_abn_void_emissary = { -- thank you Minus (they made FusionForce) and 0kronix for helping me localise this :>
                name = "Посланник Бездны",
                text = {
                    "Этот Джокер получает {C:chips}+#4#{} фишек",
                    "и {C:mult}+#2#{} множ. за каждые {C:attention}две{}",
                    "{C:attention}четные{} или {C:attention}нечетные{} {C:attention}номерные{}",
                    "карты {C:abn_suitless}Нулей{} в руке",
                    "{C:inactive}(сейчас {C:chips}+#3#{C:inactive} фишек, {C:mult}+#1#{C:inactive} множ.)"
                }
            },
            j_abn_void_joker = {
                name = "Пустотный джокер",
                text = {
                    "Все {C:attention}перевернутые{} Джокеры",
                    "в лавке {C:attention}бесплатные и получают",
                    "{C:dark_edition}#1#{}, {C:dark_edition}#2#{} или",
                    "{C:dark_edition}#3#{} после покупке",
                }
            },
            j_abn_voracity_joker = {
                name = "Ненасытный джокер",
                text = {
                    "Перезапускает {C:attention}Съедобных{} Джокеров,",
                    "Шанс {C:green}#1# к #2#{} {C:attention}съесть{}",
                    "всех {C:attention}Съедобных{} Джокеров в конце раунда",
                }
            },
            j_abn_voucher_jimbo = {
                name = "Ваучер Джимбо",
                text = {
                    "Получает {C:red}+#1#{} мож. и {C:blue}+#2#{} фишек",
                    "за каждый полученный {C:attention}Ваучер{}",
                    "{C:inactive}(сейчас {C:red}+#3#{C:inactive} множ.,{} {C:blue}+#4#{C:inactive} фишек){}",
                }
            },
            j_abn_vjoker = { -- wip
                name = "Привет",
                text = {
                    "Всем Джокер, я Привет"
                },
            },
            --#endregion





            --#region W
            j_abn_watermelon = {
                name = "Арбуз",
                text = {
                    "Джокеры получают {C:mult}+#3#{} множ., когда {C:attention}срабатывают{},",
                    "Шанс {C:green}#1# к #2#{} быть",
                    "{C:attention}съеденным{} в конце каждого раунда",
                }
            },
            j_abn_wee_bonus = {
                name = "Трусливый бонус",
                text = {
                    "{C:attention}Номерные Бонусные",
                    "карты навсегда получают",
                    "{C:chips}+#1#{} фишек при подсчете"
                }
            },
            j_abn_wee_mult = {
                name = "Трусливый множитель",
                text = {
                    "{C:attention}Номерные{} карты",
                    "{C:attention}с Множителем{} навсегда получают",
                    "{C:white,X:mult}X#1#{} множ. при подсчете"
                }
            },
            j_abn_weltschmerz_joker = {
                name = "Мировая скорбь",
                text = {
                    "{C:inactive}Нули{} становятся {C:attention}Перевернутыми{} при подсчете",
                    "Перезапускает {C:attention}Перевернутые{} {C:inactive}Нули{}",
                }
            },
            j_abn_wet_joker = {
                name = "Промокший джокер",
                text = {
                    "{C:weather_report}Прогнозы погоды{}",
                    "не уничтожаются",
                    "в конце раунда"
                }
            },
            j_abn_whitedwarf_joker = {
                name = "Белый карлик",
                text = {
                    "Этот Джокер получает {X:mult,C:white}X#1#{} множ.",
                    "каждый раз, когда",
                    "{C:planet}Ранговая планета{} использована",
                    "{C:inactive}(сейчас {X:mult,C:white}X#2#{C:inactive} множ.)",
                }
            },
            j_abn_whitenoise_joker = {
                name = "Белый шум",
                text = {
                    "Этот Джокер получает {X:mult,C:white}X#2#{} множ.,",
                    "когда играете {C:attention}четное{} количество",
                    "{C:diamonds}Светлых{} и {C:spades}Темных{} мастей",
                    "{C:inactive}(сейчас {X:mult,C:white}X#1#{} {C:inactive}множ.){}",
                }
            },
            j_abn_wicked_witch = {
                name = "Злая ведьма",
                text = {
                    {
                        "Этот Джокер получает {X:mult,C:white}X#1#{} множ., когда",
                        "{C:dark_edition}модовая{} карта {C:tarot}таро{} использована",
                        "{C:inactive}(сейчас {X:mult,C:white}X#2#{C:inactive} множ.)",
                    },
                    {
                        "{C:red}Самоуничтожается{}, если",
                        "{C:weather_report}Прогноз погоды{} использован",
                    }
                },
            },
            j_abn_wiimotionplus = {
                name = 'Нече(с)ные правила',
                text = {
                    "Этот Джокер получает {C:mult}+#2#{} множ.",
                    "в начале каждого {C:attention}блайнда,",
                    "если до этого он не начинал",
                    "{C:attention}блайнд{} в этом {C:attention}слоте джокеров{}",
                    "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.){}",
                    "{s:0.8}{C:inactive}(Использовано: #3#){}"
                }
            },
            j_abn_wild_stone = {
                name = "Дикий камень",
                text = {
                    {
                        "Если сыгранная рука содержит и {C:attention}Каменную{}",
                        "и {C:attention}Дикую{} карту, обе получают",
                        "{C:gold}+#1#{} Вознесилы и {C:purple}+#2#{} к Счету",
                    },
                    {
                        "{C:enhanced}Каменные{} {C:attention}Джокеры{} получают {X:mult,C:white}X#3#{} множ., {C:enhanced}Дикие{}",
                        "{C:attention}Джокеры{} получают {X:chips,C:white}X#4#{} фишек, когда срабатывают",
                    },
                    {
                        "Когда {C:attention}Большой блайнд{} выбран,",
                        "создает последнюю использованную в",
                        "этой партии {C:astro_cards}Астро{} карту",
                        "{C:inactive}сейчас:{} {C:astro_cards}#5#{}",
                    }
                }
            },
            j_abn_wild_gold = {
                name = "Дикое золото",
                text = {
                    {
                        "Если сыгранная рука содержит и {C:attention}Дикую{}",
                        "и {C:attention}Золотую{} карту, обе получают",
                        "{C:gold}+#1#{} Вознесилы и {C:purple}+#2#{} к Счету",
                    },
                    {
                        "{C:enhanced}Дикие{} {C:attention}Джокеры{} получают {X:mult,C:white}X#3#{} множ., {C:enhanced}Золотые{}",
                        "{C:attention}Джокеры{} получают {X:chips,C:white}X#4#{} фишек, когда срабатывают"
                    },
                    {
                        "Когда {C:attention}Большой блайнд{} выбран,",
                        "создает последнюю использованную в",
                        "этой партии {C:atomic}Атомную{} карту",
                        "{C:inactive}сейчас:{} {C:atomic}#5#{}"
                    }
                }
            },
            j_abn_wild_power_joker = { -- ts doesnt exist
                name = "Дикая сила",
                text = {
                    "Когда {C:attention}Дикая{} карта подсчитывается:",
                    "Шанс {C:green,s:0.8}#1# к #2#{s:0.8} на {X:mult,C:white,s:0.8}X#7#{s:0.8} множ.",
                    "Шанс {C:green,s:0.8}#3# к #4#{s:0.8} на {C:mult,s:0.8}+#8#{s:0.8} множ.",
                    "Шанс {C:green,s:0.8}#5# к #6#{s:0.8} на {C:chips,s:0.8}+#9#{s:0.8} фишек",
                }
            },
            j_abn_wildfrost_joker = {
                name = "Джокер из Wildfrost",
                text = {
                    "Этот Джокер получает {C:mult}+#3#{} множ., если",
                    "сыгранная рука - это {C:attention}#5#{}",
                    "и {C:chips}+#4#{} фишек, когда карта",
                    "{C:abn_snow}Снежинок{} подсчитана",
                    "{C:inactive}(сейчас {C:chips}+#2#{C:inactive} фишек, {C:mult}+#1#{C:inactive} множ.){}"
                }
            },
            j_abn_will = {
                name = "Уилл",
                text = {
                    "Этот Джокер получает {X:chips,C:white}X#2#{} фишек,",
                    "если сыгранная рука содержит",
                    "подсчитываемые {C:attention}нечетные{} карты",
                    "{C:inactive}(сейчас {C:white,X:chips}X#1#{C:inactive} фишек){}"
                }
            },
            j_abn_wingding_joker = {
                name = "Wingding джокер",
                text = {
                    "Этот Джокер получает {C:mult}+#4#{} множ.,",
                    "когда карта {C:lexica}Лексики{} продана,",
                    "получает {C:chips}+#2#{} фишек когда",
                    "{C:program_pack}Программная{} карта продана",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек, {C:mult}+#3#{C:inactive} множ.)"
                }
            },
            j_abn_wireframe_joker = {
                name = "Проволочный джокер",
                text = {
                    "шанс {C:green}#1# in #2#{}, что",
                    "сыгранная {C:attention}номерная{} карта",
                    "создаст карту {C:tarot}Таро{}",
                    "при подсчете",
                    "{C:inactive}(должно быть место)",
                }
            },
            j_abn_witching_hour = {
                name = "Час ведьм",
                text = {
                    {
                        "Все карты с {C:spades}темной мастью{}",
                        "вытягиваются лицом вниз",
                    },
                    {
                        "Этот Джокер получает {X:mult,C:white}X#2#{} множ.",
                        "за каждую вытянутую перевернутую карту",
                        "{C:inactive}(сейчас {X:mult,C:white}X#1#{C:inactive} множ.)"
                    }
                }
            },
            j_abn_witness_protection = {
                name = "Защита свидетелей",
                text = {
                    {
                        "{X:chips,C:white}X#1#{} фишек за каждую",
                        "уникальную {C:attention}редкость{} среди",
                        "всех {C:attention}перевернутых{} Джокеров",
                        "{C:inactive}(сейчас {X:chips,C:white}X#3#{C:inactive} фишек)",
                    },
                    {
                        "Если этот Джокер {C:attention}перевернут{},",
                        "подсчитываемые карты дают {C:chips}+#2#{} фишек за",
                        "каждого имеющегося {C:attention}перевернутого{} Джокера",
                        "{C:inactive}(сейчас {C:chips}+#4#{C:inactive} фишек)",
                    }
                }
            },
            j_abn_worldwind_joker = {
                name = "Мировой вихрь",
                text = {
                    {
                        "Перемешивает всех {C:attention}Джокеров{},",
                        "когда рука сыграна",
                    },
                    {
                        "Перезапускает {C:attention}самого левого{} Джокера,",
                        "{C:white,X:mult}X#1#{} множ. вместо этого, если",
                        "самый левый - это {C:attention}Мировой вихрь{}",
                    }
                },
            },
            --#endregion





            --#region X
            j_abn_xenon_joker = {
                name = "Ксеноновый джокер",
                text = {
                    "Карты и Джокеры",
                    "с {C:dark_edition}#2#{}",
                    "дают {X:mult,C:white}X#1#{} множ."
                }
            },
            --#endregion





            --#region Y
            j_abn_yanga_joker = {
                name = "Янга джокер",
                text = {
                    {
                        "Получает {C:chips}+#4#{} фишек, когда {C:attention}Темная{} карта подсчитывается",
                        "Получает {C:mult}+#3#{} множ., когда {C:dark_edition}Хтоническая{} карта подсчитывается",
                        "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ.,{} {C:chips}+#2#{} {C:inactive}фишек)",
                    },
                    {
                        "Если {C:attention}первая рука{} раунда - это {C:attention}Флеш{} из {C:abn_bow}Бабочек{}, улучшает",
                        "сыгранные карты до {C:dark_edition}Хтонических{} {C:spades}Темнейших{} карт",
                        "Если {C:attention}первая рука{} раунда - это {C:attention}Флеш{} из {C:spades}Пик{}, улучшает",
                        "сыгранные карты до {C:dark_edition}Темных{} {C:spades}Темнейших{} карт",
                        "Если {C:attention}первая рука{} раунда - это {C:attention}Флеш{} из {C:clubs}Треф{}, улучшает",
                        "сыгранные карты до {C:dark_edition}Хтонических{} {C:spades}Темнейших{} карт",
                    }
                }
            },
            j_abn_yesman_joker = {
                name = "Улыбка",
                text = {
                    "{C:dark_edition}Выпуски{} {C:attention}в руке{} так же срабатывают",
                    "Этот Джокер получает {C:mult}+#3#{} множ. и",
                    "{C:chips}+#4#{} фишек, когда {C:dark_edition}Выпуск{} срабатывает",
                    "{C:inactive}(сейчас{} {C:mult}+#1#{} {C:inactive}множ., {C:chips}+#2#{} {C:inactive}фишек)",
                }
            },
            j_abn_yharman_joker = {
                name = "Джокер из Ярнама",
                text = {
                    {
                        "{V:1}#1# масть{} вытягивается {C:attention}лицом вниз{}",
                        "{C:inactive,s:0.8}Масть меняется при выборе Блайнда",
                    },
                    {
                        "Повышает {C:planet}планетный{} уровень",
                        "{C:attention}рангов{} карт, расположенных {C:attention}лицом вверх{}",
                        "при подсчете по 1 разу за каждую",
                        "подсчитываемую {C:attention}перевернутую{} карту, добавляет",
                        "{C:dark_edition}#2#{} к картам, уровень которых выше {C:attention}5{}",
                    }
                }
            },
            j_abn_yorick_deluxe = {
                name = "Йорик {C:attention}Делюкс",
                text = {
                    {
                        "Этот Джокер получает {C:mult}+#5#{} множ.",
                        "за каждую сброшенную карту",
                        "{C:inactive}(сейчас {C:mult}+#6#{C:inactive} множ.)"
                    },
                    {
                        "Этот Джокер получает {X:chips,C:white}X#1#{} фишек",
                        "каждые {C:attention}#2#{C:inactive} [#3#]{} сброшенных карт",
                        "{C:inactive}(сейчас {X:chips,C:white}X#4#{C:inactive} фишек)",
                    },
                    {
                        "Если есть {C:attention}Джорик{},",
                        "сброшенные карты навсегда",
                        "получают {C:mult}множ.{}, равный их {C:attention}достоинству{}"
                    }
                }
            },
            j_abn_york = {
                name = "Йорк",
                text = {
                    "Карты дают {X:mult,C:white}X#1#{} множ. при подсчете",
                    "Карты в руке дают {X:chips,C:white}X#1#{} фишек",
                }
            },
            j_abn_zack_comic = {
                name = "Комик Зак",
                text = {
                    {
                        "{C:abn_leaf}Листья{} дают {X:chips,C:white}X#1#{} фишек",
                        "при подсчете, фишки увеличиваются на {X:chips,C:white}X#2#{}",
                        "когда {C:abn_leaf}Лист{} подсчитывается",
                    },
                    {
                        "Если есть {C:attention}Джокер{}, все",
                        "{C:attention}подсчитываемые{} карты получают {C:mult}множ.{},",
                        "равный количеству имеющихся расходников,",
                        "когда {C:abn_leaf}Лист{} подсчитывается",
                    }
                }
            },
            j_abn_zauberer_magicians = {
                name = "Чародеи-волшебники",
                text = {
                    {
                        "Карты меняют {C:attention}масти{} после подсчета:",
                        "{C:hearts,s:0.8}Черви{s:0.8} -> {C:abn_snow,s:0.8}Снежинки{s:0.8} -> {C:diamonds,s:0.8}Бубны{s:0.8} -> {C:abn_tie,s:0.8}Галстуки",
                        "{s:0.8} -> {C:clubs,s:0.8}Трефы{s:0.8} -> {C:abn_penumbra,s:0.8}Полутени{s:0.8} -> {C:spades,s:0.8}Пики{s:0.8} -> {C:abn_bow,s:0.8}Бабочки{}",
                    },
                    {
                        "Если этот Джокер {C:dark_edition}Винтажный{},",
                        "он получает {C:mult}+#2#{} множ. и {C:money}$#2#{} к {C:attention}цене продажи,",
                        "когда карта меняет {C:attention}масть{}",
                        "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.)",
                    }
                }
            },
            j_abn_zip_folder = {
                name = "ZIP Папка",
                text = {
                    "{C:attention}Удвивает{} слоты расходников,",
                    "Когда {C:attention}Блайнд{} побежден",
                    "получает {C:chips}+#2#{} фишек за",
                    "за каждый имеющийся {C:attention}расходник",
                    "{C:inactive}(сейчас {C:chips}+#1#{C:inactive} фишек)",
                }
            },
            j_abn_zoom_in = {
                name = 'Не так близко',
                text = {
                    "Этот Джокер получает {C:mult}+#2#{} множ.,",
                    "если сыгранная рука содержит",
                    "{C:attention}Туз{} и {C:attention}номерную карту{}",
                    "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.)",
                },
            },
            --#endregion
        }
    },
    misc = {
        dictionary = {
            -- Jevil effects
            abn_unique_suit_1 = {
                "{E:1}1 масть",
                "Перезапускает все карты {C:attention}#5#{} раз",
                "если {C:money}${} - это {C:attention}простое{} число",
            },
            abn_unique_suit_2 = {
                "{E:1}2 масти",
                "Карты дают {C:white,X:blind}X#2#{} к",
                "размеру Блайнда при подсчете"
            },
            abn_unique_suit_3 = {
                "{E:1}3 масти",
                "Карты дают {C:attention}достоинства{}",
                "{C:attention}соседних{} карт как",
                "{C:chips}фишки{} при подсчете"
            },
            abn_unique_suit_4 = {
                "{E:1}4 масти",
                "Карты дают {C:white,X:mult}X#3#{} множ.",
                "при подсчете"
            },
            abn_unique_suit_5 = {
                "{E:1}5 мастей",
                "Карты навсегда получают {C:gold}+#4#{} Вознес.",
                "при подсчете"
            },
            abn_unique_suit_6 = {
                "{E:1}6 мастей",
                "Уничтожает всех {C:attention}НЕ Легендарных{} Джокеров",
                "и заменяет их {C:legendary}Легендарными{} Джокерами",
                "{s:0.8}Исключая {C:abn_j,s:0.8}Д{C:abn_e,s:0.8}ж{C:abn_v,s:0.8}е{C:abn_i,s:0.8}в{C:abn_l,s:0.8}и{C:abn_j,s:0.8}л{C:abn_e,s:0.8}а"
            },
            -- Bio Blueprint tooltips
            abn_bio_blueprint_incompatible_norank = {
                name = "Несовместимо",
                text = {
                    "Карта без достоинства не может",
                    "получить никаких бонусов"
                }
            },
            abn_bio_blueprint_incompatible_rank = {
                name = "Несовместимо",
                text = {
                    "Карта с достоинством '#1#' не",
                    "может получить никаких бонусов"
                }
            },
            abn_bio_blueprint_even = {
                name = "#1# из #2# (Четная)",
                text = {
                    "Все #1# дают {C:mult}+#3#{} множ. при подсчете",
                    "Если хотя бы {C:attention}#1#{} #1# подсчитано",
                    "к концу раунда, удваивает множ.",
                    "{C:inactive}({C:attention}#4#{C:inactive}/#1# #1# подсчитано)"
                }
            },
            abn_bio_blueprint_even_edi = {
                name = "#5# #1# из #2# (Четная)",
                text = {
                    "Все #1# дают {C:mult}+#3#{} множ. при подсчете,",
                    "Все {C:dark_edition}#5#{} #1# дают {C:mult}+#6#{} множ.",
                    "Если хотя бы {C:attention}#1#{} #1# подсчитано",
                    "к концу раунда, удваивает множ.",
                    "Если хотя бы {C:attention}#1#{} {C:dark_edition}#5#{} #1# подсчитано",
                    "к концу раунда, удваивает множ.",
                    "{C:inactive}({C:attention}#4#{C:inactive}/#1# #1# и {C:attention}#7#{C:inactive}/#1# {C:dark_edition}#5# {C:inactive}#1# подсчитано)"
                }
            },
            abn_bio_blueprint_even_enh = {
                name = "#5# #1# из #2# (Четная)",
                text = {
                    "Все #1# дают {C:mult}+#3#{} множ. при подсчете,",
                    "Все {C:dark_edition}#5#{} #1# дают {C:chips}+#6#{} фишек при подсчете",
                    "Если хотя бы {C:attention}#1#{} #1# подсчитано",
                    "к концу раунда, удваивает множ.",
                    "Если хотя бы {C:attention}#1# {C:dark_edition}#5#{} #1# подсчитано",
                    "к концу раунда, удваивает фишки",
                    "{C:inactive}({C:attention}#4#{C:inactive}/#1# #1# и {C:attention}#7#{C:inactive}/#1# {C:attention}#5# {C:inactive}#1# подсчитано)"
                }
            },
            abn_bio_blueprint_even_edi_enh = {
                name = "#5# #8# #1# из #2# (Четная)",
                text = {
                    "Все #1# дают {C:mult}+#3#{} множ. при подсчете,",
                    "Все {C:dark_edition}#5#{} #1# дают {C:mult}+#6#{} множ. при подсчете",
                    "Все {C:attention}#8#{} #1# дают {C:chips}+#9#{} фишек при подсчете",
                    "Если хотя бы {C:attention}#1#{} #1# подсчитано",
                    "к концу раунда, удваивает множ.",
                    "Если хотя бы {C:attention}#1# {C:dark_edition}#5#{} #1# подсчитано",
                    "к концу раунда, удваивает множ.",
                    "Если хотя бы {C:attention}#1# #8#{} #1# подсчитано",
                    "к концу раунда, удваивает фишки",
                    "{C:inactive}({C:attention}#4#{C:inactive}/#1# #1#, {C:attention}#7#{C:inactive}/#1# {C:dark_edition}#5# {C:inactive}#1# и {C:inactive}#10#/#1# {C:attention}#8# {C:inactive}#1# подсчитано)"
                }
            },
            abn_bio_blueprint_odd = {
                name = "#1# из #2# (Нечетная)",
                text = {
                    "Все #1# дают {C:chips}+#3#{} фишек при подсчете",
                    "Если хотя бы {C:attention}#1#{} #1# подсчитано",
                    "к концу раунда, удваивает фишек",
                    "{C:inactive}({C:attention}#4#{C:inactive}/#1# #1# подсчитано)"
                }
            },
            abn_bio_blueprint_odd_edi = {
                name = "#5# #1# из #2# (Нечетная)",
                text = {
                    "Все #1# дают {C:chips}+#3#{} фишек при подсчете",
                    "Все {C:dark_edition}#5#{} #1# дают {C:mult}+#6#{} множ. при подсчете",
                    "Если хотя бы {C:attention}#1#{} #1# подсчитано",
                    "к концу раунда, удваивает фишек",
                    "Если хотя бы {C:attention}#1# {C:dark_edition}#5#{} #1# подсчитано",
                    "к концу раунда, удваивает множ.",
                    "{C:inactive}({C:attention}#4#{C:inactive}/#1# #1# и {C:attention}#7#{C:inactive}/#1# {C:dark_edition}#5# {C:inactive}#1# подсчитано)"
                }
            },
            abn_bio_blueprint_odd_enh = {
                name = "#5# #1# из #2# (Нечетная)",
                text = {
                    "Все #1# дают {C:chips}+#3#{} фишек при подсчете",
                    "Все {C:dark_edition}#5#{} #1# дают {C:chips}+#6#{} фишек при подсчете",
                    "Если хотя бы {C:attention}#1#{} #1# подсчитано",
                    "к концу раунда, удваивает фишек",
                    "Если хотя бы {C:attention}#1# {C:dark_edition}#5#{} #1# подсчитано",
                    "к концу раунда, удваивает фишки",
                    "{C:inactive}({C:attention}#4#{C:inactive}/#1# #1# и {C:attention}#7#{C:inactive}/#1# {C:attention}#5# {C:inactive}#1# подсчитано)"
                }
            },
            abn_bio_blueprint_odd_edi_enh = {
                name = "#5# #8# #1# из #2# (Нечетная)",
                text = {
                    "Все #1# дают {C:chips}+#3#{} фишек при подсчете",
                    "Все {C:dark_edition}#5#{} #1# дают {C:mult}+#6#{} множ. при подсчете",
                    "Все {C:attention}#8#{} #1# дают {C:chips}+#9#{} фишек при подсчете",
                    "Если хотя бы {C:attention}#1#{} #1# подсчитано",
                    "к концу раунда, удваивает фишек",
                    "Если хотя бы {C:attention}#1# {C:dark_edition}#5#{} #1# подсчитано",
                    "к концу раунда, удваивает множ.",
                    "Если хотя бы {C:attention}#1# #8#{} #1# подсчитано",
                    "к концу раунда, удваивает фишки",
                    "{C:inactive}({C:attention}#4#{C:inactive}/#1# #1#, {C:attention}#7#{C:inactive}/#1# {C:dark_edition}#5# {C:inactive}#1# и {C:inactive}#10#/#1# {C:attention}#8# {C:inactive}#1# подсчитано)"
                }
            },
        }
    }
}