extends Node2D

@onready var BLOCK_SCENE = preload("res://scenes/block.tscn")
var columns = 32
var rows = 8
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_level()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_level():
	var offset = 45
	rows = 2 + game.level
	if rows > 9:
		rows = 9
	for i in rows:
		for j in columns:
			var random = randi_range(0,2)
			if random > 0:
				var new_block = BLOCK_SCENE.instantiate()
				var new_sprite = new_block.get_node('Sprite2D')
				add_child(new_block)
				var new_x = offset + (48 * j)
				var new_y = offset + (48 * i)
				new_block.position = Vector2(new_x, new_y)
				var random2 = randi_range(0,3)
				new_sprite.modulate = get_colors()[random2]
				
			
func get_colors():
	var colors = [
		Color(0, 1, 1, 1),
		Color(0.54, 0.17, 0.89, 1),
		Color(0.68, 1, 0.18, 1),
		Color(1, 1, 1, 1),
	]
	return colors
