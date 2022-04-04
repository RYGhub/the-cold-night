extends KinematicBody2D


func _on_AttractedToMovement_collided(_origin, collision):
	$Damaging.do_damage(collision.collider, get_physics_process_delta_time())
