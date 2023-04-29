extends RigidBody3D

@export_range(0, 1) var chance_to_drop_loot: float = 0


@onready var available_packages = [
	$Drone/Package1, $Drone/Package2
]

# Called when the node enters the scene tree for the first time.
func _ready():
	if randf() < chance_to_drop_loot:
		$Drone/LootBox.visible = true
	else:
		available_packages.pick_random().visible = true

func shot():
	freeze = false
	top_level = true
	contact_monitor = true
	apply_torque_impulse(Vector3(randf_range(-5, 5), randf_range(-5, 5), randf_range(-5, 5)))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

const COOLDOWN_PROBABILITY = 0.3 
const IMPULSE_PROBABILITY = 0.3

func _on_body_entered(body):
	if body.collision_layer & 1: # Feels like a bug in collision layers...
		$CollisionShape3D.call_deferred("set_disabled", true)
		print("Drone crashed")
		if $Drone/LootBox.visible:
			if randf() < COOLDOWN_PROBABILITY:
				Globals.net_cooldown *= 0.8
			elif randf() < IMPULSE_PROBABILITY:
				Globals.net_impulse *= 1.2
			else:
				Globals.net_scale *= 1.2
		elif $Drone/Package1.visible:
			Globals.score += 20
		elif $Drone/Package2.visible:
			Globals.score += 20
		elif $Drone/Package3.visible:
			Globals.score += 50
		
		$CPUParticles3D.emitting = true
		$CPUParticles3D.top_level = true
		$Decal.global_position = global_position
		$Decal.global_rotation_degrees = Vector3(0, randf()*360, 0)
		$Decal.visible = true
		$Decal.reparent(get_parent())
