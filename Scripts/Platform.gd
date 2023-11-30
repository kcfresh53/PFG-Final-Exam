extends RigidBody3D


var gemPrefab = preload("res://Materials/gem.tscn")

func _ready() -> void:
	var chance : int = randi_range(0, 1)
	
	if chance == 0:
		pass
	else:
		var gem = gemPrefab.instantiate()
		gem.position.y += 1
		add_child(gem)


func _on_area_3d_body_exited(body: Node3D) -> void:
	print(body)
	if body.is_in_group("Player"):
		print("exited")
		$fallTimer.start()


func _on_timer_timeout() -> void:
	queue_free()


func _on_fall_timer_timeout() -> void:
	freeze = false
	$Timer.start()
