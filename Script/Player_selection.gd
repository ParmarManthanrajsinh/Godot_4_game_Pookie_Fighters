extends HBoxContainer

var warrier := preload("res://scene/warrier.tscn")
var speedster := preload("res://scene/speedster.tscn")
var tank := preload("res://scene/tank.tscn")

func _ready() -> void:
	# Initialize starting selected character
	var warr1 = warrier.instantiate()
	get_node("Player1/Panel").add_child(warr1)
	warr1.play()
	var warr2 = warrier.instantiate()
	get_node("Player2/Panel").add_child(warr2)
	warr2.play()

func _on_player_1_type_item_selected(index) -> void:
	
	# Removing the previously selected character
	for n in get_node("Player1/Panel").get_children():
		get_node("Player1/Panel").remove_child(n)
		n.queue_free()
	
	# Adding the selected character
	match index:
		0:
			var warr = warrier.instantiate()
			get_node("Player1/Panel").add_child(warr)
			warr.play()
		1:
			var spee = speedster.instantiate()
			get_node("Player1/Panel").add_child(spee)
			spee.play()
		2:
			var ta = tank.instantiate()
			get_node("Player1/Panel").add_child(ta)
			ta.play()


func _on_player_2_type_item_selected(index) -> void:
	
	# Removing the previously selected character
	for n in get_node("Player2/Panel").get_children():
		get_node("Player2/Panel").remove_child(n)
		n.queue_free()
	
	# Adding the selected character
	match index:
		0:
			var warr = warrier.instantiate()
			get_node("Player2/Panel").add_child(warr)
			warr.play()
		1:
			var spee = speedster.instantiate()
			get_node("Player2/Panel").add_child(spee)
			spee.play()
		2:
			var ta = tank.instantiate()
			get_node("Player2/Panel").add_child(ta)
			ta.play()

func _on_back_pressed() -> void:
	# Send back to the main scene
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")
