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
	game.add_points(10)
	var block_count = get_tree().get_nodes_in_group('Block')
	if block_count.size() == 1:
		get_parent().get_node("Ball").is_active
		await get_tree().create_timer(1).timeout
		game.level += 1
		get_tree().reload_current_scene()
	else:
		SPRITE.visible = false
		COLL_SHAPE.disabled = true
		await get_tree().create_timer(1).timeout
		queue_free()
	
