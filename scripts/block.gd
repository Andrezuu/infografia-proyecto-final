extends RigidBody2D

@onready var SPRITE: Sprite2D = $Sprite2D
@onready var COLL_SHAPE: CollisionShape2D = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func block_collision():
	SPRITE.visible = false
	COLL_SHAPE.disabled = true
	await get_tree().create_timer(1).timeout
	queue_free()
	
