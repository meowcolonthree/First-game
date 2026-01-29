extends Area2D


@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"

var played = false

func _on_body_entered(_body):
	if played == false:
		animation_player.play("move")
		animation_player.queue("end")
		played = true
