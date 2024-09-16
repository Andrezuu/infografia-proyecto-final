extends CharacterBody2D


const SPEED = 1000.0
var original_width
var long_paddle_duration: float = 5.0
@onready var sprite = $Sprite2D
@onready var collision_shape = $CollisionShape2D
var is_expanded

func _ready():
		original_width = sprite.scale.x
	
	
func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func _on_expand_paddle():
	if not is_expanded:
		print('Expanding paddle')
		sprite.scale.x = original_width * 1.5
		collision_shape.scale.x = 1.5
		get_tree().create_timer(long_paddle_duration).timeout.connect(_on_long_paddle_timeout)

func _on_long_paddle_timeout():
	print('Reverting paddle size')
	sprite.scale.x = original_width
	collision_shape.scale.x = 1
