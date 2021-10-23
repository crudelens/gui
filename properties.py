from os import terminal_size, write
import weakref
import bpy
import random
from bpy.props import (EnumProperty, FloatProperty, IntProperty,
                       PointerProperty, BoolProperty, RemoveProperty, StringProperty)
from bpy.types import Operator, Panel, PropertyGroup, TexMapping
class addon_Properties(PropertyGroup):

    def addObject(self):
        print('adding cube')
        bpy.ops.object.camera_add(enter_editmode=False, align='VIEW', location=(0, 0, 0), rotation=(1.10871, 0.0132652, 1.14827), scale=(1, 1, 1))

    def camerasnapshot(self):
        fp=bpy.context.scene.render.filepath
        
        for window in bpy.context.window_manager.windows:
            screen = window.screen
            for area in screen.areas:
                if area.type == 'VIEW_3D':
                    override_context = bpy.context.copy()
                    override_context['window'] = window
                    print(screen)
                    override_context['screen'] = bpy.data.screens['Layout']
                    override_context['area'] = area
                    override_context['region'] = area.regions[-1]
                    override_context['scene'] = bpy.context.scene
                    override_context['space_data'] = area.spaces.active
                    print(override_context['screen'])
                    bpy.ops.render.opengl(override_context, write_still=True, view_context=True)
        return fp



        

    
