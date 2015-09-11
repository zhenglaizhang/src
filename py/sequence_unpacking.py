def product(*args):
    ret = 1
    for arg in args:
        ret *= arg
    return ret


print(product(1, 2, 3, 4))
print(product(11))