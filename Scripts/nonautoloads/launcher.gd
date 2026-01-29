extends CharacterBody2D
@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = %"Player"
@onready var launch_area: Area2D = $"Launch Area"
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var launch_coll: CollisionShape2D = $"Launch Area/Launch Coll"
@onready var second_area: Area2D = $"Launch Area/Second Area"
@onready var sprite_2d: Sprite2D = $Sprite2D
@export var launch: int = 400    # take the inputted launch distance aka hypotenuse
@export var rotdegree: float = 0 # take the inputted degree of rotation in degrees
var usable = true                # whether its usable
var in_area = false              # whether youre in the larger area
var rotrad = 0                   # the rotation in radians
var launchy:float = 0
var launchx:float = 0            # initialising the variables for both the launch speeds for x and y

func _ready() -> void:   # when game loads:
	rotrad = deg_to_rad(rotdegree)   # calculate rotation in radians
	sprite_2d.rotate(rotrad)      # all the rotates are so that everything that makes up the launcher rotate, definately an easier way to do rotate all but idk
	collision_shape_2d.rotate(rotrad)
	launch_coll.rotate(rotrad)
	second_area.rotate(rotrad)
	launchx = launch*sin(rotrad)     # calculating the x through SOH sin(angle) x hypotenuse = one side of the triangle
	launchy = 0-sqrt((launch*launch) - (launchx*launchx)) # finding the other side through c^2 - ^2 = a^2


func _on_launch_area_body_entered(body: Node2D):    # on small zone entered:
	if usable == true:     # if you can use it
		player.velocity.y = launchy   # set velocities to lengths of sides on triangle
		player.velocity.x = launchx
		print(launchx,launchy)
		player.slowx = false     # changes a variable in the player script so that horizontal speed decreases at almost same speed as the pull of gravity on vertical speed (not very precise)
		player.just_bounced = true # changes variable to say youve recently bounced
		usable = false # makes it unusable
		timer.start(0.1) # starts a 0.1 second timer

func _on_second_area_body_entered(body: Node2D) -> void: # when bigger area entered:
	in_area = true # change variable to show that
func _on_second_area_body_exited(body: Node2D) -> void: # when bigger area left:
	in_area = false # change variable to show that
func _process(delta: float): # every frame:
	if in_area == false and usable == false: # if not in bigger area and not able to bounce
		if player.is_on_floor(): # and if player meets prev conditions and is on floor
			usable = true # give the ability to bounce again, this makes it so you cant bounce endlessly and have to touch actual floor to bounce again
	if in_area == true and player.is_on_floor():
		player.slowxblock = true
		


func _on_timer_timeout() -> void: # when prev mentioned timer ends:
	player.just_bounced = false # change just bounced to false
