https://docs.blender.org/api/blender_python_api_2_57_release/bpy.types.Operator.html#invoke-functionimport bpyclass HelloWorldOperator(bpy.types.Operator):    bl_idname = "wm.hello_world"    bl_label = "Minimal Operator"    def execute(self, context):        print("Hello World")        return {'FINISHED'}bpy.utils.register_class(HelloWorldOperator)# test call to the newly defined operatorbpy.ops.wm.hello_world()-------------------------------------------------------------------------------------------------def modal(self, ctx, evt):    if evt.type == 'LEFTMOUSE':        if evt.value == 'PRESS':            print('LMB Pressed')        elif evt.value == 'RELEASE':            print('LMB Released')    return {'RUNNING_MODAL'}-------------------------------------------------------------------------------------------------import bpyclass ModalOperator(bpy.types.Operator):    """Move an object with the mouse, example"""    bl_idname = "object.modal_operator"    bl_label = "Simple Modal Operator"    first_mouse_x: IntProperty()    first_value: FloatProperty()    def modal(self, context, event):        if event.type == 'MOUSEMOVE':            delta = self.first_mouse_x - event.mouse_x            context.object.location.x = self.first_value + delta * 0.01        elif event.type == 'LEFTMOUSE':            return {'FINISHED'}        elif event.type in {'RIGHTMOUSE', 'ESC'}:            context.object.location.x = self.first_value            return {'CANCELLED'}        return {'RUNNING_MODAL'}    def invoke(self, context, event):        if context.object:            self.first_mouse_x = event.mouse_x            self.first_value = context.object.location.x            context.window_manager.modal_handler_add(self)            return {'RUNNING_MODAL'}        else:            self.report({'WARNING'}, "No active object, could not finish")            return {'CANCELLED'}def register():    bpy.utils.register_class(ModalOperator)def unregister():    bpy.utils.unregister_class(ModalOperator)if __name__ == "__main__":    register()    # test call    bpy.ops.object.modal_operator('INVOKE_DEFAULT')			-------------------------------------------------------------------------------------------------				#!/usr/bin/env python#-*- coding:utf-8 -*-from PyQt4 import QtGui, QtCoreclass MyWindow(QtGui.QWidget):    def __init__(self, parent=None):        super(MyWindow, self).__init__(parent)        self.systemTrayIcon = QtGui.QSystemTrayIcon(self)        self.systemTrayIcon.setIcon(QtGui.QIcon.fromTheme("face-smile"))        self.systemTrayIcon.setVisible(True)        self.systemTrayIcon.activated.connect(self.on_systemTrayIcon_activated)        self.label = QtGui.QLabel(self)        self.label.setText("Minimize me!")        self.layoutVertical = QtGui.QVBoxLayout(self)        self.layoutVertical.addWidget(self.label)    @QtCore.pyqtSlot(QtGui.QSystemTrayIcon.ActivationReason)    def on_systemTrayIcon_activated(self, reason):        if reason == QtGui.QSystemTrayIcon.DoubleClick:            if self.isHidden():                self.show()            else:                self.hide()    def changeEvent(self, event):        if event.type() == QtCore.QEvent.WindowStateChange:            if self.windowState() & QtCore.Qt.WindowMinimized:                event.ignore()                self.close()                return        super(MyWindow, self).changeEvent(event)    def closeEvent(self, event):        event.ignore()        self.hide()        self.systemTrayIcon.showMessage('Running', 'Running in the background.')if __name__ == "__main__":    import sys    app = QtGui.QApplication(sys.argv)    app.setApplicationName('MyWindow')    main = MyWindow()    main.show()    sys.exit(app.exec_())