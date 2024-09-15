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
	for i in rows:
		for j in columns:
			var new_block = BLOCK_SCENE.instantiate()
			add_child(new_block)
			var new_x = offset + (48 * j)
			var new_y = offset + (48 * i)
			new_block.position = Vector2(new_x, new_y)
