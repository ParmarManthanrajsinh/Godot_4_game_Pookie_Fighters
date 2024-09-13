extends HBoxContainer

@export var player1_sprite : Sprite2D
@export var player2_sprite : Sprite2D

@export var warrior : Texture2D
@export var speedster : Texture2D
@export var tank : Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player1/VBoxContainer/player1_name.text = "  " + Global.Player1_name + "  "
	$Player1/VBoxContainer/player1_bar.max_value = Global.Player1_health
	$Player1/VBoxContainer/player1_bar.value = Global.Player1_health
	
	$Player2/VBoxContainer/player2_name.text = "  " + Global.Player2_name + "  "
	$Player2/VBoxContainer/player2_bar.max_value = Global.Player2_health
	$Player2/VBoxContainer/player2_bar.value = Global.Player2_health
	
	match Global.Player1_type:
		0:
			player1_sprite.set_texture(warrior)
		1:
			player1_sprite.set_texture(speedster)
		2:
			player1_sprite.set_texture(tank)
	
	match Global.Player2_type:
		0:
			player2_sprite.set_texture(warrior)
		1:
			player2_sprite.set_texture(speedster)
		2:
			player2_sprite.set_texture(tank)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta) -> void:
	$Player1/VBoxContainer/player1_bar.value = Global.Player1_health
	$Player2/VBoxContainer/player2_bar.value = Global.Player2_health
