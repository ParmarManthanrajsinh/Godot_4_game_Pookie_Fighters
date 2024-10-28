extends RigidBody2D

func _ready() -> void:
	randomize()
	# Genrate random sprite for food
	$Sprite2D.frame = randi_range(0,64)

func _physics_process(_delta) -> void:
	if position.y >= 736: # delete the food if it goes out of map
		self.queue_free()

func _on_pick_up_area_body_entered(body) -> void:
	if body.name == "Player1" || body.name == "Player2":
		if body.health != body.maxhealth: # check if the player health is full
			body.healup(3)
			self.queue_free()
