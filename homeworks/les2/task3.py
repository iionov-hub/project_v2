my_list = ['зима', 'весна', 'лето', 'осень']
my_dict = {'key': 'зима', 'key2': 'весна', 'key3': 'лето', 'key4': 'осень'}
v_month = int(input("Введите месяц в виде целого числа от 1 до 12 "))
if v_month == 12 or v_month == 1 or v_month == 2:
    print(my_list[0])
    print(my_dict['key'])
elif v_month == 3 or v_month == 4 or v_month == 5:
    print(my_list[1])
    print(my_dict['key2'])
elif v_month == 6 or v_month == 7 or v_month == 8:
    print(my_list[2])
    print(my_dict['key3'])
else:
    print(my_list[3])
    print(my_dict['key4'])
