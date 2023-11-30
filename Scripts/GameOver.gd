extends Control


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()


func _update_scores(score : int):
	$VBoxContainer/Panel/VBoxContainer/score.text = str(score)
	$VBoxContainer/Panel/VBoxContainer/bestScore.text = str(ScoreManager.highScore)
	
