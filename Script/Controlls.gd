extends HBoxContainer

var warrior := preload("res://scene/warrior.tscn")

func _ready() -> void:
	var warr1 = warrior.instantiate()
	get_node("Player1/Panel").add_child(warr1)
	warr1.play("Idle")
	var warr2 = warrior.instantiate()
	get_node("Player2/Panel").add_child(warr2)
	warr2.play("Idle")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")
