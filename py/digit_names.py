Language = "en"
ENGLISH = {0: "zero", 1: "one", 2: "two", 3: "three", 4: "four", 5: "five", 6: "six", 7: "seven", 8: "eight", 9: "nine"}
FRENCH = {0: "zéro", 1: "un", 2: "deux", 3: "trois", 4: "quatre", 5: "cinq", 6: "six", 7: "sept", 8: "huit", 9: "neuf"}


def print_digits(digits):
    dictionary = ENGLISH if Language == "en" else FRENCH 
    for digit in digits:
        print(dictionary[int(digit)], end=" ")
    print()


print_digits("123419901431")