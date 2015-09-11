def shorten(text, length=25, indicator='...'):
    if len(text) > length:
        text = text[:length - len(indicator)] + indicator 
    return text


print(shorten("Hello World"))
print(shorten(length = 5, text = "Hello World"))
print(shorten("Hello World", indicator = "&&&", length = 6))