extends Node

onready var target: KinematicBody2D = get_parent()
export var movement_per_second: float = 400.0


signal hit(collision)


func _physics_process(delta):
	var direction = Vector2(cos(target.rotation), sin(target.rotation))
	var collision: KinematicCollision2D = target.move_and_collide(direction * movement_per_second * delta)
	if collision != null:
		emit_signal("hit", collision)
