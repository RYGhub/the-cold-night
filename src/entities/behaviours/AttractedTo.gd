extends Node


export var movement_per_second: float = 32.0


onready var target: KinematicBody2D = get_parent()
# TODO: Use a better algorithm
onready var goal: StaticBody2D = get_parent().get_parent().get_node("Fire")


signal touching_goal
var goal_reached_triggered: bool = false
signal goal_reached


func _physics_process(_delta):
	var direction: Vector2 = (goal.global_position - target.global_position).normalized()
	var _motion: Vector2 = target.move_and_slide(direction * movement_per_second, Vector2.ZERO)
	for slide_no in target.get_slide_count():
		var slide = target.get_slide_collision(slide_no)
		if slide.collider == goal:
			emit_signal("touching_goal")
			if not goal_reached_triggered:
				emit_signal("goal_reached")
				goal_reached_triggered = true