extends ParallaxBackground


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	scroll_offset.x -= delta * 50


func _on_play_pressed():
	pass # Replace with function body.


func _on_controlls_pressed():
	pass # Replace with function body.


func _on_about_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
