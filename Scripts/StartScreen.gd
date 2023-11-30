extends Control

func _ready() -> void:
	visible = true


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("lmb"):
		visible = false
