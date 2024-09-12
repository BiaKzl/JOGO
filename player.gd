extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

const GRAVITY = 500.0  # Definindo a constante de gravidade

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get input direction (left/right)
	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED

	# Move the player (CharacterBody2D move_and_slide doesn't require arguments in Godot 4.x)
	move_and_slide()
