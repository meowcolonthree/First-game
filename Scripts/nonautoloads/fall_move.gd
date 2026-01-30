extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $"../CollisionShape2D"
@onready var timer: Timer = $"../Timer"

var in_area = false

func _on_body_entered(_body):
	in_area = true
func _on_body_exited(_body):
	in_area = false


func _on_timer_timeout():
	collision_shape_2d.set_deferred("disabled", false)
func _process(_delta):
	if Input.is_action_just_pressed("down") and in_area == true:
		collision_shape_2d.set_deferred("disabled", true)
		timer.start(0.1)
