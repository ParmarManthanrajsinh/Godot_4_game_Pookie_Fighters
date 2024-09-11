extends ParallaxBackground

func _process(delta) -> void:
	scroll_offset.x -= delta * 50 #update the background of the scene


func _on_play_pressed() -> void:
	# change scene to player selection scene
	get_tree().change_scene_to_file("res://scene/player_selection.tscn")


func _on_controlls_pressed() -> void:
	pass # Replace with function body.


func _on_about_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit() # quit game

