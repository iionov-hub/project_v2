'''
Создать класс TrafficLight (светофор) и определить у него
один атрибут color (цвет) и метод running (запуск).
Атрибут реализовать как приватный.
В рамках метода реализовать переключение светофора в режимы:
красный, желтый, зеленый.
Продолжительность первого состояния (красный) составляет 7 секунд,
второго (желтый) — 2 секунды, третьего (зеленый) —
на ваше усмотрение.
Переключение между режимами должно осуществляться только
в указанном порядке (красный, желтый, зеленый).
Проверить работу примера, создав экземпляр и вызвав описанный метод.
Задачу можно усложнить, реализовав проверку порядка режимов,
и при его нарушении выводить соответствующее сообщение и
завершать скрипт.
'''
from time import sleep

class TrafficLight:
    __color = ['Красный', 'Желтый', 'Зеленый']

    def start(self):
        i = 0
        while i < 3:
            print(f'Светофор переключается на: {TrafficLight.__color[i]}')
            if i == 0:
                sleep(7)
            elif i == 1:
                sleep(5)
            elif i == 2:
                sleep(3)
            i += 1

traff = TrafficLight()
traff.start()