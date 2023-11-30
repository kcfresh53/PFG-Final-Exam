extends Camera3D


@export var player : CharacterBody3D

var oldPos

func _process(_delta: float) -> void:
	if player.canFollow:
		oldPos = global_position
	else:
		global_position = oldPos
