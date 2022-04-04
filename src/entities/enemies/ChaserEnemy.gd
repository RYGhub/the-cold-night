extends KinematicBody2D


func _on_AttractedToMovement_collided(_origin, collision):
	$Damaging.do_damage(collision.collider, 1)
