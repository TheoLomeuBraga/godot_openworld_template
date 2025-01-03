@tool

extends Node3D

class_name ChunkLoader

@export var lod_mesh : Mesh:
	get():
		return $MeshInstance3D.mesh
	set(value):
		$MeshInstance3D.mesh = value

@export var area_scale : Vector3:
	get():
		if $Node/area_display != null:
			if $Node/area_display.shape == null:
				$Node/area_display.shape = BoxShape3D.new()
			return $Node/area_display.shape.size
		else:
			return Vector3.ONE
	set(value):
		if $Node/area_display != null:
			if $Node/area_display.shape == null:
				$Node/area_display.shape = BoxShape3D.new()
			$Node/area_display.shape.size = value
		else:
			return Vector3.ONE

@export_file("*.tscn") var chunck_scene : String

var load_chunk : bool = false

func is_in_area(pos: Vector3) -> bool:
	if $Node/area_display != null:
		var shape = $Node/area_display.shape
		if not shape or not shape is BoxShape3D:
			return false
		var global_transform = $Node/area_display.global_transform
		var local_point = $Node/area_display.to_local(pos)
		
		var extents = shape.extents
		load_chunk = (local_point.x >= -extents.x and local_point.x <= extents.x and local_point.y >= -extents.y and local_point.y <= extents.y and local_point.z >= -extents.z and local_point.z <= extents.z)
		return load_chunk
	else:
		return false

var chunk_instance_node : Node3D
var chunk_requested :bool = false

func _process(delta: float) -> void:
	if $Node/area_display != null:
		$Node/area_display.global_position = global_position
	
	if chunck_scene != null or chunck_scene != "":
		if load_chunk:
			if chunk_requested:
				if chunk_instance_node == null:
					var status = []
					ResourceLoader.load_threaded_get_status(chunck_scene,status)
					if status[0] == 1:
						var pc : PackedScene = ResourceLoader.load_threaded_get(chunck_scene)
						if pc != null:
							chunk_instance_node = pc.instantiate()
							add_child(chunk_instance_node)
			else:
				ResourceLoader.load_threaded_request(chunck_scene)
				chunk_requested = true
		elif chunk_instance_node != null:
			chunk_instance_node.queue_free()
			chunk_instance_node = null
			chunk_requested = false
	
	$MeshInstance3D.visible = chunk_instance_node == null
