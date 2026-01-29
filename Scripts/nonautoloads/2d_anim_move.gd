extends CharacterBody2D

@onready var ray_castright: RayCast2D = $RayCastright
@onready var ray_castleft: RayCast2D = $RayCastleft
@export var speed: int = 100
var dir = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_castleft.is_colliding():
		dir = 1
	if ray_castright.is_colliding():
		dir = -1
	position.x += speed * delta * dir
