extends CharacterBody2D


var speed = 200
var direction = Vector2.DOWN
var is_active = true 

func _ready() -> void:
	speed = speed + (20 * game.level)
	velocity = Vector2(speed * -1, speed)
	
func _physics_process(delta: float) -> void:
	if is_active:
		var collision = move_and_collide(velocity * delta)
		
		if collision:
			velocity = velocity.bounce(collision.get_normal())
			if collision.get_collider().has_method("block_collision"):
				collision.get_collider().block_collision()
			
		if velocity.y > 0 and velocity.y < 100:
			# Si la velocidad es baja se aumenta para que suba rapido
			velocity.y = -200
		
		if velocity.x == 0:
			velocity.x = 200
			
		
func game_over():
	game.score = 0
	game.level = 1
	get_tree().reload_current_scene()

func _on_death_area_body_entered(body: Node2D) -> void:
	game_over()
	
