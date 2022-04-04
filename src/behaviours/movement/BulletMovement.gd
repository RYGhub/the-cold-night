extends Node
class_name BulletMovement


signal moved_in_direction(origin, direction)
signal collided(origin, collision)


export var movement_per_second: float


onready var parent = get_parent()


func _physics_process(delta):
	var direction = Vector2(cos(parent.rotation), sin(parent.rotation))
	var collision = parent.move_and_collide(direction * movement_per_second * delta)
	if collision != null:
		emit_signal("collided", self, collision)
	emit_signal("moved_in_direction", self, direction)
