extends Node3D

var platform_prefab = preload("res://Materials/platform.tscn")


func _on_timer_timeout() -> void:
	
	position.x += randi_range(-1,0)
	position.z += randi_range(-1,0)
	
	var platform = platform_prefab.instantiate()
	platform.global_position = global_position
	get_tree().get_root().add_child(platform)
	
	$Timer.start()
