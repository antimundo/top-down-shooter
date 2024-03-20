extends CharacterBody3D

const SPEED = 10
const ACCELERATION = 10
const ROTATION_FORCE = 10

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	var desired_direction = Vector3(direction.x, 0, direction.y)
	velocity = lerp(velocity, desired_direction * SPEED, delta * ACCELERATION)
	if desired_direction.length() > 0:
		#$tractor2.look_at(look_at_direction, Vector3.UP)
		var desired_rotation = atan2(-desired_direction.x, -desired_direction.z)
		rotation.y = lerp_angle(rotation.y, desired_rotation, ROTATION_FORCE * delta)
	move_and_slide()
