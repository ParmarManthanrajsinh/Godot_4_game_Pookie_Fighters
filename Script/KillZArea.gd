extends Area2D

func _on_body_entered(body):
	if body.name == "Player1" || body.name == "Player2":
		body.takedamage(100,0)