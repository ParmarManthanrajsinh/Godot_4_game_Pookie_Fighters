extends Node2D

const food_object := preload("res://scene/food.tscn")
@export var timeing:int

func _ready() -> void:
	$Timer.wait_time = timeing
	if Global.GenrateFood:
		$Timer.start()

func _on_timer_timeout():
	var food = food_object.instantiate()
	add_child(food)
	food.position.x = randi_range(64,1216)
	food.position.y = 64
