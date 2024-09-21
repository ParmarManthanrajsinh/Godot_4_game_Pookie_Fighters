extends Control

func _ready() -> void:
	$AnimationPlayer.play("RESET")

func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	$AnimationPlayer.play_backwards("fadeup")
	$AnimationPlayer.play("RESET")

func _on_back_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")

func _physics_process(_delta) -> void:
	if Input.is_action_just_pressed("Exit") and !get_tree().paused:
		get_tree().paused = true
		$AnimationPlayer.play("fadeup")
	elif Input.is_action_just_pressed("Exit") and get_tree().paused:
		get_tree().paused = false
		$AnimationPlayer.play_backwards("fadeup")
		$AnimationPlayer.play("RESET")
