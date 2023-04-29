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
	tween.tween_property($net, "scale", Vector3.ONE*1.6, 0.2)

func _on_body_entered(body):
	
	if body.collision_layer & 2:
		print("hit!")
		animation_tree.set("parameters/Transition/transition_request", "state_2")

		body.shot()
		freeze = true
		call_deferred("reparent", body)
		call_deferred("tween_to_parent")
	else:
		print("miss!")
		$CPUParticles3D.emitting = true
	$CollisionShape3D.call_deferred("set_disabled", true)

func set_net_scale(net_scale):
	$CollisionShape3D.shape["radius"] *= net_scale
	$net.scale *= net_scale
	print($CollisionShape3D.shape["radius"])

func _on_free_timer_timeout():
	queue_free()


func _on_enable_collision_timer_timeout():
	collision_mask |= 1 #Enable collision with ground after a while
