'''
    Создать (программно) текстовый файл, записать в него программно
    набор чисел, разделенных пробелами. Программа должна
    подсчитывать сумму чисел в файле и выводить ее на экран.
'''

file_name = 'test_file5.txt'
try:
    with open(file_name, 'w+', encoding='UTF-8') as file:
        line = input('Введите цифры через пробел \n')
        file.writelines(line)
        my_numb = line.split()

        print(sum(map(int, my_numb)))
except IOError:
    print('Ошибка в файле')
except ValueError:
    print('Неправильно набран номер. Ошибка ввода-вывода')
