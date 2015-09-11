#!/usr/bin/env python3
# Copyright ...

"""
This module provides a few string manipulation functions.

>>> is_balanced("(Python (is (not (lisp))))")
True
>>> shorten("The Crossing", 10)
'The Cro...'
>>> simplify(" some text with spurious whitespace ") 
'some text with spurious whitespace'
"""

import string

def simplify(text, whitespace=string.whitespace, delete=""):
    pass

def is_balanced(text, brackets="()[]{}<>"):
    pass


if __name__ == "__main__":
    import doctest
    doctest.testmod()
