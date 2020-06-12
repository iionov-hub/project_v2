revenue = int(input('Укажите выручку фирмы'))
cost = int(input('Кажите издержку фирмы'))

if revenue > cost:
    print("Финансовый результат фирмы: прибыль")
    profit = revenue - cost
    print(f"рентабельность выручки: {profit}")
    num_emp = int(input('Укажите колличество сотрудников фирмы'))
    num_emp = profit/num_emp
    print(f"Прибыль одного сотрудника: {num_emp}")
else:
    print("Финансовый результат фирмы: убыток")

