def append_if_even(x, lst=None):
    lst = [] if lst is None else lst 
    if (x % 2) == 0:
        lst.append(x)
    return lst



def append_if_even2(x, lst=[]):
    if (x % 2) == 0:
        lst.append(x)
    return lst



l = append_if_even2(2)
l = append_if_even2(4)
print(l)


l2 = append_if_even(2)
l2 = append_if_even(4)
print(l2)