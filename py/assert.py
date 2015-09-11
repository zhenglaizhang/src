def product(*args):
    ret = 1
    for arg in args:
        ret *= arg
    assert ret, "0 argument"
    return ret 