		script_path = Micra_Blender_Dir + "\\mcCommand.py"		exec(compile(open(script_path).read(), script_path, 'exec'))		# text = bpy.data.texts[script_path]   # if exists in blend		# ctx = bpy.context.copy()		# ctx['edit_text'] = text		# bpy.ops.text.run_script(ctx)		# bpy.ops.script.python_file_run(filepath=script_path)