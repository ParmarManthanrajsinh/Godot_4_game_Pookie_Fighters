extends HBoxContainer

var warrior := preload("res://scene/warrior.tscn")
var speedster := preload("res://scene/speedster.tscn")
var tank := preload("res://scene/tank.tscn")
var map:int = 0

func _ready() -> void:
	Global.Player1_type = 0
	Global.Player2_type = 0
	# Initialize starting selected character
	var warr1 = warrior.instantiate()
	get_node("Player1/Panel").add_child(warr1)
	warr1.play("Idle")
	var warr2 = warrior.instantiate()
	get_node("Player2/Panel").add_child(warr2)
	warr2.play("Idle")

func _on_player_1_type_item_selected(index) -> void:
	# Setting the player1_type for character properties in the player1 scene
	Global.Player1_type = index
	
	# Removing the previously selected character
	for n in get_node("Player1/Panel").get_children():
		get_node("Player1/Panel").remove_child(n)
		n.queue_free()
	
	# Adding the selected character
	match index:
		0:
			var warr = warrior.instantiate()
			get_node("Player1/Panel").add_child(warr)
			warr.play("Idle")
		1:
			var spee = speedster.instantiate()
			get_node("Player1/Panel").add_child(spee)
			spee.play("Idle")
		2:
			var ta = tank.instantiate()
			get_node("Player1/Panel").add_child(ta)
			ta.play("Idle")


func _on_player_2_type_item_selected(index) -> void:
	# Setting the player2_type for character properties in the player2 scene
	Global.Player2_type = index
	
	# Removing the previously selected character
	for n in get_node("Player2/Panel").get_children():
		get_node("Player2/Panel").remove_child(n)
		n.queue_free()
	
	# Adding the selected character
	match index:
		0:
			var warr = warrior.instantiate()
			get_node("Player2/Panel").add_child(warr)
			warr.play("Idle")
		1:
			var spee = speedster.instantiate()
			get_node("Player2/Panel").add_child(spee)
			spee.play("Idle")
		2:
			var ta = tank.instantiate()
			get_node("Player2/Panel").add_child(ta)
			ta.play("Idle")

func _on_back_pressed() -> void:
	# Send back to the main scene
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")


func _on_start_game_pressed():
	# Play the Selected Map
	match map:
		0:
			get_tree().change_scene_to_file("res://scene/map1.tscn")
		1:
			get_tree().change_scene_to_file("res://scene/map2.tscn")
		2:
			get_tree().change_scene_to_file("res://scene/map3.tscn")
		3:
			get_tree().change_scene_to_file("res://scene/map4.tscn")
	
	if $Player1/Player1_name.text != "" and $Player2/Player2_name.text != "":
		Global.Player1_name = $Player1/Player1_name.text
		Global.Player2_name = $Player2/Player2_name.text
	else:
		Global.Player1_name = "player1"
		Global.Player2_name = "player2"


func _on_level_selection_item_selected(index):
	match index:
		0:
			map = 0
		1:
			map = 1
		2:
			map = 2
		3:
			map = 3
