extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
const COYOTE_TIME = .1
var coyote_left = 0.0

	 

func _physics_process(delta: float) -> void:
	if is_on_floor():
		coyote_left = COYOTE_TIME
	else:
		coyote_left -= delta
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and coyote_left > 0:
		velocity.y = JUMP_VELOCITY
		coyote_left = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
