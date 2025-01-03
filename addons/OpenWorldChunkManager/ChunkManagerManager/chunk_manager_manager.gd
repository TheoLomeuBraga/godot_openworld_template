@tool

extends ChunkManagerPluginBase

class_name ChunkManagerManager

@export var manual_mode : bool = false:
	get():
		return manual_mode
	set(value):
		manual_mode = value
		for c in get_children():
			if c is ChunkManager:
				c.manual_mode = value
	
@export var foucus_node : Node3D:
	get():
		return foucus_node
	set(value):
		foucus_node = value
		for c in get_children():
			if c is ChunkManager:
				c.foucus_node = value

@export var foucus_is_editor_camera : bool = true:
	get():
		return foucus_is_editor_camera
	set(value):
		foucus_is_editor_camera = value
		for c in get_children():
			if c is ChunkManager:
				c.foucus_is_editor_camera = value
