extends Node2D

@onready var score_label: Label = $ScoreLabel
@onready var level_label: Label = $LevelLabel

var score = 0
var level = 8

func add_points(points):
	score += points
	
func _process(delta: float) -> void:
	score_label.text = str(score)
	level_label.text = "Nivel "+ str(level)
	
