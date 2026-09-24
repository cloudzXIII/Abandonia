return {
    descriptions = {
        paradox = {
            c_abn_laplace = {
                name = "Лаплас",
                text = {
                    {
                        "На {C:attention}четных{} Анте {C:attention}Переворачивает{}",
                        "все карты {C:attention}в руке{}",
                    },
                    {
                        "На {C:attention}нечетных{} Анте {C:attention}Переворачивает",
                        "{C:attention}5{} случайных карт в {C:attention}колоде{}"
                    }
                }
            },
            c_abn_maxwell = {
                name = "Максвелл",
                text = {
                    {
                        "На {C:attention}четных{} Анте {C:attention}ванильные расходники{}",
                        "в руке получают {C:chips}+#1#{} фишек",
                    },
                    {
                        "На {C:attention}нечетных{} Анте {C:attention}модовые расходники{}",
                        "в руке получают {C:mult}+#2#{} множ."
                    }
                }
            },
            c_abn_schrodinger = {
                name = "Шредингер",
                text = {
                    {
                        "На {C:attention}четных{} Анте дает всем Джокерам",
                        "{C:mult}Хрупкий{} и создает {C:attention}случайного{}",
                        "{C:abn_superrare}Супер редкого{} {C:abn_perishable}Портящегося{} Джокера"
                    },
                    {
                        "На {C:attention}нечетных{} Анте дает всем Джокерам",
                        "{C:abn_perishable}Портящийся{} и создает {C:attention}случайного{}",
                        "{C:abn_parallelrare}Параллель-редкого{} {C:mult}Хрупкого{} Джокера"
                    }
                }
            },
            c_abn_zeno = {
                name = "Зено",
                text = {
                    {
                        "На {C:attention}четных{} Анте копирует",
                        "{C:dark_edition}выпуск{} {C:attention}случайной{} карты в руке",
                        "на {C:attention}случайного{} Джокера",
                    },
                    {
                        "На {C:attention}нечетных{} Анте Анте копирует",
                        "{C:dark_edition}выпуск{} {C:attention}случайного{} Джокера",
                        "на {C:attention}случайную{} карту в руке",
                    }
                }
            },
            c_abn_theseus = {
                name = "Тесей",
                text = {
                    {
                        "На {C:attention}четных{} Анте {C:mult}уничтожает{} все",
                        "карты с рангом выше {C:attention}4{} в руке",
                    },
                    {
                        "На {C:attention}нечетных{} Анте {C:mult}уничтожает{} все",
                        "карты с рангом ниже {C:attention}5{} в руке"
                    }
                }
            },
            c_abn_sortie = {
                name = "Сорти",
                text = {
                    {
                        "На {C:attention}четных{} Анте {C:attention}увеличивает",
                        "{C:attention}размер{} Босс-блайнда на {X:attention,C:white}X2{},",
                        "но {C:attention}удваивает{} {C:money}оплату{}",
                    },
                    {
                        "На {C:attention}нечетных{} Анте {C:attention}уменьшает",
                        "{C:attention}размер{} Босс-блайнда на {C:attention}50%{},",
                        "но {C:attention}делит пополам{} {C:money}оплату{}",
                    }
                }
            },
            c_abn_newcomb = {
                name = "Ньюкомб",
                text = {
                    {
                        "На {C:attention}четных{} Анте добавляет {C:dark_edition}улучшение{}",
                        "{C:attention}самой правой{} карты к {C:attention}самомй левому{} Джокеру",
                    },
                    {
                        "На {C:attention}нечетных{} Анте добавляет {C:dark_edition}улучшение{}",
                        "{C:attention}самого левого{} Джокера к {C:attention}самой правой{} карте",
                    }
                }
            },
            c_abn_epimenides = {
                name = "Эпименида",
                text = {
                    {
                        "На {C:attention}четных{} Анте {C:attention}уменьшает{}",
                        "{C:attention}достоинство{} всех карт {C:attention}в руке{} на {C:attention}2{}",
                    },
                    {
                        "На {C:attention}нечетных{} Анте {C:attention}увеличивает{}",
                        "{C:attention}достоинство{} всех карт {C:attention}в руке{} на {C:attention}2{}"
                    }
                }
            },
            c_abn_barjavel = {
                name = "Барджавел",
                text = {
                    {
                        "На {C:attention}четных{} Анте {C:green}перебрасывает{}",
                        "доступные {C:attention}наборы{} в лавке",
                    },
                    {
                        "На {C:attention}нечетных{} Анте {C:green}перебрасывает{}",
                        "доступные {C:attention}ваучеры{} в лавке"
                    }
                }
            },
            c_abn_jevons = {
                name = "Джевонс",
                text = {
                    {
                        "На {C:attention}четных{} Анте возвращает на {C:attention}2{} Анте,",
                        "{C:mult}уничтожает{} всех Джокеров и вы получаете",
                        "{C:money}$5{} за каждого {C:mult}уничтоженного{} Джокера"
                    },
                    {
                        "На {C:attention}нечетных{} Анте возвращает на {C:attention}3{} Анте,",
                        "все Джокеры получают {C:abn_eternal}Вечный{} и",
                        "устанавливает ваши {C:money}${} на {C:money}$0{}"
                    }
                }
            },
            c_abn_roko = {
                name = "Роко",
                text = {
                    {
                        "На {C:attention}четных{} Анте увеличивает победное Анте на {C:attention}4{}",
                        "и вы получаете {C:attention}+2{} слота Джокеров",
                    },
                    {
                        "На {C:attention}нечетных{} Анте уменьшает {C:attention}требование всех Блайндов{}",
                        "на {C:attention}50%{}, но вы теряете {C:attention}2{} Слота Джокеров",
                    }
                }
            },
        }
    }
}