@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("ChunkManagerPluginBase", "Node3D", preload("res://addons/OpenWorldChunkManager/ChunkManagerPluginBase/chunk_manager_plugin_base.gd"), preload("res://addons/OpenWorldChunkManager/icon.svg"))
	add_custom_type("ChunkManagerManager", "ChunkManagerPluginBase", preload("res://addons/OpenWorldChunkManager/ChunkManagerManager/chunk_manager_manager.gd"), preload("res://addons/OpenWorldChunkManager/icon.svg"))
	add_custom_type("ChunkManager", "ChunkManagerPluginBase", preload("res://addons/OpenWorldChunkManager/ChunkManager/chunk_manager.gd"), preload("res://addons/OpenWorldChunkManager/icon.svg"))
	add_custom_type("ChunkLoader", "ChunkManagerPluginBase", preload("res://addons/OpenWorldChunkManager/ChunkLoader/chunk_loader.gd"), preload("res://addons/OpenWorldChunkManager/icon.svg"))



func _exit_tree() -> void:
	remove_custom_type("ChunkManagerPluginBase")
	remove_custom_type("ChunkManagerManager")
	remove_custom_type("ChunkManager")
	remove_custom_type("ChunkLoader")
