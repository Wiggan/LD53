extends RigidBody3D

@onready var animation_tree = $AnimationTree

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_tree.set("parameters/Transition/transition_request", "state_0")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func tween_to_parent():
	var tween = create_tween()
	tween.tween_property(self, "position", Vector3.ZERO, 0.2)
	tween.tween_property(self, "scale", Vector3.ONE*1.6, 0.2)

func _on_body_entered(body:RigidBody3D):
	print("hit!")
	animation_tree.set("parameters/Transition/transition_request", "state_2")

	body.freeze = false
	body.top_level = true
	body.apply_torque_impulse(Vector3(randf_range(-5, 5), randf_range(-5, 5), randf_range(-5, 5)))
	freeze = true
	call_deferred("reparent", body)
	call_deferred("tween_to_parent")
	


func _on_free_timer_timeout():
	queue_free()
