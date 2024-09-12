extends CharacterBody2D


const SPEED = 300.0
const ACCELERATION = 250.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var warrier := preload("res://scene/warrier.tscn")
var speedster := preload("res://scene/speedster.tscn")
var tank := preload("res://scene/tank.tscn")

var type:AnimatedSprite2D

func _ready() -> void:
	match Global.Player2_type:
		0:
			var warr = warrier.instantiate()
			add_child(warr)
			warr.play()
			warr.flip_h = true
			warr.offset.x = -12
			type = warr
		1:
			var spee = speedster.instantiate()
			add_child(spee)
			spee.play()
			spee.flip_h = true
			spee.offset.x = -12
			type = spee
		2:
			var ta = tank.instantiate()
			add_child(ta)
			ta.play()
			ta.flip_h = true
			ta.offset.x = -12
			type = ta

func _physics_process(delta) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("P2_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("P2_move_right", "P2_move_left")
	
	# Setting the direction of player
	if direction == 1:
		type.flip_h = false
		type.offset.x = 0
		velocity.x = direction * ACCELERATION
	elif direction == -1:
		type.flip_h = true
		type.offset.x = -12
		velocity.x = direction * ACCELERATION
	else:
		velocity.x = lerp(velocity.x,0.0,0.1)
	
	# Play the correct animation based on the state.
	if is_on_floor():
		if int(abs(velocity.x)) > 0:  # Only play "Walk" if moving horizontally.
			type.play("Walk")
		else:
			type.play("Idle")
	else:
		if velocity.y < 0:  # Jumping upward.
			type.play("Jump")
		else:  # Falling downward.
			type.play("Fall")
	
	velocity.x = clamp(velocity.x,-SPEED,SPEED)
	move_and_slide()
