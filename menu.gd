extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	if not Globals.game_started:
		get_tree().paused = true
	else:
		$Start.visible = false
		$Resume.visible = true
		resume()
	$GridContainer/AudioVolumeSlider.value = Globals.volume
	_on_audio_volume_slider_value_changed(Globals.volume)
	$GridContainer/SensitivitySlider.value = Globals.mouse_sensitivity/0.01
	_on_sensitivity_slider_value_changed($GridContainer/SensitivitySlider.value)

func _on_audio_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear2db(value))
	Globals.volume = value

func linear2db(percent):
	return 10*log(percent/100)/log(10)


func _on_sensitivity_slider_value_changed(value):
	Globals.mouse_sensitivity = value*0.01



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _input(event):
	if event.is_action_pressed("ui_cancel") or event.is_action_pressed("ui_menu"):
		if get_tree().paused:
			resume()
		else:
			pause()
		
func pause():
	if Globals.game_started:
		get_tree().paused = true
		mouse_filter = Control.MOUSE_FILTER_PASS
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		$"AnimationPlayer".play_backwards("to_game")
	

func resume():
	if Globals.game_started:
		$"AnimationPlayer".play("to_game")
		mouse_filter = Control.MOUSE_FILTER_IGNORE
		get_tree().paused = false
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _on_start_pressed():
	Globals.game_started = true
	$Start.visible = false
	$Resume.visible = true
	resume()

func _on_exit_pressed():
	get_tree().quit()


