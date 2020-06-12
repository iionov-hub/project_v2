a = int(input())
m = a%10
print(m)
a = a//10
print(a)

while a > 0:
    print(a)
    if a%10 > m:
        m = a%10
    a = a//10


print(m)