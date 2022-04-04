extends Node
class_name AttractedToMovement


signal moved_in_direction(origin, direction)
signal goal_reached(origin, who)
signal collided(origin, collision)


export(float) var movement_per_second


onready var parent = get_parent()


var goal


func _move():
	var direction = (goal.global_position - parent.global_position).normalized()
	var _motion = parent.move_and_slide(direction * movement_per_second)
	_handle_collisions()	
	emit_signal("moved_in_direction", self, direction)


func _handle_collisions():
	for slide_no in parent.get_slide_count():
		var collision = parent.get_slide_collision(slide_no)
		emit_signal("collided", self, collision)
		if collision.collider == goal:
			emit_signal("goal_reached", self)


func _physics_process(_delta):
	if goal:
		_move()
