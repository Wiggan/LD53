extends Control

@onready var net_impulse = 40
@onready var net_cooldown = 0.8
@onready var net_scale = 1
@onready var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.net_impulse = net_impulse
	Globals.net_cooldown = net_cooldown
	Globals.net_scale = net_scale
	Globals.score = score
	Globals.small = 0
	Globals.cardboard = 0
	Globals.big = 0
	Globals.loot_box = 0
	$Score.text = "[update]Doses intercepted: " + str(Globals.score)
	$VBoxContainer/NetSize.text = "Net Size: " + str(Globals.net_scale)
	$VBoxContainer/NetImpulse.text = "Power: " + str(Globals.net_impulse)
	$VBoxContainer/NetCooldown.text = "Cooldown: " + str(Globals.net_cooldown)



var time_text_format = "TIME: %d:%02d"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if net_scale != Globals.net_scale:
		net_scale = Globals.net_scale
		$LootBoxNotification/RichTextLabel.text = "[pulse freq=5.0 height=20.0][pulse color=#68c2d3 freq=2.0][center]Net Size Increased![/center][/pulse][/pulse]"
		$VBoxContainer/NetSize.text = "[update]Net Size: " + str(net_scale) + "[/update]"
		$LootBoxNotification/AnimationPlayer.play("show")
	if net_impulse != Globals.net_impulse:
		net_impulse = Globals.net_impulse
		$LootBoxNotification/RichTextLabel.text = "[pulse freq=5.0 height=20.0][pulse color=#68c2d3 freq=2.0][center]Net Launcher Power Increased![/center][/pulse][/pulse]"
		$VBoxContainer/NetImpulse.text = "[update]Power: " + str(net_impulse) + "[/update]"
		$LootBoxNotification/AnimationPlayer.play("show")
	if net_cooldown != Globals.net_cooldown:
		net_cooldown = Globals.net_cooldown
		$LootBoxNotification/RichTextLabel.text = "[pulse freq=5.0 height=20.0][pulse color=#68c2d3 freq=2.0][center]Net Launcher Cooldown Reduced![/center][/pulse][/pulse]"
		$VBoxContainer/NetCooldown.text = "[update]Cooldown: " + str(net_cooldown) + "[/update]"
		$LootBoxNotification/AnimationPlayer.play("show")
	if score != Globals.score:
		score = Globals.score
		$Score.text = "[update]Doses intercepted: " + str(score) + "[/update]"

	$Time.text = time_text_format % [floor($"../Timer".time_left / 60), int($"../Timer".time_left) % 60]


func _on_time_running_out_timer_timeout():
	$Time/AnimationPlayer.play("running_out")
