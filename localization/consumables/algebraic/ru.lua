return {
    descriptions = {
        algebraic = {
            c_abn_euler = {
                name = "Эйлер",
                text = {
                    "Следующий сыгранный {C:attention}Стрит{}",
                    "без {C:attention}достоинств{} выше {C:attention}6{}",
                    "даст {C:white,X:chips}X#1#{} фишек",
                },
            },
            c_abn_golden = {
                name = "Золотое сечение",
                text = {
                    "Следующий сыгранный {C:attention}Стрит{}",
                    "без {C:attention}достоинств{} выше {C:attention}10{}",
                    "даст {C:white,X:mult}X#1#{} множ.",
                },
            },
            c_abn_pi = {
                name = "Число Пи",
                text = {
                    "Следующая сыгранная {C:attention}Старшая карта{}",
                    "даст {C:chips}фишки{} и {C:mult}множ.{}",
                    "последнего сыгранного {C:attention}Флеша{}",
                    "{C:inactive}(сейчас {C:white,X:mult}#1#{} {C:inactive}X{} {C:white,X:chips}#2#{} {C:inactive})",
                },
            },
            c_abn_number = {
                name = "Цифра",
                text = {
                    "Следующая рука только с",
                    "{C:attention}номерными{} картами повышает свой",
                    "{C:attention}уровень{} на {C:attention}1{} за каждое",
                    "{C:attention}уникальное{} число в подсчете"
                },
            },
			c_abn_square_root = {
				name = "Квадратный корень",
				text = {
					"Следующий сыгранный {C:attention}Сет",
					"только с {C:attention}номерными{} картами",
					"даст {C:white,X:chips}X#2#{} фишек",
					"и {C:white,X:mult}X#1#{} множ.",
				},
			},
			c_abn_limit_of_function = {
				name = "Предел функции",
				text = {
					"Следующий сыгранный {C:attention}Флеш",
					"только с {C:attention}номерными{} картами",
					"даст {C:white,X:mult}X#1#{} множ. за каждую",
					"{C:attention}четную{} карту в подсчете",
				},
			},
			c_abn_limit_of_sequence = {
				name = "Предел последовательности",
				text = {
					"Все карты в",
					"следующем сыгранном {C:attention}{}Стрит-флеше",
					"только с {C:attention}номерными{} картами",
					"перезапускаются {C:attention}#1#{} раза",
				},
			},
            c_abn_divide_by_zero = {
                name = "Деление на ноль",
                text = {
                    "Следующий сыгранный {C:attention}{}Фулл-хаус",
					"только с {C:attention}номерными{} картами",
                    "дает {C:mult}множ.{} и {C:chips}фишки{},",
                    "равные сумме {C:mult}множ.{} и {C:chips}фишек{}",
                    "содержащихся в {C:attention}Фулл-хаусе",
                    "{C:inactive}(напр.: Старшая карта, Пара, Сет)"
                }
            },
            c_abn_mathematical_fallacy = {
                name = "Математическая ошибка",
                text = {
                    "Следующая сыгранная {C:dark_edition}секретная{} рука",
					"только с {C:attention}номерными{} картами",
                    "дает {C:gold}+#1#{} Вознесилы за каждую",
                    "покерную руку, содержащуюся в ней"
                }
            },
            ["c_abn_drölf"] = {
                name = "Дрольф",
                text = {
                    "Следующая сыгранная рука только",
					"с {C:attention}номерными{} картами и хотя",
					"бы {C:attention}1 {C:dark_edition}модовым{} достоинством",
					"{C:attention}повышает{} {C:planet}планетный{} уровень {C:attention}рангов{}",
					"всех сыгранных карт перед подсчетом",
					"и дает {X:mult,C:white}X#1#{} множ. и {X:chips,C:white}X#2#{} фишек",
                }
            }
        }
    }
}