extends Node3D

const BULLET = preload("res://scenes/bullet.tscn")

func _process(_delta):
	var mouse_position = get_viewport().get_mouse_position()
	
	var ray_origin = $"../../Camera3D".project_ray_origin(mouse_position)
	var ray_target = ray_origin + $"../../Camera3D".project_ray_normal(mouse_position) * 2000
	
	var space_state = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(ray_origin, ray_target)
	var intersection = space_state.intersect_ray(query)
	
	if not intersection.is_empty():
		var pos = intersection.position
		var look_at_me = Vector3(pos.x, position.y, pos.z)
		look_at(look_at_me, Vector3.UP)
		#rotation.y += deg_to_rad(180)
	
	if Input.is_action_just_pressed("shoot"):
		var b = BULLET.instantiate()
		$"../..".add_child(b)
		$Blaster/AnimationPlayer.play("shoot")
		
		b.transform = $ShootPoint.global_transform
		b.velocity = -b.transform.basis.z * b.muzzle_velocity
