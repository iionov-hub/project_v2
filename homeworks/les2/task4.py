my_str = input("Введите строку из нескольких слов, разделённых пробелами ")
my_list = []
num_count = 0
for i in range(my_str.count(' ') + 1):
    my_list = my_str.split()
    if len(str(my_list)) <= 10:
        print(f" {num_count} {my_list [i]}")
        num_count += 1
    else:
        print(f" {num_count} {my_list [i] [0:10]}")
        num_count += 1