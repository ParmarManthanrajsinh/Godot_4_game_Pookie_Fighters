extends CharacterBody2D

# Player2 Properties
var SPEED = 300.0
var ACCELERATION = 250.0
const JUMP_VELOCITY = -500.0
var health: int = 10

var attack: int = 3
var IsAttacking: bool = false
var attack_cooldown: float = 0.5
var attack_timer: float = 0.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var warrior := preload("res://scene/warrior.tscn")
var speedster := preload("res://scene/speedster.tscn")
var tank := preload("res://scene/tank.tscn")

var type: AnimatedSprite2D

func _ready() -> void:
	match Global.Player2_type:
		0:
			var warr = warrior.instantiate()
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
			
			# Setting the player property
			health = 8
			attack = 2
			SPEED = 400
			ACCELERATION = 350
		2:
			var ta = tank.instantiate()
			add_child(ta)
			ta.play()
			ta.flip_h = true
			ta.offset.x = -12
			type = ta
			
			# Setting the player property
			health = 14
			attack = 2
			SPEED = 280
	Global.Player2_health = health
	type.animation_finished.connect(_on_animation_finished)
	$AttackBox/CollisionShape.disabled = true

func _physics_process(delta) -> void:
	
	# Update attack cooldown timer
	if attack_timer > 0:
		attack_timer -= delta

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("P2_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Handle Attack
	if Input.is_action_just_pressed("P2_Attack") and attack_timer <= 0:
		Attack()
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("P2_move_right", "P2_move_left")
	
	# Setting the direction of player
	if direction == 1:
		type.flip_h = false
		type.offset.x = 0
		$AttackBox.position.x = 144
		velocity.x = direction * ACCELERATION
	elif direction == -1:
		type.flip_h = true
		type.offset.x = -12
		$AttackBox.position.x = -16
		velocity.x = direction * ACCELERATION
	else:
		velocity.x = lerp(velocity.x, 0.0, 0.1)
	
	# Play the correct animation based on the state.
	if is_on_floor() and IsAttacking == false:
		if int(abs(velocity.x)) > 0: # Only play "Walk" if moving horizontally.
			type.play("Walk")
		else:
			type.play("Idle")
	elif not IsAttacking:
		if velocity.y < 0: # Jumping upward.
			type.play("Jump")
		else: # Falling downward.
			type.play("Fall")
	
	velocity.x = clamp(velocity.x, -SPEED, SPEED)
	move_and_slide()

func Attack() -> void:
	if not IsAttacking:
		randomize()
		var i: int = randi_range(0, 1)

		IsAttacking = true
		attack_timer = attack_cooldown # Reset the cooldown
		if i == 0:
			type.play("Attack1")
		else:
			type.play("Attack2")
		$AnimationPlayer.play("Attack")


func _on_animation_finished() -> void:
	if type.animation == "Attack1" or type.animation == "Attack2":
		IsAttacking = false
