'''
2. Реализовать функцию, принимающую несколько параметров,
описывающих данные пользователя: имя, фамилия, год рождения,
город проживания, email, телефон. Функция должна принимать
параметры как именованные аргументы.
Реализовать вывод данных о пользователе одной строкой.
'''

def my_func(name, surname, year, city, email, telephone):
    return ' '.join([name, surname, year, city, email, telephone])



name = input('Укажите имя ')
surname = input('Укажите фамилию ')
year = input('Укажите год рождения ')
city = input('Укажите город проживания ')
email = input('Укажите email ')
telephone = input('Укажите телефон ')

print(my_func(name, surname, year, city, email, telephone))