# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys
from PySide2 import QtWidgets
from PySide2.QtWidgets import QWidget
import bpy
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal
from . properties import addon_Properties
import threading
class MainWindow(QtWidgets.QMainWindow):
    def __init__(self, parent=None):
        super(MainWindow, self).__init__(parent)
        main=MainWindowfunc()
        from . exit import Exit
        exit=Exit()
        self.engine = QQmlApplicationEngine()
        self.engine.rootContext().setContextProperty("backend", main)
        self.engine.rootContext().setContextProperty("exitcode", exit)
        self.engine.load(os.fspath(Path(__file__).resolve().parent / "qml/main.qml"))

class MainWindowfunc(QObject):
    @Slot()
    def execute(self):
        addon_Properties.addObject(self)

    getFilepath = Signal(str)
    
    @Slot()
    def cameraimageadd(self):
        threads=[]
        for thread in threading.enumerate(): 
            threads.append(thread.name)
            print(thread.name)
            if thread != threading.current_thread():
                thread.join()
        self.getFilepath.emit(addon_Properties.camerasnapshot(self))
        for th in threads:
            print(th.name)
            if th.name!= threading.current_thread():
                th.start()
