'''
3. Реализовать функцию my_func(), которая принимает
три позиционных аргумента,
и возвращает сумму наибольших двух аргументов.
'''

def my_func(n_number_1, n_number_2, n_number_3):
    if n_number_1 >= n_number_3 and n_number_2 >= n_number_3:
        return n_number_1 + n_number_2
    elif n_number_1 > n_number_2 and n_number_1 < n_number_3:
        return n_number_1 + n_number_3
    else:
        return n_number_2 + n_number_3



n_number_1 = int(input("Укажите первое число "))
n_number_2 = int(input("Укажите второе число "))
n_number_3 = int(input("Укажите третье число "))
print(f'Result - {my_func(n_number_1, n_number_2, n_number_3)}')

