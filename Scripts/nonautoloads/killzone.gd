extends Area2D

@onready var timer: Timer = $Timer
@onready var label: Label = $CanvasLayer/Label

func _on_body_entered(_body: Node2D) -> void:
	label.visible = true
	Engine.time_scale = 0.5
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1
