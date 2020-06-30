'''
Создать программно файл в текстовом формате, записать
в него построчно данные, вводимые пользователем.
Об окончании ввода данных свидетельствует пустая строка.
'''

file_name = 'test_file.txt'
## открывем файл
my_file = open(file_name, 'w', encoding='UTF-8')

## заполняем информацию
line = input('Введите текст \n')

while line:
    my_file.writelines(line)
    line = input('Введите текст \n')
    if not line:
        break

##Закрываем файл
my_file.close()
my_file = open(file_name, 'r',encoding='UTF-8')
content = my_file.readlines()
print(content)
my_file.close()