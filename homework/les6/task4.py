'''
Реализуйте базовый класс Car. У данного класса должны быть
следующие атрибуты: speed, color, name, is_police (булево).
А также методы: go, stop, turn(direction), которые должны
сообщать, что машина поехала, остановилась, повернула (куда).
Опишите несколько дочерних классов: TownCar, SportCar, WorkCar,
PoliceCar. Добавьте в базовый класс метод show_speed, который
должен показывать текущую скорость автомобиля. Для классов TownCar
и WorkCar переопределите метод show_speed.
При значении скорости свыше 60 (TownCar) и 40 (WorkCar)
должно выводиться сообщение о превышении скорости.
Создайте экземпляры классов, передайте значения атрибутов.
Выполните доступ к атрибутам, выведите результат.
Выполните вызов методов и также покажите результат.
'''

class Car:
    # atributes
    def __init__(self, speed, color, name, is_police):
        self.speed = speed
        self.color = color
        self.name = name
        self.is_police = is_police

    # methods
    def go(self):
        return f'{self.name} старт'

    def stop(self):
        return f'{self.name} стоп'

    def turn_right(self):
        return f'{self.name} повернуть направа'

    def turn_left(self):
        return f'{self.name} повернуть налево'

    def show_speed(self):
        return f'Текущая скорость {self.name}  {self.speed}'


class TownCar(Car):
    def __init__(self, speed, color, name, is_police):
        super().__init__(speed, color, name, is_police)

    def show_speed(self):
        print(f'Текущая скорость городской машины:  {self.name}  {self.speed}')

        if self.speed > 40:
            return f'Скорость {self.name} выше разрешенного для городского автомобиля'
        else:
            return f'Скорость  {self.name} нормальная для городской машины'

class SportCar(Car):
    def __init__(self, speed, color, name, is_police):
        super().__init__(speed, color, name, is_police)


class WorkCar(Car):
    def __init__(self, speed, color, name, is_police):
        super().__init__(speed, color, name, is_police)

    def show_speed(self):
        print(f'Текущая скорость рабочей машины {self.name} is {self.speed}')

        if self.speed > 60:
            return f'Скорость {self.name} выше разрешенного для рабочего автомобиля'


class PoliceCar(Car):
    def __init__(self, speed, color, name, is_police):
        super().__init__(speed, color, name, is_police)

    def police(self):
        if self.is_police:
            return f'{self.name} полицаи'
        else:
            return f'{self.name} не полицаи'


ferrari = SportCar(100, 'красная', 'ferrari', False)
oka = TownCar(30, 'белая', 'Oka', False)
lada = WorkCar(70, 'белая', 'Lada', True)
ford = PoliceCar(110, 'голубой',  'Ford', True)
print(lada.turn_left())

print(f'Когда  {oka.turn_right()}, затем {ferrari.stop()}')
print(f'{lada.go()} со скоростью {lada.show_speed()}')
print(f'{lada.name} цвета  {lada.color}')
print(f' {ferrari.name} полицаи ? {ferrari.is_police}')
print(f' {lada.name}  полицаи ? {lada.is_police}')
print(ferrari.show_speed())
print(oka.show_speed())
print(ford.police())
print(ford.show_speed())