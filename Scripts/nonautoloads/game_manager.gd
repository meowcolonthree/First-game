extends Node

var first_collected = false
var score = 0
@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var end_total: Label = $"End total"
@onready var coins: Node = $"../Coins"
@onready var coin_total = coins.get_child_count()
@onready var next_level: AnimatedSprite2D = $NextLevel


func add_point_UI():
	score += 1
	if score == 1 and first_collected == false:
		score_label.text = "You have " + str(score) + " coin"
		first_collected = true
	else:
		score_label.text = "You have " + str(score) + " coins"
	
func final_score():
	if score == coin_total:
		end_total.text = "You collected all " + str(score) + " of the " + str(coin_total) + " coins!\nYou win!"
		next_level.visible = true
	else:
		end_total.text = "You collected " + str(score) + " of the " + str(coin_total) + " coins"
