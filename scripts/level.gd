extends Node2D

@onready var BLOCK_SCENE = preload("res://scenes/block.tscn")
@onready var paddle: CharacterBody2D = $Paddle

signal expand_paddle
var columns = 32
var rows = 8

func _ready() -> void:
	create_level()
	connect("expand_paddle", Callable(paddle, "_on_expand_paddle"))
	pass # Replace with function body.

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
				new_block.is_special = bool(randi_range(0, 1))
				var random2 = randi_range(0,3)
				new_sprite.modulate = get_colors()[random2]
				new_block.connect("special_block_destroyed", _on_special_block_destroyed)

				
			
func get_colors():
	var colors = [
		Color(0, 1, 1, 1),
		Color(0.54, 0.17, 0.89, 1),
		Color(0.68, 1, 0.18, 1),
		Color(1, 1, 1, 1),
	]
	return colors

func _on_special_block_destroyed():
	expand_paddle.emit()
