# Here’s a working example with notepad# Adds a filepath to bpy.context.scene.live_text. Just point it to a py-file.import bpyimport osbl_info = {    "name" : "live text",    "author" : "kaio",    "description" : "yep",    "blender" : (2, 81, 0),    "location" : "Text Editor",    "warning" : "",    "category" : "Text Editor"}def execute_text(context):    st = getattr(context, 'space_data', None)    if not execute_text.ok or not st:        return    execute_text.ok = False    try:        bpy.ops.text.run_script()    except Exception as err:        print(err)def call_redraw():    wm = bpy.data.window_managers[0]    texeds = [a for w in wm.windows             for a in w.screen.areas             if a.type == 'TEXT_EDITOR' and             a.spaces.active.text]    if texeds:        path = bpy.data.scenes[0].live_text        name = os.path.split(path)[-1]        for ed in texeds:            if name == ed.spaces.active.text.name:                execute_text.ok = True                ed.tag_redraw()                return        else:            text = bpy.data.texts.get(name)            if not text:                text = bpy.data.texts.new(name)            texeds[0].spaces.active.text = textdef modify_internal_text():    path = bpy.data.scenes[0].live_text    name = os.path.split(path)[-1]    text = bpy.data.texts.get(name)    if not text:        text = bpy.data.texts.new(name)    with open(path) as file:        text.from_string(file.read())def poll_text():    live_text = bpy.data.scenes[0].live_text    if os.path.exists(live_text):        mtime = os.path.getmtime(live_text)        if mtime != poll_text.mtime_prev:            modify_internal_text()            poll_text.mtime_prev = mtime            call_redraw()    return 1def register():    poll_text.mtime_prev = -1    execute_text.ok = False    add = bpy.types.SpaceTextEditor.draw_handler_add    bpy.types.Scene.live_text = bpy.props.StringProperty(        name="Live Text", subtype='FILE_PATH', default="‪")    bpy.app.timers.register(lambda: setattr(register, 'execute_text', add(execute_text, (getattr(bpy, 'context'),), 'WINDOW', 'POST_PIXEL')), first_interval=0.1)        bpy.app.timers.register(poll_text)def unregister():    bpy.app.timers.unregister(poll_text)    bpy.types.SpaceTextEditor.draw_handler_remove(        register.execute_text, 'WINDOW')    del bpy.types.Scene.live_text