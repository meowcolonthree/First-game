extends Area2D

var cointotal = 0

@onready var game_manager = %GameManager

func _on_body_entered(_body: Node2D):
	game_manager.add_point_UI()
	game_manager.final_score()
	queue_free()
