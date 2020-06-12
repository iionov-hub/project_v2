a=int(input('Ведите a'))
b=int(input('Ведите b'))
c = 0

while b > a:
    c += 1
    print(f"{c}-й день: {a}")
    a = round(a+(a*10/100),2)
c += 1
print(f"{c}-й день: {a}")
print(f"на {c}-й день спортсмен достиг результата — не менее {b} км")