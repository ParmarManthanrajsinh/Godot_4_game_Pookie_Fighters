extends Control

var win_scene:bool = false

func _ready() -> void:
	$AnimationPlayer.play("RESET")

func _physics_process(_delta) -> void:
	if Global.Player1_health <= 0 and !win_scene:
		win_scene = true
		$PanelContainer/VBoxContainer/PlayerName.text = "  " + Global.Player2_name + " Win" + "  "
		$AnimationPlayer.play("fadeup")
		
	elif Global.Player2_health <= 0 and !win_scene:
		win_scene = true
		$PanelContainer/VBoxContainer/PlayerName.text = "  " + Global.Player1_name + " Win" + "  "
		$AnimationPlayer.play("fadeup")
		

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_back_to_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")
