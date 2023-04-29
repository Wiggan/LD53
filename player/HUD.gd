extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Player stats
var net_impulse = 0
var net_cooldown = 0
var net_scale = 0
var score = -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if net_scale != Globals.net_scale:
		net_scale = Globals.net_scale
		$LootBoxNotification/RichTextLabel.text = "[pulse freq=5.0 height=20.0][pulse color=#00FFAA freq=2.0][center]Net Size Increased![/center][/pulse][/pulse]"
		$VBoxContainer/NetSize.text = "Net Size: " + str(net_scale)
		$LootBoxNotification/AnimationPlayer.play("show")
	if net_impulse != Globals.net_impulse:
		net_impulse = Globals.net_impulse
		$LootBoxNotification/RichTextLabel.text = "[pulse freq=5.0 height=20.0][pulse color=#00FFAA freq=2.0][center]Net Launcher Power Increased![/center][/pulse][/pulse]"
		$VBoxContainer/NetImpulse.text = "Power: " + str(net_impulse)
		$LootBoxNotification/AnimationPlayer.play("show")
	if net_cooldown != Globals.net_cooldown:
		net_cooldown = Globals.net_cooldown
		$LootBoxNotification/RichTextLabel.text = "[pulse freq=5.0 height=20.0][pulse color=#00FFAA freq=2.0][center]Net Launcher Cooldown Reduced![/center][/pulse][/pulse]"
		$VBoxContainer/NetCooldown.text = "Cooldown: " + str(net_cooldown)
		$LootBoxNotification/AnimationPlayer.play("show")
	if score != Globals.score:
		score = Globals.score
		$Score.text = "Doses intercepted: " + str(score)






