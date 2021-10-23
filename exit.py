# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys
import bpy
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal
from . properties import addon_Properties
from . . core import QtWindowEventLoop
class Exit(QObject):
    @Slot()
    def exit(self):
        QtWindowEventLoop.widget = 'END'
        print('exit')
