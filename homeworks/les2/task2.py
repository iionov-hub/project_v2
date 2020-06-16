input_string = input("Введите элементы списка, разделенные пробелом ")
my_list = input_string.split()
print("user list is ", my_list)
for i in range(1, len(my_list), 2):
    my_list[i - 1], my_list[i] = my_list[i], my_list[i - 1]
    print(my_list[i])
    print(my_list[i - 1])
##проверяем список
print(my_list)

