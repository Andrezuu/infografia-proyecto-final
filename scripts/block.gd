extends RigidBody2D

@onready var SPRITE: Sprite2D = $Sprite2D
@onready var COLL_SHAPE: CollisionShape2D = $CollisionShape2D
@onready var PARTICLES: CPUParticles2D = $CPUParticles2D
var is_special = false
signal special_block_destroyed

func block_collision():
	game.add_points(10)
	PARTICLES.emitting = true
	var block_count = get_tree().get_nodes_in_group('Block')
	if is_special:
		emit_signal("special_block_destroyed")


		
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
	
