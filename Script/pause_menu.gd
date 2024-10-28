extends Control

func _ready() -> void:
	# Set visibility to disable
	$AnimationPlayer.play("RESET")

func _on_resume_button_pressed() -> void:
	# Pause the Game
	get_tree().paused = false
	$AnimationPlayer.play_backwards("fadeup")
	# Set visibility to disable
	$AnimationPlayer.play("RESET")

func _on_back_button_pressed() -> void:
	# UnPause the Game
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")

func _physics_process(_delta) -> void:
	if Global.Player1_health >= 0 and Global.Player2_health >= 0:
		if Input.is_action_just_pressed("Exit") and !get_tree().paused:
			# Pause the Game
			get_tree().paused = true
			$AnimationPlayer.play("fadeup")
		elif Input.is_action_just_pressed("Exit") and get_tree().paused:
			# UnPause the Game
			get_tree().paused = false
			$AnimationPlayer.play_backwards("fadeup")
			$AnimationPlayer.play("RESET")
