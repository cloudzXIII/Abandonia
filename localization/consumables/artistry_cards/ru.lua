return {
    descriptions = {
        artistry_cards = {
            c_abn_marquee = {
                name = "Выделение",
                text = {
                    {
                        "Выберите карту и Джокера:",
                        "{C:mult}Уничтожает{} Джокера",
                        "{C:attention}Все{} карты с такой же {C:attention}мастью{},",
                        "как у выбранной карты, получают {C:chips}фишки{},",
                        "зависящие от {C:attention}редкости{} Джокера",
                    },
                    {
                        "{C:common,s:0.8}Обычный{s:0.8}: {C:chips,s:0.8}+#1#{s:0.8}, {C:uncommon,s:0.8}Необычный{s:0.8}: {C:chips,s:0.8}+#2#{}",
                        "{C:rare,s:0.8}Редкий{s:0.8}: {C:chips,s:0.8}+#3#{s:0.8}, {C:abn_superrare,s:0.8}Супер редкий{s:0.8}: {C:chips,s:0.8}+#4#{}",
                        "{C:legendary,s:0.8}Легендарный{s:0.8}: {C:chips,s:0.8}+#5#{s:0.8}, {C:abn_parallelrare,s:0.8}Параллель-редкий{s:0.8}: {C:chips,s:0.8}+#6#{}",
                    }
                }
            },
            c_abn_pencil = {
                name = "Карандаш",
                text = {
                    {
                        "Выберите карту и Джокера:",
                        "{C:mult}Уничтожает{} Джокера",
                        "{C:attention}Все{} карты с такой же {C:attention}мастью{},",
                        "как у выбранной карты, получают {C:mult}множ.{},",
                        "зависящий от {C:attention}редкости{} Джокера",
                    },
                    {
                        "{C:common,s:0.8}Обычный{s:0.8}: {C:mult,s:0.8}+#1#{s:0.8}, {C:uncommon,s:0.8}Необычный{s:0.8}: {C:mult,s:0.8}+#2#{}",
                        "{C:rare,s:0.8}Редкий{s:0.8}: {C:mult,s:0.8}+#3#{s:0.8}, {C:abn_superrare,s:0.8}Супер редкий{s:0.8}: {C:mult,s:0.8}+#4#{}",
                        "{C:legendary,s:0.8}Легендарный{s:0.8}: {C:mult,s:0.8}+#5#{s:0.8}, {C:abn_parallelrare,s:0.8}Параллель-редкий{s:0.8}: {C:mult,s:0.8}+#6#{}",
                    }
                }
            },
            c_abn_eraser = {
                name = "Ластик",
                text = {
                    {
                        "Выберите карту {C:attention}без достоинства{} и Джокера:",
                        "{C:mult}Уничтожает{} Джокера",
                        "{C:attention}Все{} карты {C:attention}без достоинства{} получают {C:chips}фишки{} и {C:mult}множ.{},",
                        "зависящие от {C:attention}редкости{} Джокера",
                    },
                    {
                        "{C:common,s:0.8}Обычный{s:0.8}: {C:chips,s:0.8}+#1#{s:0.8} и {C:mult,s:0.8}+#2#{s:0.8}, {C:uncommon,s:0.8}Необычный{s:0.8}: {C:chips,s:0.8}+#3#{s:0.8} и {C:mult,s:0.8}+#4#{}",
                        "{C:rare,s:0.8}Редкий{s:0.8}: {C:chips,s:0.8}+#5#{s:0.8} и {C:mult,s:0.8}+#6#{s:0.8}, {C:abn_superrare,s:0.8}Супер редкий{s:0.8}: {C:chips,s:0.8}+#7#{s:0.8} и {C:mult,s:0.8}+#8#{}",
                        "{C:legendary,s:0.8}Легендарный{s:0.8}: {C:chips,s:0.8}+#9#{s:0.8} и {C:mult,s:0.8}+#10#{s:0.8}, {C:abn_parallelrare,s:0.8}Параллель-редкий{s:0.8}: {C:chips,s:0.8}+#11#{s:0.8} и {C:mult,s:0.8}+#12#{}",
                    }
                }
            },
            c_abn_eyedropper = {
                name = "Пипетка",
                text = {
                    {
                        "Выберите карту и Джокера:",
                        "{C:mult}Уничтожает{} Джокера",
                        "{C:attention}Все{} карты с такой же {C:attention}мастью{},",
                        "как у выбранной карты, получают {C:money}${},",
                        "зависящие от {C:attention}редкости{} Джокера",
                    },
                    {
                        "{C:common,s:0.8}Обычный{s:0.8}: {C:money,s:0.8}+$#1#{s:0.8}, {C:uncommon,s:0.8}Необычный{s:0.8}: {C:money,s:0.8}+$#2#{}",
                        "{C:rare,s:0.8}Редкий{s:0.8}: {C:money,s:0.8}+$#3#{s:0.8}, {C:abn_superrare,s:0.8}Супер редкий{s:0.8}: {C:money,s:0.8}+$#4#{}",
                        "{C:legendary,s:0.8}Легендарный{s:0.8}: {C:money,s:0.8}+$#5#{s:0.8}, {C:abn_parallelrare,s:0.8}Параллель-редкий{s:0.8}: {C:money,s:0.8}+$#6#{}",
                    }
                }
            },
            c_abn_hand = {
                name = "Рука",
                text = {
                    {
                        "Выберите карту и Джокера:",
                        "{C:mult}Уничтожает{} Джокера",
                        "{C:attention}Все{} карты с такой же {C:attention}мастью{},",
                        "как у выбранной карты, получают {X:chips,C:white}Хфишки{},",
                        "зависящие от {C:attention}редкости{} Джокера",
                    },
                    {
                        "{C:common,s:0.8}Обычный{s:0.8}: {X:chips,C:white,s:0.8}X#1#{s:0.8}, {C:uncommon,s:0.8}Необычный{s:0.8}: {X:chips,C:white,s:0.8}X#2#{}",
                        "{C:rare,s:0.8}Редкий{s:0.8}: {X:chips,C:white,s:0.8}X#3#{s:0.8}, {C:abn_superrare,s:0.8}Супер редкий{s:0.8}: {X:chips,C:white,s:0.8}X#4#{}",
                        "{C:legendary,s:0.8}Легендарный{s:0.8}: {X:chips,C:white,s:0.8}X#5#{s:0.8}, {C:abn_parallelrare,s:0.8}Параллель-редкий{s:0.8}: {X:chips,C:white,s:0.8}X#6#{}",
                    }
                }
            },
            c_abn_move = {
                name = "Перемещение",
                text = {
                    {
                        "Выберите карту и Джокера:",
                        "{C:mult}Уничтожает{} Джокера",
                        "{C:attention}Все{} карты с такой же {C:attention}мастью{},",
                        "как у выбранной карты, получают {X:mult,C:white}Хмнож.{},",
                        "зависящие от {C:attention}редкости{} Джокера",
                    },
                    {
                        "{C:common,s:0.8}Обычный{s:0.8}: {X:mult,C:white,s:0.8}X#1#{s:0.8}, {C:uncommon,s:0.8}Необычный{s:0.8}: {X:mult,C:white,s:0.8}X#2#{}",
                        "{C:rare,s:0.8}Редкий{s:0.8}: {X:mult,C:white,s:0.8}X#3#{s:0.8}, {C:abn_superrare,s:0.8}Супер редкий{s:0.8}: {X:mult,C:white,s:0.8}X#4#{}",
                        "{C:legendary,s:0.8}Легендарный{s:0.8}: {X:mult,C:white,s:0.8}X#5#{s:0.8}, {C:abn_parallelrare,s:0.8}Параллель-редкий{s:0.8}: {X:mult,C:white,s:0.8}X#6#{}",
                    }
                }
            },
            c_abn_paint = {
                name = "Заливка",
                text = {
                    {
                        "Выберите карту и Джокера:",
                        "{C:mult}Уничтожает{} Джокера",
                        "Повышает {C:planet}планетный{} уровень",
                        "{C:attention}ранга{} выбранной карты на количество,",
                        "зависящее от {C:attention}редкости{} Джокера",
                    },
                    {
                        "{C:common,s:0.8}Обычный{s:0.8}: {C:planet,s:0.8}+#1#{s:0.8}, {C:uncommon,s:0.8}Необычный{s:0.8}: {C:planet,s:0.8}+#2#{}",
                        "{C:rare,s:0.8}Редкий{s:0.8}: {C:planet,s:0.8}+#3#{s:0.8}, {C:abn_superrare,s:0.8}Супер редкий{s:0.8}: {C:planet,s:0.8}+#4#{}",
                        "{C:legendary,s:0.8}Легендарный{s:0.8}: {C:planet,s:0.8}+#5#{s:0.8}, {C:abn_parallelrare,s:0.8}Параллель-редкий{s:0.8}: {C:planet,s:0.8}+#6#{}",
                    }
                }
            },
            c_abn_line = {
                name = "Линия",
                text = {
                    {
                        "Выберите карту и Джокера:",
                        "{C:mult}Уничтожает{} Джокера",
                        "{C:attention}Все{} карты с такой же {C:attention}мастью{},",
                        "как у выбранной карты, получают {C:attention}Перезапуски{},",
                        "зависящие от {C:attention}редкости{} Джокера",
                    },
                    {
                        "{C:common,s:0.8}Обычный{s:0.8}: {C:attention,s:0.8}+#1#{s:0.8}, {C:uncommon,s:0.8}Необычный{s:0.8}: {C:attention,s:0.8}+#2#{}",
                        "{C:rare,s:0.8}Редкий{s:0.8}: {C:attention,s:0.8}+#3#{s:0.8}, {C:abn_superrare,s:0.8}Супер редкий{s:0.8}: {C:attention,s:0.8}+#4#{}",
                        "{C:legendary,s:0.8}Легендарный{s:0.8}: {C:attention,s:0.8}+#5#{s:0.8}, {C:abn_parallelrare,s:0.8}Параллель-редкий{s:0.8}: {C:attention,s:0.8}+#6#{}",
                    }
                }
            },
        }
    }
}