extends Node2D

func _ready():
	call_deferred("set_scene_process_mode")

func set_scene_process_mode() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED #freez scene
