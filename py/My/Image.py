#!/usr/bin/env python3

class ImageError(Exception): pass
class CoordinateError(ImageError): pass
class LoadError(Exception): pass
class SaveError(Exception): pass
class ExportError(Exception): pass
class NoFilenameError(Exception): pass
