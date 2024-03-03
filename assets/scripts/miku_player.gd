extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var notes = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var _animated_sprite = $AnimatedSprite2D


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$jump_sfx.play()

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if direction:
			if velocity.x > 0:
				_animated_sprite.flip_h = false
			elif velocity.x < 0:
				_animated_sprite.flip_h = true
			_animated_sprite.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		_animated_sprite.play("idle")

	move_and_slide()
	

func GetNote():
	notes += 1
	

