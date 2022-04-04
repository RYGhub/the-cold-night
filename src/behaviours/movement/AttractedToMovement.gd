extends Node
class_name AttractedToMovement


signal moving_in_direction(direction)
signal touching_goal
signal goal_reached


export var movement_per_second: float


onready var parent: KinematicBody2D = get_parent()


var goal: Node2D = null
var _goal_reached_triggered: bool = false


func move():
	var direction: Vector2 = (goal.global_position - parent.global_position).normalized()
	emit_signal("moving_in_direction", direction)
	var _motion: Vector2 = parent.move_and_slide(direction * movement_per_second, Vector2.ZERO)
	for slide_no in parent.get_slide_count():
		var slide = parent.get_slide_collision(slide_no)
		if slide.collider == goal:
			emit_signal("touching_goal")
			if not _goal_reached_triggered:
				emit_signal("goal_reached")
				_goal_reached_triggered = true


func _physics_process(_delta):
	if goal:
		move()
