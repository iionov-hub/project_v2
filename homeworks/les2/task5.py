my_list = [7, 5, 3, 3, 2]
print("Рейтинг -  ", my_list)
num = int(input("Введите число 0 - выход  "))
while num != 0:
    for i in range(len(my_list)):
        if my_list[i] == num:
            # если равны то добавляем на +1 позицию
            my_list.insert(i + 1, num)
            break  ## чтобы много значений не пришло
        elif my_list[0] < num:
            # добавляем в начала если введеное число больше первого элемента
            my_list.insert(0, num)
        elif my_list[-1] > num:
            # Добавляем в конец списка если введеное число меньше последнего числа в списке
            my_list.append(num)
        elif my_list[i] > num and my_list[i + 1] < num:
            my_list.insert(i + 1, num)
    print(f"текущий список - {my_list}")
    num = int(input("Введите число 0 - выход  "))
