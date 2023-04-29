extends Control

var game = load("res://game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$GridContainer/Small.text = "[update]20 x " + str(Globals.small) + "[/update]"
	$GridContainer/Cardboard.text = "[update]40 x " + str(Globals.cardboard) + "[/update]"
	$GridContainer/Big.text = "[update]60 x " + str(Globals.big) + "[/update]"
	$GridContainer/LootBox.text = "[update]20 x " + str(Globals.loot_box) + "[/update]"
	$GridContainer/Score.text = "[update]" + str(Globals.score) + "[/update]"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	$"../ColorRect/AnimationPlayer".play("restart")
	
func restart_game():
	get_tree().change_scene_to_packed(game)
