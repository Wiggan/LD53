extends Control

var game = load("res://game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	var tween = get_tree().create_tween()
	tween.tween_callback($GridContainer/Small.set_text.bind("[update]20 x " + str(Globals.small) + "[/update]")).set_delay(1)
	tween.tween_callback($GridContainer/Cardboard.set_text.bind("[update]40 x " + str(Globals.cardboard) + "[/update]")).set_delay(0.5)
	tween.tween_callback($GridContainer/Big.set_text.bind("[update]60 x " + str(Globals.big) + "[/update]")).set_delay(0.5)
	tween.tween_callback($GridContainer/LootBox.set_text.bind("[update]20 x " + str(Globals.loot_box) + "[/update]")).set_delay(0.5)
	tween.tween_callback($GridContainer/Score.set_text.bind("[update]" + str(Globals.score) + "[/update]")).set_delay(0.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	$"../ColorRect/AnimationPlayer".play("restart")
	
func restart_game():
	get_tree().change_scene_to_packed(game)
