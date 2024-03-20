extends Camera3D

const FOLLOW_FORCE = 5

func _process(delta):
	position = lerp(position, $"../Player".position + Vector3(0, 26, 18), delta * FOLLOW_FORCE)
