@tool
extends Node3D

class_name ChunkManager

@export var manual_mode : bool = false

@export var foucus_node : Node3D

@export var foucus_is_editor_camera : bool = true
@export var load_all : bool = false

func load_focus_point_chunk(pos: Vector3) -> void:
	if load_all:
		for c in get_children():
			if c is ChunkLoader:
				c.load_chunk = true
	else:
		for c in get_children():
			if c is ChunkLoader:
				c.is_in_area(pos)

func _process(delta: float) -> void:
	if not manual_mode:
		if Engine.is_editor_hint() and foucus_is_editor_camera:
			load_focus_point_chunk(EditorInterface.get_editor_viewport_3d().get_camera_3d().global_position)
		elif foucus_node != null:
			load_focus_point_chunk(foucus_node.global_position)
	
