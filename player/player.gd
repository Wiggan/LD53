extends Node3D

var net1 = preload("res://player/net.tscn")

var net_impulse = 70

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event is InputEventMouseMotion:
		var look_dir = event.relative * 0.1
		#rotation.y -= look_dir.x * Globals.mouse_sensitivity
		$pivot.rotation.y = clamp($pivot.rotation.y - look_dir.x * Globals.mouse_sensitivity, -1.5, 1.5)
		$pivot.rotation.x = clamp($pivot.rotation.x - look_dir.y * Globals.mouse_sensitivity, -1.5, 1.5)

	if event.is_action_pressed("shoot"):
		var net: RigidBody3D = net1.instantiate()
		net.apply_central_impulse($pivot.global_transform.basis.z * -net_impulse)
		add_sibling(net)
		net.global_transform.origin = $pivot/Camera3D/model.global_position
		net.global_rotation = $pivot/Camera3D.global_rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
