def get_int(msg):
    while True:
        try:
            i = int(input(msg))
            return i
        except ValueError as err:
            print(err)


age = get_int("enter your age")

import sys
print(sys.argv)