extends Area3D

var muzzle_velocity = 25
var g = Vector3.DOWN * 20

var velocity = Vector3.ZERO

func _physics_process(delta):
	#velocity += g * delta
	if transform.origin.is_equal_approx(transform.origin + velocity.normalized()):
		look_at(transform.origin + velocity.normalized(), Vector3.UP)
	transform.origin += velocity * delta


func _on_body_entered(body):
	queue_free()
	if body is Enemy:
		body.kill()
		queue_free()

func _on_timer_timeout():
	queue_free()
