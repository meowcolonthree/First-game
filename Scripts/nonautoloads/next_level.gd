extends AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
var works = false

func _on_area_2d_body_entered(_body):
	if works == true:
		var current_scene_file = get_tree().current_scene.scene_file_path
		var next_level_number = current_scene_file.to_int() + 1
		var next_level_path = "res://Scenes/levels/level" + str(next_level_number) + ".tscn"
		get_tree().change_scene_to_file.call_deferred(next_level_path)
