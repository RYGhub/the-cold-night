extends KinematicBody2D


func _on_Damageable_dead():
	queue_free()
