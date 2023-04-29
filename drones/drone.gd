extends RigidBody3D

@export_range(0, 1) var chance_to_drop_loot: float = 0

var available_packages = [
	$Drone/Package1, $Drone/Package2
]

# Called when the node enters the scene tree for the first time.
func _ready():	
	if randf() < chance_to_drop_loot:
		$Drone/LootBox.visible = true
	else:
		available_packages.pick_random().visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
